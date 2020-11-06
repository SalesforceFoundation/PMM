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
class ServiceParticipantListingPage(BasePMMPage, ListingPage):
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
