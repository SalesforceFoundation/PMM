# Copyright (c) 2020, salesforce.com, inc.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
# For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause

import glob
from pathlib import Path


STAR_COPYRIGHT = """/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

"""

POINTY_COPYRIGHT = """<!--
  - /*
  -  * Copyright (c) 2020, salesforce.com, inc.
  -  * All rights reserved.
  -  * SPDX-License-Identifier: BSD-3-Clause
  -  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
  -  */
  -->

"""


def get_all_paths(path):
    return glob.glob(path, recursive=True)


def apply_copyright(paths, copyright):
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
    return total


def main():
    js_paths = get_all_paths("force-app/**/*.js")
    apex_paths = get_all_paths("force-app/**/*.cls")
    css_paths = get_all_paths("force-app/**/*.css")
    star_paths = js_paths + apex_paths + css_paths

    html_paths = get_all_paths("force-app/**/*.html")
    cmp_paths = get_all_paths("force-app/**/*.cmp")
    pointy_paths = html_paths + cmp_paths

    total = apply_copyright(pointy_paths, POINTY_COPYRIGHT) + apply_copyright(
        star_paths, STAR_COPYRIGHT
    )

    if total == 0:
        print(
            "All .cls, .js, .html, .cmp, and .css files already have copyright statements! \U0001F389 \U000000A9 \U0001F389 \U000000A9 \U0001F389"
        )
    else:
        print(f"Added copyright statement to {total} files")


if __name__ == "__main__":
    main()
