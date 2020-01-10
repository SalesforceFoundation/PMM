import operator
from tasks.logger import LoggingTask

from cumulusci.core.config import TaskConfig
from cumulusci.core.utils import process_bool_arg
from cumulusci.tasks.salesforce import GetInstalledPackages, BaseSalesforceApiTask
from cumulusci.tasks.apex.anon import AnonymousApexTask

class Namespace():

    def __init__(
        self,
        namespace: str,
        localNamespace=None,
        version=None
    ) -> None:
        self._namespace = namespace
        self._local_namespace = namespace if localNamespace is None else localNamespace
        self._version = version

    @property
    def namespace(self):
        return self._namespace

    @namespace.setter
    def namespace(self, value):
        pass

    @namespace.deleter
    def namespace(self):
        pass

    @property
    def local_namespace(self):
        return self._local_namespace

    @local_namespace.setter
    def local_namespace(self, value):
        pass

    @local_namespace.deleter
    def local_namespace(self):
        pass

    @property
    def version(self):
        return self._version

    @version.setter
    def version(self, value):
        pass

    @version.deleter
    def version(self):
        pass

    def __repr__(self) -> str:
        return (
            'Namespace('
            f'namespace={self.namespace!r}, local_namespace={self.local_namespace!r}, '
            f'version={self.version!r})'
        )

    def __hash__(self) -> int:
        return hash((self.namespace))

    def __eq__(self, other) -> bool:
        if not isinstance(other, Namespace):
            return NotImplemented
        return (
            (self.namespace, self.local_namespace, self.version) == 
            (other.namespace, other.local_namespace, other.version))

    def __lt__(self, other):
        if not isinstance(other, Namespace):
            return NotImplemented
        return self.namespace < other.namespace

    def get_prefix(self, delimter):
        return "{}{}".format(self.local_namespace, delimter) if self.local_namespace else ""

    def get_field_prefix(self):
        return self.get_prefix("__")

    def get_class_prefix(self):
        return self.get_prefix(".")

    def inject_namespace(self, value, delimiter):
        return "{}{}{}".format(self.local_namespace, delimiter, value) if self.local_namespace else value

    def inject_field_namespace(self, field):
        return self.inject_namespace(field, "__") if field and field.endswith("__c") else field

    def inject_sobject_namespace(self, sobject):
        return self.inject_field_namespace(sobject)

    def inject_class_namespace(self, class_name):
        return self.inject_namespace(class_name, ".")


class RecordTypeTask(LoggingTask, BaseSalesforceApiTask):

    def _get_record_type_query(self):
        return "SELECT SobjectType, DeveloperName FROM RecordType ORDER BY SobjectType, DeveloperName"

    @property
    def record_types_by_sobject(self):
        # caches queried record_types by SobjectType in org_config
        record_types_by_sobject = self.org_config.config.get("record_types_by_sobject")

        # record_types_by_sobject is None means sf doesn't exist meaning we can't query
        if record_types_by_sobject is None and hasattr(self, "sf"):
            # TODO: is there a way we can "load" sf connection if it doesn't exist?
            # If we have a Bulk API task, sf attr seems to be deleted

            record_types_by_sobject = {}
            self.record_types_by_sobject = record_types_by_sobject

            rows = [
                [
                    "SOBJECT TYPE",
                    "DEVELOPER NAME"
                ]
            ]

            # Query org for all Record Types
            last_sobject_type = None
            for record in self.sf.query_all(self._get_record_type_query()).get("records"):
                sobject_type = record.get("SobjectType")
                developer_name = record.get("DeveloperName")

                developer_names = record_types_by_sobject.get(sobject_type) or set()
                developer_names.add(developer_name)

                record_types_by_sobject[sobject_type] = developer_names
                rows.append(
                    [
                        sobject_type if sobject_type != last_sobject_type else "",
                        developer_name
                    ]
                )

                last_sobject_type = sobject_type
            
            if not record_types_by_sobject:
                rows.append([
                    "💤  NONE  💤"
                ])
            self.log_title("Record Types")
            self.log_table(rows)

        return record_types_by_sobject

    @record_types_by_sobject.setter
    def record_types_by_sobject(self, value):
        # caches queried record_types by SobjectType in org_config
        self.org_config.config.update({
            "record_types_by_sobject": value
        })

    @record_types_by_sobject.deleter
    def record_types_by_sobject(self):
        self.record_types_by_sobject = None


class NamespaceTask(LoggingTask):
    """
    Caches namespaces in self.org_config.config
    """

    def set_project_namespace(self, project_namespace):
        self.org_config.config.update({
            "project_namespace": project_namespace
        })
        self.log_title("Setting org config's project namespace")
        self.log_table([
            [
                "project_namespace",
                self.org_config.config.get("project_namespace")
            ]
        ])

    @property
    def project_namespace(self):
        # support caching 
        if not self.org_config.config.get("project_namespace"):
            self.project_namespace = self.project_config.project__package__namespace
        return self.org_config.config.get("project_namespace")

    @project_namespace.setter
    def project_namespace(self, project_namespace):
        self.org_config.config.update({
            "project_namespace": project_namespace
        })
        self.log_title("Setting org config's project namespace")
        self.log_table([
            [
                "project_namespace",
                self.org_config.config.get("project_namespace")
            ]
        ])

    @project_namespace.deleter
    def project_namespace(self):
        self.project_namespace = None

    @property
    def is_org_namespaced(self):
        return self.org_config and process_bool_arg(self.org_config.config.get("namespaced"))
    """
    @is_org_namespaced.setter
    def is_org_namespaced(self, value):
        pass

    @is_org_namespaced.deleter
    def is_org_namespaced(self):
        pass
    """
    @property
    def local_project_namespace(self):
        return "" if not self.is_org_namespaced else self.project_namespace

    @property
    def namespaces(self):
        if not self.org_config.config.get("namespaces"):
            #project_namespace = self.project_namespace

            self.log_title("Getting installed packages:")

            namespace_infos_by_prefix = {
                "c": Namespace(
                    "c",
                    localNamespace=self.local_project_namespace,
                ),
                self.project_namespace: Namespace(
                    self.project_namespace,
                    localNamespace=self.local_project_namespace,
                ),
            }

            # Overwrites project namespace if project is installed, e.g. install_beta flow
            for package in GetInstalledPackages(
                self.project_config, 
                TaskConfig({}), 
                self.org_config,
            )().items():
                namespace_infos_by_prefix[package[0]] = Namespace(
                    package[0],
                    version=package[1],
                )

            self.org_config.config.update({
                "namespaces": namespace_infos_by_prefix
            })

            self.log_namespaces()

        return self.org_config.config.get("namespaces")

    @namespaces.deleter
    def namespaces(self):
        if "namespaces" in self.org_config.config:
            del self.org_config.config["namespaces"]
        self.namespaces

    def log_namespaces(self):
        rows = [
            [
                "NAMESPACE",
                "LOCAL NAMESPACE",
                "VERSION",
                "PROJECT"
            ],
        ]
        for prefix in sorted(self.namespaces.keys()):
            rows.append([
                self.namespaces[prefix].namespace,
                self.namespaces[prefix].local_namespace,
                self.namespaces[prefix].version,
                "✅" if self.namespaces[prefix].namespace == self.project_namespace else ""
            ])
        
        self.log_title("Namespaces")
        self.log_table(rows)

class CacheNamespaces(NamespaceTask):
    def _run_task(self):
        self.namespaces

class RefreshNamespacesCache(NamespaceTask):
    def _run_task(self):
        # reset namespace info cache
        del self.namespaces
        """
        if "namespaces" in self.org_config.config:
            del self.org_config.config["namespaces"]
        self.namespaces
        """

class ExecuteAnonymousTask(AnonymousApexTask, NamespaceTask):

    task_docs = """
    Use the `apex` option to run a string of anonymous Apex.
    Use the `path` option to run anonymous Apex from a file.
    Or use both to concatenate the string to the file contents.
    """

    task_options = {
        "path": {"description": "The path to an Apex file to run.", "required": False},
        "apex": {
            "description": "A string of Apex to run (after the file, if specified).",
            "required": False,
        },
        "namespace": {
            "description": (
                "If the namespace is used in the org (as the project's package's namespace or as an installed package, the tokens %%%NAMESPACED_RT%%% and %%%namespaced%%% will get replaced with the namespace prefix for Record Types.   Automatically detects if the namespace is the project's package's namespace and whether or not the org is namespaced."
            ),
            "required": True,
        },
    }

    def _run_task(self):
        if not self.options.get("namespace") in self.namespaces:
            self.log_table([
                [
                    "ACTION",
                    "MESSAGE",
                    "NAMESPACE",
                ],
                [
                    "💤  Skipping",
                    "Namespace is not used.",
                    self.options.get("namespace")
                ]
            ])
            return

        AnonymousApexTask._run_task(self)

    def _prepare_apex(self, apex):
        # Process namespace tokens
        specified_namespace = self.options.get("namespace")
        namespace = self.namespaces.get(specified_namespace)

        if namespace:
            apex = apex.replace("%%%NAMESPACE%%%", namespace.get_prefix("__"))
            apex = apex.replace("%%%NAMESPACED_ORG%%%", namespace.get_prefix("__"))
            apex = apex.replace("%%%NAMESPACED_RT%%%", namespace.get_prefix("."))

            self.log_table([
                [
                    "TOKEN",
                    "REPLACEMENT"
                ],
                ["%%%NAMESPACE%%%", namespace.get_prefix("__")],
                ["%%%NAMESPACED_ORG%%%", namespace.get_prefix("__")],
                ["%%%NAMESPACED_RT%%%", namespace.get_prefix(".")],
            ])

        return apex

