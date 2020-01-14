import os
import yaml
import re
import functools
from tasks.logger import LoggingTask
from tasks.org_info import Namespace, NamespaceTask, RecordTypeTask
from cumulusci.tasks.salesforce import BaseSalesforceApiTask
from cumulusci.core.utils import process_bool_arg
from cumulusci.utils import os_friendly_path
from tasks.bulkdata import LoadData, ExtractData, DeleteData as BaseDeleteData
from tasks.bulkdata.utils import (
    get_lookup_key_field,
)
from cumulusci.core.exceptions import TaskOptionsError


class BulkData(Namespace):

    def __init__(
        self,
        step: str,
        namespace: Namespace,
        map_path = None,
        sql_path = None,
        record_types_by_sobject = None,
    ) -> None:
        self._step = step
        self._namespace = namespace.namespace
        self._local_namespace = namespace.local_namespace
        self._version = namespace.version
        self._sql_path = sql_path

        # load map
        map = {}
        unique_tables_by_table = {}

        if map_path:
            with open(os_friendly_path(map_path), "r") as f:
                map = yaml.safe_load(f)
            
            # inject namepsace into fields and lookups
            for map_step, step in map.items():
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

                        # force auto-numbered primary keys
                        if key == "fields" and "Id" in step["fields"]:
                            del step["fields"]["Id"]
                
                # inject namespace in sf_object
                if not step.get("table"):
                    raise TaskOptionsError("\n".join([
                        "Each bulk data map step must have a 'sf_object':",
                        "",
                        "    bulk_data step: {}".format(self.step),
                        "        map_path: {}".format(map_path),
                        "",
                        "    map step: {}".format(map_step),
                    ]))
                sobject = step["sf_object"]
                step["sf_object"] = self.inject_sobject_namespace(sobject)

                # Save uniquify table to this BulkData step as unique_table 
                if not step.get("table"):
                    raise TaskOptionsError("\n".join([
                        "Each bulk data map step must have a 'table':",
                        "",
                        "    bulk_data step: {}".format(self.step),
                        "        map_path: {}".format(map_path),
                        "",
                        "    map step: {}".format(map_step),
                        "        sf_object: {}".format(sobject),
                    ]))
                    
                table = step["table"]
                unique_table = "{}__{}".format(self.step, table)
                step["unique_table"] = unique_table
                unique_tables_by_table[table] = unique_table

                # delete record_types from map that don't exist
                # skip this record_type check if record_types_by_sobject is None (meaning the RecordTypeTask wasn't able to query)
                if step.get("record_type") and not record_types_by_sobject is None:
                    if not (
                        record_types_by_sobject.get(sobject) 
                        and step.get("record_type") in record_types_by_sobject.get(sobject)
                    ):
                        del step["record_type"]

        self.map = map   
        
        # load sql
        self._sql = ""
        if sql_path:
            with open(os_friendly_path(sql_path), "r") as f:
                self._sql = f.read()
            
            # Uniquify tables in sql to this BulkData step
            if self._sql:
                for table, unique_table in unique_tables_by_table.items():
                    # CREATE TABLE with and without table wrapped in double-quotes
                    self._sql = re.sub(
                        r'(?<=CREATE TABLE )' + re.escape(table) + r'(?= \()', 
                        unique_table, 
                        self._sql,
                    )
                    self._sql = re.sub(
                        r'(?<=CREATE TABLE ")' + re.escape(table) + r'(?=" \()', 
                        unique_table, 
                        self._sql,
                    )

                    # INSERT INTO with and without table wrapped in double-quotes
                    self._sql = re.sub(
                        r'(?<=INSERT INTO )' + re.escape(table) + r'(?= VALUES\()', 
                        unique_table, 
                        self._sql,
                    )
                    self._sql = re.sub(
                        r'(?<=INSERT INTO ")' + re.escape(table) + r'(?=" VALUES\()', 
                        unique_table, 
                        self._sql,
                    )

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

    @property
    def step(self):
        return self._step

    @property
    def map_path(self):
        return self._map_path

    @property
    def sql_path(self):
        return self._sql_path

    @property
    def sql(self):
        return self._sql

    @property
    def map(self):
        return self._map

    @map.setter
    def map(self, map):
        self._map = BulkData.order_map(map) if map else {}

    def __iadd__(self, other):
        if other is None:
            return

        # combines maps
        map = self.map

        for step_name, step in other.map.items():
            if step_name not in map:
                map[step_name] = {}

            for key in step.keys():
                if key == "fields" or key == "lookups":
                    if key not in map[step_name]:
                        map[step_name][key] = {}
                    for field, value in step[key].items():
                        map[step_name][key][field] = value
                else:
                    map[step_name][key] = step[key]
        
        # Re-Orders steps in dependency order in setter
        self.map = map

        # Combine sql here??

        return self

    def log_map(self, logging_task: LoggingTask):
        if not logging_task:
            return
        
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
        
        logging_task.log_title(self.step)
        logging_task.log_table(rows)
        
    @property
    def insert_update_combied_data_sql_queries(self):
        queries_by_step = {}

        for step_name, step in self.map.items():
            queries = {}
            queries_by_step[step_name] = queries

            table = step["table"]
            unique_table = step["unique_table"]

            # collect all table columns
            columns = BulkData.get_map_step_columns(step)
            
            columns_with_id = set()
            columns_with_id.add("id")
            columns_with_id.update(columns)

            # inserts rows from unqiue_table into table whose id does not exist in table
            columns_with_id_by_comma = ", ".join(columns_with_id)
            queries["insert"] = "\n".join([
                "",
                "BEGIN TRANSACTION;",
                f"INSERT INTO {table} ({columns_with_id_by_comma})",
                f"SELECT {columns_with_id_by_comma}",
                f"FROM {unique_table}",
                f"WHERE id NOT IN (SELECT id FROM {table})",
                "ORDER BY id;",
                "COMMIT;",
            ])

            # updates all unique_table columns into table whose id exists in table
            set_columns = ", ".join(columns)
            select_column_prefix = "{}.".format(unique_table)
            select_columns = select_column_prefix + (", {}".format(select_column_prefix)).join(columns) 

            queries["update"] = "\n".join([
                "",
                "BEGIN TRANSACTION;",
                f"UPDATE {table}",
                "SET",
                f"    ({set_columns}) = (",
                f"        SELECT {select_columns}",
                f"        FROM {unique_table}",
                f"        WHERE {unique_table}.id = {table}.id",
                "    )",
                "WHERE",
                "    EXISTS (",
                "        SELECT *",
                f"        FROM {unique_table}",
                f"        WHERE {unique_table}.id = {table}.id",
                "    );",
                "COMMIT;",
            ])
        return queries_by_step

    @property
    def sobjects_for_delete(self):
        return BulkData.get_sobjects_ordered_by_reverse_dependency(self.map)

    @staticmethod
    def get_map_step_columns(step):
        columns = set()
        if step.get("fields"):
            columns.update(step["fields"].values())
        if step.get("lookups"):
            for field, lookup in step["lookups"].items():
                columns.add(get_lookup_key_field(lookup, field))
        if step.get("record_type"):
            columns.add("record_type")
        return columns

    @staticmethod
    def get_sobjects_ordered_by_reverse_dependency(map):
        sobject_names_by_table = {}
        sobjects_by_name = {}

        # Collect tables' sobjects
        for step_name, step in map.items():
            sobject_names_by_table[step.get("table")] = step.get("sf_object")

        # Collect each sobject's parents to know which sobjects are dependencies
        for step_name, step in map.items():
            sobject = step.get("sf_object")
            parents = set()
            if "lookups" in step:
                for api_name, lookup in step.get("lookups").items():
                    table = lookup.get("table")
                    parent = sobject_names_by_table.get(table)

                    if parent is None:
                        error_messages = [
                            "No table found for map step's lookup:",
                            "",
                            "    map step: {}".format(step_name),
                            "        sf_object: {}".format(sobject),
                            "",
                            "    lookup:",
                            "        Field API Name: {}".format(api_name),
                            "        table: {}".format(table),
                            "        key_field: {}".format(lookup.get("key_field")),
                            "",
                            "    available sobject_names_by_table:",
                        ]
                        for table, sobject in sobject_names_by_table.items():
                            error_messages.append("        {}: {}".format(table, sobject))
                        raise TaskOptionsError("\n".join(error_messages))

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
    def get_sobjects_ordered_by_dependency(map):
        return list(reversed(BulkData.get_sobjects_ordered_by_reverse_dependency(map)))

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

        ordered_map = {}
        for sobject in BulkData.get_sobjects_ordered_by_dependency(map):
            for step_name in step_names_by_sobject[sobject]:
                ordered_map[step_name] = map[step_name]

        return ordered_map

class BulkDataTask(NamespaceTask, RecordTypeTask):
    task_options = {
        "bulk_data_log_level": {
            "description": "Level to log BulkData maps.  Options are 'None', 'Summary', 'Combined', or 'All'. Default: None",
            "required": False,
        },
    }

    @property
    @functools.lru_cache()
    def bulk_data_log_level(self):
        return {
            "all": 3,
            "combined": 2,
            "summary": 1,
        }.get((self.options.get("bulk_data_log_level") or "").lower()) or 0

    @property
    def log_all_bulk_data(self):
        return 2 < self.bulk_data_log_level

    @property
    def log_combined_bulk_data(self):
        return 1 < self.bulk_data_log_level

    @property
    def log_summary_bulk_data(self):
        return 0 < self.bulk_data_log_level

    @property
    def bulk_data(self):
        if self.org_config.config.get("bulk_data") is None:
            self.bulk_data = {}
            self.cache_project_bulk_data()
        return self.org_config.config.get("bulk_data")

    @bulk_data.setter
    def bulk_data(self, value):
        # save bulk_data in org_config to be shared with flow's next steps
        self.org_config.config.update({
            "bulk_data": value or {}
        })

    @bulk_data.deleter
    def bulk_data(self):
        self.bulk_data = {}

    @property
    @functools.lru_cache()
    def combined_bulk_data(self):
        combined_bulk_data = BulkData(
            "Combined", 
            self.namespaces.get("c")
        )

        for data in self.bulk_data.values():
            combined_bulk_data += data

        return combined_bulk_data

    def cache_project_bulk_data(self):
        if not hasattr(self.project_config, "bulk_data"):
            return

        summary_rows = [
            [
                "STEP",
                "NAMESPACE",
                "REQUIRES NAMESPACES",
                "USED",
                "MAP",
                "SQL",
            ]
        ]

        for step, data in self.project_config.bulk_data.items():
            namespace = self.namespaces.get(data.get("namespace"))
            
            all_namespaces = set()
            all_namespaces.add(data.get("namespace"))
            if data.get("when_all_namespaces"):
                all_namespaces.update(data.get("when_all_namespaces"))

            is_used = ""
            if namespace and all(prefix in self.namespaces for prefix in all_namespaces):
                is_used = "✅"
                bulk_data = BulkData(
                    step,
                    namespace, 
                    data.get("map"), 
                    data.get("sql"),
                    self.record_types_by_sobject
                )
                if step in self.bulk_data:
                    error_messages = [
                        "Each bulk_data step must be uniquely defined among all projects:",
                        "",
                        "    Duplicate bulk_data step: {}".format(step),
                        "",
                        "    Existing bulk_data steps:"
                    ]
                    for step_name in self.bulk_data.keys():
                        error_messages.append("        {}".format(step_name))
                    raise TaskOptionsError("\n".join(error_messages))
                else:
                    self.bulk_data[step] = bulk_data 

            summary_rows.append([
                step,
                data.get("namespace"),
                "'" + "', '".join(all_namespaces) + "'",
                is_used,
                data.get("map"),
                data.get("sql"),
            ])
        
        # log summary
        if True or self.log_summary_bulk_data:
            self.log_title("{} bulk_data".format(self.project_namespace))
            self.log_table(summary_rows)

        if self.log_all_bulk_data:
            for step, data in self.bulk_data.items():
                data.log_map(self)

class BulkDataStepTask(BulkDataTask):
    task_options = {
        **BulkDataTask.task_options,
        "bulk_data_step": {
            "description": "Data step to capture",
            "required": True,
        },
    }

    @property
    @functools.lru_cache()
    def combined_bulk_data(self):
        # sets combined_bulk_data as the bulk_data for 'bulk_data_step' option
        if self.options["bulk_data_step"] not in self.bulk_data:
            error_messages = [
                "'bulk_data_step' option must be a member of 'bulk_data' option:",
                "",
                "    Invalid bulk_data_step: {}".format(self.options["bulk_data_step"]),
                "",
                "    Existing bulk_data steps:"
            ]
            for step_name in self.bulk_data.keys():
                error_messages.append("        {}".format(step_name))
            raise TaskOptionsError("\n".join(error_messages))
        return self.bulk_data.get(self.options["bulk_data_step"])

class CacheProjectBulkDataTask(BulkDataTask):
    """
        Caches project's bulk_data in org_config so accessible in later flow step.
        Defaults bulk_data_log_level option as 'summary'.
        Also caches namespaces and record_types_by_sobject in org_config.
    """

    def _run_task(self):
        if not self.options.get("bulk_data_log_level"):
            self.options["bulk_data_log_level"] = "summary"
        self.cache_project_bulk_data()   

class LogBulkDataMapTask(BulkDataTask):

    task_options = {
        **BulkDataTask.task_options,
    }

    def _run_task(self):
        if (self.options.get("log_maps") or "").lower() != "all":
            self.options["log_maps"] = "combined"
        
        self.combined_bulk_data.log_map(self)

        self.logger.info(self.combined_bulk_data.sql)

class LogBulkDataStepMapTask(LogBulkDataMapTask, BulkDataStepTask):

    task_options = {
        **BulkDataStepTask.task_options,
    }

class DeleteBulkDataTask(BaseDeleteData, BulkDataTask):
    task_options = {
        **BaseDeleteData.task_options,
        **BulkDataTask.task_options,
    }

    def _init_options(self, kwargs):
        super(BaseDeleteData, self)._init_options(kwargs)

        if not self.options.get("bulk_data_log_level"):
            self.options["bulk_data_log_level"] = "combined"

        self.combined_bulk_data.log_map(self)

        # Always hard-delete
        self.options["hardDelete"] = process_bool_arg(self.options.get("hardDelete"))
        self.options["where"] = self.options.get("where", None)

        # Generate objects from mapping
        self.options["objects"] = self.combined_bulk_data.sobjects_for_delete

        self.log_title("Deleting SObjects from bulk_data step: {}".format(self.combined_bulk_data.step))
        self.log_list(self.options.get("objects"))

        if not len(self.options["objects"]) or not self.options["objects"][0]:
            raise TaskOptionsError("At least one object must be specified.")

class DeleteBulkDataStepTask(DeleteBulkDataTask, BulkDataStepTask):
    task_options = {
        **BulkDataStepTask.task_options,
    }

class CaptureBulkDataStepTask(ExtractData, BulkDataStepTask):
    task_options = {
        **BulkDataStepTask.task_options,
    }

    def _init_options(self, kwargs):
        super(ExtractData, self)._init_options(kwargs)
        
        # Set default bulk_data_log_level
        if not self.options.get("bulk_data_log_level"):
            self.options["bulk_data_log_level"] = "combined"

        self.options["database_url"] = "sqlite://"
        self.options["sql_path"] = self.combined_bulk_data.sql_path

    def _init_mapping(self):
        if self.log_combined_bulk_data:
            self.combined_bulk_data.log_map(self)
        
        self.mappings = self.combined_bulk_data.map

class InsertBulkDataStepTask(LoadData, BulkDataStepTask):

    task_options = {
        **BulkDataStepTask.task_options,
        "ignore_row_errors": {
            "description": "If True, allow the load to continue even if individual rows fail to load."
        },
    }

    def _init_options(self, kwargs):
        super(LoadData, self)._init_options(kwargs)

        self.options["ignore_row_errors"] = process_bool_arg(
            self.options.get("ignore_row_errors", False)
        )
        self.options["database_url"] = "sqlite://"
        self.options["sql_path"] = "not None so _sqlite_load() is called"

        # Set default bulk_data_log_level
        if not self.options.get("bulk_data_log_level"):
            self.options["bulk_data_log_level"] = "combined"

    def _init_mapping(self):
        if self.log_combined_bulk_data:
            self.combined_bulk_data.log_map(self)
        self.mapping = self.combined_bulk_data.map

    def _sqlite_load(self):
        # original
        #        conn = self.session.connection()
        #        cursor = conn.connection.cursor()
        #        with open(self.options["sql_path"], "r") as f:
        #            try:
        #                cursor.executescript(f.read())
        #            finally:
        #                cursor.close()
        #        #self.session.flush()
        #    TODO
        #    ------------
        #    - get each namespace sql file
        #    - modify each namespace 
        #    - how to get data files from other repos?
        #        - add cci task that saves the path of a file in org_config from another repo.

    
        conn = self.session.connection()
        cursor = conn.connection.cursor()
        try:
            cursor.executescript(self.combined_bulk_data.sql)
        finally:
            cursor.close()

class InsertBulkDataTask(LoadData, BulkDataTask):

    task_options = {
        **BulkDataTask.task_options,
        "ignore_row_errors": {
            "description": "If True, allow the load to continue even if individual rows fail to load."
        },
    }

    # hard code get_installed_package_version_by_namespace response for quick testing
    """
    def get_installed_package_version_by_namespace(self):
        return {
            "caseman": "1.0 (Beta 256)",
            "npe01": "3.13",
            "npe03": "3.16",
            "npe4": "3.9",
            "npe5": "3.8",
            "npo02": "3.12",
            "npsp": "3.168",
            "pmdm0": "1.0 (Beta 29)",
            "pub": "1.5",
            "sf_chttr_apps": "1.11",
            "sf_com_apps": "1.7",
        }
    """

    def _init_options(self, kwargs):
        super(LoadData, self)._init_options(kwargs)

        self.options["ignore_row_errors"] = process_bool_arg(
            self.options.get("ignore_row_errors", False)
        )
        self.options["database_url"] = "sqlite://"
        self.options["sql_path"] = "not None so _sqlite_load() is called"

        # Set default bulk_data_log_level
        if not self.options.get("bulk_data_log_level"):
            self.options["bulk_data_log_level"] = "combined"

    def _init_mapping(self):
        if self.log_combined_bulk_data:
            self.combined_bulk_data.log_map(self)
        self.mapping = self.combined_bulk_data.map
    
    def _get_combined_bulk_data_create_tables_script(self):
        sql_lines = [
            "",
            "BEGIN TRANSACTION;",
        ]
        
        # CREATE TABLES
        for step in self.combined_bulk_data.map.values():

            sql_lines.extend([
                'CREATE TABLE "{}" ('.format(step["table"]),
                "    id INTEGER NOT NULL,",
            ])

            for column in BulkData.get_map_step_columns(step):
                sql_lines.append('    "{}" VARCHAR(255),'.format(column))
            """
            # fields
            if step.get("fields"):
                for field in step["fields"].values():
                    sql_lines.append('    "{}" VARCHAR(255),'.format(field))
            
            # lookups
            if step.get("lookups"):
                for field, lookup in step["lookups"].items():
                    sql_lines.append('    {} VARCHAR(255),'.format(get_lookup_key_field(lookup, field)))
            
            # record_type
            if step.get("record_type"):
                sql_lines.append("    record_type VARCHAR(255),")
            """

            sql_lines.extend([
                "    PRIMARY KEY(id)",
                ");",
                "",
            ])
        sql_lines.append("COMMIT;")
        return "\n".join(sql_lines)

    def _sqlite_load(self):
        conn = self.session.connection()
        cursor = conn.connection.cursor()
        try:
            # Create combined_bulk_data tables
            self.log_title("Creating combined_bulk_data tables")
            cursor.executescript(self._get_combined_bulk_data_create_tables_script())

            # Load each bulk_data step's unique_table sql
            self.log_title("Loading sql data for bulk_data steps")
            for step, data in self.bulk_data.items():
                self.logger.info("")
                self.logger.info(step)
                self.logger.info("    Creating unique tables and inserting data")
                cursor.executescript(data.sql)

                self.logger.info("    Inserting/Updating data from unique tables into combined tables")
                queries_by_step = data.insert_update_combied_data_sql_queries
                for map_step, queries in queries_by_step.items():
                    self.logger.info("        {}".format(map_step))
                    for query_type, query in queries.items():
                        self.logger.info("            {}: {}".format(query_type, "query"))
                        cursor.executescript(query)
            """
            if True:
                raise TaskOptionsError("......")
            """

        finally:
            cursor.close()