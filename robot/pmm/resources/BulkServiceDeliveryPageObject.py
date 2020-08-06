# Copyright (c) 2020, salesforce.com, inc.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
# For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause

import time

from cumulusci.robotframework.pageobjects import BasePage
from cumulusci.robotframework.pageobjects import pageobject
from pmm_locators import pmm_lex_locators
from BaseObjects import BasePMMPage


@pageobject("Custom", "Bulk_Service_Deliveries")
class BulkServiceDeliveryPage(BasePMMPage,BasePage):
    
    @property
    def pmm(self):
        return self.builtin.get_library_instance('pmm')

    def _go_to_page(self, **kwargs):
        """To go to Bulk Service Delivery page"""
        url_template = "{root}/lightning/n/{object}"
        object_name = "{}{}".format(self.pmm.get_pmm_namespace_prefix(), self._object_name)
        url = url_template.format(root=self.cumulusci.org.lightning_base_url, object=object_name)
        self.selenium.go_to(url)
        self.salesforce.wait_until_loading_is_complete()

    def verify_current_page(self, label):
        """ Verify we are on the Bulk Service Deliveries page by verifying the header title """
        locator = pmm_lex_locators["bulk_service_delivery_locators"]["page_header"].format(label)
        self.selenium.wait_until_page_contains_element(
            locator,
            error="The header for this page is not 'Bulk Service Deliveries' as expected",
        )

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

    def verify_persist_save_icon(self, row, message):
        """Verify persist save icon when service delivery record is saved"""
        locator = pmm_lex_locators["bulk_service_delivery_locators"]["persist_save"].format(row,message)
        self.selenium.wait_until_page_contains_element(
            locator, error=" Incorrect icon displayed "
        )

    def verify_persist_warning_icon(self, row, message):
        """Verify warning icon when service delivery record is not saved"""
        locator = pmm_lex_locators["bulk_service_delivery_locators"]["persist_warning"].format(row,message)
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

    def populate_bsdt_lookup(self, row, title, value):
        """populate the lookup field on bulk service delivery"""
        locator = pmm_lex_locators["bulk_service_delivery_locators"]["new_lookup"].format(row,title)
        self.selenium.click_element(locator)
        self.selenium.get_webelement(locator).send_keys(value)
        locator_val = pmm_lex_locators["bulk_service_delivery_locators"]["select_bsdt_value"].format(value)
        self.selenium.wait_until_page_contains_element(
            locator_val, error="value is not available"
        )
        time.sleep(1)
        self.salesforce._jsclick(locator_val)
        time.sleep(0.5)

    def populate_bsdt_field(self, row, label, value):
        """populate quantity and delivery date for 1st row"""
        locator = pmm_lex_locators["bulk_service_delivery_locators"]["new_field"].format(row,label)
        self.selenium.get_webelement(locator).click()
        self.selenium.set_focus_to_element(locator)
        self.selenium.get_webelement(locator).send_keys(value)

    def populate_bsdt_listbox(self, row, title, value):
        """populate program engagement and services field for 1st row"""
        locator = pmm_lex_locators["bulk_service_delivery_locators"]["new_lookup"].format(row, title)
        self.selenium.get_webelement(locator).click()
        popup_loc = pmm_lex_locators["bulk_service_delivery_locators"]["select_popup"]
        self.selenium.wait_until_page_contains_element(
            popup_loc, error="The dropdown did not open"
        )
        value_loc = pmm_lex_locators["bulk_service_delivery_locators"]["select_value"].format(value)
        element_click = self.selenium.driver.find_element_by_xpath(value_loc)
        self.selenium.driver.execute_script("arguments[0].click()", element_click)

    def click_bsdt_icon(self, icon):
        """ Click on an icon on bsdt page"""
        locator = pmm_lex_locators["bulk_service_delivery_locators"]["icon"].format(icon)
        self.selenium.wait_until_element_is_enabled(
            locator, error="Icon is not enabled"
        )
        self.selenium.click_element(locator)
