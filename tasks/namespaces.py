from tasks.logger import TableLogger
from cumulusci.core.config import TaskConfig
from cumulusci.core.utils import process_bool_arg
from cumulusci.tasks.salesforce import GetInstalledPackages
from cumulusci.tasks.apex.anon import AnonymousApexTask


class NamespaceInfo(TableLogger):
    """
    Caches installed_package_versions on self.org_config.config
    """

    installed_package_versions = None

    def get_namespaces(self):
        if self.org_config.config.get("namespaces"):
            return self.org_config.config.get("namespaces")

        log_installed_packages = process_bool_arg(
            self.options.get("log_installed_packages")
        )

        self.log_title("Getting installed packages:")

        namespaces = {}

        if log_installed_packages:
            rows = [["NAMESPACE", "VERSION"]]
        rows = []

        for package in self.get_installed_packages().items():
            namespaces[package[0]] = package[0]
            if log_installed_packages:
                rows.append([package[0], package[1]])

        if log_installed_packages:
            if rows:
                self.log_table([["NAMESPACE", "VERSION",]] + rows)
            else:
                self.log_table([["🚫   No packages installed"]])

        namespaces[self.get_project_namespace()] = self.get_local_project_namespace()

        self.org_config.config.update({"namespaces": namespaces})

        return namespaces

    def get_installed_packages(self):
        # return GetInstalledPackages(
        # self.project_config,
        # TaskConfig({}),
        # self.org_config,
        # )()
        return {
            "pub": "1.5",
            "sf_chttr_apps": "1.11",
            "sf_com_apps": "1.7",
            "caseman": "1.0 (Beta 244)",
            "npe4": "3.8",
            "npe5": "3.7",
            "npsp": "3.165",
            "npe01": "3.12",
            "npo02": "3.11",
            "npe03": "3.15",
        }

    def get_installed_package_versions(self):
        if self.org_config.config.get("namespace_info"):
            return self.org_config.config.get("namespace_info").get(
                "installed_package_versions"
            )

        log_installed_packages = process_bool_arg(
            self.options.get("log_installed_packages")
        )

        self.log_title("Getting installed packages:")

        installed_package_versions = {}

        if log_installed_packages:
            rows = [["NAMESPACE", "VERSION"]]
        rows = []

        for package in self.get_installed_packages().items():
            installed_package_versions[package[0]] = package[0]
            if log_installed_packages:
                rows.append([package[0], package[1]])

        if log_installed_packages:
            if rows:
                self.log_table([["NAMESPACE", "VERSION",]] + rows)
            else:
                self.log_table([["🚫   No packages installed"]])

        self.org_config.config.update(
            {
                "namespace_info": {
                    "installed_package_versions": installed_package_versions,
                }
            }
        )

        self.org_config.config.update(
            {
                "namespace_info": {
                    "installed_package_versions": installed_package_versions,
                    "installed_package_namespaces": self.get_installed_package_namespaces(),
                    "project_namespace": self.get_project_namespace(),
                    "is_org_namespaced": self.is_org_namespaced(),
                    "local_project_namespace": self.get_local_project_namespace(),
                }
            }
        )

        return installed_package_versions

    def get_installed_package_namespaces(self):
        return self.get_installed_package_versions().keys()

    def get_project_namespace(self):
        return self.project_config.project__package__namespace

    def is_org_namespaced(self):
        return self.org_config and process_bool_arg(
            self.org_config.config.get("namespaced")
        )

    def get_local_project_namespace(self):
        return "" if not self.is_org_namespaced() else self.get_project_namespace()

    def get_used_namespaces(self):
        used_namespaces = {}
        used_namespaces[
            self.get_project_namespace()
        ] = self.get_local_project_namespace()
        used_namespaces.update(self.get_installed_package_versions())

    def is_package_installed(self, namespace):
        return namespace in self.get_installed_package_namespaces()

    def is_project_namespace(self, namespace):
        return self.get_project_namespace() == namespace

    def is_namespace_used(self, namespace):
        return namespace in self.get_namespaces()

    def is_namespace_used_locally(self, namespace):
        return namespace in self.get_namespaces() and self.get_namespaces()[namespace]


class CacheNamespaces(NamespaceInfo):
    def _run_task(self):
        self.get_namespaces()


class ExecuteAnonymousTask(AnonymousApexTask, NamespaceInfo):

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
        if not self.is_namespace_used(self.options.get("namespace")):
            self.log_table(
                [
                    ["ACTION", "MESSAGE", "NAMESPACE",],
                    [
                        "💤  Skipping",
                        "Namespace is not used in this org.",
                        self.options.get("namespace"),
                    ],
                ]
            )
            return

        AnonymousApexTask._run_task(self)

    def _prepare_apex(self, apex):
        # Process namespace tokens
        namespace = self.options.get("namespace")
        is_namespaced = self.is_namespace_used_locally(namespace)

        namespace_prefix = "" if not is_namespaced else "{}__".format(namespace)
        record_type_prefix = "" if not is_namespaced else "{}.".format(namespace)

        apex = apex.replace("%%%NAMESPACE%%%", namespace_prefix)
        apex = apex.replace("%%%NAMESPACED_ORG%%%", namespace_prefix)
        apex = apex.replace("%%%NAMESPACED_RT%%%", record_type_prefix)

        self.log_table(
            [
                ["TOKEN", "REPLACEMENT"],
                ["%%%NAMESPACE%%%", namespace_prefix],
                ["%%%NAMESPACED_ORG%%%", namespace_prefix],
                ["%%%NAMESPACED_RT%%%", record_type_prefix],
            ]
        )

        return apex
