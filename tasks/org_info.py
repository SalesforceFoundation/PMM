import operator
import os
import subprocess

from tasks.logger import LoggingTask
from cumulusci.utils import os_friendly_path
from cumulusci.core.config import TaskConfig
from cumulusci.core.utils import process_bool_arg
from cumulusci.tasks.salesforce import GetInstalledPackages, BaseSalesforceApiTask
from cumulusci.tasks.apex.anon import AnonymousApexTask


class utils(object):
    @staticmethod
    def absolute_path(path):
        return os.path.abspath(os_friendly_path(path))

    @staticmethod
    def is_dict(value):
        return isinstance(value, dict)

    @staticmethod
    def is_string(value):
        return isinstance(value, str)

    @staticmethod
    def is_list(value):
        return isinstance(value, list)

    @staticmethod
    def is_set(value):
        return isinstance(value, set)


class Namespace:
    def __init__(
        self, namespace: str, local_namespace: str = None, version: str = None,
    ) -> None:
        self._namespace = namespace
        self._local_namespace = local_namespace
        self._version = version

    @property
    def namespace(self):
        return self._namespace

    @property
    def local_namespace(self):
        return self._local_namespace

    @property
    def version(self):
        return self._version

    def __repr__(self) -> str:
        return (
            "Namespace("
            f"namespace={self.namespace!r}, local_namespace={self.local_namespace!r}, "
            f"version={self.version!r})"
        )

    def __hash__(self) -> int:
        return hash((self.namespace))

    def __eq__(self, other) -> bool:
        if not isinstance(other, Namespace):
            return NotImplemented
        return (self.namespace, self.local_namespace, self.version) == (
            other.namespace,
            other.local_namespace,
            other.version,
        )

    def __lt__(self, other):
        if not isinstance(other, Namespace):
            return NotImplemented
        return self.namespace < other.namespace

    def get_prefix(self, delimter):
        return (
            "{}{}".format(self.local_namespace, delimter)
            if self.local_namespace
            else ""
        )

    def get_field_prefix(self):
        return self.get_prefix("__")

    def get_class_prefix(self):
        return self.get_prefix(".")

    def inject_namespace(self, value, delimiter):
        return (
            "{}{}{}".format(self.local_namespace, delimiter, value)
            if self.local_namespace
            else value
        )

    def inject_field_namespace(self, field):
        return (
            self.inject_namespace(field, "__")
            if field and field.endswith("__c")
            else field
        )

    def inject_sobject_namespace(self, sobject):
        return self.inject_field_namespace(sobject)

    def inject_class_namespace(self, class_name):
        return self.inject_namespace(class_name, ".")



class RecordTypeTask(LoggingTask, BaseSalesforceApiTask):

    _record_types_by_sobject = None

    def _get_record_type_query(self):
        return "SELECT SobjectType, DeveloperName FROM RecordType ORDER BY SobjectType, DeveloperName"

    def cache_record_types_by_sobject(self):
        # TODO: Is there a way we can "load" sf connection if it doesn't exist?
        #       If we have a Bulk API task, sf attr seems to be deleted
        if not hasattr(self, "sf"):
            return
    
        self._record_types_by_sobject = {}

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

    @property
    def record_types_by_sobject(self):
        if self._record_types_by_sobject is None:
            self.cache_record_types_by_sobject()
        return self._record_types_by_sobject


class NamespaceTask(LoggingTask):

    task_options = {
        "installed_packages_api": {
            "description": "API to get list of installed packages.  Options are 'sfdx' or 'metadata'.  Default: 'metadata",
            "required": False,
        },
    }

    _namespaces = None

    @property
    def project_namespace(self):
        return self.project_config.project__package__namespace

    @property
    def is_org_namespaced(self):
        return self.org_config and process_bool_arg(
            self.org_config.config.get("namespaced")
        )

    @property
    def local_project_namespace(self):
        return "" if not self.is_org_namespaced else self.project_namespace

    def _get_installed_package_versions_by_namespace_from_metadata(self):
        self.log_title("Getting installed packages from Metadata API")
        installed_package_version_by_namespace = {}
        for package in GetInstalledPackages(
            self.project_config, TaskConfig({}), self.org_config,
        )().items():
            installed_package_version_by_namespace[package[0]] = package[1]
        return installed_package_version_by_namespace

    def _get_installed_package_versions_by_namespace_from_sfdx(self):
        self.logger.info(
            "Getting installed packages from sfdx is currently not supported"
        )
        # TODO: use subprocess to call f'sfdx force:packages:installed:list --json -u {self.org_config.username}', parse the response as JSON
        return self._get_installed_package_versions_by_namespace_from_metadata()

    def get_installed_package_version_by_namespace(self):
        if (
            self.options.get("installed_packages_api")
            and self.options.get("installed_packages_api").lower() == "sfdx"
        ):
            return self._get_installed_package_versions_by_namespace_from_sfdx()
        return self._get_installed_package_versions_by_namespace_from_metadata()

    def log_namespaces(self):
        rows = [
            ["NAMESPACE", "LOCAL NAMESPACE", "PACKAGE VERSION", "PROJECT"],
        ]
        for prefix in sorted(self.namespaces.keys()):
            rows.append(
                [
                    self.namespaces[prefix].namespace,
                    self.namespaces[prefix].local_namespace,
                    self.namespaces[prefix].version,
                    "✅"
                    if self.namespaces[prefix].namespace == self.project_namespace
                    else "",
                ]
            )

        self.log_title("Namespaces")
        self.log_table(rows)

    # cache namespace_infos as dicts and load NamespaceInfos
    def cache_namespaces(self):
        namespaces = {
            "c": {
                "namespace": "c",
                "local_namespace": str(self.local_project_namespace),
            },
            self.project_namespace: {
                "namespace": str(self.project_namespace),
                "local_namespace": str(self.local_project_namespace),
            },
        }

        # Overwrites project namespace if project is installed, e.g. install_beta flow
        for (
            namespace,
            version,
        ) in self.get_installed_package_version_by_namespace().items():
            if utils.is_string(namespace):
                namespaces[namespace] = {
                    "namespace": namespace,
                    "local_namespace": namespace,
                    "version": str(version),
                }

        # Cache namespaces in org_config.config as dict of strings which can always safely be unpickled
        self.org_config.config.update({"namespaces": namespaces})

        self.log_namespaces()

    @property
    def namespaces(self):
        if self._namespaces is None:
            if not self.org_config.config.get("namespaces"):
                self.cache_namespaces()

            self._namespaces = {}

            # Load instances of Namespace from org_config.config.get("namespaces")
            cached_namespaces = self.org_config.config.get("namespaces")
            for namespace in (
                cached_namespaces if utils.is_dict(cached_namespaces) else {}
            ).values():
                # Only create safe Namespace instances from cache, e.g. namespace, local_namespace, version are strings
                if utils.is_string(namespace.get("namespace")):
                    self._namespaces[namespace["namespace"]] = Namespace(
                        namespace["namespace"],
                        namespace.get("local_namespace")
                        if utils.is_string(namespace.get("local_namespace"))
                        else None,
                        namespace.get("version")
                        if utils.is_string(namespace.get("version"))
                        else None,
                    )

        return self._namespaces


class CacheNamespaces(NamespaceTask):
    def _run_task(self):
        self.cache_namespaces()


"""
class ExecuteAnonymousTask(AnonymousApexTask, NamespaceTask):

    task_docs = ""
    Use the `apex` option to run a string of anonymous Apex.
    Use the `path` option to run anonymous Apex from a file.
    Or use both to concatenate the string to the file contents.
    ""

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
"""
