# Copyright (c) 2020, salesforce.com, inc.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
# For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause

import base64
import os
import re
from cumulusci.core.tasks import BaseTask


class UpdateClientPhotoDirectories(BaseTask):
    task_options = {
        "directory_path": {
            "description": "Path to the root directory of ContentVersions to upload",
            "required": True,
        },
        "sql_path": {
            "description": "Path to the .sql file containing test data",
            "required": True,
        },
    }

    def _run_task(self):
        # After capturing test data, we need to convert our ContentVersion directories to the new PhotoFileId__c values.
        # We iterate over our ContentVersion directory
        # It will contain subdirectories whose names are 068 Ids (ContentVersions)
        # Each directory will contain exactly one file whose fileName in the format FirstLast.png.
        # Then, we regex search the Test Data SQL file at sql_path for the Contact's new PhotoFileId__c (068...).
        # Finally, we update the ContentVersion directories with the new PhotoFileId__c

        top_dir = self.options["directory_path"]
        photos = []

        for path, names, files in os.walk(top_dir):
            if (
                path != top_dir
                and os.path.split(path)[-1][:3] == "068"
                and len(files) == 1
            ):

                clientNames = re.compile("[A-Z][a-z]+").findall(files[0])
                pattern = re.compile(".*".join(clientNames) + ".*(068[A-Za-z0-9]{15})")

                for i, line in enumerate(open(self.options["sql_path"])):
                    for match in re.finditer(pattern, line):
                        photoFileId = match.group(1)
                        photos.append({
                            "client": " ".join(clientNames),
                            "old_path": path,
                            "new_path": path[:-18] + photoFileId
                        })
        
        self.logger.info("Updating Client Photo Directories")
        self.logger.info("------------------------------------------------------")
        self.logger.info("")

        for photo in photos:
            os.rename(photo["old_path"], photo["new_path"])
            self.logger.info(photo["client"])
            self.logger.info("   old path: " + photo["old_path"])
            self.logger.info("   new path: " + photo["new_path"])
            self.logger.info("")
