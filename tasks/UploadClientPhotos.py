# Copyright (c) 2020, salesforce.com, inc.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
# For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause

import base64
import os
import re
from tasks.namespaces import NamespaceInfo
from cumulusci.tasks.salesforce import BaseSalesforceApiTask

class UploadClientPhotos(NamespaceInfo, BaseSalesforceApiTask):
    task_options = {
        "directory_path": {
            "description": "Path to the root directory of ContentVersions to upload",
            "required": True,
        },
        "namespace": {
            "description": "Namespace prefix to use with Contact.PhotoFileID__c if the namespace is used.  Default: 'caseman'"
        }
    }

    def _run_task(self):
        namespace = self.options.get("namespace") or "caseman"

        # Skip uploading client photos if namespace is not used
        if not self.is_namespace_used(namespace):
            self.logger.info("Skipping uploading client photos.  Only uploads client photos is the project's package's namespace equals '{}' or '{}' is the namespace of an installed package".format(namespace, namespace))
            return

        managed = self.is_namespace_used_locally(namespace)
        namespace_prefix = "{}__".format(namespace)

        # Iterate over our ContentVersion directory
        # It will contain subdirectories whose names are 068 Ids (ContentVersions)
        # Each directory will contain exactly one file, which should be uploaded
        # as a new ContentVersion.
        # We'll then query for Contacts that have their PhotoFileID__c
        # mapped to the original Id, and update them;
        # we'll also use ContentDocumentLink to share the file to the record.

        # Note that files over 37.5MB aren't supported with the approach here;
        # they'd require multipart messages.

        top_dir = self.options["directory_path"]
        created_versions = {}
        document_ids = {}

        content_version_rows = [
            [
                "FILE",
                "ORIGINAL ID",
                "ERROR"
            ]
        ]
        for path, names, files in os.walk(top_dir):
            if (
                path != top_dir
                and os.path.split(path)[-1][:3] == "068"
                and len(files) == 1
            ):
                # We're walking a subdirectory with a ContentVersion Id name
                # and exactly one file inside.
                
                with open(os.path.join(path, files[0]), "rb") as version_data:
                    row = [
                        files[0],
                        os.path.split(path)[-1]
                    ]
                    content_version_rows.append(row)
                    #self.logger.info(
                        #"Uploading ContentVersion for file {} (original Id {})".format(
                            #files[0], os.path.split(path)[-1]
                        #)
                    #)
                    result = self.sf.ContentVersion.create(
                        {
                            "PathOnClient": files[0],
                            "Title": os.path.splitext(files[0])[0],
                            "VersionData": base64.b64encode(version_data.read()).decode(
                                "utf-8"
                            ),
                        }
                    )
                    if not result["success"]:
                        row.append(result["errors"])
                        #self.logger.error(
                            #"Failed to create ContentVersion: {}".format(
                                #result["errors"]
                            #)
                        #)

                    created_versions[os.path.split(path)[-1]] = result["id"]
        self.log_title("Uploading ContentVerions")
        self.log_table(content_version_rows)

        # Query the ContentDocumentIds for our created records.
        for content_version in self.sf.query(
            "SELECT Id, ContentDocumentId FROM ContentVersion"
        )["records"]:
            document_ids[content_version["Id"]] = content_version["ContentDocumentId"]

        # Now, query Contacts and update their PhotoFileID__c fields.
        field_name = "{}PhotoFileID__c".format(namespace_prefix if managed else "")
        
        contacts_updated_rows = []
        for old_id in created_versions:
            contacts = self.sf.query(
                "SELECT Id, Name FROM Contact WHERE {} = '{}'".format(
                    field_name, old_id
                )
            )["records"]
            for contact in contacts:
                row = [
                    contact["Name"],
                    created_versions[old_id]
                ]
                contacts_updated_rows.append(row)
                #self.logger.info(
                    #"Updating Photo File Id for {} to {}".format(
                        #contact["Name"], created_versions[old_id]
                    #)
                #)
                self.sf.Contact.update(
                    contact["Id"], {field_name: created_versions[old_id]}
                )

                # Add a ContentDocumentLink to share the file to the Contact's record page
                #self.logger.info(
                    #"Creating ContentDocumentLink to share file to Contact"
                #)
                row.append("✅")
                self.sf.ContentDocumentLink.create(
                    {
                        "LinkedEntityId": contact["Id"],
                        "ContentDocumentId": document_ids[created_versions[old_id]],
                        "ShareType": "I",
                        "Visibility": "AllUsers",
                    }
                )
        if contacts_updated_rows:
            self.log_title("Updated Contacts")
            self.log_table([
                [
                    "CONTACT",
                    field_name,
                    "CREATED ContentDocumentLink"
                ]
            ] + contacts_updated_rows)
