import bs4 as bs
import glob
import esprima
import re
import pathlib
import json
import os


def check_js(paths, strings_dict):
    """Return the count of user-exposed hard-coded strings in javascript files."""
    js_offenses = 0

    for path in paths:

        short_path = path.replace(os.path.join("force-app", "main", "default", ""),"")

        with open(path) as f:
            last_value = ""

            # This strips out the decorators, which aren't supported in esprima.
            js_body = re.sub(r"@\w+(\(.*\))?", "", f.read())

            parsed_js = esprima.tokenize(js_body, { "loc": True })
            parsed_js = [
                element for element in parsed_js if element.type != "Punctuator"
            ]
            for item in parsed_js:
                item.value = item.value.strip("\u00a0'\"/.;() ")
                if (
                        item.type == "String"
                        and not item.value in strings_dict.get("ignorable_js_values")
                        and not item.value.endswith("__r")
                        and not item.value.endswith("__c")
                        and not last_value in strings_dict.get("ignorable_js_last_values") # allows for lwc attributes that expect string values
                        and item.value[0:1].isupper() # assumes title case in any user-exposed strings
                        and not item.value.isupper() # allows for constants with ALLUPPER naming convention
                        and not last_value.isupper() # allows for constants with ALLUPPER naming convention
                ):
                    print(f"JS: {short_path} -- line {str(item.loc.start.line)} -- {last_value}: {item.value}")
                    js_offenses += 1
                last_value = item.value
    return js_offenses


def check_html(paths, strings_dict):
    """Return the count of user-exposed hard-coded strings in HTML files."""
    html_offenses = 0

    for path in paths:

        short_path = path.replace(os.path.join("force-app", "main", "default", ""),"")

        with open(path) as f:
            soup = bs.BeautifulSoup(f, "html.parser", multi_valued_attributes=None)

        for tag in soup.find_all():

            # Find all tag attribute values that are not {evaluated}
            for k, v in tag.attrs.items():
                if (
                        k in strings_dict.get("string_attributes_to_check")
                        and not v.startswith("{")
                        and not v == ""
                ):
                    print(f"HTML attribute: {short_path} -- line {tag.sourceline} -- {tag.name} {k}: {v}")
                    html_offenses += 1

            # Find all tag contents that are not {evaluated}, stripping spaces and known non-alpha characters like pipes
            tag_value = tag.string
            if tag_value:
                tag_value = str(tag_value).strip("\u00a0 (|\t\n")
                if tag_value and not tag_value.startswith("{"):
                    print(f"HTML contents: {short_path} -- line {tag.sourceline} String: {tag_value}")
                    html_offenses += 1

    return html_offenses


def get_all_paths(path):
    return glob.glob(path, recursive=True)


def find_dictionary_file():
    """Return the filepath of the .ignorable_strings.json dictionary file."""
    file_name = ".ignoreable_strings.json"
    parent_directories = [pathlib.Path().resolve()] + list(
        pathlib.Path().resolve().parents
    )
    for directory in parent_directories:
        file_path = directory / file_name
        if file_path.exists():
            return file_path


def main():

    strings_dict = json.load(open(find_dictionary_file()))

    js_offenses = 0
    js_paths = get_all_paths("force-app/**/*.js")
    js_offenses += check_js(js_paths, strings_dict)

    html_offenses = 0
    html_paths = get_all_paths("force-app/**/*.html")
    html_offenses += check_html(html_paths, strings_dict)

    total_offenses = js_offenses + html_offenses

    if total_offenses == 0:
        print("No strings found. Well done! \U0001F389 \U0001F600")
    else:
        print("Total Strings: " + str(total_offenses))

if __name__ == "__main__":
    main()