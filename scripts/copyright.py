# Copyright (c) 2020, salesforce.com, inc.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
# For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause

import glob
from pathlib import Path


def get_all_paths(path):
    return glob.glob(path, recursive=True)


def main():
    js_paths = get_all_paths("force-app/**/*.js")
    apex_paths = get_all_paths("force-app/**/*.cls")

    paths = js_paths + apex_paths

    copyright = """/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

"""
    total = 0

    for path in paths:
        text = Path(path).read_text()
        top_lines = text.splitlines()[:9]
        for actual, expected in zip(top_lines, copyright.splitlines()):
            if not actual == expected:
                text = copyright + text
                Path(path).write_text(text)
                total += 1
                break

    if total == 0:
        print(
            "All .cls and .js files already have copyright statements! \U0001F389 \U000000A9 \U0001F389 \U000000A9 \U0001F389"
        )
    else:
        print(f"Added copyright statement to {total} files")


if __name__ == "__main__":
    main()
