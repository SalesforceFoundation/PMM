import os
import yaml
import functools
from tasks.logger import LoggingTask
from tasks.namespaces import NamespaceTask, Namespace
from cumulusci.tasks.salesforce import BaseSalesforceApiTask
from cumulusci.core.utils import process_bool_arg
from cumulusci.utils import os_friendly_path
from tasks.bulkdata import LoadData, ExtractData, DeleteData as BaseDeleteData
from cumulusci.core.exceptions import TaskOptionsError


class BulkData(Namespace):

    def __init__(
        self,
        namespace: Namespace,
        map_path = None,
        sql_path = None,
        record_types_by_sobject = None,
    ) -> None:
        self._namespace = namespace.namespace
        self._local_namespace = namespace.local_namespace
        self._version = namespace.version
        self._map_path = map_path
        self._sql_path = sql_path

        self._map = {}
        if self._map_path:
            with open(os_friendly_path(self.map_path), "r") as f:
                self._map = yaml.safe_load(f)
            
            # inject namepsace into fields and lookups
            for _, step in self._map.items():
                for key in [
                    "fields", 
                    "lookups",
                ]:
                    if step.get(key):
                        fields_to_delete = set()
                        new_fields = {}
                        for field in step[key].keys():
                            namespaced_field = self.inject_field_namespace(field)
                            if field != namespaced_field:
                                new_fields[namespaced_field] = step[key][field]
                                fields_to_delete.add(field)
                        for field in fields_to_delete:
                            del step[key][field]
                        step[key].update(new_fields)
                
                # inject namespace in sf_object
                sobject = step["sf_object"]
                step["sf_object"] = self.inject_sobject_namespace(sobject)
                
                # delete record_type if doesn't exist in org
                if step.get("record_type"):
                    if not (
                        record_types_by_sobject 
                        and record_types_by_sobject.get(sobject) 
                        and step.get("record_type") in record_types_by_sobject.get(sobject)
                    ):
                        del step["record_type"]

            # Order steps in dependency order
            self._map = BulkData.order_map(self._map)

    def __repr__(self) -> str:
        return (
            'BulkData('
            f'namespace={self.namespace!r}, local_namespace={self.local_namespace!r}, '
            f'version={self.version!r}), map_path={self.map_path!r}, sql_path={self.sql_path!r}'
        )

    def __hash__(self) -> int:
        return hash((self.namespace, self.map_path, self.sql_path))

    def __eq__(self, other) -> bool:
        if not isinstance(other, Namespace):
            return NotImplemented
        return (
            (self.namespace, self.local_namespace, self.version, self.map_path, self.sql_path) == 
            (other.namespace, other.local_namespace, other.version, other.map_path, other.sql_path))

    def __lt__(self, other):
        if not isinstance(other, Namespace):
            return NotImplemented
        return self.namespace < other.namespace and self.map_path < other.map_path and self.sql_path < other.sql_path

    @property
    def map_path(self):
        return self._map_path

    @map_path.setter
    def map_path(self, value):
        pass

    @map_path.deleter
    def map_path(self):
        pass

    @property
    def sql_path(self):
        return self._sql_path

    @sql_path.setter
    def sql_path(self, value):
        pass

    @sql_path.deleter
    def sql_path(self):
        pass

    @property
    def map(self):
        return self._map

    @map.setter
    def map(self, map):
        # Combines self.map and map
        if map:
            for step_name, step in map.items():
                if step_name not in self.map:
                    self.map[step_name] = {}

                for key in step.keys():
                    if key == "fields" or key == "lookups":
                        if key not in self.map[step_name]:
                            self.map[step_name][key] = {}
                        for field, value in step[key].items():
                            self.map[step_name][key][field] = value
                    else:
                        self.map[step_name][key] = step[key]

        # Order steps in dependency order
        self._map = BulkData.order_map(self._map)

    @map.deleter
    def map(self):
        self._map = {}

    def get_map_as_table_rows(self):
        rows = [
            [
                "STEP", 
                "PARAMETER", 
                "API NAME",
                "SQL NAME",
            ]
        ]
        for step_name, step in self.map.items():
            is_first_step = True
            if "sf_object" in step:
                rows.append([
                    step_name if is_first_step else "", 
                    "sf_object",
                    step["sf_object"],
                    step.get("table")
                ])
                is_first_step = False
            if "record_type" in step:
                rows.append([
                    step_name if is_first_step else "", 
                    "record_type",
                    step["record_type"],
                ])
                is_first_step = False
            
            if "fields" in step:
                is_first_field = True
                for key, value in step["fields"].items():
                    rows.append(
                        [
                            step_name if is_first_step else "",
                            "fields" if is_first_field else "",
                            key,
                            value,
                        ]
                    )
                    is_first_step = False
                    is_first_field = False
            if "lookups" in step:
                for api_name, lookup in step["lookups"].items():
                    is_first_lookup = True
                    for lookup_param in lookup.keys():
                        rows.append(
                            [
                                step_name if is_first_step else "",
                                "lookups" if is_first_lookup else "",
                                api_name if is_first_lookup else "",
                                lookup_param,
                                lookup[lookup_param],
                            ]
                        )
                        is_first_step = False
                        is_first_lookup = False
        return rows

    @property
    def sobjects_for_delete(self):
        return BulkData.get_sobjects_orderd_bottom_to_top(self.map)

    @staticmethod
    def get_sobjects_orderd_bottom_to_top(map):
        sobject_names_by_table = {}
        sobjects_by_name = {}

        # Collect tables' sobjects
        for _, step in map.items():
            sobject_names_by_table[step.get("table")] = step.get("sf_object")

        # Collect each sobject's parents to know which sobjects are dependencies 
        for _, step in map.items():
            sobject = step.get("sf_object")
            parents = set()
            if "lookups" in step:
                for _, lookup in step.get("lookups").items():
                    parent = sobject_names_by_table.get(lookup.get("table"))

                    # Ignore circular references
                    if parent != sobject:
                        parents.add(parent)

            sobjects_by_name[step.get("sf_object")] = {
                "name": sobject,
                "parents": parents,
                "children": set(),
            }

        # Collect each sobject's children and ancestors
        for name, sobject in sobjects_by_name.items():

            # Collect all sobjects where this sobject is a direct dependency as "children", i.e. sobjects where this sobject is a parent
            for parent in sobject.get("parents"):
                # Ignore circular references
                if parent != name:
                    sobjects_by_name.get(parent).get("children").add(name)

            # Collect all dependent sobjects as "ancestors", e.g. parents, grandparents, great-grandparents, etc.
            ancestors = set()
            current_parents = set(sobject.get("parents"))
            while current_parents:
                ancestors.update(current_parents)
                next_parents = set()
                for parent in current_parents:
                    next_parents.update(sobjects_by_name[parent].get("parents"))
                current_parents = next_parents
            sobject["ancestors"] = ancestors

        # Collect sobjects that are not a dependency for other sobjects, i.e. have no children
        sobjects_without_children = set()
        for name, sobject in sobjects_by_name.items():
            if not sobject.get("children"):
                sobjects_without_children.add(name)

        # Order all sobjects by dependency starting with sobjects that are no a dependency for other sobjects, i.e. "bottom up"
        sobjects_bottom_up = []
        current_sobjects = set(sobjects_without_children)
        while current_sobjects:
            sobjects_bottom_up.extend(current_sobjects)

            next_sobjects = set()
            all_ancestors = set()

            # Collect all dependencies/ancestors for current_sobjects' parents
            for name in current_sobjects:
                sobject = sobjects_by_name[name]

                # Remove parents from ancestors
                sobject["ancestors"] = sobject.get("ancestors") - sobject.get("parents")

                # Collect all non-parent ancestors
                all_ancestors.update(sobject.get("ancestors"))

                # Collect all parents' ancestors in case a parent is also a dependency/ancestor of a grandparent
                for parent in sobject.get("parents"):
                    all_ancestors.update(sobjects_by_name[parent].get("ancestors"))

            # Add all parents to next_sobjects if the parent is not a later dependency for any sobject in current_sobjects
            for name in current_sobjects:
                sobject = sobjects_by_name[name]
                for parent in sobject.get("parents"):
                    # Don't include parents that are a later dependency
                    if parent not in all_ancestors:
                        next_sobjects.add(parent)

            current_sobjects = next_sobjects

        return sobjects_bottom_up

    @staticmethod
    def get_sobjects_orderd_top_to_bottom(map):
        return list(reversed(BulkData.get_sobjects_orderd_bottom_to_top(map)))

    @staticmethod
    def order_map(map):
        step_names_by_sobject = {}
        for step_name, step in map.items():
            sobject = step.get("sf_object")
            step_names = step_names_by_sobject.get(sobject)
            if not step_names:
                step_names = []
                step_names_by_sobject[sobject] = step_names
            step_names.append(step_name)

        ordered_mapping = {}
        for sobject in BulkData.get_sobjects_orderd_top_to_bottom(map):
            for step_name in step_names_by_sobject[sobject]:
                ordered_mapping[step_name] = map[step_name]

        return ordered_mapping
    
class RecordTypeTask(LoggingTask, BaseSalesforceApiTask):

    def _get_record_type_query(self):
        return "SELECT SobjectType, DeveloperName FROM RecordType ORDER BY SobjectType, DeveloperName"

    @property
    @functools.lru_cache()
    def record_types_by_sobject(self):
        # Query org for all Record Types
        self._record_types_by_sobject = {}

        rows = [
            [
                "SOBJECT TYPE",
                "DEVELOPER NAME"
            ]
        ]

        last_sobject_type = None
        for record in self.sf.query_all(self._get_record_type_query()).get("records"):
            sobject_type = record.get("SobjectType")
            developer_name = record.get("DeveloperName")

            developer_names = self._record_types_by_sobject.get(sobject_type) or set()
            developer_names.add(developer_name)

            self._record_types_by_sobject[sobject_type] = developer_names
            rows.append(
                [
                    sobject_type if sobject_type != last_sobject_type else "",
                    developer_name
                ]
            )

            last_sobject_type = sobject_type

        
        if not self._record_types_by_sobject:
            rows.append([
                "💤  NONE  💤"
            ])
        self.log_title("Record Types")
        self.log_table(rows)

        return self._record_types_by_sobject


class BulkDataTask(NamespaceTask, RecordTypeTask):
    task_options = {
        "data": {
            "description": "If True, combines SQL files"
        },
        "log_maps": {
            "description": "Option to logs map in console.  Options are 'None', 'Combined', or 'All'. Default: None",
            "required": False,
        },
    }

    @property
    def log_all_maps(self):
        return not self.options.get("log_maps") is None and self.options.get("log_maps").lower() == "all"

    @property
    def log_combined_maps(self):
        return self.log_all_maps or (not self.options.get("log_maps") is None and self.options.get("log_maps").lower() == "combined")

    @property
    @functools.lru_cache()
    def bulk_data(self):
        self._bulk_data = {}

        rows = [
            [
                "NAME",
                "NAMESPACE",
                "REQUIRES NAMESPACES",
                "USED",
                "MAP",
                "SQL",
            ]
        ]

        for name, data in self.options["bulk_data"].items():
            namespace_info = self.get_namespaces().get(data.get("namespace"))
            
            all_namespaces = set()
            all_namespaces.add(data.get("namespace"))
            if data.get("when_all_namespaces"):
                all_namespaces.update(data.get("when_all_namespaces"))

            is_used = ""
            if namespace_info and all(namespace in self.get_namespaces() for namespace in all_namespaces):
                is_used = "✅"
                self._bulk_data[name] = BulkData(
                    namespace_info, 
                    data.get("map"), 
                    data.get("sql"),
                    self.record_types_by_sobject
                )

            rows.append([
                name,
                data.get("namespace"),
                "'" + "', '".join(all_namespaces) + "'",
                is_used,
                data.get("map"),
                data.get("sql"),
            ])
        
        # log summary
        self.log_title("bulk_data")
        self.log_table(rows)

        if self.log_all_maps:
            for name, data in self._bulk_data.items():
                self.log_title(name)
                self.log_table(data.get_map_as_table_rows())

        return self._bulk_data

    @property
    @functools.lru_cache()
    def combined_bulk_data(self):
        self._combined_bulk_data = BulkData(self.get_namespaces().get("c"))

        for data in self.bulk_data.values():
            self._combined_bulk_data.map = data.map

        if self.log_combined_maps:
            self.log_title("Combined Data")
            self.log_table(self._combined_bulk_data.get_map_as_table_rows())

        return self._combined_bulk_data

class LogBulkDataMapTask(BulkDataTask):

    task_options = {
        **BulkDataTask.task_options,
    }

    def _run_task(self):
        self.options["log_maps"] = "combined"
        
        # Calling combined_bulk_data logs the map
        self.combined_bulk_data


class DeleteBulkDataTask(BaseDeleteData, BulkDataTask):

    task_options = {
        **BulkDataTask.task_options,
    }

    def _init_options(self, kwargs):
        super(BaseDeleteData, self)._init_options(kwargs)

        # Always hard-delete
        self.options["hardDelete"] = process_bool_arg(self.options.get("hardDelete"))
        self.options["where"] = self.options.get("where", None)

        # Generate objects from mapping
        self.options["objects"] = self.combined_bulk_data.sobjects_for_delete

        self.log_title("Object to delete")
        self.log_list(self.options.get("objects"))

        if not len(self.options["objects"]) or not self.options["objects"][0]:
            raise TaskOptionsError("At least one object must be specified.")




class MappingGenerator(NamespaceTask, BaseSalesforceApiTask):
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
            "default": True,
        },
        "skip_mapping_installed_managed_packages": {
            "description": "If True, skips adding mapping configs for the org's installed managed packages.  Default: False",
            "required": False,
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

    """
    def get_project_namespace(self):
        return self.org_config.config.get("project_namespace") if self.org_config.config.get("project_namespace") else super().get_project_namespace()
    """

    def get_available_package_mappings(self):
        rows = [["PATH", "NAMESPACE"]]

        available_mappings = {}
        if self.options.get("package_mapping_directories"):
            for directory in self.options["package_mapping_directories"]:
                root = os_friendly_path(directory)
                items = os.listdir(root)
                items.sort()
                is_first = True
                for item in items:
                    path = os.path.join(root, item)
                    if os.path.isfile(os.path.join(root, item)) and item.endswith(
                        ".yml"
                    ):
                        namespace = item[:-4]
                        mapping = {
                            "path": path,
                            "namespace": namespace,
                        }
                        available_mappings[namespace] = mapping
                        rows.append([root if is_first else "", namespace])
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
                    mapping, self.options.get("mapping_tab_size"),
                ):
                    self.logger.info(row)
            elif log_option == "table":
                self.log_table(
                    Util.print_mapping_as_table(mapping), groupByBlankColumns=True,
                )

    def get_mapping_configs_from_option(self, option):
        mapping_configs = []
        option_mapping_configs = self.options.get(option, []).copy()
        if option_mapping_configs:
            for mapping_config in option_mapping_configs:
                add_mapping_config = True
                if mapping_config.get("when_all_namespaces"):
                    add_mapping_config = all(namespace in self.get_namespaces() for namespace in mapping_config.get("when_all_namespaces"))
                    """
                    for namespace in mapping_config.get("when_all_namespaces"):
                        if namespace not in self.get_namespaces():
                            add_mapping_config = False
                            break
                    """
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

        rows = [["STEP", "OBJECT", "RECORD TYPE", "EXISTS"]]

        # Delete step's "record_type" key if values doesn't exist in developer_names_by_object.
        for step_name, step in mapping.items():
            developer_name = step.get("record_type")
            sobject_type = step.get("sf_object")
            if developer_name:
                if not (
                    developer_names_by_object.get(sobject_type)
                    and developer_name in developer_names_by_object[sobject_type]
                ):
                    del step["record_type"]
                rows.append(
                    [
                        step_name,
                        sobject_type,
                        developer_name,
                        "✅" if step.get("record_type") else "❌",
                    ]
                )

        self.log_title("Removing Record Types from mapping that don't exist in org")
        self.log_table(rows)

    def get_combined_mapping(self):
        self.options["log_installed_packages"] = True

        available_package_mappings = self.get_available_package_mappings()

        mapping_configs_by_step = {}

        # Pre mapping configs
        mapping_configs_by_step["Pre"] = self.get_mapping_configs_from_option(
            "pre_mapping_configs"
        )

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
        if not process_bool_arg(
            self.options.get("skip_mapping_installed_managed_packages")
        ):
            for prefix, namespace in self.get_namspaces().items():
                if namespace.version and available_package_mappings.get(namespace):
                    mapping_config = available_package_mappings.get(namespace)
                    mapping_configs_by_step["Managed packages"].append(mapping_config)

        # Post mapping configs
        mapping_configs_by_step["Post"] = self.get_mapping_configs_from_option(
            "post_mapping_configs"
        )

        # Log mapping configs
        self.log_title("Mapping configs")

        all_mapping_configs = []

        rows = [["SELF", "PATH", "NAMESPACE",]]
        for step, mapping_configs in mapping_configs_by_step.items():
            if mapping_configs:
                is_first = True
                for mapping_config in mapping_configs:
                    rows.append(
                        [
                            step if is_first else "",
                            mapping_config.get("path"),
                            ""
                            if not mapping_config.get("namespace")
                            else mapping_config.get("namespace"),
                        ]
                    )
                    is_first = False
                    all_mapping_configs.append(mapping_config)
            else:
                rows.append([step, "SKIPPED", ""])

        # self.log_table(rows, groupByFirstColumnIfBlank=True)
        self.log_table(rows, groupByBlankColumns=True)

        # Combine mappings
        mapping = Util.get_ordered_mapping(
            Util.get_combined_mapping(all_mapping_configs)
        )

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
            f.write(
                "\n".join(
                    Util.print_mapping_as_list(
                        self.mapping, self.options.get("mapping_tab_size")
                    )
                )
            )


class InsertData(LoadData, MappingGenerator):

    task_options = {
        **LoadData.task_options,
        **MappingGenerator.task_options,
        "combine_sql": {
            "description": "If True, combines SQL files"
        },
        "data": {
            "description": "If True, combines SQL files"
        },
    }

    def _init_mapping(self):
        self.mapping = self.get_combined_mapping()

    def _sqlite_load(self):
        """ # original
        conn = self.session.connection()
        cursor = conn.connection.cursor()
        with open(self.options["sql_path"], "r") as f:
            try:
                cursor.executescript(f.read())
            finally:
                cursor.close()
        # self.session.flush()
        """
        """ TODO
            ------------
            - get each namespace sql file
            - modify each namespace 


            - how to get data files from other repos?
                - add cci task that saves the path of a file in org_config from another repo.

        """
        if process_bool_arg(self.options.get("combine_sql")):
            conn = self.session.connection()
            cursor = conn.connection.cursor()
            with open(self.options["sql_path"], "r") as f:
                try:
                    cursor.executescript(f.read())
                finally:
                    cursor.close()
            # self.session.flush()
        else:
            super()._sqlite_load()
        


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
        self.options["objects"] = Util.get_sobjects_orderd_bottom_to_top(
            self.get_combined_mapping()
        )

        self.log_title("Object to delete")
        self.log_list(self.options.get("objects"))

        if not len(self.options["objects"]) or not self.options["objects"][0]:
            raise TaskOptionsError("At least one object must be specified.")


class Util:
    @staticmethod
    def get_sobjects_orderd_bottom_to_top(mapping):
        sobject_names_by_table = {}
        sobjects_by_name = {}

        # Collect tables' sobjects
        for step_name, step in mapping.items():
            sobject_names_by_table[step.get("table")] = step.get("sf_object")

        # Collect each sobject's parents to know which sobjects are dependencies 
        for step_name, step in mapping.items():
            sobject = step.get("sf_object")
            parents = set()
            if "lookups" in step:
                for api_name, lookup in step.get("lookups").items():
                    parent = sobject_names_by_table.get(lookup.get("table"))

                    # Ignore circular references
                    if parent != sobject:
                        parents.add(parent)

            sobjects_by_name[step.get("sf_object")] = {
                "name": sobject,
                "parents": parents,
                "children": set(),
            }

        # Collect each sobject's children and ancestors
        for name, sobject in sobjects_by_name.items():

            # Collect all sobjects where this sobject is a direct dependency as "children", i.e. sobjects where this sobject is a parent
            for parent in sobject.get("parents"):
                # Ignore circular references
                if parent != name:
                    sobjects_by_name.get(parent).get("children").add(name)

            # Collect all dependent sobjects as "ancestors", e.g. parents, grandparents, great-grandparents, etc.
            ancestors = set()
            current_parents = set(sobject.get("parents"))
            while current_parents:
                ancestors.update(current_parents)
                next_parents = set()
                for parent in current_parents:
                    next_parents.update(sobjects_by_name[parent].get("parents"))
                current_parents = next_parents
            sobject["ancestors"] = ancestors

        # Collect sobjects that are not a dependency for other sobjects, i.e. have no children
        sobjects_without_children = set()
        for name, sobject in sobjects_by_name.items():
            if not sobject.get("children"):
                sobjects_without_children.add(name)

        # Order all sobjects by dependency starting with sobjects that are no a dependency for other sobjects, i.e. "bottom up"
        sobjects_bottom_up = []
        current_sobjects = set(sobjects_without_children)
        while current_sobjects:
            sobjects_bottom_up.extend(current_sobjects)

            next_sobjects = set()
            all_ancestors = set()

            # Collect all dependencies/ancestors for current_sobjects' parents
            for name in current_sobjects:
                sobject = sobjects_by_name[name]

                # Remove parents from ancestors
                sobject["ancestors"] = sobject.get("ancestors") - sobject.get("parents")

                # Collect all non-parent ancestors
                all_ancestors.update(sobject.get("ancestors"))

                # Collect all parents' ancestors in case a parent is also a dependency/ancestor of a grandparent
                for parent in sobject.get("parents"):
                    all_ancestors.update(sobjects_by_name[parent].get("ancestors"))

            # Add all parents to next_sobjects if the parent is not a later dependency for any sobject in current_sobjects
            for name in current_sobjects:
                sobject = sobjects_by_name[name]
                for parent in sobject.get("parents"):
                    # Don't include parents that are a later dependency
                    if parent not in all_ancestors:
                        next_sobjects.add(parent)

            current_sobjects = next_sobjects

        return sobjects_bottom_up

    @staticmethod
    def get_sobjects_orderd_top_to_bottom(mapping):
        return list(reversed(Util.get_sobjects_orderd_bottom_to_top(mapping)))

    @staticmethod
    def get_ordered_mapping(mapping):
        step_names_by_sobject = {}
        for step_name, step in mapping.items():
            sobject = step.get("sf_object")
            step_names = step_names_by_sobject.get(sobject)
            if not step_names:
                step_names = []
                step_names_by_sobject[sobject] = step_names
            step_names.append(step_name)

        ordered_mapping = {}
        for sobject in Util.get_sobjects_orderd_top_to_bottom(mapping):
            for step_name in step_names_by_sobject[sobject]:
                ordered_mapping[step_name] = mapping[step_name]

        return ordered_mapping

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
        return (
            ""
            if not mapping_config.get("namespace")
            else mapping_config.get("namespace")
        )

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
                    rows.append("{}{}: {}".format(tab, param, step[param]))
            if "fields" in step:
                rows.append("{}{}:".format(tab, "fields"))
                for key, value in step["fields"].items():
                    rows.append("{}{}: {}".format(tab * 2, key, value))
            if "lookups" in step:
                rows.append("{}{}:".format(tab, "lookups"))
                for api_name, lookup in step["lookups"].items():
                    rows.append("{}{}:".format(tab * 2, api_name))
                    for lookup_param in lookup.keys():
                        rows.append(
                            "{}{}: {}".format(
                                tab * 3, lookup_param, lookup[lookup_param]
                            )
                        )

        return rows

    @staticmethod
    def print_mapping_as_table(mapping):
        rows = [["STEP", "PARAMETER", "FIELD",]]
        for step_name, step in mapping.items():
            is_first_step = True
            for param in ["sf_object", "table", "record_type"]:
                if param in step:
                    rows.append(
                        [step_name if is_first_step else "", param, step[param],]
                    )
                    is_first_step = False
            if "fields" in step:
                is_first_field = True
                for key, value in step["fields"].items():
                    rows.append(
                        [
                            step_name if is_first_step else "",
                            "fields" if is_first_field else "",
                            key,
                            value,
                        ]
                    )
                    is_first_step = False
                    is_first_field = False
            if "lookups" in step:

                for api_name, lookup in step["lookups"].items():
                    is_first_lookup = True
                    for lookup_param in lookup.keys():
                        rows.append(
                            [
                                step_name if is_first_step else "",
                                "lookups" if is_first_lookup else "",
                                api_name if is_first_lookup else "",
                                lookup_param,
                                lookup[lookup_param],
                            ]
                        )
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
                            mapping[step_name][step_config][
                                Util.get_api_name(new_mapping_namespace, api_name)
                            ] = value
                    elif (
                        step_config == "sf_object"
                        and step["sf_object"]
                        and step["sf_object"].endswith("__c")
                    ):
                        mapping[step_name]["sf_object"] = Util.get_api_name(
                            new_mapping_namespace, step["sf_object"]
                        )
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
                        mapping_config.get("namespace"),
                    )

        if forcePrimaryKey == "autonumber":
            Util.force_autonumber_primary_key(combined_mapping)
        elif forcePrimaryKey == "id":
            Util.force_id_primary_key(combined_mapping)

        return combined_mapping
