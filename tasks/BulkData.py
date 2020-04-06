import os
import yaml
from tasks.namespaces import NamespaceInfo
from cumulusci.tasks.salesforce import BaseSalesforceApiTask
from cumulusci.core.utils import process_bool_arg
from cumulusci.utils import os_friendly_path
from cumulusci.tasks.bulkdata import LoadData, ExtractData

class MappingGenerator(NamespaceInfo, BaseSalesforceApiTask):
    task_options = {
        "package_mapping_directories": {
            "description": "List of directory paths containing package mapping files.  Package mappings have file names are in the form '[namespace].yml' and are used to automatically include mapping configs for the CumulusCI project and installed managed packages in the org with the namespaced injected if applicable.",
            "required": True,
        },
        "pre_mapping_configs": {
            "description": "List of mapping config objects added to the combined mapping before project, installed packages, and post-mapping configs are added.  Use to initialize combined mapping for Bulk Data Tasks.  Mapping configs are Dicts that (1) contain a required 'path' attribute containing the path to the mapping file, (2) an optional 'namespace' attribute that is injected into the mapping, and (3) an optional 'inject_project_namespace' which injects the project's namespace overriding 'namespace' if True.",
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
        "post_mapping_configs": {
            "description": "List of mapping config objects added to the combined mapping after adding pre-, project, installed packages configs.  Use to override any mappings before creating the combined mapping for Bulk Data Tasks.  Mapping configs are Dicts that (1) contain a required 'path' attribute containing the path to the mapping file and (2) an optional 'namespace' attribute that is injected into the mapping.",
            "required": False,
        },
        "log_mapping": {
            "description": "If a valid value, logs the combined mapping in the console.  Valid values: (1) 'YAML' or 'yml' to log as a YAML file; (2) 'table' to log as a table.  Default: None",
            "required": False,
        },
    }

    def get_project_namespace(self):
        ns = self.org_config.config.get("project_namespace") if self.org_config.config.get("project_namespace") else super().get_project_namespace()
        if ns in self.get_namespaces():
            return None
        else:
            return ns

    def get_available_package_mappings(self):
        rows = [
            [
                "PATH",
                "NAMESPACE"
            ]
        ]

        available_mappings = {} 
        for directory in self.options["package_mapping_directories"]:
            root = os_friendly_path(directory)
            items = os.listdir(root)
            items.sort()
            is_first = True
            for item in items:
                path = os.path.join(root, item)
                if os.path.isfile(os.path.join(root, item)) and item.endswith(".yml"):
                    namespace = item[:-4]
                    mapping = {
                        "path": path,
                        "namespace": namespace,
                    }
                    available_mappings[namespace] = mapping
                    rows.append([
                        root if is_first else "",
                        namespace
                    ])
                    is_first = False

        self.log_table(rows, groupByBlankColumns=True)
        
        return available_mappings

    def get_log_mapping_option(self):
        log_option = str(self.options.get("log_mapping"))
        if log_option == "yml" or log_option == "yaml":
            return "yml"
        elif log_option == "table":
            return "table"

    def log_combined_mapping(self, mapping):
        log_option = self.get_log_mapping_option()
        if log_option:
            self.log_title("Combined mapping")
            if log_option == "yml":
                for row in Util.print_mapping_as_list(
                    mapping, 
                    self.options.get("mapping_tab_size"),
                ):
                    self.logger.info(row)
            elif log_option == "table":
                self.log_table(
                    Util.print_mapping_as_table(mapping), 
                    groupByBlankColumns=True,
                )

    def get_mapping_configs_from_option(self, option):
        mapping_configs = []
        option_mapping_configs = self.options.get(option, []).copy()
        if option_mapping_configs:
            for mapping_config in option_mapping_configs:
                add_mapping_config = True
                if mapping_config.get("when_all_namespaces"):
                    add_mapping_config = True
                    for namespace in mapping_config.get("when_all_namespaces"):
                        if namespace not in self.get_namespaces():
                            add_mapping_config = False
                            break
                
                if add_mapping_config:
                    if process_bool_arg(mapping_config.get("inject_project_namespace")) or "namespace" not in mapping_config:
                        mapping_config["namespace"] = self.get_local_project_namespace()
                    mapping_configs.append(mapping_config)
        return mapping_configs

    def keep_existing_record_types(self, mapping):
        # Collect sobject_type and developer_name of Record Types used in mapping.
        sobject_types = []
        developer_names = []
        
        for step_name, step in mapping.items():
            record_type = step.get("record_type")
            sf_object = step.get("sf_object")
            if record_type:
                sobject_types.append(sf_object)
                developer_names.append(record_type)

        if not sobject_types:
            return

        # Query org for Record Types that exist.  Sometimes a mapping says to use a Record Type that isn't installed with a dependency.
        query = "SELECT SobjectType, DeveloperName FROM RecordType WHERE SObjectType IN ({}) and DeveloperName IN ({})".format(
            "'" + "','".join(sobject_types) + "'",
            "'" + "','".join(developer_names) + "'",
        )

        developer_names_by_object = {}
        for record in self.sf.query_all(query).get("records"):
            sobject_type = record.get("SobjectType")
            developer_name = record.get("DeveloperName")

            developer_names = developer_names_by_object.get(sobject_type) or {}
            developer_names[developer_name] = None
            developer_names_by_object[sobject_type] = developer_names

        rows = [
            [
                "STEP",
                "OBJECT",
                "RECORD TYPE",
                "EXISTS"
            ]
        ]

        # Delete step's "record_type" key if values doesn't exist in developer_names_by_object.
        for step_name, step in mapping.items():
            developer_name = step.get("record_type")
            sobject_type = step.get("sf_object")
            if developer_name:
                if not (developer_names_by_object.get(sobject_type) and developer_name in developer_names_by_object[sobject_type]):
                    del step["record_type"]
                rows.append([
                    step_name,
                    sobject_type,
                    developer_name,
                    "✅" if step.get("record_type") else "❌"
                ])

        self.log_title("Removing Record Types from mapping that don't exist in org")
        self.log_table(rows)

    def get_combined_mapping(self):
        self.options["log_installed_packages"] = True

        available_package_mappings = self.get_available_package_mappings()

        mapping_configs_by_step = {}

        # Pre mapping configs
        mapping_configs_by_step["Pre"] = self.get_mapping_configs_from_option("pre_mapping_configs")

        # Project mapping config
        mapping_configs_by_step["Project"] = []
        if not process_bool_arg(self.options.get("skip_mapping_project")):
            project_namespace = self.get_project_namespace()
            project_mapping_config = available_package_mappings.get(project_namespace)
            if project_mapping_config:
                project_mapping_config["namespace"] = self.get_local_project_namespace()
                mapping_configs_by_step["Project"].append(project_mapping_config)
        
        # Installed managed package mapping configs
        mapping_configs_by_step["Managed packages"] = []
        if not process_bool_arg(self.options.get("skip_mapping_installed_managed_packages")):
            for namespace in self.get_installed_package_namespaces():
                if available_package_mappings.get(namespace):
                    mapping_config = available_package_mappings.get(namespace)
                    mapping_configs_by_step["Managed packages"].append(mapping_config)

        # Post mapping configs
        mapping_configs_by_step["Post"] = self.get_mapping_configs_from_option("post_mapping_configs")

        # Log mapping configs
        self.log_title("Mapping configs")

        all_mapping_configs = []

        rows = [
            [
                "SELF",
                "PATH",
                "NAMESPACE",
            ]
        ]
        for step, mapping_configs in mapping_configs_by_step.items():
            if mapping_configs:
                is_first = True
                for mapping_config in mapping_configs:
                    rows.append([
                        step if is_first else "",
                        mapping_config.get("path"),
                        "" if not mapping_config.get("namespace") else mapping_config.get("namespace")
                    ])
                    is_first = False
                    all_mapping_configs.append(mapping_config)
            else:
                rows.append([
                    step,
                    "SKIPPED",
                    ""
                ])

        # self.log_table(rows, groupByFirstColumnIfBlank=True)
        self.log_table(rows, groupByBlankColumns=True)

        # Combine mappings
        mapping = Util.get_combined_mapping(all_mapping_configs)

        self.keep_existing_record_types(mapping)

        self.log_combined_mapping(mapping)

        return mapping

class LogMapping(MappingGenerator):
    
    task_options = {
        **MappingGenerator.task_options,
    }

    def _run_task(self):
        if not self.get_log_mapping_option():
            self.options["log_mapping"] = "yml"
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
    def force_id_primary_key(mapping):
        for step_name, step in mapping.items():
            if "fields" in step:
                step["fields"]["Id"] = "sf_id"

    @staticmethod
    def force_autonumber_primary_key(mapping):
        for step_name, step in mapping.items():
            if "fields" in step:
                fields = step["fields"]
                if "Id" in fields:
                    del fields["Id"]

    @staticmethod
    def get_mapping_from_file(mapping_path):
        with open(os_friendly_path(mapping_path), "r") as f:
            return yaml.safe_load(f)

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
    def print_mapping_as_table(mapping):
        rows = [
            [
                "STEP",
                "PARAMETER",
                "FIELD",
            ]
        ]
        for step_name, step in mapping.items():
            is_first_step = True
            for param in ["sf_object", "table", "record_type"]:
                if param in step:
                    rows.append([
                        step_name if is_first_step else "",
                        param,
                        step[param],
                    ])
                    is_first_step = False
            if "fields" in step:
                is_first_field = True
                for key, value in step["fields"].items():
                    rows.append([
                        step_name if is_first_step else "",
                        "fields" if is_first_field else "",
                        key,
                        value
                    ])
                    is_first_step = False
                    is_first_field = False
            if "lookups" in step:
                
                for api_name, lookup in step["lookups"].items():
                    is_first_lookup = True
                    for lookup_param in lookup.keys():
                        rows.append([
                            step_name if is_first_step else "",
                            "lookups" if is_first_lookup else "",
                            api_name if is_first_lookup else "",
                            lookup_param, 
                            lookup[lookup_param]
                        ])
                        is_first_step = False
                        is_first_lookup = False
        return rows

    @staticmethod
    def combine_mapping(mapping, new_mapping_path, new_mapping_namespace):
        new_mapping = Util.get_mapping_from_file(new_mapping_path)
        if new_mapping:
            for step_name, step in new_mapping.items():
                if step_name not in mapping:
                    mapping[step_name] = {}

                for step_config in step.keys():
                    if step_config == "fields" or step_config == "lookups":
                        if step_config not in mapping[step_name]:
                            mapping[step_name][step_config] = {}
                        for api_name, value in step[step_config].items():
                            mapping[step_name][step_config][Util.get_api_name(new_mapping_namespace, api_name)] = value
                    elif step_config == "sf_object" and step["sf_object"] and step["sf_object"].endswith("__c"):
                        mapping[step_name]["sf_object"] = Util.get_api_name(new_mapping_namespace, step["sf_object"])
                    else:
                        mapping[step_name][step_config] = step[step_config]

    @staticmethod
    def get_combined_mapping(mapping_configs, forcePrimaryKey="autonumber"):
        combined_mapping = {}
        
        if mapping_configs:
            for mapping_config in mapping_configs:
                if "path" in mapping_config:
                    Util.combine_mapping(
                        combined_mapping,
                        mapping_config["path"],
                        mapping_config.get("namespace")
                    )

        if forcePrimaryKey == "autonumber":
            Util.force_autonumber_primary_key(combined_mapping)
        elif forcePrimaryKey == "id":
            Util.force_id_primary_key(combined_mapping)

        return combined_mapping