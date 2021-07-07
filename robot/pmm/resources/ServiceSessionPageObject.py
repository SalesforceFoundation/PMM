# Copyright (c) 2020, salesforce.com, inc.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
# For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
import time

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
        self.selenium.wait_until_page_contains("Service Session Name", timeout=60)

    def populate_attendance_field(self, client_name, label, value):
        """Populate text field on attendance component given the Client Name"""
        locator = pmm_lex_locators["attendance"]["attendance_text"].format(
            client_name, label
        )
        self.selenium.get_webelement(locator).click()
        self.selenium.set_focus_to_element(locator)
        self.selenium.get_webelement(locator).send_keys(value)

    def populate_attendance_dropdown(self, client_name, title, value):
        """populate dropdown on attendace row given the contact name"""
        locator = pmm_lex_locators["attendance"]["dropdown_field"].format(
            client_name, title
        )
        self.selenium.set_focus_to_element(locator)
        element_click = self.selenium.driver.find_element_by_xpath(locator)
        self.selenium.driver.execute_script("arguments[0].click()", element_click)
        popup_loc = pmm_lex_locators["attendance"]["select_popup"].format(client_name)
        self.selenium.wait_until_page_contains_element(
            popup_loc, error="The dropdown did not open"
        )
        value_loc = pmm_lex_locators["attendance"]["dropdown_value"].format(
            client_name, value
        )
        element_click = self.selenium.driver.find_element_by_xpath(value_loc)
        self.selenium.driver.execute_script("arguments[0].click()", element_click)
        time.sleep(1)

    def dim_attendance_row(self, client_name, status):
        """If status is set to 'Select' then the attendance row is Dimmed, if status is set to
        'Is displayed' then validate that the Dim icon is displayed given the row number. If status
        is set to 'not displayed' then validate that the dim icon is not displayed given the client name
        """
        locator = pmm_lex_locators["attendance"]["dim_icon"].format(client_name)
        if status == "Is displayed":
            self.selenium.wait_until_page_contains_element(
                locator, error="Dim attendance icon is not displayed"
            )
        elif status == "Is not displayed":
            self.selenium.wait_until_page_does_not_contain_element(
                locator, error="Dim attendance icon is displayed"
            )
        elif status == "Select":
            self.selenium.set_focus_to_element(locator)
            self.selenium.click_element(locator)
        else:
            raise Exception("Valid status not entered")

    def validate_attendance_info_in_row(self, client_name, field, status, value):
        """Validate details on attendance component given the client name and field name"""
        locator = pmm_lex_locators["attendance"]["details"].format(client_name, field)
        actual_value = self.selenium.get_webelement(locator).text
        if status == "contains":
            assert (
                value == actual_value
            ), f"Expected value to be {value} but found {actual_value}"
        elif status == "does not contain":
            assert (
                value != actual_value
            ), f"Expected value {value} should not match {actual_value}"
        else:
            raise Exception("Valid status not entered")
