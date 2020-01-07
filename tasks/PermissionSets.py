from cumulusci.tasks.salesforce.UpdateAdminProfile import UpdateAdminProfile
import os
from cumulusci.salesforce_api.metadata import ApiRetrieveUnpackaged
from cumulusci.utils import elementtree_parse_file
import xml.etree.ElementTree as XML_ET


class AddFieldLevelSecurity(UpdateAdminProfile):
    task_options = {
        "permission_set": {
            "description": "Name of Permission Set to add Field Level Security",
            "required": "True",
        },
        "field_permissions": {
            "description": "Array of fieldPermissions objects to upsert into permission_set.  Each fieldPermission requires the following attributes: 'field': API Name of the field including namespace; 'readable': boolean if field can be read; 'editable': boolean if field can be edited",
            "required": "False",
        },
        "class_accesses": {
            "description": "Array of classAccesses objects to upsert into permission_set.  Each classAccess requires the following attributes: 'apexClass': Name of Apex Class.  If namespaced, make sure to use the form \"namespace__ApexClass\"; 'enabled': boolean if the Apex Class can be accessed.",
            "required": "False",
        },
    }

    def _retrieve_unpackaged(self):
        # we want to to inject namespaces into self.options.get("permission_set")
        # e.g. %%%NAMESPACE%%%ManageCases
        self._package_xml_content = """
        <?xml version="1.0" encoding="UTF-8"?>
        <Package xmlns="http://soap.sforce.com/2006/04/metadata">
            <types>
                <members>{}</members>
                <name>PermissionSet</name>
            </types>
            <version>47.0</version>
        </Package>
        """.format(
            self.options.get("permission_set")
        )

        self._package_xml_content = self._package_xml_content.format(
            **self.namespace_prefixes
        )
        self.logger.info(
            "Retrieving {} Permission Set metadata".format(
                self.options.get("permission_set")
            )
        )
        api_retrieve = ApiRetrieveUnpackaged(
            self,
            self._package_xml_content,
            self.project_config.project__package__api_version,
        )
        unpackaged = api_retrieve()
        unpackaged.extractall(self.tempdir)

    def _process_metadata(self):
        self.logger.info("Processing retrieved metadata in {}".format(self.tempdir))

        # we want to to inject namespaces into self.options.get("permission_set")
        # e.g. %%%NAMESPACE%%%ManageCases
        path = os.path.join(
            self.tempdir,
            "permissionsets",
            "{}.permissionset".format(self.options.get("permission_set")),
        )

        self.tree = elementtree_parse_file(path)
        
        self._upsert_class_accesses()
        self._upsert_field_permissions()

        self.tree.write(
            path, "utf-8", xml_declaration=True, default_namespace=self.namespaces["sf"]
        )

    def _get_new_permission_index(self, permissionTag):
        # All permissions must be grouped together in XML file
        field_permissions = self.tree.findall(".//sf:{}".format(permissionTag), self.namespaces)
        if 0 < len(field_permissions):
            # Insert new permission after the last existing permission of the same type
            return self.tree.getroot().getchildren().index(field_permissions[-1]) + 1
        else:
            # There are no existing permissions of this type; insert new permission at the top.
            return 0

    def _upsert_class_accesses(self):
        class_accesses = self.options.get("class_accesses")

        if not class_accesses:
            return
        
        self.logger.info("")
        self.logger.info(
            "Upserting {} Class Accesses".format(
                self.options.get("permission_set")
            )
        )
        self.logger.info(
            "----------{}-------------------------".format(
                "-" * len(self.options.get("permission_set"))
            )
        )

        new_permission_index = self._get_new_permission_index("classAccesses")

        for class_access in class_accesses:
            existing_permissions = self.tree.findall(
                ".//sf:classAccesses[sf:apexClass='{apexClass}']".format(**class_access),
                self.namespaces,
            )
            if 0 < len(existing_permissions):
                # Permission exists: update
                self.logger.info(
                    "Updating {apexClass} Class Access".format(**class_access)
                )

                for elem in existing_permissions:
                    elem.find("sf:enabled", self.namespaces).text = str(
                        class_access.get("enabled")
                    )
            else:
                # Permission doesn't exist: insert
                self.logger.info(
                    "Inserting {apexClass} Class Access".format(**class_access)
                )

                elem = XML_ET.Element(
                    "{%s}classAccesses" % (self.namespaces.get("sf"))
                )
                self.tree.getroot().insert(new_permission_index, elem)

                elem_apexClass = XML_ET.SubElement(
                    elem, "{%s}apexClass" % (self.namespaces.get("sf"))
                )
                elem_apexClass.text = class_access.get("apexClass")

                elem_enabled = XML_ET.SubElement(
                    elem, "{%s}enabled" % (self.namespaces.get("sf"))
                )
                elem_enabled.text = str(class_access.get("enabled"))

            self.logger.info("    enabled: {enabled}".format(**class_access))

        self.logger.info("")

    def _upsert_field_permissions(self):
        field_permissions = self.options.get("field_permissions")

        if not field_permissions:
            return
        
        self.logger.info("")
        self.logger.info(
            "Upserting {} Field Level Security".format(
                self.options.get("permission_set")
            )
        )
        self.logger.info(
            "----------{}-------------------------".format(
                "-" * len(self.options.get("permission_set"))
            )
        )

        new_permission_index = self._get_new_permission_index("fieldPermissions")

        for field_permission in field_permissions:
            existing_permissions = self.tree.findall(
                ".//sf:fieldPermissions[sf:field='{field}']".format(**field_permission),
                self.namespaces,
            )
            if 0 < len(existing_permissions):
                # Permission exists: update
                self.logger.info(
                    "Updating {field} Field Permission".format(**field_permission)
                )

                for elem in existing_permissions:
                    elem.find("sf:readable", self.namespaces).text = str(
                        field_permission.get("readable")
                    )
                    elem.find("sf:editable", self.namespaces).text = str(
                        field_permission.get("editable")
                    )
            else:
                # Permission doesn't exist: insert
                self.logger.info(
                    "Inserting {field} Field Permission".format(**field_permission)
                )

                elem = XML_ET.Element(
                    "{%s}fieldPermissions" % (self.namespaces.get("sf"))
                )
                self.tree.getroot().insert(new_permission_index, elem)

                elem_field = XML_ET.SubElement(
                    elem, "{%s}field" % (self.namespaces.get("sf"))
                )
                elem_field.text = field_permission.get("field")

                elem_editable = XML_ET.SubElement(
                    elem, "{%s}editable" % (self.namespaces.get("sf"))
                )
                elem_editable.text = str(field_permission.get("editable"))

                elem_readable = XML_ET.SubElement(
                    elem, "{%s}readable" % (self.namespaces.get("sf"))
                )
                elem_readable.text = str(field_permission.get("readable"))
            self.logger.info("    readable: {readable}".format(**field_permission))
            self.logger.info("    editable: {editable}".format(**field_permission))

        self.logger.info("")
