# Shared Storytelling Data

## Purpose

**Shared storytelling data** is the idea that each project/repo can contain its own, independent collection of storytelling data plus support a mechanism to "re-use" records across projects by combining new and existing records that share a specified value so there is only one (1) record of that bulk data step with that specified value.

CumulusCI includes [`cumulusci.tasks.bulkdata`](https://cumulusci.readthedocs.io/en/latest/api/cumulusci.tasks.bulkdata.html) tasks that supports storing relational Salesforce data in a project that can be loaded, captured, or deleted in an org.

### Example

-   Suppose <kbd>Project A</kbd> has a Contact `Tom Higgins` with **Email** `thiggins@example.com` along with many other related records that tells the story of the interactions of Tom Higgins in the managed package for <kbd>Project A</kbd>.
-   Suppose the managed package for <kbd>Project B</kbd> can be installed side-by-side with the managed package from <kbd>Project B</kbd>, and we want to share a story of how <kbd>Project A</kbd> and <kbd>Project B</kbd> can be used together.
-   <kbd>Project B</kbd> wants to extend the Tom Higgins story from <kbd>Project A</kbd>. In the storytelling data for <kbd>Project B</kbd>, a Contact for `Tom Higgins` with the same **Email** `thiggens@example.com` is created along with many other related records that tells the story of the interactions of Tom Higgins in the managed package for <kbd>Project B</kbd>.
-   We tell the cci task which records to combine by specifying a specific SQL Column. Records of the same bulk data step sharing the same SQL Column value are combined. In this case, we combine Contact records on the `Email` SQL Column.
-   When we spin up a scratch org that uses both <kbd>Project A</kbd> and <kbd>Project B</kbd>, we can "combine" both `Tom Higgins` Contacts from <kbd>Project A</kbd> and <kbd>Project B</kbd> during before inserting bulk data so in the new scratch org there is only one (1) Contact for `Tom Higgins` with **Email** `thiggins@example.com`. Additionally, all related records to `Tom Higgins` for both **Package A** and **Package B** will point to the one (1) `Tom Higgins` Contact record.

# Setup

CumulusCI supports inserting, capturing, and deleting bulk data with tasks in [`cumulusci.tasks.bulkdata`](https://cumulusci.readthedocs.io/en/latest/api/cumulusci.tasks.bulkdata.html).

**Shared storytelling data** defines local tasks in `tasks.sharedbulkdata` that extend the respective [`cumulusci.tasks.bulkdata`](https://cumulusci.readthedocs.io/en/latest/api/cumulusci.tasks.bulkdata.html) tasks that combines storytelling [bulk_data](#bulk_data) from all supported projects used in the scratch org before running the respective `cumulusci.tasks.bulkdata` task. To support shared storytelling data, each project defines a [bulk_data](#bulk_data) configuration in its `cumulusci.yml` file as specified below.

[`cumulusci.tasks.bulkdata`](https://cumulusci.readthedocs.io/en/latest/api/cumulusci.tasks.bulkdata.html) tasks or the associated extension `tasks.sharedbulkdata` tasks require both a [map](#map) `.yml` file and a **data** file. In [`cumulusci.tasks.bulkdata`](https://cumulusci.readthedocs.io/en/latest/api/cumulusci.tasks.bulkdata.html) tasks, **data** files can either be a human-readable `.sql` script or a SQLite binary `.db` file. However, `tasks.sharedbulkdata` will always use human-readable [sql](#sql) script as the **data** source. See the [map](#map) and [sql](#sql) sections below for `tasks.sharedbulkdata`-specifc setup instructions plus the [Appendix](#appendix) for general [`cumulusci.tasks.bulkdata`](https://cumulusci.readthedocs.io/en/latest/api/cumulusci.tasks.bulkdata.html) setup instructions.

## bulk_data

To use `tasks.sharedbulkdata`, we need to define the collection of bulk data configurations consisting of **maps** and **sql** data. Additionally, we have behind the scenes automation that will inject appropriate **namespaces** into bulk data configurations. Define bulk data configurations in a `bulk_data` key in the project's `cumulusci.yml` as follows:

```yml
project:
    name: projectName
    package:
        namespace: projectNamespace # project.package.namespace is important
        # plus other project attributes

# other cumulusci.yml keys/values ...

bulk_data:
    # The bulk_data "step" name can be anything.  Think of this value as a key in a map.
    # At runtime, all bulk_data configurations or "steps" are combined.
    # The last value per key "put" in the combined config "wins".
    bulkDataStepName:
        # map, sql, and namespace are required
        map: path/to/bulkdata/map.yml
        sql: path/to/bulkdata/data.sql
        # This bulk_data "step" is used only if namespace is "used" in the org
        # namespace also is injected for all Schema ending in "__c" unless overridden
        namespace: namespaceToInject
        # and_require_namespaces is an OPTIONAL list of namespaces.
        # If specified, this bulk_data "step" is used only if namespace is used
        # AND each namespace in and_require_namespaces is used
        and_require_namespaces:
            - secondNamespace
            - thirdNamespace

tasks:
# the rest of cumulusci.yml ...
```

The general proceedure for `tasks.sharedbulkdata` tasks is:

1. Get which namespaces are **used** in the org passed into the cci task. See [tasks.org_info.BaseNamespaceTask](#tasks.org_info.BaseNamespaceTask) in the [Appendix](#appendix) for more information. A namespace is **used** if it is:
    - The `project.package.namespace` defined in `cumulusci.yml`
    - Namespaces of installed managed packages
2. Cache bulk data configurations via [cache_bulk_data_config](#cache_bulk_data_config) cci tasks, i.e. load bulk data configurations into memory.
    - In a flow, call `cache_bulk_data_config` cci task for each supported project/source to combine and used in a `tasks.sharedbulkdata` task.
    - `cache_bulk_data_config` loops through each of the project's `bulk_data` configuration and loads its **map** and **sql** if its **namespace** is used in the org and also all **and_require_namespaces** are used if applicable.
    - Cached bulk data configurations are saved in a map with the bulk data "step" name as its key. This means, the last bulk data configuration cached for a specific key "wins".
3. Combine all used bulk data configurations and pass the information into the associated `cumulusci.tasks.bulkdata` task for processing.

### Examples

Suppose <kbd>Project A</kbd> has the following `cumulusci.yml`:

```yml
# Project A

project:
    name: Project A
    package:
        namespace: proj_a

bulk_data:
    ProjectA:
        map: storytelling_data/proj_a/map.yml
        sql: storytelling_data/proj_a/data.sql
        namespace: proj_a
        # this means:
        #   only use this bulk_data config if proj_a is used
        #   and inject the namespace proj_a as it is "locally used", meaning:
        #       If creating a scratch org in Project A, only inject the namespace if the scratch org is namespaced.
        #       Else if proj_a managed package is installed, inject the namespace.

    ProjectA_unpackaged:
        map: storytelling_data/proj_a_unpackaged/map.yml
        sql: storytelling_data/proj_a_unpackacged/data.sql
        namespace: c # c is the org's default/"common" namespace which always is used.
        and_require_namespaces:
            - proj_a # but only use this bulk_data config if proj_a is also used

# Define sources to call another project's cci tasks and flows
sources:
    proj_b:
        github: https://github.com/Organization/ProjectB

tasks:
    # Caches this project's bulk_data config, i.e. caches Project A's bulk_data config
    cache_bulk_data_config:
        group: "Storytelling data"
        class_path: tasks.sharedbulkdata.CacheBulkDataConfigTask

    # tasks.sharedbulkdata.InsertBulkDataCombinedTask detects which namespaces are used in the scratch org
    # then combines are bulk_data configs whose namespaces (+ maybe required namespaces) are used.
    # Tasks in tasks.sharedbulkdata on can "see" bulk_data configs that are cached in a previous flow step.
    insert_bulk_data_combined:
        group: "Storytelling data"
        description: "Inserts combined bulk data"
        class_path: tasks.sharedbulkdata.InsertBulkDataCombinedTask

flow:
    cache_bulk_data_config:
        steps:
            # Cache Project B's bulk_data config in case the scratch org has Project B installed
            1:
                task: proj_b:cache_bulk_data_config
            # Cache this project's bulk_data config since all scratch orgs created here use this project
            # Also, cache this project's bulk_data config last so this project's bulk_data config are put in last
            2:
                task: cache_bulk_data_config

    insert_bulk_data:
        steps:
            # Cache all supported bulk_data configs before calling a tasks.sharedbulkdata task
            1:
                flow: cache_bulk_data_config
            # All supported bulk_data configs are cached.  Now safe to call a tasks.sharedbulkdata task
            2:
                task: insert_bulk_data_combined
```

And suppose <kbd>Project B</kbd> has the following `cumulusci.yml`:

```yml
# Project B

project:
    name: Project B
    package:
        namespace: proj_b

bulk_data:
    proj_b:
        map: storytelling_data/proj_b.yml
        sql: storytelling_data/proj_b.sql
        namespace: proj_b

# Define sources to call another project's cci tasks and flows
sources:
    ProjectA:
        github: https://github.com/Organization/ProjectA

tasks:
    # Caches this project's bulk_data config, i.e. caches Project B's bulk_data config
    cache_bulk_data_config:
        group: "Storytelling data"
        class_path: tasks.sharedbulkdata.CacheBulkDataConfigTask

    # tasks.sharedbulkdata.InsertBulkDataCombinedTask detects which namespaces are used in the scratch org
    # then combines are bulk_data configs whose namespaces (+ maybe required namespaces) are used.
    # Tasks in tasks.sharedbulkdata on can "see" bulk_data configs that are cached in a previous flow step.
    insert_bulk_data_combined:
        group: "Storytelling data"
        description: "Inserts combined bulk data"
        class_path: tasks.sharedbulkdata.InsertBulkDataCombinedTask

flow:
    cache_bulk_data_config:
        steps:
            # Cache Project A's bulk_data config in case the scratch org has Project A installed
            1:
                task: ProjectA:cache_bulk_data_config
            # Cache this project's bulk_data config since all scratch orgs created here use this project
            # Also, cache this project's bulk_data config last so this project's bulk_data config are combined last
            2:
                task: cache_bulk_data_config

    insert_bulk_data:
        steps:
            # Cache all supported bulk_data configs before calling a tasks.sharedbulkdata task
            1:
                flow: cache_bulk_data_config
            # All supported bulk_data configs are cached.  Now safe to call a tasks.sharedbulkdata task
            2:
                task: insert_bulk_data_combined
```

With thes experts of the `cumulusci.yml` files from <kbd>Project A</kbd> and <kbd>Project B</kbd>, we can do the following:

-   Choose a project, say <kbd>Project A</kbd>.
-   In a flow for the project:
    -   Maybe or maybe not choose to [add other dependencies](https://cumulusci.readthedocs.io/en/latest/api/cumulusci.tasks.salesforce.html#cumulusci.tasks.salesforce.UpdateDependencies.UpdateDependencies)/install other managed packages in the scratch org, e.g. choose to install <kbd>Project B</kbd>.
    -   Call a `cache_bulk_data_config` flow that calls each supported project's `cache_bulk_data_config`.
    -   Call a `insert_bulk_data_combined` task.
-   Run the flow.
    -   `insert_bulk_data` task automatically detects which namespaces are used in the org and combines all used bulk_data configs to load bulk data.

Results

-   This setup works whether or not other projects are installed. If projects are installed, `tasks.sharedbulkdata` will combine all bulk_data configs used.
-   All `tasks.sharedbulkdata` tasks are built to be callable from it's own project or any other project:
    1. without having to modify the task's options, and
    2. will only execute for namespaces that are used
-   The `sources` defined always point to that source's `master` branch. If a source modifies its bulk_data config, such as adding or removing schema, everything still works + the scratch org will always have the latest shared bulk data for each project.

## map

`tasks.sharedbulkdata` extends the maps used in [cumulusci.tasks.bulkdata](https://cumulusci.readthedocs.io/en/latest/api/cumulusci.tasks.bulkdata.html). Below is a sample YAML file describing how to bulild a `tasks.sharedbulkdata` map.

In the project's `bulk_data` definition, each bulk_data config's `map` is a **local path** to the map's `.yml` file.

```yml
# Similar to the bulk_data config, the map is split into "steps"
# tasks.sharedbulkdata combines map steps that have the same "step name"

Household_Accounts: # This is the "step name".  Generally, use the namespaced SObject API Name as the step name.
    # "sf_object" is REQUIRED and part of the cumulusci.tasks.bulkdata specifications.
    # "sf_object" is the SObject API Name.
    # Always use the non-namespaced SObject API Name if applicable.
    # Make sure steps that are supposed to be combined use the same "sf_object".
    sf_object: Account # The namespaces will be injected if both the namespace is needed and sf_object ends in "__c"

    # "record_type" is OPTIONAL and part of the cumulusci.tasks.bulkdata specifications.
    # "record_type" is the Record Type Developer Name is applicable.
    # If specified, records of this sf_object are only captured that have this record_type.
    # If not specified, all records of this sf_object are captured.
    # When inserting data, tasks.sharedbulkdata remove map's record_type if that Record Type Developer Name doesn't exist
    # The last non-blank "record_type" map step combined with this step is applied to all records in its SQL Table.
    record_type: HH_Account

    # "table" is REQUIRED and part of the cumulusci.tasks.bulkdata specifications.
    # "table" is the name of the SQL Table used to store the data.
    # Make sure steps that are supposed to be combined use the same "table".
    # "table" can be any value.  Generally, use the namespaced SObject API Name.
    table: Account__HH_Account # Here we include the Record Type

    # "combine_records_on_column" is OPTIONAL and only part of the tasks.sharedbulkdata specifications.
    # "combine_records_on_column" is used to specifiy a SQL Column used to combine or "join" records.
    # If specified, when combining SQL data files, records are updated on this SQL Column who have a match.
    # If specified and no combined records have a match, records are inserted.
    # If not specified, all records are inserted.
    # Generally, use the same "combine_records_on_column" for all map steps meant to be combined with this map step.
    combine_records_on_column: AccountNumber # This must be listed in fields and is the SQL Column value (not Field API Name)

    # "fields" is REQUIRED and part of the cumulusci.tasks.bulkdata specifications.
    # "fields" is a map whose:
    #       keys are writeable SObject Field's API Name and
    #       values are the associated the SQL Column name
    # Always use the non-namespaced Field API Name as the key.
    # Generally, use the namespaced Field API Name as the SQL Column to prevent SQL columns being unintentionally overwritten when combining.
    # When combining data, the last table's SQL Column values are used.
    fields:
        # IDs: fields that are used to combine record on and/or easily identify the record in the SQL file
        AccountNumber: AccountNumber # Standard Fields generally have the same key and value
        Name: Name # Namespaces are only inject if (1) needed and (2) the Field API Name ends with "__c"

        # Data: all other non-ID fields
        ShippingCountry: Country
        Phone: Phone

        SpecialAccount__c: namespace__SpecialAccount__c # This is a custom field.  The namespace will be injected in the Field API Name if needed since this Field API Name ends with "__c"

# Another step
Contacts:
    sf_object: Contact
    table: Contact
    combine_records_on_column: Email # records will be combined if the have the same Email SQL Column value

    # Note, no record_type is used

    fields:
        # IDs
        Email: Email
        FirstName: FirstName
        LastName: LastName

        # Data
        Salutation: Salutation # Writeable standard fields can always be included
        Phone: Phone

        # Generally, only include custom fields belonging to the scope of this map file
        # since the bulk_data config's namespace will be injected to all custom API Names (i.e. ending in "__c")
        Pronouns__c: namespace__Pronouns__c
        ClientID__c: namespace__ClientID__c

    # "lookups" is OPTIONAL and part of the cumulusci.tasks.bulkdata specifications.
    # "lookups" is a map whose:
    #       keys are writeable Relationship Field's API Name (lookup or master-detail) and
    #       values are objects with attributes as described below
    # Always use the non-namespaced Relationship Field API Name as the key.  Namespace is automatically injected.
    lookups:
        AccountId: # non-namespaced Relationship API Name
            # "table" is REQUIRED and part of the cumulusci.tasks.bulkdata specifications.
            # "table" is the name of the parent's map step's table, i.e. the SQL Table name
            # If a table is referenced in a lookup, there needs to exists a map step using that table name.
            # "table" is used to sort map steps in dependency order so parents are inserted before children, etc.
            table: Account__HH_Account # table of map step "Household_Accounts"

        # Another lookup
        EmergencyContact__c: # non-namespaced Relationship API Name
            table: Contact # This is a circuluar reference pointint to the same table in this map step!

            # "after" is OPTIONAL and is part of the cumulusci.tasks.bulkdata specifications.
            # "after" is a name of the map step.
            # "after" means: after the specified map step is completed, populate this lookup.
            # Useful for circular references: parent records need to exist before child records can reference the parent.
            after: Contacts # name of the map step; not to be confused with the map step's "table"!

            # "key_field" is OPTIONAL and part of the cumulusci.tasks.bulkdata specifications.
            # "key_field" is the name of the autogenerated SQL Column name.
            # SQL Column names for lookups are autogenerated as the snake_case name of the non-namespaced Field API Name.
            # It's a little werid, but don't worry.
            # tasks.sharedbulkdata automatically populates "key_field", so need to populate.
            # If you do populate "key_field", tasks.sharedbulkdata automatically overwrites "key_field" value.
            key_field: emergency_contact__c

# Another step
namespace__ClientNote__c: # Generally, use the namespaced SObject API Name as the map step name
    sf_object: ClientNote__c # non-namespaced
    table: namespace__ClientNote__c # namespaced
    # no "record_type" is applicable; capture all records.
    # no "combined_record_on_column" is applicable; all children referencing Client Notes only exist in this bulk_data config.
    fields:
        Name: Name
        Content__c: namespace__Content__c # non-namespaced key --> namespaced value
        Subject__c: namespace__Subject__c # non-namespaced Field API Name --> namespaced SQL Column name
        Status__c: namespace__Status__c

        # cumulusci.tasks.bulkdata supports have a field "Id: sf_id" that sto res the captured record's Salesforce ID.
        # If no "Id: sf_id" field is specified, an integer auto-number is used.
        # tasks.sharedbulkdata automatically enforces the integer auto-number meaning "Id: sf_id" is never read or used.

    lookups:
        Client__c: # non-namespaced Field API Name
            table: Contact # "table" used in map step "Contacts"
            key_field: client__c # will be overwritten by tasks.sharedbulkdata
```

## sql

[cumulusci.tasks.bulkdata](https://cumulusci.readthedocs.io/en/latest/api/cumulusci.tasks.bulkdata.html) supports capturing and loading data from two different sources:

-   A binary SQLite `.db` database file.
-   A text SQLite `.sql` script file. Human readable and easy to understand diffs (especially with auto-numbered primary keys)!

In practice, using a binary SQLite `.db` database file whose diffs that are very difficult/impossible to understand! Conversely, using a text SQLite `.sql` script file is human readable whose diffs easy to understand (especially with auto-numbered primary keys)!

`tasks.sharedbulkdata` adopted the opionated stance to always use a text SQLite `.sql` file to store bulk data. In the project's `bulk_data` definition, each bulk_data config's `sql` is a **local path** to the data's `.sql` file.

# Appendix

## How tasks.sharedbulkdata combines bulk_data configs

## tasks.sharedbulkdata

### tasks.sharedbulkdata.BulkDataCombinedTask

Behind the scenes each `tasks.sharedbulkdata` cci task extends `tasks.sharedbulkdata.BulkDataCombinedTask`

## Example tasks.sharedbulkdata Flows

lorem ipsum

## tasks.org_info

`tasks.org_info` is locally defined containing cci tasks that provides APIs to share what "shape" the org is, e.g. which namespaces are used in an org, what Record Types are used in an org. In general, querying the "shape" of an org is expensive/long-running API call. All cci tasks in `tasks.org_info` caches any org shape query so each expensive query is only executed once within a cci flow and the cached result is returned in subsequent calls.

### tasks.org_info.RecordTypeTask

### tasks.org_info.BaseNamespaceTask

### tasks.org_info.CacheNamespacesTasks

### tasks.org_info.RefreshNamespacesCacheTask

### tasks.org_info.Namespace

A `Namespace` Instance contains information about a **namespace** plus methods to help inject namespaces when applicable. `Namespace` instance highlights:

-   `namespace`: the identifier of the instance, e.g. `npsp`
-   `local_namespace`: the namespace to inject in API Names if requried. If the namespaces does NOT require its namespace injected into API Names, `local_namespace` is a blank string. Else, `local_namespace` equals `namespace`. One can detect if `namespace` should be injected into API Names if `local_namespace` is falsey.
-   `version`: If the namespace represents an installed managed package, this is the manage package's version. One can detect if the `Namespace` represents a managed package if `version` is falsey.

### tasks.org_info.utils

Utilities to generate abosulte paths and detect data types for santizations.
