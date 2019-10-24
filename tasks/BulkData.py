import os
from collections import OrderedDict
from cumulusci.core.config import TaskConfig
from cumulusci.core.tasks import BaseTask
from cumulusci.core.utils import process_bool_arg, ordered_yaml_load
from cumulusci.utils import os_friendly_path
from cumulusci.tasks.bulkdata import LoadData, ExtractData
from cumulusci.tasks.salesforce import GetInstalledPackages

class MappingGenerator(BaseTask):
    task_options = {
        "package_mapping_directories": {
            "description": "List of directory paths containing package mapping files.  Package mappings have file names are in the form '[namespace].yml' and are used to automatically include mapping configs for the CumulusCI project and installed managed packages in the org with the namespaced injected if applicable.",
            "required": True,
        },
        "pre_mapping_configs": {
            "description": "List of mapping config objects added to the combined mapping before project, installed pacakges, and post-mapping configs are added.  Use to initialize combined mapping for Bulk Data Tasks.  Mapping configs are Dicts that (1) contain a required 'path' attribute containing the path to the mapping file and (2) an optional 'namespace' attribute that is injected into the mapping.",
            "required": False,
        },
        "skip_mapping_project": {
            "description": "If True, skips adding the project's mapping config.  Default: False",
            "required": False,
            "default": True
        },
        "skip_mapping_installed_managed_packages": {
            "description": "If True, skips adding mapping configs for the org's installed managed packages.  Default: False",
            "required": False
        },
        "post_mapping_cnofigs": {
            "description": "List of mapping config objects added to the combined mapping after adding pre-, project, installed pacakges configs.  Use to override any mappings before creating the combined mapping for Bulk Data Tasks.  Mapping configs are Dicts that (1) contain a required 'path' attribute containing the path to the mapping file and (2) an optional 'namespace' attribute that is injected into the mapping.",
            "required": False,
        },
        "log_mapping": {
            "description": "If True, logs the combined mapping in the terminal",
            "required": False,
        },
        "mapping_tab_size": {
            "description": "Tab size to indent the combined mapping.  Default: 4",
            "required": False
        }
    }

    def get_project_namespace(self):
        return self.project_config.project__package__namespace

    def is_project_namespaced(self):
        return self.org_config and process_bool_arg(self.org_config.config.get("namespaced"))

    def get_installed_package_namespaces(self):
        self.log_title("Get Installed Packages")
        installed_packages = GetInstalledPackages(self.project_config, TaskConfig({}), self.org_config)()

        self.log_title("Installed Packages")
        namespaces = []
        for package in installed_packages.items():
            namespace = package[0]
            self.logger.info("    {}".format(namespace))
            namespaces.append(namespace)
            
        return namespaces

    def log_title(self, title):
        if title:
            self.logger.info("")
            self.logger.info(title)
            self.logger.info("-" * len(title))

    def get_available_package_mappings(self):
        self.log_title("Package mapping configs")
        available_mappings = OrderedDict() 
        for directory in self.options["package_mapping_directories"]:
            root = os_friendly_path(directory)
            items = os.listdir(root)
            items.sort()
            self.logger.info("    {}".format(root))
            for item in items:
                path = os.path.join(root, item)
                if os.path.isfile(os.path.join(root, item)) and item.endswith(".yml"):
                    namespace = item[:-4]
                    mapping = OrderedDict()
                    mapping["path"] = path
                    mapping["namespace"] = namespace
                    available_mappings[namespace] = mapping
                    self.logger.info("        {}".format(namespace))
        
        return available_mappings

    def log_combined_mapping(self, mapping):
        for row in Util.print_mapping_as_list(
            mapping, 
            self.options.get("mapping_tab_size"),
        ):
            self.logger.info(row)
            
        self.logger.info("")

    def get_mapping_configs_from_option(self, option):
        option_mapping_configs = []
        mapping_configs = self.options.get(option)
        if mapping_configs and 0 < len(mapping_configs):
            for mapping_config in mapping_configs:
                option_mapping_configs.append(mapping_config)
        return option_mapping_configs

    def get_combined_mapping(self):
        available_package_mappings = self.get_available_package_mappings()

        mapping_configs_by_step = OrderedDict()
        max_path_length = len("PATH")
        max_namespace_length = len("NAMESPACE")

        # Pre mapping configs
        mapping_configs_by_step["Pre"] = self.get_mapping_configs_from_option("pre_mapping_configs")
        for mapping_config in mapping_configs_by_step["Pre"]:
            max_path_length = max(max_path_length, len(mapping_config.get("path")))
            max_namespace_length = max(max_namespace_length, len(Util.get_namespace(mapping_config)))

        # Project mapping config
        mapping_configs_by_step["Project"] = []
        if not process_bool_arg(self.options.get("skip_mapping_project")):
            project_namespace = self.get_project_namespace()
            project_mapping_config = available_package_mappings.get(project_namespace)
            if project_mapping_config:
                if not self.is_project_namespaced():
                    project_mapping_config["namespace"] = ""
                mapping_configs_by_step["Project"].append(project_mapping_config)
                max_path_length = max(max_path_length, len(project_mapping_config.get("path")))
                max_namespace_length = max(max_namespace_length, len(Util.get_namespace(project_mapping_config)))
        
        # Installed managed package mapping configs
        mapping_configs_by_step["Managed packages"] = []
        if not process_bool_arg(self.options.get("skip_mapping_installed_managed_packages")):
            for namespace in self.get_installed_package_namespaces():
                if available_package_mappings.get(namespace):
                    mapping_config = available_package_mappings.get(namespace)
                    mapping_configs_by_step["Managed packages"].append(mapping_config)
                    max_path_length = max(max_path_length, len(mapping_config.get("path")))
                    max_namespace_length = max(max_namespace_length, len(Util.get_namespace(mapping_config)))

        # Post mapping configs
        mapping_configs_by_step["Post"] = self.get_mapping_configs_from_option("post_mapping_configs")
        for mapping_config in mapping_configs_by_step["Post"]:
            max_path_length = max(max_path_length, len(mapping_config.get("path")))
            max_namespace_length = max(max_namespace_length, len(Util.get_namespace(mapping_config)))

        # Log mapping configs
        max_step_length = len("STEP")
        for step in mapping_configs_by_step.keys():
            max_step_length = max(max_step_length, len(step))
        
        self.log_title("Mapping configs")
        self.logger.info("┌─{}─┬─{}─┬─{}─┐".format(
            "─" * max_step_length,
            "─" * max_path_length,
            "─" * max_namespace_length,
        ))
        self.logger.info("│ STEP{} │ PATH{} | NAMESPACE{} │".format(
            " " * (max_step_length - len("STEP")),
            " " * (max_path_length - len("PATH")),
            " " * (max_namespace_length - len("NAMESPACE")),
        ))
        line_break = "├─{}─┼─{}─┼─{}─┤".format(
            "─" * max_step_length,
            "─" * max_path_length,
            "─" * max_namespace_length,
        )
        step_line_break = "│ {} ├─{}─┼─{}─┤".format(
            " " * max_step_length,
            "─" * max_path_length,
            "─" * max_namespace_length,
        )

        all_mapping_configs = []

        for step, mapping_configs in mapping_configs_by_step.items():
            if mapping_configs:
                all_mapping_configs.extend(mapping_configs)
                is_first = True
                for mapping_config in mapping_configs:
                    path = mapping_config.get("path")
                    namespace = Util.get_namespace(mapping_config)
                    self.logger.info(line_break if is_first else step_line_break)
                    self.logger.info("│ {} │ {} │ {} │".format(
                        "{}{}".format(
                            step,
                            " " * (max_step_length - len(step)),
                        ) if is_first else " " * max_step_length,
                        "{}{}".format(
                            path,
                            " " * (max_path_length - len(path)),
                        ),
                        "{}{}".format(
                            namespace,
                            " " * (max_namespace_length - len(namespace)),
                        ),
                    ))
                    is_first = False
            else:
                self.logger.info(line_break)
                self.logger.info("│ {} │ {} │ {} │".format(
                    "{}{}".format(
                        step,
                        " " * (max_step_length - len(step)),
                    ),
                    "{}{}".format(
                        "SKIPPED",
                        " " * (max_path_length - len("SKIPPED")),
                    ),
                    " " * max_namespace_length,
                ))


        self.logger.info("└─{}─┴─{}─┴─{}─┘".format(
            "─" * max_step_length,
            "─" * max_path_length,
            "─" * max_namespace_length,
        ))

        # Combine mappings
        mapping = Util.get_combined_mapping(all_mapping_configs)

        if process_bool_arg(self.options.get("log_mapping")):
            self.log_title("Combined mapping")
            self.log_combined_mapping(mapping)
        
        return mapping

class LogMapping(MappingGenerator):
    
    task_options = {
        **MappingGenerator.task_options,
        "log_mapping": {
            "description": "Logs the combined mapping in the terminal.  Always True.",
        },
    }

    def _run_task(self):
        self.options["log_mapping"] = True
        self.get_combined_mapping()

class CreateMapping(MappingGenerator):
    task_options = {
        "output_path": {
            "description": "Path to save combined mapping",
            "required": True,
        },
        **MappingGenerator.task_options,
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
        **MappingGenerator.task_options,
    }

    def _init_mapping(self):
        self.mapping = self.get_combined_mapping()

class CaptureData(ExtractData, MappingGenerator):

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
        **MappingGenerator.task_options,
    }

    def _init_mapping(self):
        self.mappings = self.get_combined_mapping()

class Util:

    @staticmethod
    def get_namespace(mapping_config):
        return "" if not mapping_config.get("namespace") else mapping_config.get("namespace")

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
    def get_combined_mapping(mapping_configs):
        combined_mapping = OrderedDict()
        
        if mapping_configs:
            for mapping_config in mapping_configs:
                if "path" in mapping_config:
                    Util.combine_mapping(
                        combined_mapping,
                        mapping_config["path"],
                        mapping_config.get("namespace")
                    )

        Util.add_sf_id(combined_mapping)

        return combined_mapping