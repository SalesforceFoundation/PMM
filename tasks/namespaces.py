import operator
from tasks.logger import TableLogger
from cumulusci.core.config import TaskConfig
from cumulusci.core.utils import process_bool_arg
from cumulusci.tasks.salesforce import GetInstalledPackages
from cumulusci.tasks.apex.anon import AnonymousApexTask

class NamespaceInfo():
    namespace: str
    local_namespace: str
    version: str

    def __init__(
        self,
        namespace: str,
        localNamespace=None,
        version=None
    ) -> None:
        self.namespace = namespace
        self.local_namespace = namespace if localNamespace is None else localNamespace
        self.version = version

    def __repr__(self) -> str:
        return (
            'NamespaceInfo('
            f'namespace={self.namespace!r}, local_namespace={self.local_namespace!r}, '
            f'version={self.version!r})'
        )

    def __hash__(self) -> int:
        return hash((self.namespace))

    def __eq__(self, other) -> bool:
        if not isinstance(other, NamespaceInfo):
            return NotImplemented
        return (
            (self.namespace, self.local_namespace, self.version) == 
            (other.namespace, other.local_namespace, other.version))

    def __lt__(self, other):
        if not isinstance(other, NamespaceInfo):
            return NotImplemented
        return self.namespace < other.namespace

    def prefix(self, value, delimiter):
        return "{}{}{}".format(self.local_namespace, delimiter, value) if self.local_namespace else value

    def prefix_field(self, value):
        return self.prefix(value, "__")

    def prefix_class(self, value):
        return self.prefix(value, ".")

class NamespaceTask(TableLogger):
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

    def get_project_namespace(self):
        # support caching 
        if not self.org_config.config.get("project_namespace"):
            self.set_project_namespace(self.project_config.project__package__namespace)
        return self.org_config.config.get("project_namespace")

    def is_org_namespaced(self):
        return self.org_config and process_bool_arg(self.org_config.config.get("namespaced"))

    def get_local_project_namespace(self):
        return "" if not self.is_org_namespaced() else self.get_project_namespace()

    def get_namespaces(self):
        if not self.org_config.config.get("namespaces"):

            project_namespace = self.get_project_namespace()

            self.log_title("Getting installed packages:")

            namespace_infos_by_prefix = {
                "c": NamespaceInfo(
                    "c",
                    localNamespace=self.get_local_project_namespace(),
                ),
                project_namespace: NamespaceInfo(
                    project_namespace,
                    localNamespace=self.get_local_project_namespace(),
                ),
            }

            # Overwrites project namespace if project is installed, e.g. install_beta flow
            for package in GetInstalledPackages(
                self.project_config, 
                TaskConfig({}), 
                self.org_config,
            )().items():
                namespace_infos_by_prefix[package[0]] = NamespaceInfo(
                    package[0],
                    version=package[1],
                )

            self.org_config.config.update({
                "namespaces": namespace_infos_by_prefix
            })

            self.log_namespaces()

        return self.org_config.config.get("namespaces")

    def log_namespaces(self):
        rows = [
            [
                "NAMESPACE",
                "LOCAL NAMESPACE",
                "VERSION",
                "PROJECT"
            ],
        ]
        for prefix in sorted(self.get_namespaces().keys()):
            rows.append([
                self.get_namespaces()[prefix].namespace,
                self.get_namespaces()[prefix].local_namespace,
                self.get_namespaces()[prefix].version,
                "✅" if self.get_namespaces()[prefix].namespace == self.get_project_namespace() else ""
            ])

        """
        prefixes_by_type = {
            "local": [],
            "project": [],
            "installed": [],
        }

        for prefix, namespace in self.get_namespaces().items():
            prefixes_by_type[namespace.get("type")].append(prefix)

        rows = [
            [
                #"TYPE",
                "NAMESPACE",
                "LOCAL NAMESPACE",
                "VERSION",
                "IS PROJECT"
            ],
        ]
        
        for namespace_type in ["local", "project", "installed"]:
            prefixes = prefixes_by_type[namespace_type]
            if prefixes:
                is_first = True
                for prefix in sorted(prefixes):
                    rows.append([
                        namespace_type if is_first else "",
                        self.get_namespaces()[prefix].get("namespace"),
                        self.get_namespaces()[prefix].get("local_namespace"),
                        self.get_namespaces()[prefix].get("version"),
                        "✅" if self.get_namespaces()[prefix].get("namespace") == self.get_project_namespace() else ""
                    ])
                    is_first = False
        """
        
        self.log_title("Namespaces")
        self.log_table(rows)

class CacheNamespaces(NamespaceTask):
    def _run_task(self):
        self.get_namespaces()

class RefreshNamespacesCache(NamespaceTask):
    def _run_task(self):
        # reset namespace info cache
        if "namespaces" in self.org_config.config:
            del self.org_config.config["namespaces"]
        self.get_namespaces()

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
        if not self.options.get("namespace") in self.get_namespaces():
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
        namespace = self.options.get("namespace")
        namespace_info = self.get_namespaces().get(namespace)
        if namespace_info:
            local_namespace = namespace_info.get("local_namespace")
            namespace_prefix = "" if not local_namespace else "{}__".format(namespace)
            record_type_prefix = "" if not local_namespace else "{}.".format(namespace)

            apex = apex.replace("%%%NAMESPACE%%%", namespace_prefix)
            apex = apex.replace("%%%NAMESPACED_ORG%%%", namespace_prefix)
            apex = apex.replace("%%%NAMESPACED_RT%%%", record_type_prefix)

            self.log_table([
                [
                    "TOKEN",
                    "REPLACEMENT"
                ],
                ["%%%NAMESPACE%%%", namespace_prefix],
                ["%%%NAMESPACED_ORG%%%", namespace_prefix],
                ["%%%NAMESPACED_RT%%%", record_type_prefix],
            ])

        return apex

