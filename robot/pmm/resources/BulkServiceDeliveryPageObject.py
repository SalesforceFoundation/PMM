# Copyright (c) 2020, salesforce.com, inc.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
# For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause

from cumulusci.robotframework.pageobjects import BasePage
from cumulusci.robotframework.pageobjects import pageobject
from pmm_locators import pmm_lex_locators
from BaseObjects import BasePMMPage


@pageobject("Custom", "Bulk_Service_Deliveries")
class BulkServiceDeliveryPage(BasePage):
    
    def get_namespace_prefix(self, name):
        parts = name.split('__')
        if parts[-1] == 'c':
            parts = parts[:-1]
        if len(parts) > 1:
            return parts[0] + '__'
        else:
            return ''

    def get_pmm_namespace_prefix(self):
        if not hasattr(self.cumulusci, '_describe_result'):
            self.cumulusci._describe_result = self.cumulusci.sf.describe()
        objects = self.cumulusci._describe_result['sobjects']
        program_object = [o for o in objects if o['label'] == 'Program'][0]
        return self.get_namespace_prefix(program_object['name'])

    def _go_to_page(self, **kwargs):
        """To go to Bulk Service Delivery page"""
        url_template = "{root}/lightning/n/{object}"
        ns = self.get_pmm_namespace_prefix()
        if ns == "pmdm__":
            url = url_template.format(root=self.cumulusci.org.lightning_base_url, object='pmdm__Bulk_Service_Deliveries')
        else:
            url = url_template.format(root=self.cumulusci.org.lightning_base_url, object='Bulk_Service_Deliveries')
        self.selenium.go_to(url)
        self.salesforce.wait_until_loading_is_complete()


    def verify_current_page(self, label):
        """ Verify we are on the Bulk Service Deliveries page by verifying the header title """
        locator = pmm_lex_locators["bulk_service_delivery_locators"]["page_header"].format(label)
        self.selenium.wait_until_page_contains_element(
            locator,
            error="The header for this page is not 'Bulk Service Deliveries' as expected",
        )

    def populate_bsdt_lookup(self, title, value):
        """populate the lookup field on bulk service delivery"""
        locator = pmm_lex_locators["bulk_service_delivery_locators"]["lookup_bsdt_field"].format(title)
        self.selenium.click_element(locator)
        self.selenium.clear_element_text(locator)
        self.selenium.get_webelement(locator).send_keys(value)

        locator_val = pmm_lex_locators["bulk_service_delivery_locators"]["select_bsdt_value"].format(value)
        self.selenium.wait_until_page_contains_element(
            locator_val, error="value is not available"
        )
        self.selenium.click_element(locator_val)

    def populate_row1_fields(self, title, value):
        """populate program engagement and services field for 1st row"""
        locator = pmm_lex_locators["bulk_service_delivery_locators"]["lookup_field_row1"].format(title)
        self.selenium.get_webelement(locator).click()
        popup_loc = pmm_lex_locators["bulk_service_delivery_locators"]["select_popup"]
        self.selenium.wait_until_page_contains_element(
            popup_loc, error="The dropdown did not open"
        )
        value_loc = pmm_lex_locators["bulk_service_delivery_locators"]["select_value"].format(value)
        element_click = self.selenium.driver.find_element_by_xpath(value_loc)
        self.selenium.driver.execute_script("arguments[0].click()", element_click)

    def populate_row2_fields(self, title, value):
        """populate program engagement and services field for 2nd row"""
        locator = pmm_lex_locators["bulk_service_delivery_locators"]["lookup_field_row2"].format(title)
        self.selenium.get_webelement(locator).click()
        popup_loc = pmm_lex_locators["bulk_service_delivery_locators"]["select_popup"]
        self.selenium.wait_until_page_contains_element(
            popup_loc, error="The dropdown did not open"
        )
        value_loc = pmm_lex_locators["bulk_service_delivery_locators"]["select_value"].format(value)
        element_click = self.selenium.driver.find_element_by_xpath(value_loc)
        self.selenium.driver.execute_script("arguments[0].click()", element_click)

    def input_row1_data(self, label, value):
        """populate quantity and delivery date for 1st row"""
        locator = pmm_lex_locators["bulk_service_delivery_locators"]["text_field_row1"].format(label)
        self.selenium.get_webelement(locator).click()
        self.selenium.set_focus_to_element(locator)
        self.selenium.get_webelement(locator).send_keys(value)

    def input_row2_data(self, label, value):
        """populate quantity and delivery date for 2nd row"""
        locator = pmm_lex_locators["bulk_service_delivery_locators"]["text_field_row2"].format(label)
        self.selenium.get_webelement(locator).click()
        self.selenium.set_focus_to_element(locator)
        self.selenium.get_webelement(locator).send_keys(value)

    def click_button(self, label):
        """ Click on the Add service delivery button """
        locator_save = pmm_lex_locators["bulk_service_delivery_locators"]["button"].format(label)
        self.selenium.wait_until_element_is_enabled(
            locator_save, error="Add service delivery button is not enabled"
        )
        self.selenium.click_element(locator_save)

    def verify_error_message(self, message):
        """Verify error message"""
        locator = pmm_lex_locators["bulk_service_delivery_locators"]["error_message"].format(message)
        self.selenium.wait_until_page_contains_element(
            locator, error=" Incorrect message displayed"
        )

    def verify_persist_save_icon(self, message):
        """Verify persist save icon when service delivery record is saved"""
        locator = pmm_lex_locators["bulk_service_delivery_locators"]["persist_save"].format(message)
        self.selenium.wait_until_page_contains_element(
            locator, error=" Incorrect icon displayed "
        )

    def verify_persist_warning_icon(self, message):
        """Verify warning icon when service delivery record is not saved"""
        locator = pmm_lex_locators["bulk_service_delivery_locators"]["persist_warning"].format(message)
        self.selenium.wait_until_page_contains_element(
            locator, error=" Incorrect icon displayed "
        )

    def select_listbox(self, title, value):
        """populate program engagement and services field for 1st row"""
        locator = pmm_lex_locators["bulk_service_delivery_locators"]["lookup_field_row1"].format(title)
        self.selenium.get_webelement(locator).click()
        popup_loc = pmm_lex_locators["bulk_service_delivery_locators"]["select_popup"]
        self.selenium.wait_until_page_contains_element(
            popup_loc, error="The dropdown did not open"
        )
        value_loc = pmm_lex_locators["bulk_service_delivery_locators"]["pick_listbox"].format(value)
        element_click = self.selenium.driver.find_element_by_xpath(value_loc)
        self.selenium.driver.execute_script("arguments[0].click()", element_click)

    def verify_dialog_title(self, label):
        """ Verify we are on the Bulk Service Deliveries page by verifying the header title """
        locator = pmm_lex_locators["bulk_service_delivery_locators"]["new_prog_engagement"]["title"].format(label)
        self.selenium.wait_until_page_contains_element(
            locator,
            error="The header for this page is not  as expected",
        )

    def click_dialog_button(self,title):
        """ Click on the save button """
        locator_save = pmm_lex_locators["bulk_service_delivery_locators"]["new_prog_engagement"]["button"].format(title)
        self.selenium.wait_until_element_is_enabled(
            locator_save, error="button is not enabled"
        )
        self.selenium.click_element(locator_save)
