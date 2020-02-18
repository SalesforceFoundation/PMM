import operator
import os
import subprocess

from cumulusci.utils import os_friendly_path
from cumulusci.core.config import TaskConfig
from cumulusci.core.exceptions import TaskOptionsError
from cumulusci.core.utils import process_bool_arg
from cumulusci.tasks.salesforce import GetInstalledPackages, BaseSalesforceApiTask
from cumulusci.tasks.apex.anon import AnonymousApexTask
from cumulusci.tasks.sfdx import SFDXBaseTask

from tasks.logger import LoggingTask


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

        rows = [["SOBJECT TYPE", "DEVELOPER NAME"]]

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
                    developer_name,
                ]
            )

            last_sobject_type = sobject_type

        if not self._record_types_by_sobject:
            rows.append(["💤  NONE  💤"])
        self.log_title("Record Types")
        self.log_table(rows)

        return self._record_types_by_sobject

    @property
    def record_types_by_sobject(self):
        if self._record_types_by_sobject is None:
            self.cache_record_types_by_sobject()
        return self._record_types_by_sobject


class BaseNamespaceTask(LoggingTask):

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

    def _get_installed_package_versions_by_namespace_from_soap_api(self):
        self.log_title("Getting installed packages from SOAP API")
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
        return self._get_installed_package_versions_by_namespace_from_soap_api()

    def get_installed_package_version_by_namespace(self):
        if (
            self.options.get("installed_packages_api")
            and self.options.get("installed_packages_api").lower() == "sfdx"
        ):
            return self._get_installed_package_versions_by_namespace_from_sfdx()
        return self._get_installed_package_versions_by_namespace_from_soap_api()

    def log_namespaces(self):
        rows = [
            [
                "NAMESPACE",
                "LOCAL NAMESPACE",
                "PACKAGE VERSION",
                "PROJECT",
                "NEEDING INJECTION",
                "WITHOUT INJECTION",
            ],
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
                    "✅" if self.namespaces[prefix].local_namespace else "",
                    "" if self.namespaces[prefix].local_namespace else "✅",
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

        namespaces_needing_injection = {}
        namespaces_without_injection = {}
        for prefix, namespace in namespaces.items():
            if namespace.get("local_namespace"):
                namespaces_needing_injection[prefix] = namespace
            else:
                namespaces_without_injection[prefix] = namespace

        # Cache in org_config:
        #   - namespaces as dict of strings which can always safely be unpickled
        #   - namespaces_needing_injection as namespaces needing namespace injection
        #   - namespaces_without_injection as namespaces without needing namespace injection
        self.org_config.config.update(
            {
                "namespaces": namespaces,
                "namespaces_needing_injection": namespaces_needing_injection,
                "namespaces_without_injection": namespaces_without_injection,
            }
        )

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


class NamespaceTask(BaseNamespaceTask):

    task_options = {
        "namespace": {
            "description": 'Namespace to inject if locally used.  Task runs only if namespace is used.  Use the "c" namespace for unpackaged/local references.',
            "required": True,
        },
        "and_require_namespaces": {
            "description": 'Array of namespaces that also must be used in addition to "namespace" option to run this task.  Ignores non-string-array option values.',
            "required": False,
        },
        "and_require_namespaces_installed": {
            "description": 'Array of namespaces that must be locally used/installed to run this task in addition to the "namespace" and "and_require_namespaces" options.  If the "namespace" option should be installed, include "namespace" in this option.  Ignores non-string-array option values.',
            "required": False,
        },
    }

    _required_namespaces = None
    _required_namespaces_installed = None
    _is_namespace_used = None
    _namespace = None

    @property
    def required_namespaces_installed(self):
        if self._required_namespaces_installed is None:
            self._required_namespaces_installed = set()
            # and_require_namespaces_installed
            if utils.is_list(self.options.get("and_require_namespaces_installed")):
                for namespace in self.options.get("and_require_namespaces_installed"):
                    if utils.is_string(namespace):
                        self._required_namespaces_installed.add(namespace)

        return self._required_namespaces_installed

    @property
    def required_namespaces(self):
        if self._required_namespaces is None:
            self._required_namespaces = []
            # namespace
            if utils.is_string(self.options.get("namespace")):
                self._required_namespaces.append(self.options.get("namespace"))

            # and_require_namespaces
            if utils.is_list(self.options.get("and_require_namespaces")):
                for namespace in self.options.get("and_require_namespaces"):
                    if utils.is_string(namespace):
                        self._required_namespaces.append(namespace)

            # and_require_namespaces_installed
            self._required_namespaces.extend(
                self.required_namespaces_installed.difference(self._required_namespaces)
            )

        return self._required_namespaces

    @property
    def is_namespace_used(self):
        if self._is_namespace_used is None:
            rows = [["REQUIRED NAMESPACE", "USED", "INSTALLED", "INSTALL REQUIRED",]]

            is_namespace_used = True
            for namespace_prefix in self.required_namespaces:
                namespace = self.namespaces.get(namespace_prefix)
                is_installed_required = (
                    namespace_prefix in self.required_namespaces_installed
                )
                is_namespace_used = is_namespace_used and namespace

                installed = "✅" if namespace and namespace.local_namespace else ""
                if is_installed_required:
                    installed = installed if installed else "❌"

                rows.append(
                    [
                        namespace_prefix,
                        "✅" if namespace else "❌",
                        installed,
                        "❕" if is_installed_required else "",
                    ]
                )

            self._is_namespace_used = is_namespace_used

            # log result
            self.log_table(rows)
            if self._is_namespace_used:
                self.log_title("✅  Running task!  All required namespaces are used.")
            else:
                self.log_title(
                    "😴  Skipping task.  All required namespaces must be used and/or installed to run task."
                )
        return self._is_namespace_used

    @property
    def namespace(self):
        if self.is_namespace_used:
            return self.namespaces.get(self.options.get("namespace"))

    def _run_task_when_namespace_used(self):
        """ Subclasses should override to provide their implementation """
        raise NotImplementedError("Subclasses should provide their own implementation")

    def _run_task(self):
        if self.is_namespace_used:
            self._run_task_when_namespace_used()


class CacheNamespacesTask(BaseNamespaceTask):
    def _run_task(self):
        # Calling namespaces will cache_namespaces() if first call
        self.namespaces


class RefreshNamespacesCacheTask(BaseNamespaceTask):
    def _run_task(self):
        self.cache_namespaces()


class AssignPermissionSetNamespaceTask(NamespaceTask, SFDXBaseTask):

    task_options = {
        **NamespaceTask.task_options,
        "permsetname": {
            "description": "Un-namespaced Permission Set API Name to assign.",
            "required": True,
        },
        "extra": {
            "description": "Append additional options to the command.  e.g. --onbehalfof",
            "required": False,
        },
    }

    salesforce_task = True

    @property
    def sfdx_username(self):
        return (
            self.org_config.sfdx_alias
            if self.org_config.sfdx_alias
            else self.org_config.username
        )

    @property
    def permsetname(self):
        permsetname = self.options.get("permsetname")
        if self.is_namespace_used:
            return self.namespace.inject_namespace(permsetname, "__")
        else:
            return permsetname

    def _get_command(self):
        return f'sfdx force:user:permset:assign --targetusername="{self.sfdx_username}" --permsetname="{self.permsetname}"'

    def _run_task_when_namespace_used(self):
        """ Calls SFDXBaseTask's _run_task() """
        return super(SFDXBaseTask, self)._run_task()


class ExecuteAnonymousNamespaceTask(NamespaceTask, AnonymousApexTask):
    """ Runs AnonymousApexTask if is_namespace_used.   Injects namespace into apex. """

    task_options = {
        **NamespaceTask.task_options,
        **AnonymousApexTask.task_options,
    }

    def _prepare_apex(self, apex):
        # Process namespace tokens

        if self.is_namespace_used:
            NAMESPACE = self.namespace.get_prefix("__")
            NAMESPACED_ORG = self.namespace.get_prefix("__")
            NAMESPACED_RT = self.namespace.get_prefix(".")
            param1 = self.options.get("param1") or ""
            param2 = self.options.get("param2") or ""

            apex = apex.replace("%%%NAMESPACE%%%", NAMESPACE)
            apex = apex.replace("%%%NAMESPACED_ORG%%%", NAMESPACED_ORG)
            apex = apex.replace("%%%NAMESPACED_RT%%%", NAMESPACED_RT)
            apex = apex.replace("%%%PARAM_1%%%", param1)
            apex = apex.replace("%%%PARAM_2%%%", param2)

            self.log_table(
                [
                    ["TOKEN", "REPLACEMENT"],
                    ["%%%NAMESPACE%%%", NAMESPACE,],
                    ["%%%NAMESPACED_ORG%%%", NAMESPACED_ORG,],
                    ["%%%NAMESPACED_RT%%%", NAMESPACED_RT,],
                    ["%%%PARAM_1%%%", param1,],
                    ["%%%PARAM_2%%%", param2,],
                ]
            )

        return apex

    def _run_task_when_namespace_used(self):
        return AnonymousApexTask._run_task(self)
