import subprocess
import json
import os
from collections import OrderedDict
from cumulusci.core.tasks import BaseTask
from cumulusci.core.utils import process_bool_arg, ordered_yaml_load
from cumulusci.utils import os_friendly_path
from cumulusci.tasks.bulkdata import LoadData, ExtractData


class MappingGenerator(BaseTask):
    task_options = {
        "pre_mappings": {
            "description": "List of (path, namespace) with paths to mappings files to be namespaced with given namespace.  Mappings are combined in the following order: initial, package, installed packages, last.",
            "required": False,
        },
        "mapping_directories": {
            "description": "List of directory paths containing mappings for specified namespaces.   Include a path to a directory that includes a mapping for this package's namespace.  Mappings are combined in the following order: initial, package, installed packages, last.",
            "required": True,
        },
        "post_mappings": {
            "description": "List of (path, namespace) with paths to mappings files to be namespaced with given namespace.   Mappings are combined in the following order: initial, package, installed packages, last.",
            "required": False,
        },
        "log_mapping": {
            "description": "If to log mapping after creating file",
            "required": False,
        },
        "tab_size": {
            "description": "Tab size to indent file.  Default: 4",
            "required": False
        }
    }

    mapping_message_format = "        {} with namespace '{}'"
    none_message           = "        --None--"

    def get_project_namespace(self):
        return self.project_config.config["project"]["package"]["namespace"]

    def get_is_namespaced(self):
        return self.org_config.config["namespaced"]

    def get_installed_package_namespaces(self):
        namespaces = []
        
        command = "sfdx force:package:installed:list -u {} --json".format(self.org_config.config.get("username"))
        packages_response = json.loads(subprocess.check_output(command, shell=True))

        if packages_response.get("result"):
            for package in packages_response.get("result"):
                namespace = package.get("SubscriberPackageNamespace")
                if (namespace):
                    namespaces.append(namespace)

        return namespaces

    def log_title(self, title):
        if title:
            self.logger.info("")
            self.logger.info(title)
            self.logger.info("-" * len(title))

    def get_available_mappings(self):
        self.log_title("Mappings in mapping_directories for project & installed package mappings")
        
        available_mappings = OrderedDict()
        for directory in self.options["mapping_directories"]:
            root = os_friendly_path(directory)
            self.logger.info(root)
            for item in os.listdir(root):
                path = os.path.join(root, item)
                if os.path.isfile(os.path.join(root, item)) and item.endswith(".yml"):
                    namespace = item[:-4]
                    mapping = OrderedDict()
                    mapping["path"] = path
                    mapping["namespace"] = namespace
                    available_mappings[namespace] = mapping
                    self.logger.info("    {}: {}".format(namespace, path))

        self.logger.info("")
        
        return available_mappings

    def get_installed_package_mappings_paths(self):
        installed_package_mappings_paths = OrderedDict()
        root = os_friendly_path("data/bulk/mapping")
        
        self.logger.info("Available Mappings:")
        for item in os.listdir(root):
            path = os.path.join(root, item)
            if os.path.isfile(os.path.join(root, item)) and item.endswith(".yml"):
                namespace = item[:-4]
                self.logger.info("    {}: {}".format(namespace, path))
                installed_package_mappings_paths[namespace] = path
        
        self.logger.info("")
        
        return installed_package_mappings_paths

    def log_combined_mapping(self):
        for row in Util.print_mapping_as_list(self.mapping, self.options.get("tab_size")):
            self.logger.info(row)
            
        self.logger.info("")

    def log_mapping(self, mapping):
        if mapping:
            self.logger.info(self.mapping_message_format.format(
                mapping.get("path"), 
                "" if not mapping.get("namespace") else mapping.get("namespace"),
            ))

    def add_mappings(self, option, title):
        self.logger.info("    {}".format(title))
        mappings = self.options.get(option)
        if mappings and 0 < len(mappings):
            for mapping in mappings:
                self.mappings.append(mapping)
                self.log_mapping(mapping)
        else:
            self.logger.info(self.none_message)

    def set_mapping(self):
        available_mappings = self.get_available_mappings()
        self.mappings = []

        self.log_title("Combining mappings")

        # Pre mappings
        self.add_mappings("pre_mappings", "Pre:")

        # Add project's mapping
        self.logger.info("    Project:")
        project_namespace = self.get_project_namespace()
        project_mapping = available_mappings.get(project_namespace)
        if not self.get_is_namespaced():
            project_mapping["namespace"] = ""
        self.log_mapping(project_mapping)
        self.mappings.append(project_mapping)

        # Add installed packages' mappings
        self.logger.info("    Installed package mappings:")
        added_installed_package_mapping = False
        for namespace in self.get_installed_package_namespaces():
            if available_mappings.get(namespace):
                self.mappings.append(available_mappings.get(namespace))
                self.log_mapping(available_mappings.get(namespace))
                added_installed_package_mapping = True
        if not added_installed_package_mapping:
            self.logger.info(self.none_message)

        # Post mappings
        self.add_mappings("post_mappings", "Post:")

        # Combine mappings
        self.mapping = Util.get_combined_mapping(self.mappings)

        if process_bool_arg(self.options.get("log_mapping")):
            self.log_title("Combined mapping")
            self.log_combined_mapping()

class LogMapping(MappingGenerator):
    
    def _run_task(self):
        self.options["log_mapping"] = True
        self.set_mapping()

class CreateMapping(MappingGenerator):
    task_options = {
        "output_path": {
            "description": "Path to save combined mapping",
            "required": True,
        },
        "pre_mappings": {
            "description": "List of (path, namespace) with paths to mappings files to be namespaced with given namespace.  Mappings are combined in the following order: initial, package, installed packages, last.",
            "required": False,
        },
        "mapping_directories": {
            "description": "List of directory paths containing mappings for specified namespaces.   Include a path to a directory that includes a mapping for this package's namespace.  Mappings are combined in the following order: initial, package, installed packages, last.",
            "required": True,
        },
        "post_mappings": {
            "description": "List of (path, namespace) with paths to mappings files to be namespaced with given namespace.   Mappings are combined in the following order: initial, package, installed packages, last.",
            "required": False,
        },
        "log_mapping": {
            "description": "If to log mapping after creating file",
            "required": False,
        },
        "tab_size": {
            "description": "Tab size to indent file.  Default: 4",
            "required": False
        }
    }

    def _run_task(self):
        self.set_mapping()

        with open(os_friendly_path(self.options.get("output_path")), "w+") as f:
            f.write("\n".join(Util.print_mapping_as_list(self.mapping, self.options.get("tab_size"))))

class InsertData(LoadData, MappingGenerator):

    task_options = {
        "database_url": {
            "description": "The database url to a database containing the test data to load",
            "required": True,
        },
        "sql_path": {
            "description": "If set, an SQL script will be generated at the path provided "
            + "This is useful for keeping data in the repository and allowing diffs."
        },
        "pre_mappings": {
            "description": "List of (path, namespace) with paths to mappings files to be namespaced with given namespace.  Mappings are combined in the following order: initial, package, installed packages, last.",
            "required": False,
        },
        "mapping_directories": {
            "description": "List of directory paths containing mappings for specified namespaces.   Include a path to a directory that includes a mapping for this package's namespace.  Mappings are combined in the following order: initial, package, installed packages, last.",
            "required": True,
        },
        "post_mappings": {
            "description": "List of (path, namespace) with paths to mappings files to be namespaced with given namespace.   Mappings are combined in the following order: initial, package, installed packages, last.",
            "required": False,
        },
        "log_mapping": {
            "description": "If to log mapping after creating file",
            "required": False,
        },
        "tab_size": {
            "description": "Tab size to indent file.  Default: 4",
            "required": False
        }
    }

    def _init_mapping(self):
        self.set_mapping()

class WriteData(ExtractData):

    task_options = {
        "database_url": {
            "description": "The database url to a database containing the test data to load",
            "required": True,
        },
        "sql_path": {
            "description": "If specified, a database will be created from an SQL script at the provided path"
        },
        "start_step": {
            "description": "If specified, skip steps before this one in the mapping",
            "required": False,
        },
        "pre_mappings": {
            "description": "List of (path, namespace) with paths to mappings files to be namespaced with given namespace.  Mappings are combined in the following order: initial, package, installed packages, last.",
            "required": False,
        },
        "mapping_directories": {
            "description": "List of directory paths containing mappings for specified namespaces.   Include a path to a directory that includes a mapping for this package's namespace.  Mappings are combined in the following order: initial, package, installed packages, last.",
            "required": True,
        },
        "post_mappings": {
            "description": "List of (path, namespace) with paths to mappings files to be namespaced with given namespace.   Mappings are combined in the following order: initial, package, installed packages, last.",
            "required": False,
        },
        "log_mapping": {
            "description": "If to log mapping after creating file",
            "required": False,
        },
        "tab_size": {
            "description": "Tab size to indent file.  Default: 4",
            "required": False
        }
    }

    def _init_mapping(self):
        self.set_mapping()

class Util:

    @staticmethod
    def get_api_name(namespace, api_name):
        if namespace and api_name and api_name.endswith("__c"):
            return "{}__{}".format(namespace, api_name)
        return api_name

    @staticmethod
    def add_sf_id(mapping):
        for step in mapping.items():
            if "fields" in step:
                step["fields"]["Id"] = "sf_id"

    @staticmethod
    def get_mapping_from_file(mapping_path):
        with open(os_friendly_path(mapping_path), "r") as f:
            return ordered_yaml_load(f)

    @staticmethod
    def print_mapping_as_list(mapping, tabSize=4):
        if not tabSize or tabSize < 1:
            tabSize = 4
        tab = " " * tabSize

        rows = []
        for step_name, step in mapping.items():
            rows.append("{}:".format(step_name))
            for param in ["sf_object", "table", "record_type"]:
                if param in step:
                    rows.append("{}{}: {}".format(
                        tab,     
                        param, 
                        step[param]
                    ))
            if "fields" in step:
                rows.append("{}{}:".format(tab, "fields"))
                for key, value in step["fields"].items():
                    rows.append("{}{}: {}".format(tab * 2, key, value))
            if "lookups" in step:
                rows.append("{}{}:".format(tab, "lookups"))
                for api_name, lookup in step["lookups"].items():
                    rows.append("{}{}:".format(tab * 2, api_name))
                    for lookup_param in lookup.keys():
                        rows.append("{}{}: {}".format(tab * 3, lookup_param, lookup[lookup_param]))

        return rows

    @staticmethod
    def combine_mapping(mapping, new_mapping_path, new_mapping_namespace):
        new_mapping = Util.get_mapping_from_file(new_mapping_path)
        if new_mapping:
            for step_name, step in new_mapping.items():
                if step_name not in mapping:
                    mapping[step_name] = OrderedDict()

                for step_config in step.keys():
                    if step_config == "fields" or step_config == "lookups":
                        if step_config not in mapping[step_name]:
                            mapping[step_name][step_config] = OrderedDict()
                        for api_name, value in step[step_config].items():
                            mapping[step_name][step_config][Util.get_api_name(new_mapping_namespace, api_name)] = value
                    elif step_config == "sf_object" and step["sf_object"] and step["sf_object"].endswith("__c"):
                        mapping[step_name]["sf_object"] = Util.get_api_name(new_mapping_namespace, step["sf_object"])
                    else:
                        mapping[step_name][step_config] = step[step_config]

    @staticmethod
    def get_combined_mapping(mappings):
        combined_mapping = OrderedDict()
        
        if mappings:
            for mapping in mappings:
                if "path" in mapping:
                    Util.combine_mapping(
                        combined_mapping,
                        mapping["path"],
                        mapping.get("namespace")
                    )

        Util.add_sf_id(combined_mapping)

        return combined_mapping