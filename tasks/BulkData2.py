import os
import yaml
import re
import functools
from tasks.logger import LoggingTask
from tasks.org_info import Namespace, NamespaceTask, RecordTypeTask

from cumulusci.tasks.salesforce import BaseSalesforceApiTask
from cumulusci.core.utils import process_bool_arg
from cumulusci.utils import os_friendly_path
from cumulusci.tasks.bulkdata import LoadData, ExtractData, DeleteData

from cumulusci.tasks.bulkdata.utils import (
    get_lookup_key_field,
)
from cumulusci.core.exceptions import TaskOptionsError

class BulkData(Namespace):

    _reserved_sql_columns = [
        "_last_table",
        "_last_table_id",
    ]

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
        self._map_path = map_path

        # load map
        map = {}

        if map_path:
            with open(os_friendly_path(map_path), "r") as f:
                map = yaml.safe_load(f)
            
            # inject namespace into sf_object, fields, and lookups
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

                            # Always set lookups' key_field
                            if key == "lookups":
                                step[key][field]["key_field"] = get_lookup_key_field(step[key][field], field)

                                # Add column_name to make later code easier to understand
                                step[key][field]["column_name"] = step[key][field]["key_field"]

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
            
            # Uniquify tables in sql to this BulkDataStep step
            if self._sql:
                for table_name, table in self.tables_by_name.items():
                    namespaced_table = table["namespaced_table"]
                    # CREATE TABLE with and without table wrapped in double-quotes
                    self._sql = re.sub(
                        r'(?<=CREATE TABLE )' + re.escape(table_name) + r'(?= \()', 
                        namespaced_table, 
                        self._sql,
                    )
                    self._sql = re.sub(
                        r'(?<=CREATE TABLE ")' + re.escape(table_name) + r'(?=" \()', 
                        namespaced_table, 
                        self._sql,
                    )

                    # INSERT INTO with and without table wrapped in double-quotes
                    self._sql = re.sub(
                        r'(?<=INSERT INTO )' + re.escape(table_name) + r'(?= VALUES\()', 
                        namespaced_table, 
                        self._sql,
                    )
                    self._sql = re.sub(
                        r'(?<=INSERT INTO ")' + re.escape(table_name) + r'(?=" VALUES\()', 
                        namespaced_table, 
                        self._sql,
                    )

    def __repr__(self) -> str:
        return (
            'BulkDataStep('
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

    def _validate_table_is_not_none(self, map_step, step):
        if not step.get("table"):
            raise TaskOptionsError("\n".join([
                f'Each bulk data map step must have a "table":',
                f'',
                f'    bulk_data step: {self.step}',
                f'    map step: {map_step}',
                f'        sf_object: {step["sf_object"]}',
            ]))

    def _validate_lookup_tables_exist(self, map_step, step):
        for field, lookup in (step.get("lookups") or {}).items():
            if not self._table_infos_by_name.get(lookup["table"]):
                raise TaskOptionsError("\n".join([
                    f'Each lookup for each bulk data map step must look up to a valid "table":',
                    f'',
                    f'    bulk_data step: {self.step}',
                    f'    map step: {map_step}',
                    f'        sf_object: {step["sf_object"]}',
                    f'        lookup: {field}',
                    f'            invalid table: {lookup["table"]}',
                ]))

    def _validate_reserved_sql_columns_are_not_used(self, map_step, step):
        # Validates _reserved_sql_columns are not used as SQL columns for fields and lookups
        reserved_columns_messages = []

        for field, column in (step.get("fields") or {}).items():
            if column in BulkDataStep._reserved_sql_columns:
                reserved_columns_messages.extend([
                    f'    field: {field}',
                    f'        column: {column}',
                ])
        for field, lookup in (step.get("lookups") or {}).items():
            key_field = lookup.get("key_field")
            if key_field in BulkDataStep._reserved_sql_columns:
                reserved_columns_messages.extend([
                    f'    lookup: {field}',
                    f'        key_field: {key_field}',
                ])
        
        if reserved_columns_messages:
            messages = [
                f'The following SQL column names are reserved and cannot be used: {", ".join(BulkDataStep._reserved_sql_columns)}',
                f'',
                f'The following map uses reserved SQL colunms:',
                f'    bulk_data step: {self.step}',
                f'    map step: {map_step}',
            ]
            messages.extend(reserved_columns_messages)
            messages.append("")

            raise TaskOptionsError("\n".join(messages))

    def _validate_combine_on_column_is_a_fields_column(self, map_step, step):
        # Verify combine_records_on_column is valid, i.e. a column in fields
        combine_records_on_column = step.get("combine_records_on_column")
        if combine_records_on_column:
            fields_columns = BulkDataStep.get_map_step_fields_columns(step)    
            if combine_records_on_column not in fields_columns:
                error_messages = [
                    f"combine_records_on_column must be a SQL Column defined in fields",
                    f"",
                    f"    bulk_data step: {self.step}",
                    f"    map step: {map_step}",
                    f"    combine_records_on_column: {combine_records_on_column}",
                    f"",
                    f"    available columns in fields:",
                ]
                for column in fields_columns:
                    error_messages.append(f"        {column}")
                raise TaskOptionsError("\n".join(error_messages))

    @map.setter
    def map(self, map):
        self._map = BulkDataStep.order_map(map) if map else {}
        self._table_infos_by_name = {}

        # Validate map steps are valid and store table info used to combine SQL
        for map_step, step in self._map.items():
            
            # Save uniquify table to this BulkDataStep step as namespaced_table 
            self._validate_table_is_not_none(map_step, step)

            table = step["table"]
            namespaced_table = "{}__{}".format(self.step, table)
            step["namespaced_table"] = namespaced_table

            # Verify _reserved_sql_columns are not used
            self._validate_reserved_sql_columns_are_not_used(map_step, step)
            
            # Verify combine_records_on_column is valid, i.e. a column in fields
            self._validate_combine_on_column_is_a_fields_column(map_step, step)

            # Update tables_by_name
            self._table_infos_by_table[table] = {
                "namespaced_name": namespaced_table,
                "combined_name": table,
                "combine_records_on_column": step.get("combine_records_on_column"),
            }
        
        for Map_step, step in self._map.items():
            # Validate lookups are consistent, i.e. lookups' tables are actual tables
            self._validate_lookup_tables_exist(map_step, step)

    @property
    def tables_by_name(self):
        return self._table_infos_by_name

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
                "SQL PK/lookup VALUE",
            ]
        ]
        for step_name, step in self.map.items():
            is_first_step = True
            if "sf_object" in step:
                rows.append([
                    step_name if is_first_step else "", 
                    "sf_object",
                    step["sf_object"],
                    step.get("table"),
                    step.get("combine_records_on_column"),
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
        
    @staticmethod
    def get_map_create_tables_sql(combined_bulk_data):
        sql_lines = [
            f'BEGIN TRANSACTION;',
            f'',
        ]
        for step in combined_bulk_data.map.values():
            table = step["table"]

            fields = []
            fields.extend(BulkDataStep._reserved_sql_columns)
            fields.extend(BulkDataStep.get_map_step_columns(step))

            sql_lines.extend([
                f'CREATE TABLE "{table}" (',
                f'    id INTEGER PRIMARY KEY AUTOINCREMENT,',
                f'    "' + '" VARCHAR(255),\n    "'.join(fields) + '" VARCHAR(255)',
                f');',
                f'',
            ])
            
        sql_lines.append("COMMIT;")
        return "\n".join(sql_lines)

    def _get_step_update_sql_if_combined_records_on_column(self, step, columns_by_comma):
        table_info = self.tables_by_name[step["table"]]
        combine_records_on_column = table_info.get("combine_records_on_column")
        
        if combine_records_on_column:
            namespaced_table = table_info["namespaced_name"]
            combined_table = table_info["combined_name"]

            return "\n".join([
                f'BEGIN TRANSACTION;',
                f'UPDATE {combined_table}',
                f'    SET',
                f'        (_last_table, _last_table_id, {columns_by_comma}) = (',
                f'            SELECT "{namespaced_table}" AS _last_table, id AS _last_table_id, {columns_by_comma}',
                f'            FROM {namespaced_table}',
                f'            WHERE {namespaced_table}.{combine_records_on_column} = {combined_table}.{combine_records_on_column}',
                f'        )',
                f'    WHERE EXISTS (',
                f'        SELECT *',
                f'        FROM {namespaced_table}',
                f'        WHERE {namespaced_table}.{combine_records_on_column} = {combined_table}.{combine_records_on_column}',
                f'        AND {namespaced_table}.{combine_records_on_column} IS NOT NULL',
                f'    );',
                f'COMMIT;',
            ])

    def _get_step_insert_sql_for_records_not_combined(self, step, columns_by_comma):
        table_info = self.tables_by_name[step["table"]]
        
        namespaced_table = table_info["namespaced_name"]
        combined_table = table_info["combined_name"]

        return "\n".join([
            f'BEGIN TRANSACTION;',
            f'INSERT INTO {combined_table} (_last_table, _last_table_id, {columns_by_comma})',
            f'    SELECT "{namespaced_table}" AS _last_table, id AS _last_table_id, {columns_by_comma}',
            f'    FROM {namespaced_table}',
            f'    WHERE id NOT IN (',
            f'        SELECT _last_table_id',
            f'        FROM {combined_table}',
            f'        WHERE _last_table = "{namespaced_table}"',
            f'    )',
            f'    ORDER BY ROWID;',
            f'COMMIT;',
        ])

    def _get_step_update_lookup_sql(self, step, lookup):
        lookup_column = lookup["key_field"]

        table_info = self.tables_by_name[step["table"]]
        combined_table = table_info["combined_name"]
        namespaced_table = table_info["namespaced_name"]

        lookup_table_info = self.tables_by_name[lookup["table"]]
        lookup_combined_table = lookup_table_info["lookup_combined_name"]
        lookup_namespaced_table = lookup_table_info["lookup_namespaced_name"]

        return "\n".join([
            f'UPDATE {combined_table}',
            f'SET ({lookup_column}) = (',
            f'    SELECT {lookup_combined_table}.id',
            f'    FROM ',
            f'        {namespaced_table}', # JOIN 1
            f'        JOIN {lookup_namespaced_table}', # JOIN 2
            f'            ON {namespaced_table}.{lookup_column} = {lookup_namespaced_table}.id',
            f'        JOIN {lookup_combined_table}', # JOIN 3
            f'            ON {lookup_combined_table}._last_table = "{lookup_namespaced_table}"',
            f'            AND {lookup_combined_table}._last_table_id = {lookup_namespaced_table}.id',
            f'    WHERE EXISTS (',
            f'        SELECT *',
            f'        FROM {namespaced_table}',
            f'        WHERE {lookup_column} IS NOT NULL',
            f'    )',
            f')',
            f'WHERE _last_table = "{namespaced_table}"',
            f'AND _last_table_id IN (',
            f'    SELECT id',
            f'    FROM {namespaced_table}',
            f')',
            f'AND {lookup_column} IS NOT NULL',
        ])

    @property
    def sql_queries_to_combine(self):
        queries_by_step = {}

        for step_name, step in self.map.items(): 
            columns = set()
            columns.update(BulkDataStep.get_map_step_fields_columns(step))
            columns.update(BulkDataStep.get_map_step_lookups_columns(step))
            columns.update(BulkDataStep.get_map_step_record_type_columns(step))

            columns_by_comma = ", ".join(columns)

            queries = {}
            queries_by_step[step_name] = queries

            # Update records
            update_sql = self._get_step_update_sql_if_combined_records_on_column(step, columns_by_comma)
            if update_sql:
                queries[f'Update records on {step.get("combine_records_on_column")}'] = update_sql

            # Inserting records
            queries["Insert records not combined"] = self._get_step_insert_sql_for_records_not_combined(step, columns_by_comma)
            
            # Update lookups
            for field, lookup in (step.get("lookups") or {}).items():
                queries[f'Update {field}/{lookup["key_field"]} lookups'] = self._get_step_update_lookup_sql(step, lookup)
            
        return queries_by_step

    @property
    def sobjects_for_delete(self):
        return BulkDataStep.get_sobjects_ordered_by_reverse_dependency(self.map)

    @staticmethod
    def get_map_step_fields_columns(step):
        columns = set()
        if step.get("fields"):
            columns.update(step["fields"].values())
        return columns

    @staticmethod
    def get_map_step_lookups_columns(step):
        columns = set()
        if step.get("lookups"):
            for field, lookup in step["lookups"].items():
                columns.add(get_lookup_key_field(lookup, field))
        return columns

    @staticmethod
    def get_map_step_record_type_columns(step):
        columns = set()
        if step.get("record_type"):
            columns.add("record_type")
        return columns

    @staticmethod
    def get_map_step_columns(step):
        columns = set()
        columns.update(BulkDataStep.get_map_step_fields_columns(step))
        columns.update(BulkDataStep.get_map_step_lookups_columns(step))
        columns.update(BulkDataStep.get_map_step_record_type_columns(step))
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
        return list(reversed(BulkDataStep.get_sobjects_ordered_by_reverse_dependency(map)))

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
        for sobject in BulkDataStep.get_sobjects_ordered_by_dependency(map):
            for step_name in step_names_by_sobject[sobject]:
                ordered_map[step_name] = map[step_name]

        return ordered_map


class BulkDataStep(Namespace):

    _reserved_sql_columns = [
        "_last_table",
        "_last_table_id",
    ]

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
        self._map_path = map_path

        # load map
        map = {}

        if map_path:
            with open(os_friendly_path(map_path), "r") as f:
                map = yaml.safe_load(f)
            
            # inject namespace into sf_object, fields, and lookups
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

                            # Always set lookups' key_field
                            if key == "lookups":
                                step[key][field]["key_field"] = get_lookup_key_field(step[key][field], field)

                                # Add column_name to make later code easier to understand
                                step[key][field]["column_name"] = step[key][field]["key_field"]

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
            
            # Uniquify tables in sql to this BulkDataStep step
            if self._sql:
                for table_name, table in self.tables_by_name.items():
                    namespaced_table = table["namespaced_table"]
                    # CREATE TABLE with and without table wrapped in double-quotes
                    self._sql = re.sub(
                        r'(?<=CREATE TABLE )' + re.escape(table_name) + r'(?= \()', 
                        namespaced_table, 
                        self._sql,
                    )
                    self._sql = re.sub(
                        r'(?<=CREATE TABLE ")' + re.escape(table_name) + r'(?=" \()', 
                        namespaced_table, 
                        self._sql,
                    )

                    # INSERT INTO with and without table wrapped in double-quotes
                    self._sql = re.sub(
                        r'(?<=INSERT INTO )' + re.escape(table_name) + r'(?= VALUES\()', 
                        namespaced_table, 
                        self._sql,
                    )
                    self._sql = re.sub(
                        r'(?<=INSERT INTO ")' + re.escape(table_name) + r'(?=" VALUES\()', 
                        namespaced_table, 
                        self._sql,
                    )

    def __repr__(self) -> str:
        return (
            'BulkDataStep('
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

    def _validate_table_is_not_none(self, map_step, step):
        if not step.get("table"):
            raise TaskOptionsError("\n".join([
                f'Each bulk data map step must have a "table":',
                f'',
                f'    bulk_data step: {self.step}',
                f'    map step: {map_step}',
                f'        sf_object: {step["sf_object"]}',
            ]))

    def _validate_lookup_tables_exist(self, map_step, step):
        for field, lookup in (step.get("lookups") or {}).items():
            if not self._table_infos_by_name.get(lookup["table"]):
                raise TaskOptionsError("\n".join([
                    f'Each lookup for each bulk data map step must look up to a valid "table":',
                    f'',
                    f'    bulk_data step: {self.step}',
                    f'    map step: {map_step}',
                    f'        sf_object: {step["sf_object"]}',
                    f'        lookup: {field}',
                    f'            invalid table: {lookup["table"]}',
                ]))

    def _validate_reserved_sql_columns_are_not_used(self, map_step, step):
        # Validates _reserved_sql_columns are not used as SQL columns for fields and lookups
        reserved_columns_messages = []

        for field, column in (step.get("fields") or {}).items():
            if column in BulkDataStep._reserved_sql_columns:
                reserved_columns_messages.extend([
                    f'    field: {field}',
                    f'        column: {column}',
                ])
        for field, lookup in (step.get("lookups") or {}).items():
            key_field = lookup.get("key_field")
            if key_field in BulkDataStep._reserved_sql_columns:
                reserved_columns_messages.extend([
                    f'    lookup: {field}',
                    f'        key_field: {key_field}',
                ])
        
        if reserved_columns_messages:
            messages = [
                f'The following SQL column names are reserved and cannot be used: {", ".join(BulkDataStep._reserved_sql_columns)}',
                f'',
                f'The following map uses reserved SQL colunms:',
                f'    bulk_data step: {self.step}',
                f'    map step: {map_step}',
            ]
            messages.extend(reserved_columns_messages)
            messages.append("")

            raise TaskOptionsError("\n".join(messages))

    def _validate_combine_on_column_is_a_fields_column(self, map_step, step):
        # Verify combine_records_on_column is valid, i.e. a column in fields
        combine_records_on_column = step.get("combine_records_on_column")
        if combine_records_on_column:
            fields_columns = BulkDataStep.get_map_step_fields_columns(step)    
            if combine_records_on_column not in fields_columns:
                error_messages = [
                    f"combine_records_on_column must be a SQL Column defined in fields",
                    f"",
                    f"    bulk_data step: {self.step}",
                    f"    map step: {map_step}",
                    f"    combine_records_on_column: {combine_records_on_column}",
                    f"",
                    f"    available columns in fields:",
                ]
                for column in fields_columns:
                    error_messages.append(f"        {column}")
                raise TaskOptionsError("\n".join(error_messages))

    @map.setter
    def map(self, map):
        self._map = BulkDataStep.order_map(map) if map else {}
        self._table_infos_by_name = {}

        # Validate map steps are valid and store table info used to combine SQL
        for map_step, step in self._map.items():
            
            # Save uniquify table to this BulkDataStep step as namespaced_table 
            self._validate_table_is_not_none(map_step, step)

            table = step["table"]
            namespaced_table = "{}__{}".format(self.step, table)
            step["namespaced_table"] = namespaced_table

            # Verify _reserved_sql_columns are not used
            self._validate_reserved_sql_columns_are_not_used(map_step, step)
            
            # Verify combine_records_on_column is valid, i.e. a column in fields
            self._validate_combine_on_column_is_a_fields_column(map_step, step)

            # Update tables_by_name
            self._table_infos_by_table[table] = {
                "namespaced_name": namespaced_table,
                "combined_name": table,
                "combine_records_on_column": step.get("combine_records_on_column"),
            }
        
        for Map_step, step in self._map.items():
            # Validate lookups are consistent, i.e. lookups' tables are actual tables
            self._validate_lookup_tables_exist(map_step, step)

    @property
    def tables_by_name(self):
        return self._table_infos_by_name

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
                "SQL PK/lookup VALUE",
            ]
        ]
        for step_name, step in self.map.items():
            is_first_step = True
            if "sf_object" in step:
                rows.append([
                    step_name if is_first_step else "", 
                    "sf_object",
                    step["sf_object"],
                    step.get("table"),
                    step.get("combine_records_on_column"),
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
        
    @staticmethod
    def get_map_create_tables_sql(combined_bulk_data):
        sql_lines = [
            f'BEGIN TRANSACTION;',
            f'',
        ]
        for step in combined_bulk_data.map.values():
            table = step["table"]

            fields = []
            fields.extend(BulkDataStep._reserved_sql_columns)
            fields.extend(BulkDataStep.get_map_step_columns(step))

            sql_lines.extend([
                f'CREATE TABLE "{table}" (',
                f'    id INTEGER PRIMARY KEY AUTOINCREMENT,',
                f'    "' + '" VARCHAR(255),\n    "'.join(fields) + '" VARCHAR(255)',
                f');',
                f'',
            ])
            
        sql_lines.append("COMMIT;")
        return "\n".join(sql_lines)

    def _get_step_update_sql_if_combined_records_on_column(self, step, columns_by_comma):
        table_info = self.tables_by_name[step["table"]]
        combine_records_on_column = table_info.get("combine_records_on_column")
        
        if combine_records_on_column:
            namespaced_table = table_info["namespaced_name"]
            combined_table = table_info["combined_name"]

            return "\n".join([
                f'BEGIN TRANSACTION;',
                f'UPDATE {combined_table}',
                f'    SET',
                f'        (_last_table, _last_table_id, {columns_by_comma}) = (',
                f'            SELECT "{namespaced_table}" AS _last_table, id AS _last_table_id, {columns_by_comma}',
                f'            FROM {namespaced_table}',
                f'            WHERE {namespaced_table}.{combine_records_on_column} = {combined_table}.{combine_records_on_column}',
                f'        )',
                f'    WHERE EXISTS (',
                f'        SELECT *',
                f'        FROM {namespaced_table}',
                f'        WHERE {namespaced_table}.{combine_records_on_column} = {combined_table}.{combine_records_on_column}',
                f'        AND {namespaced_table}.{combine_records_on_column} IS NOT NULL',
                f'    );',
                f'COMMIT;',
            ])

    def _get_step_insert_sql_for_records_not_combined(self, step, columns_by_comma):
        table_info = self.tables_by_name[step["table"]]
        
        namespaced_table = table_info["namespaced_name"]
        combined_table = table_info["combined_name"]

        return "\n".join([
            f'BEGIN TRANSACTION;',
            f'INSERT INTO {combined_table} (_last_table, _last_table_id, {columns_by_comma})',
            f'    SELECT "{namespaced_table}" AS _last_table, id AS _last_table_id, {columns_by_comma}',
            f'    FROM {namespaced_table}',
            f'    WHERE id NOT IN (',
            f'        SELECT _last_table_id',
            f'        FROM {combined_table}',
            f'        WHERE _last_table = "{namespaced_table}"',
            f'    )',
            f'    ORDER BY ROWID;',
            f'COMMIT;',
        ])

    def _get_step_update_lookup_sql(self, step, lookup):
        lookup_column = lookup["key_field"]

        table_info = self.tables_by_name[step["table"]]
        combined_table = table_info["combined_name"]
        namespaced_table = table_info["namespaced_name"]

        lookup_table_info = self.tables_by_name[lookup["table"]]
        lookup_combined_table = lookup_table_info["lookup_combined_name"]
        lookup_namespaced_table = lookup_table_info["lookup_namespaced_name"]

        return "\n".join([
            f'UPDATE {combined_table}',
            f'SET ({lookup_column}) = (',
            f'    SELECT {lookup_combined_table}.id',
            f'    FROM ',
            f'        {namespaced_table}', # JOIN 1
            f'        JOIN {lookup_namespaced_table}', # JOIN 2
            f'            ON {namespaced_table}.{lookup_column} = {lookup_namespaced_table}.id',
            f'        JOIN {lookup_combined_table}', # JOIN 3
            f'            ON {lookup_combined_table}._last_table = "{lookup_namespaced_table}"',
            f'            AND {lookup_combined_table}._last_table_id = {lookup_namespaced_table}.id',
            f'    WHERE EXISTS (',
            f'        SELECT *',
            f'        FROM {namespaced_table}',
            f'        WHERE {lookup_column} IS NOT NULL',
            f'    )',
            f')',
            f'WHERE _last_table = "{namespaced_table}"',
            f'AND _last_table_id IN (',
            f'    SELECT id',
            f'    FROM {namespaced_table}',
            f')',
            f'AND {lookup_column} IS NOT NULL',
        ])

    @property
    def sql_queries_to_combine(self):
        queries_by_step = {}

        for step_name, step in self.map.items(): 
            columns = set()
            columns.update(BulkDataStep.get_map_step_fields_columns(step))
            columns.update(BulkDataStep.get_map_step_lookups_columns(step))
            columns.update(BulkDataStep.get_map_step_record_type_columns(step))

            columns_by_comma = ", ".join(columns)

            queries = {}
            queries_by_step[step_name] = queries

            # Update records
            update_sql = self._get_step_update_sql_if_combined_records_on_column(step, columns_by_comma)
            if update_sql:
                queries[f'Update records on {step.get("combine_records_on_column")}'] = update_sql

            # Inserting records
            queries["Insert records not combined"] = self._get_step_insert_sql_for_records_not_combined(step, columns_by_comma)
            
            # Update lookups
            for field, lookup in (step.get("lookups") or {}).items():
                queries[f'Update {field}/{lookup["key_field"]} lookups'] = self._get_step_update_lookup_sql(step, lookup)
            
        return queries_by_step

    @property
    def sobjects_for_delete(self):
        return BulkDataStep.get_sobjects_ordered_by_reverse_dependency(self.map)

    @staticmethod
    def get_map_step_fields_columns(step):
        columns = set()
        if step.get("fields"):
            columns.update(step["fields"].values())
        return columns

    @staticmethod
    def get_map_step_lookups_columns(step):
        columns = set()
        if step.get("lookups"):
            for field, lookup in step["lookups"].items():
                columns.add(get_lookup_key_field(lookup, field))
        return columns

    @staticmethod
    def get_map_step_record_type_columns(step):
        columns = set()
        if step.get("record_type"):
            columns.add("record_type")
        return columns

    @staticmethod
    def get_map_step_columns(step):
        columns = set()
        columns.update(BulkDataStep.get_map_step_fields_columns(step))
        columns.update(BulkDataStep.get_map_step_lookups_columns(step))
        columns.update(BulkDataStep.get_map_step_record_type_columns(step))
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
        return list(reversed(BulkDataStep.get_sobjects_ordered_by_reverse_dependency(map)))

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
        for sobject in BulkDataStep.get_sobjects_ordered_by_dependency(map):
            for step_name in step_names_by_sobject[sobject]:
                ordered_map[step_name] = map[step_name]

        return ordered_map

class BulkDataCombinedTask(NamespaceTask, RecordTypeTask):
    task_options = {
        "bulk_data_log_level": {
            "description": "Level to log BulkDataStep maps.  Options are 'None', 'Summary', 'Combined', or 'All'. Default: 'Summary'",
            "required": False,
        },
    }

    _is_bulk_data_cached = False

    @property
    @functools.lru_cache()
    def bulk_data_log_level(self):
        # Default to 'summary' bulk_data_log_level
        bulk_data_log_level = {
            "all": 3,
            "combined": 2,
            "summary": 1,
        }.get((self.options.get("bulk_data_log_level") or "summary").lower()) or 0
        return bulk_data_log_level

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
            #self.bulk_data = {}
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
        combined_bulk_data = BulkDataStep(
            "Combined", 
            self.namespaces.get("c")
        )

        for data in self.bulk_data.values():
            combined_bulk_data += data

        return combined_bulk_data

    def is_project_bulk_data_cached(self):
        return self.org_config.config.get("bulk_data_projects_cached") and self.project_namespace in self.org_config.config.get("bulk_data_projects_cached")

    def cache_project_bulk_data(self):
        if self.is_project_bulk_data_cached():
            self.logger.info(f"{self.project_namespace} bulk_data is already cached")
            return

        # check if self.project_config.bulk_data is defined
        if not self.project_config.bulk_data:
            self.log_title("cumulusci.yml does not have bulk_data defined")
            self.log_table([
                [
                    " 💤  Skipping caching project bulk_data  💤 "
                ]
            ])
            self._is_bulk_data_cached = True
            return

        cached_bulk_data = self.org_config.config.get("bulk_data") or {}

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
                bulk_data = BulkDataStep(
                    step,
                    namespace, 
                    data.get("map"), 
                    data.get("sql"),
                    self.record_types_by_sobject
                )
                if step in cached_bulk_data:
                    error_messages = [
                        "Each bulk_data step must be uniquely defined among all projects:",
                        "",
                        "    Duplicate bulk_data step: {}".format(step),
                        "",
                        "    Existing bulk_data steps:"
                    ]
                    for step_name in cached_bulk_data.keys():
                        error_messages.append("        {}".format(step_name))
                    raise TaskOptionsError("\n".join(error_messages))
                else:
                    cached_bulk_data[step] = bulk_data 

            summary_rows.append([
                step,
                data.get("namespace"),
                "'" + "', '".join(all_namespaces) + "'",
                is_used,
                data.get("map"),
                data.get("sql"),
            ])

        self.bulk_data = cached_bulk_data

        # Update org_config saying this project's bulk_data is cached
        bulk_data_projects_cached = self.org_config.config.get("bulk_data_projects_cached") or set()
        bulk_data_projects_cached.add(self.project_namespace)
        self.org_config.config.update({
            "bulk_data_projects_cached": bulk_data_projects_cached
        })
        
        # log summary
        if self.log_summary_bulk_data:
            self.log_title("{} bulk_data".format(self.project_namespace))
            self.log_table(summary_rows)

        if self.log_all_bulk_data:
            for step, data in self.bulk_data.items():
                data.log_map(self)

class BulkDataStepTask(BulkDataCombinedTask):
    task_options = {
        **BulkDataCombinedTask.task_options,
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

class CacheProjectBulkDataTask(BulkDataCombinedTask):
    
    #    Caches project's bulk_data in org_config so accessible in later flow step.
    #    Defaults bulk_data_log_level option as 'summary'.
    #    Also caches namespaces and record_types_by_sobject in org_config.
    

    def _run_task(self):
        self.namespaces
        self.cache_project_bulk_data()

class LogBulkDataCombinedMapTask(BulkDataCombinedTask):

    task_options = {
        **BulkDataCombinedTask.task_options,
    }

    def _run_task(self):
        if (self.options.get("log_maps") or "").lower() != "all":
            self.options["log_maps"] = "combined"
        
        self.combined_bulk_data.log_map(self)

class LogBulkDataStepMapTask(LogBulkDataCombinedMapTask, BulkDataStepTask):

    task_options = {
        **BulkDataStepTask.task_options,
    }

class DeleteBulkDataCombinedTask(DeleteData, BulkDataCombinedTask):
    task_options = {
        **DeleteData.task_options,
        **BulkDataCombinedTask.task_options,
    }

    def _init_options(self, kwargs):
        super(DeleteData, self)._init_options(kwargs)

        # Optinally log combined_bulk_data for debugging
        if self.log_combined_bulk_data:
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

class DeleteBulkDataStepTask(DeleteBulkDataCombinedTask, BulkDataStepTask):
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
        conn = self.session.connection()
        cursor = conn.connection.cursor()
        try:
            cursor.executescript(self.combined_bulk_data.sql)
        finally:
            cursor.close()

class InsertBulkDataCombinedTask(LoadData, BulkDataCombinedTask):

    task_options = {
        **BulkDataCombinedTask.task_options,
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

    def _init_mapping(self):
        if self.log_combined_bulk_data:
            self.combined_bulk_data.log_map(self)
        self.mapping = self.combined_bulk_data.map
    
    def _get_combined_bulk_data_create_tables_script(self):
        return BulkDataStep.get_map_create_tables_sql(self.combined_bulk_data)

    def _sqlite_load(self):
        conn = self.session.connection()
        cursor = conn.connection.cursor()
        try:
            # Create combined_bulk_data tables
            self.log_title("Creating combined_bulk_data tables")
            combined_bulk_data_create_tables_script = self._get_combined_bulk_data_create_tables_script()
            self.logger.info(combined_bulk_data_create_tables_script)
            cursor.executescript(self._get_combined_bulk_data_create_tables_script())

            # Load each bulk_data step's namespaced_table sql
            # TODO: add better logging.  Use log_table(...)?
            self.log_title("Loading sql data for bulk_data steps")
            for step, data in self.bulk_data.items():
                self.logger.info("")
                self.logger.info(step)
                self.logger.info("    Creating unique tables and inserting data")
                cursor.executescript(data.sql)

                self.logger.info("    'Joining' bulk_data sql into combined sql for each map step")
                sql_queries_to_combine = data.sql_queries_to_combine
                for map_step, queries in sql_queries_to_combine.items():
                    self.logger.info(f"        {map_step}")
                    
                    # update records
                    update_records = queries["update_records"]
                    self.logger.info(f"            update_records: \n{update_records}\n")
                    cursor.executescript(queries["update_records"])

                    # insert records
                    insert_records = queries["insert_records"]
                    self.logger.info(f"            insert_records: \n{insert_records}\n")
                    cursor.executescript(queries["insert_records"])

                    # update lookups
                    lookup_queries = queries.get("update_lookups")
                    if lookup_queries:
                        self.logger.info(f"            update_lookups")
                        for field, lookup_query in lookup_queries.items():
                            self.logger.info(f"                {field}: \n{lookup_query}\n")
                            cursor.executescript(lookup_query)
            self.logger.info("")
        finally:
            cursor.close()
