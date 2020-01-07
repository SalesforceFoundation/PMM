import base64
import os
import re
import json
from cumulusci.tasks.salesforce import BaseSalesforceApiTask


class SetUserPhoto(BaseSalesforceApiTask):
    task_options = {"path": {"description": "Path to desired photo", "required": True}}

    def _run_task(self):
        path = self.options["path"]

        self.logger.info("Setting user photo to {}".format(path))
        with open(path, "rb") as version_data:
            result = self.sf.ContentVersion.create(
                {
                    "PathOnClient": os.path.split(path)[-1],
                    "Title": os.path.splitext(os.path.split(path)[-1])[0],
                    "VersionData": base64.b64encode(version_data.read()).decode(
                        "utf-8"
                    ),
                }
            )
            if not result["success"]:
                self.logger.error(
                    "Failed to create ContentVersion: {}".format(result["errors"])
                )

        # Query the ContentDocumentId for our created record.
        content_document_id = self.sf.query(
            "SELECT Id, ContentDocumentId FROM ContentVersion WHERE Id = '{}'".format(
                result["id"]
            )
        )["records"][0]["ContentDocumentId"]

        self.logger.info("Uploaded ContentDocument {}".format(content_document_id))

        # Get the User Id of our current user.
        user_id = self.sf.restful("")["identity"][-18:]

        # Call the Connect API to set our user photo.
        result = self.sf.restful(
            "connect/user-profiles/{}/photo".format(user_id),
            data=json.dumps({"fileId": content_document_id}),
            method="POST",
        )
