import base64
import os
import sys
from cumulusci.tasks.salesforce import BaseSalesforceApiTask
from tasks.org_info import NamespaceTask
from cumulusci.core.exceptions import TaskOptionsError
from cumulusci.utils import os_friendly_path


class utils:
    @staticmethod
    def get_ids_for_query(ids):
        if ids:
            ids_for_query = "','".join(ids)
            return f"'{ids_for_query}'"


class InsertTask(BaseSalesforceApiTask, NamespaceTask):
    task_options = {
        "photos": {
            "description": 'Map of photo steps by step name.   Photo step names are arbitrary.  Each photo step requires an "email" as Contact record\'s Email to insert the client photo on and "photo" as the path the client photo file to insert.',
            "required": True,
        },
    }

    _photos = None
    _contact_ids_by_email = None

    @property
    def photos(self):
        return self.options["photos"]

    @property
    def contact_ids_by_email(self):
        if self._contact_ids_by_email is None:
            self._contact_ids_by_email = {}
            for photo in self.photos.values():
                email = photo.get("email")
                if email:
                    self._contact_ids_by_email[email] = None
            if self._contact_ids_by_email:
                query = f"SELECT Id, Email FROM Contact WHERE Email IN ({utils.get_ids_for_query(self._contact_ids_by_email.keys())})"
                for record in self.sf.query_all(query).get("records"):
                    self._contact_ids_by_email[record.get("Email")] = record.get("Id")
        return self._contact_ids_by_email

    def _get_content_document_ids_by_content_version_id(self, content_version_ids=[]):
        query = (
            query
        ) = f"SELECT Id, ContentDocumentId FROM ContentVersion WHERE Id IN ({utils.get_ids_for_query(content_version_ids)})"

        content_document_ids_by_content_version_id = {}

        for content_version in self.sf.query(query)["records"]:
            content_document_ids_by_content_version_id[
                content_version["Id"]
            ] = content_version["ContentDocumentId"]

        return content_document_ids_by_content_version_id

    def _run_task(self):
        caseman_namespace = self.namespaces.get("caseman")
        if True or not caseman_namespace:
            self.log_table(
                [
                    [f'"caseman" namespace is not used in this org.',],
                    ["Skipping inserting client photos. 💤 "],
                ]
            )
            return

        # Insert ContentVersions
        content_version_ids = set()
        for step, photo in (self.options.get("photos") or {}).items():
            photo_path = photo.get("photo")

            try:
                with open(os_friendly_path(photo_path), "rb") as version_data:
                    result = self.sf.ContentVersion.create(
                        {
                            "PathOnClient": os_friendly_path(photo_path),
                            "Title": step,
                            "VersionData": base64.b64encode(version_data.read()).decode(
                                "utf-8"
                            ),
                        }
                    )
                    if not result["success"]:
                        photo["error"] = result["errors"]

                    # Success
                    content_version_id = result["id"]
                    photo["content_version_id"] = content_version_id
                    content_version_ids.add(content_version_id)
            except Exception as e:
                exc_type, _, _ = sys.exc_info()
                photo["error"] = f"{exc_type.__name__}: {str(e)}"

        # Query ContentDocument IDs for ContentVersions
        content_document_ids_by_content_version_id = self._get_content_document_ids_by_content_version_id(
            content_version_ids
        )

        # Update Contacts' PhotoFileID__c fields.
        self.log_title("Inserting Client Photos")

        photo_file_id_field = caseman_namespace.inject_field_namespace("PhotoFileID__c")
        for step, photo in self.photos.items():
            email = photo.get("email")
            contact_id = self.contact_ids_by_email.get(email)
            content_version_id = photo.get("content_version_id")
            content_document_id = content_document_ids_by_content_version_id.get(
                content_version_id
            )
            content_document_link_id = None
            photo_file_id = None

            if contact_id and content_version_id and content_document_id:
                try:
                    # Insert ContentDocumentLink
                    link_result = self.sf.ContentDocumentLink.create(
                        {
                            "LinkedEntityId": contact_id,
                            "ContentDocumentId": content_document_id,
                            "ShareType": "I",
                            "Visibility": "AllUsers",
                        }
                    )
                    if not link_result["success"]:
                        photo["error"] = link_result["errors"]
                    else:
                        content_document_link_id = link_result["id"]

                        # Update Contact's PhotoFileID__c
                        self.sf.Contact.update(
                            contact_id, {photo_file_id_field: content_version_id}
                        )

                        photo_file_id = content_version_id
                except Exception as e:
                    exc_type, _, _ = sys.exc_info()
                    photo["error"] = f"{exc_type.__name__}: {str(e)}"
                    raise e

            self.log_table(
                [
                    ["STEP", step,],
                    ["EMAIL", email,],
                    ["CONTACT", contact_id,],
                    ["CONTENT VERSION", content_version_id,],
                    ["CONTENT DOCUMENT", content_document_id,],
                    ["CONTENT DOCUMENT LINK", content_document_link_id],
                    [photo_file_id_field, photo_file_id,],
                    ["ERROR", photo.get("error"),],
                ]
            )
