import os
import yaml
from tasks.namespaces import NamespaceInfo
from cumulusci.tasks.salesforce import BaseSalesforceApiTask
from cumulusci.core.utils import process_bool_arg
from cumulusci.utils import os_friendly_path
from tasks.bulkdata import LoadData, ExtractData, DeleteData as BaseDeleteData
from cumulusci.core.exceptions import TaskOptionsError

class MappingGenerator(NamespaceInfo, BaseSalesforceApiTask):
    task_options = {
        "package_mapping_directories": {
            "description": "List of directory paths containing package mapping files.  Package mappings have file names are in the form '[namespace].yml' and are used to automatically include mapping configs for the CumulusCI project and installed managed packages in the org with the namespaced injected if applicable.",
            "required": False,
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
        "skip_keeping_existing_record_types": {
            "description": "Skips check to only keep record_types that exist in the org",
            "required": False,
        },
    }

    def get_available_package_mappings(self):
        rows = [
            [
                "PATH",
                "NAMESPACE"
            ]
        ]

        available_mappings = {} 
        if self.options.get("package_mapping_directories"):
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
        mapping_configs = self.options.get(option, []).copy()
        if mapping_configs:
            for mapping_config in mapping_configs:
                if process_bool_arg(mapping_config.get("inject_project_namespace")):
                    mapping_config["namespace"] = self.get_local_project_namespace()
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

        if not process_bool_arg(self.options.get("skip_keeping_existing_record_types")):
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

class DeleteData(BaseDeleteData, MappingGenerator):

    task_options = {
        **MappingGenerator.task_options,
    }

    def _init_options(self, kwargs):
        super(BaseDeleteData, self)._init_options(kwargs)

        # Getting an error that self.sf doesn't exist???
        self.options["skip_keeping_existing_record_types"] = True

        # Always hard-delete
        self.options["hardDelete"] = process_bool_arg(self.options.get("hardDelete"))
        self.options["where"] = self.options.get("where", None)

        # Generate objects from mapping
        self.options["objects"] = self._get_objects_from_combined_mapping()
        if not len(self.options["objects"]) or not self.options["objects"][0]:
            raise TaskOptionsError("At least one object must be specified.")

    def log_set(self, title, values):
        rows = [
            [
                title
            ]
        ]
        for value in values:
            rows.append([
                value
            ])

        self.log_table(rows, )

    def _get_objects_from_combined_mapping(self):
        self.tables_by_name = {}
        
        #self.combined_mapping = self.get_combined_mapping()
        for step_name, step in self.get_combined_mapping().items():
            parent_names = []
            if "lookups" in step:
                for api_name, lookup in step.get("lookups").items():
                    parent_names.append(lookup.get("table"))
                    
            table = {
                "name": step.get("table"),
                "sf_object": step.get("sf_object"),
                "parent_names": parent_names,
                "parent_sf_objects": set(),
                "children_names": [],
                "child_sf_objects": set(),
            }
            self.tables_by_name[table.get("name")] = table

        for name, table in self.tables_by_name.items():
            for parent_name in table.get("parent_names"):
                if parent_name != name:
                    self.tables_by_name.get(parent_name).get("children_names").append(name)
                    self.tables_by_name.get(parent_name).get("child_sf_objects").add(table.get("sf_object"))
                
                parent_sf_object = self.tables_by_name.get(parent_name).get("sf_object")
                # Ignore circuluar references
                if parent_sf_object != table.get("sf_object"):
                    table.get("parent_sf_objects").add(parent_sf_object)
        
        rows = [
            [
                "name",
                "sf_object",
                "parent_sf_objects",
                "child_sf_objects",
            ]
        ]

        for name, table in self.tables_by_name.items():
            if table.get("child_sf_objects"):
                is_first = True
                for child_sf_object in table.get("child_sf_objects"):
                    rows.append([
                        name if is_first else "",
                        table.get("sf_object") if is_first else "",
                        ", ".join(table.get("parent_sf_objects")) if is_first else "",
                        child_sf_object,
                    ])
                    is_first = False
            else:
                rows.append([
                    name,
                    table.get("sf_object"),
                    ", ".join(table.get("parent_sf_objects")),
                    ", ".join(table.get("child_sf_objects")),
                ])

        self.log_table(rows, groupByBlankColumns=True)

        children_by_parent = self._get_children_by_parent()   
        parents_by_child = self._get_parents_by_child()

        sobjects_by_name = {}
        for parent, children in children_by_parent.items():
            sobjects_by_name[parent] = {
                "name": parent,
                "children_names": children,
                "children": {},
                "parent_names": parents_by_child[parent],
                "parents": {},
                "ancestor_names": set()
            }

        bottom_names = set()
        top_names = set()
        for name, sobject in sobjects_by_name.items():
            for child_name in sobject.get("children_names"):
                sobject["children"][child_name] = sobjects_by_name[child_name]
            for parent_name in sobject.get("parent_names"):
                sobject["parents"][parent_name] = sobjects_by_name[parent_name]
            if not sobject.get("children"):
                bottom_names.add(name)
            if not sobject.get("parents"):
                top_names.add(name)

        for name, sobject in sobjects_by_name.items():
            ancestor_names = set()
            current_parents = set()
            current_parents.update(sobject.get("parents"))
            while current_parents:
                ancestor_names.update(current_parents)
                next_parents = set()
                for parent in current_parents:
                    next_parents.update(sobjects_by_name[parent].get("parents"))
                current_parents = next_parents
            sobject["ancestor_names"] = ancestor_names
            self.log_set("=== {} ===".format(name), ancestor_names)

        self.log_set("bottom_names", bottom_names)
        self.log_set("top_names", top_names)

        bottom_up = []
        current_names = bottom_names
        while current_names:
            bottom_up.extend(current_names)

            next_names = set()
            all_ancestors = set()
            for name in current_names:
                sobject = sobjects_by_name[name]
                # remove current parents from sobject's ancestors
                sobject["ancestor_names"] = sobject.get("ancestor_names") - sobject.get("parent_names")
     
                # Collect all ancestors and all parent's ancestors since higher SObjects have dependencies
                all_ancestors.update(sobject.get("ancestor_names"))
                for parent in sobject.get("parent_names"):
                    all_ancestors.update(sobjects_by_name[parent].get("ancestor_names"))

            for name in current_names:
                sobject = sobjects_by_name[name]
                for parent in sobject.get("parent_names"):
                    if parent not in all_ancestors:
                        next_names.add(parent)

            current_names = next_names

        self.log_set("==== BOTTOM UP ====", bottom_up)

        return bottom_up

    def _get_children_by_parent(self):
        # child by parent
        children_by_parent = {}
        for name, table in self.tables_by_name.items():
            parent = table.get("sf_object")
            children = children_by_parent.get(parent)
            if not children:
                children = set()
            children.update(table.get("child_sf_objects"))
            children_by_parent[parent] = children


        rows = [
            [
                "parent",
                "children",
            ]
        ]

        for parent, children in children_by_parent.items():
            if children:
                is_first = True
                for child in children:
                    rows.append([
                        parent if is_first else "",
                        child
                    ])
                    is_first = False
            else:
                rows.append([
                    parent,
                    ""
                ])
        self.log_table(rows, groupByBlankColumns=True)

        return children_by_parent

    def _get_parents_by_child(self):
        parents_by_child = {}
        for name, table in self.tables_by_name.items():
            child = table.get("sf_object")
            parents = parents_by_child.get(child)
            if not parents:
                parents = set()
            parents.update(table.get("parent_sf_objects"))
            parents_by_child[child] = parents

        rows = [
            [
                "child",
                "parents",
            ]
        ]

        for child, parents in parents_by_child.items():
            if parents:
                is_first = True
                for parent in parents:
                    rows.append([
                        child if is_first else "",
                        parent
                    ])
                    is_first = False
            else:
                rows.append([
                    child,
                    ""
                ])
        self.log_table(rows, groupByBlankColumns=True)

        return parents_by_child

class Util:

    @staticmethod
    def get_children_sf_objects(parent, tables_by_name):
        sf_objects = set()
        sf_objects.add(parent.get("sf_object"))
        if parent.get("children_names"): 
            for child_name in parent.get("children_names"):
                child = tables_by_name.get(child_name)
                sf_objects.update(Util.get_children_sf_objects(child, tables_by_name))
        return sf_objects

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