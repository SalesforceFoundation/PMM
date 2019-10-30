from tasks.logger import TableLogger
from cumulusci.core.config import TaskConfig
from cumulusci.core.utils import process_bool_arg
from cumulusci.tasks.salesforce import GetInstalledPackages

class NamespaceInfo(TableLogger):
    installed_package_versions = None

    def get_installed_package_versions(self):
        if self.org_config.config.get("installed_package_versions"):
            return self.org_config.config.get("installed_package_versions")
        
        log_installed_packages = process_bool_arg(self.options.get("log_installed_packages"))

        self.log_title("Getting installed packages:")

        installed_package_versions = {}

        self.org_config.config["installed_package_versions"] = installed_package_versions

        if log_installed_packages:
            rows = [
                [
                    "NAMESPACE",
                    "VERSION"
                ]
            ]

        for package in GetInstalledPackages(
            self.project_config, 
            TaskConfig({}), 
            self.org_config,
        )().items():
            installed_package_versions[package[0]] = package[1]
            if log_installed_packages:
                rows.append([
                    package[0],
                    package[1]
                ])
            
        if log_installed_packages:
            self.log_table(rows)

        return installed_package_versions

    def get_installed_package_namespaces(self):
        return self.get_installed_package_versions().keys()

    def get_project_namespace(self):
        return self.project_config.project__package__namespace

    def is_org_namespaced(self):
        return self.org_config and process_bool_arg(self.org_config.config.get("namespaced"))

    def get_local_project_namespace(self):
        return "" if not self.is_org_namespaced() else self.get_project_namespace()

    def is_package_installed(self, namespace):
        return namespace in self.get_installed_package_namespaces()

    def is_namespace_used(self, namespace):
        if self.get_project_namespace() == namespace:
            return self.is_org_namespaced()
        else:
            return self.is_package_installed(namespace)
