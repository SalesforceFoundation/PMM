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


@pageobject("Listing", "ServiceSchedule__c")
class ServiceScheduleListingPage(BasePMMPage, ListingPage):
    object_name = "ServiceSchedule__c"


@pageobject("New", "ServiceSchedule__c")
class NewServiceSchedulePage(BasePMMPage, BasePage):
    def _is_current_page(self):
        """Verify we are on the New Service Schedule modal page
        by verifying that the section title is 'New Service Schedule'
        """
        self.selenium.wait_until_location_contains(
            "/new", timeout=60, message="Record view did not open in 1 min"
        )
        self.selenium.wait_until_page_contains("New Service Schedule")

    def verify_wizard_screen_title(self, title):
        """ Verify title on a screen on service schedule wizard  """
        locator = pmm_lex_locators["service_schedule"]["wizard_title"].format(title)
        self.selenium.wait_until_page_contains_element(
            locator, error=" Incorrect title found"
        )

    def select_service_participant(self, participant):
        """ Selects a service participant, by clicking on the radio button given the name of the participant """
        locator_button = pmm_lex_locators["service_schedule"][
            "select_participants"
        ].format(participant)
        self.selenium.scroll_element_into_view(locator_button)
        self.selenium.set_focus_to_element(locator_button)
        self.salesforce._jsclick(locator_button)

    def verify_wizard_review_screen(self, title, status, value):
        """Verifies data on wizard screen 4, If status is 'contains' then the specified value should be present in the field
        'does not contain' then the specified value should not be present in the field
        """
        locator = pmm_lex_locators["service_schedule"]["review_wizard"].format(title)
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

    def verify_accordion(self, title, status, value):
        """Verifies data on wizard screen 4 accordion, If status is 'contains' then the specified value should be present in the field
        'does not contain' then the specified value should not be present in the field
        """
        locator = pmm_lex_locators["service_schedule"]["accordion"].format(title, value)
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


@pageobject("Details", "ServiceSchedule__c")
class ServiceScheduleDetailPage(BasePMMPage, DetailPage):
    def _is_current_page(self):
        """Verify we are on the Service Schedule detail page
        by verifying that the url contains '/view'
        """
        self.selenium.wait_until_location_contains(
            "/view", timeout=60, message="Detail view did not open in 1 min"
        )
        self.selenium.wait_until_page_contains("Service Schedule Name")
