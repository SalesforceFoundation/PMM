# Copyright (c) 2020, salesforce.com, inc.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
# For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause

from cumulusci.robotframework.pageobjects import BasePage
from cumulusci.robotframework.pageobjects import ListingPage
from cumulusci.robotframework.pageobjects import DetailPage
from cumulusci.robotframework.pageobjects import pageobject
from pmm import pmm_lex_locators
from BaseObjects import BasePMMPage


@pageobject("Listing", "ServiceSession__c")
class ServiceSessionListingPage(BasePMMPage, ListingPage):
    object_name = "ServiceSession__c"


@pageobject("New", "ServiceSession__c")
class NewServiceSessionPage(BasePMMPage, BasePage):
    def _is_current_page(self):
        """Verify we are on the New Service Session modal page
        by verifying that the section title is 'New Service Session'
        """
        self.selenium.wait_until_location_contains(
            "/new", timeout=60, message="Record view did not open in 1 min"
        )
        self.selenium.location_should_contain(
            "/lightning/o/ServiceSession__c/",
            message="Section title is not 'New Service Session' as expected",
        )

    def select_session_date(self, date, value):
        """Opens the date picker on service session dialog by clicking on the date picker
        icon given the title of the field and select a date
        """
        locator = pmm_lex_locators["service_session"]["date"].format(date)
        self.selenium.set_focus_to_element(locator)
        element = self.selenium.driver.find_element_by_xpath(locator)
        self.selenium.driver.execute_script("arguments[0].click()", element)
        locator_date = pmm_lex_locators["new_record"]["c_datepicker"].format(value)
        self.selenium.set_focus_to_element(locator_date)
        element_date = self.selenium.driver.find_element_by_xpath(locator_date)
        self.selenium.driver.execute_script("arguments[0].click()", element_date)


@pageobject("Details", "ServiceSession__c")
class ServiceSessionDetailPage(BasePMMPage, DetailPage):
    def _is_current_page(self):
        """Verify we are on the Service Session detail page
        by verifying that the url contains '/view'
        """
        self.selenium.wait_until_location_contains(
            "/view", timeout=60, message="Detail view did not open in 1 min"
        )
        self.selenium.wait_until_page_contains("Service Session Name")

    def populate_attendance_field(self, row, label, value):
        """ Populate text field on attendance component given the attendance row number """
        locator = pmm_lex_locators["attendance"]["attendance_text"].format(row, label)
        self.selenium.get_webelement(locator).click()
        self.selenium.set_focus_to_element(locator)
        self.selenium.get_webelement(locator).send_keys(value)

    def populate_attendance_dropdown(self, row, title, value):
        """populate dropdown on attendace row given the attendance row number"""
        locator = pmm_lex_locators["attendance"]["dropdown_field"].format(row, title)
        self.selenium.set_focus_to_element(locator)
        element_click = self.selenium.driver.find_element_by_xpath(locator)
        self.selenium.driver.execute_script("arguments[0].click()", element_click)
        popup_loc = pmm_lex_locators["bulk_service_delivery_locators"]["select_popup"]
        self.selenium.wait_until_page_contains_element(
            popup_loc, error="The dropdown did not open"
        )
        value_loc = pmm_lex_locators["bulk_service_delivery_locators"][
            "select_dropdown_value"
        ].format(value)
        element_click = self.selenium.driver.find_element_by_xpath(value_loc)
        self.selenium.driver.execute_script("arguments[0].click()", element_click)
