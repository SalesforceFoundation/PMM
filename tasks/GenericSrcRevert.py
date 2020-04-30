# Copyright (c) 2020, salesforce.com, inc.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
# For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause

import os
from distutils.dir_util import copy_tree
from distutils.dir_util import remove_tree
from cumulusci.core.tasks import BaseTask
from cumulusci.core.exceptions import TaskOptionsError
from cumulusci.core.utils import process_bool_arg


class GenericSrcRevert(BaseTask):
    task_options = {
        "path": {
            "description": "The path containing metadata to process for managed deployment",
            "required": True,
        },
        "revert_path": {
            "description": "The path to copy the original metadata to for the revert call",
            "required": True,
        },
        "revert": {
            "description": "False if this task should back up, and True if we should revert."
        },
    }

    def _init_options(self, kwargs):
        super(GenericSrcRevert, self)._init_options(kwargs)

        self.options["revert"] = process_bool_arg(
            self.options.get("revert", False)
        )
        if not os.path.isdir(self.options["path"]):
            raise TaskOptionsError(
                "The path {} does not exist or is not a directory".format(
                    self.options["path"]
                )
            )

    def _run_task(self):

        if self.options["revert"]:
            copy_tree(self.options["revert_path"], self.options["path"], update=False)
            self.logger.info("{} is now reverted".format(self.options["path"]))

        if os.path.exists(self.options["revert_path"]):
            # Delete the revert_path
            self.logger.info("Deleting {}".format(self.options["revert_path"]))
            remove_tree(self.options["revert_path"])

        if not self.options["revert"]:
            copy_tree(self.options["path"], self.options["revert_path"])
