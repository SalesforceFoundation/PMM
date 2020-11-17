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
        self.selenium.location_should_contain(
            "/lightning/o/ServiceSchedule__c/",
            message="Section title is not 'New Service Schedule' as expected",
        )

    def verify_wizard_screen_title(self, title):
        """ Verify title on a screen on service schedule wizard  """
        locator = pmm_lex_locators["service_schedule"]["wizard_title"].format(title)
        self.selenium.wait_until_page_contains_element(
            locator, error=" Incorrect title found"
        )

    def select_service_participant(self, participant):
        """ Selects a service participant, by clicking on the radio button given the name of the participant """
        locator_button = pmm_lex_locators["service_schedule"]["select_participants"]
        self.selenium.scroll_element_into_view(locator_button)
        self.selenium.set_focus_to_element(locator_button)
        self.salesforce._jsclick(locator_button)

    def wizard_review_screen_contains(self, title, value):
        """Verifies data on wizard screen 4, if the title is Service Session on Service Participant, the value within the accordion
        is verified else verfies the value given the field name"""
        if title == "Service Participants" or "Service Sessions":
            locator = pmm_lex_locators["service_schedule"]["accordion"]
        else:
            locator = pmm_lex_locators["service_schedule"]["review_wizard"]
        self.selenium.wait_until_page_contains_element(
            locator, error="Review screen does not contain {value} for {title}"
        )


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
