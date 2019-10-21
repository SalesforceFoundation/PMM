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
        "package_mapping_directories": {
            "description": "List of directory paths containing mapping YAML files for a package, in the form of [namespace].yml, used to automatically add mappings for cci project and installed packages.",
            "required": True,
        },
        "pre_mappings": {
            "description": "List of (path, namespace) objects of mapping .yml files added before project, install pacakges, and post mappings.  Use to initialize mapping for Bulk Data Task.  Path is required.  Namespace is optional and is injected into the mapping.",
            "required": False,
        },
        "skip_mapping_project": {
            "description": "If True, skips trying to add namespaced mapping for the project's namespace.  Default: False",
            "required": False,
            "default": True
        },
        "skip_mapping_installed_packages": {
            "description": "If True, skips trying to add namespaced mapping for the org's installed packages.  Default: False",
            "required": False
        },
        "post_mappings": {
            "description": "List of (path, namespace) objects of mapping .yml files added after pre, project, and install pacakges mappings.  Use to override mapping before executing BulkLoad Task.  Path is required.  Namespace is optional and is injected into the mapping.",
            "required": False,
        },
        "log_mapping": {
            "description": "If to log mapping after creating file",
            "required": False,
        },
        "mapping_tab_size": {
            "description": "Tab size to indent file.  Default: 4",
            "required": False
        }
    }

    mapping_message_format = "        {} with namespace '{}'"
    none_message           = "        --None--"
    skipped_message        = "        Skipped!"

    def get_project_namespace(self):
        return self.project_config.config["project"]["package"]["namespace"]

    def get_is_namespaced(self):
        return self.org_config and process_bool_arg(self.org_config.config.get("namespaced"))

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

    def get_available_namespace_mappings(self):
        self.log_title("Namespaced mappings in package_mapping_directories")
        
        available_mappings = OrderedDict()
        for directory in self.options["package_mapping_directories"]:
            root = os_friendly_path(directory)
            self.logger.info(root)
            items = os.listdir(root)
            items.sort()
            for item in items:
                path = os.path.join(root, item)
                if os.path.isfile(os.path.join(root, item)) and item.endswith(".yml"):
                    namespace = item[:-4]
                    mapping = OrderedDict()
                    mapping["path"] = path
                    mapping["namespace"] = namespace
                    available_mappings[namespace] = mapping
                    self.logger.info("    {}".format(namespace))
        
        return available_mappings

    def log_combined_mapping(self, mapping):
        for row in Util.print_mapping_as_list(
            mapping, 
            self.options.get("mapping_tab_size"),
        ):
            self.logger.info(row)
            
        self.logger.info("")

    def log_mapping(self, mapping):
        if mapping:
            self.logger.info(self.mapping_message_format.format(
                mapping.get("path"),
                "" if not mapping.get("namespace") else mapping.get("namespace"),
            ))

    def add_mappings(self, combined_mappings, option, title):
        self.logger.info("    {}".format(title))
        mappings = self.options.get(option)
        if mappings and 0 < len(mappings):
            for mapping in mappings:
                combined_mappings.append(mapping)
                self.log_mapping(mapping)
        else:
            self.logger.info(self.none_message)

    def get_combined_mapping(self):
        available_namespace_mappings = self.get_available_namespace_mappings()
        combined_mappings = []

        self.log_title("Combining mappings")

        # Pre mappings
        self.add_mappings(combined_mappings, "pre_mappings", "Pre:")

        # Add project's mapping
        self.logger.info("    Project:")
        if not process_bool_arg(self.options.get("skip_mapping_project")):
            project_namespace = self.get_project_namespace()
            project_mapping = available_namespace_mappings.get(project_namespace)
            if project_mapping:
                if not self.get_is_namespaced():
                    project_mapping["namespace"] = ""
                self.log_mapping(project_mapping)
                combined_mappings.append(project_mapping)
            else:
                self.logger.info(self.none_message)
        else:
            self.logger.info(self.skipped_message)
        
        # Add installed packages' mappings
        self.logger.info("    Installed package mappings:")
        if not process_bool_arg(self.options.get("skip_mapping_installed_packages")):
            added_installed_package_mapping = False
            for namespace in self.get_installed_package_namespaces():
                if available_namespace_mappings.get(namespace):
                    combined_mappings.append(available_namespace_mappings.get(namespace))
                    self.log_mapping(available_namespace_mappings.get(namespace))
                    added_installed_package_mapping = True
            if not added_installed_package_mapping:
                self.logger.info(self.none_message)
        else:
            self.logger.info(self.skipped_message)

        # Post mappings
        self.add_mappings(combined_mappings, "post_mappings", "Post:")

        # Combine mappings
        mapping = Util.get_combined_mapping(combined_mappings)

        if process_bool_arg(self.options.get("log_mapping")):
            self.log_title("Combined mapping")
            self.log_combined_mapping(mapping)
        
        return mapping

class LogMapping(MappingGenerator):
    
    def _run_task(self):
        self.options["log_mapping"] = True
        self.get_combined_mapping()

class CreateMapping(MappingGenerator):
    task_options = {
        "output_path": {
            "description": "Path to save combined mapping",
            "required": True,
        },
        "package_mapping_directories": {
            "description": "List of directory paths containing mapping YAML files for a package, in the form of [namespace].yml, used to automatically add mappings for cci project and installed packages.",
            "required": True,
        },
        "pre_mappings": {
            "description": "List of (path, namespace) objects of mapping .yml files added before project, install pacakges, and post mappings.  Use to initialize mapping for Bulk Data Task.  Path is required.  Namespace is optional and is injected into the mapping.",
            "required": False,
        },
        "skip_mapping_project": {
            "description": "If True, skips trying to add namespaced mapping for the project's namespace.  Default: False",
            "required": False,
            "default": True
        },
        "skip_mapping_installed_packages": {
            "description": "If True, skips trying to add namespaced mapping for the org's installed packages.  Default: False",
            "required": False
        },
        "post_mappings": {
            "description": "List of (path, namespace) objects of mapping .yml files added after pre, project, and install pacakges mappings.  Use to override mapping before executing BulkLoad Task.  Path is required.  Namespace is optional and is injected into the mapping.",
            "required": False,
        },
        "log_mapping": {
            "description": "If to log mapping after creating file",
            "required": False,
        },
        "mapping_tab_size": {
            "description": "Tab size to indent file.  Default: 4",
            "required": False
        }
    }

    def _run_task(self):
        self.mapping = self.get_combined_mapping()

        with open(os_friendly_path(self.options.get("output_path")), "w+") as f:
            f.write("\n".join(Util.print_mapping_as_list(self.mapping, self.options.get("mapping_tab_size"))))

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
        "package_mapping_directories": {
            "description": "List of directory paths containing mapping YAML files for a package, in the form of [namespace].yml, used to automatically add mappings for cci project and installed packages.",
            "required": True,
        },
        "pre_mappings": {
            "description": "List of (path, namespace) objects of mapping .yml files added before project, install pacakges, and post mappings.  Use to initialize mapping for Bulk Data Task.  Path is required.  Namespace is optional and is injected into the mapping.",
            "required": False,
        },
        "skip_mapping_project": {
            "description": "If True, skips trying to add namespaced mapping for the project's namespace.  Default: False",
            "required": False,
            "default": True
        },
        "skip_mapping_installed_packages": {
            "description": "If True, skips trying to add namespaced mapping for the org's installed packages.  Default: False",
            "required": False
        },
        "post_mappings": {
            "description": "List of (path, namespace) objects of mapping .yml files added after pre, project, and install pacakges mappings.  Use to override mapping before executing BulkLoad Task.  Path is required.  Namespace is optional and is injected into the mapping.",
            "required": False,
        },
        "log_mapping": {
            "description": "If to log mapping after creating file",
            "required": False,
        },
        "mapping_tab_size": {
            "description": "Tab size to indent file.  Default: 4",
            "required": False
        }
    }

    def _init_mapping(self):
        self.mapping = self.get_combined_mapping()

class WriteData(ExtractData, MappingGenerator):

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
        "package_mapping_directories": {
            "description": "List of directory paths containing mapping YAML files for a package, in the form of [namespace].yml, used to automatically add mappings for cci project and installed packages.",
            "required": True,
        },
        "pre_mappings": {
            "description": "List of (path, namespace) objects of mapping .yml files added before project, install pacakges, and post mappings.  Use to initialize mapping for Bulk Data Task.  Path is required.  Namespace is optional and is injected into the mapping.",
            "required": False,
        },
        "skip_mapping_project": {
            "description": "If True, skips trying to add namespaced mapping for the project's namespace.  Default: False",
            "required": False,
            "default": True
        },
        "skip_mapping_installed_packages": {
            "description": "If True, skips trying to add namespaced mapping for the org's installed packages.  Default: False",
            "required": False
        },
        "post_mappings": {
            "description": "List of (path, namespace) objects of mapping .yml files added after pre, project, and install pacakges mappings.  Use to override mapping before executing BulkLoad Task.  Path is required.  Namespace is optional and is injected into the mapping.",
            "required": False,
        },
        "log_mapping": {
            "description": "If to log mapping after creating file",
            "required": False,
        },
        "mapping_tab_size": {
            "description": "Tab size to indent file.  Default: 4",
            "required": False
        }
    }

    def _init_mapping(self):
        self.mappings = self.get_combined_mapping()

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