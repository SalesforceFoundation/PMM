import base64
import os
import re
from cumulusci.tasks.salesforce import BaseSalesforceApiTask


class UploadClientPhotos(BaseSalesforceApiTask):
    task_options = {
        "directory_path": {
            "description": "Path to the root directory of ContentVersions to upload",
            "required": True,
        },
        "managed": {
            "description": (
                "If True, will use the project's namespace prefix.  "
                "Defaults to False or no namespace."
            ),
            "required": False,
        },
    }

    def _run_task(self):
        managed = self.options.get("managed") or False
        namespace = self.project_config.project__package__namespace + "__"

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

        for path, names, files in os.walk(top_dir):
            if (
                path != top_dir
                and os.path.split(path)[-1][:3] == "068"
                and len(files) == 1
            ):
                # We're walking a subdirectory with a ContentVersion Id name
                # and exactly one file inside.
                with open(os.path.join(path, files[0]), "rb") as version_data:
                    self.logger.info(
                        "Uploading ContentVersion for file {} (original Id {})".format(
                            files[0], os.path.split(path)[-1]
                        )
                    )
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
                        self.logger.error(
                            "Failed to create ContentVersion: {}".format(
                                result["errors"]
                            )
                        )

                    created_versions[os.path.split(path)[-1]] = result["id"]

        # Query the ContentDocumentIds for our created records.
        for content_version in self.sf.query(
            "SELECT Id, ContentDocumentId FROM ContentVersion"
        )["records"]:
            document_ids[content_version["Id"]] = content_version["ContentDocumentId"]

        # Now, query Contacts and update their PhotoFileID__c fields.
        field_name = "{}PhotoFileID__c".format(namespace if managed else "")
        for old_id in created_versions:
            contacts = self.sf.query(
                "SELECT Id, Name FROM Contact WHERE {} = '{}'".format(
                    field_name, old_id
                )
            )["records"]
            for contact in contacts:
                self.logger.info(
                    "Updating Photo File Id for {} to {}".format(
                        contact["Name"], created_versions[old_id]
                    )
                )
                self.sf.Contact.update(
                    contact["Id"], {field_name: created_versions[old_id]}
                )

                # Add a ContentDocumentLink to share the file to the Contact's record page
                self.logger.info(
                    "Creating ContentDocumentLink to share file to Contact"
                )
                self.sf.ContentDocumentLink.create(
                    {
                        "LinkedEntityId": contact["Id"],
                        "ContentDocumentId": document_ids[created_versions[old_id]],
                        "ShareType": "I",
                        "Visibility": "AllUsers",
                    }
                )
