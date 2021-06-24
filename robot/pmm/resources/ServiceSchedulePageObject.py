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
        """Verify title on a screen on service schedule wizard"""
        locator = pmm_lex_locators["service_schedule"]["wizard_title"].format(title)
        self.selenium.wait_until_page_contains_element(
            locator, error=" Incorrect title found"
        )

    def select_service_participant(self, participant):
        """Selects a service participant, by clicking on the Add button in the row of the participant"""
        locator_button = pmm_lex_locators["service_schedule"][
            "add_participants"
        ].format(participant)
        self.pmm.scroll_element_into_view(locator_button)
        self.selenium.set_focus_to_element(locator_button)
        self.salesforce._jsclick(locator_button)

    def click_add_all_button(self):
        """Selects all participants, by clicking on the Add All button above the participant list"""
        locator_button = pmm_lex_locators["service_schedule"]["add_all"].format(self)
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

    def validate_participant_is_added(self, participant):
        """Validates that the service participant is added to the participant selector component"""
        locator = pmm_lex_locators["service_schedule"]["participant_selector"].format(
            participant
        )
        self.selenium.wait_until_page_contains_element(
            locator, error="Service Participant is not added"
        )

    def remove_participant(self, participant):
        """Validates that the service participant is removed when clicked on X and added to the participant list on screen3"""
        locator = pmm_lex_locators["service_schedule"]["remove_participant"].format(
            participant
        )
        self.selenium.set_focus_to_element(locator)
        self.salesforce._jsclick(locator)
        locator_participant = pmm_lex_locators["service_schedule"][
            "add_participants"
        ].format(participant)
        self.selenium.wait_until_page_contains_element(
            locator_participant,
            error="The service participant is not removed from participant selector",
        )

    def set_frequency(self, frequency):
        """Sets the frequency on Screen1 of Service Schedule Wizard"""
        locator = pmm_lex_locators["service_schedule"]["frequency"].format(frequency)
        self.pmm.scroll_element_into_view(locator)
        self.selenium.set_focus_to_element(locator)
        self.salesforce._jsclick(locator)

    def set_service_schedule_ends(self, frequency, field, value):
        """Sets the Service Session end to 'On/After given the frequency and also fills in the number of service session field if frequency is  'After' or Service Session End Date field if frequency in 'On'"""
        locator = pmm_lex_locators["service_schedule"]["ends_radio_button"].format(
            frequency
        )
        self.pmm.scroll_element_into_view(locator)
        self.selenium.set_focus_to_element(locator)
        self.salesforce._jsclick(locator)
        locator_session = pmm_lex_locators["service_schedule"]["session_end"].format(
            field
        )
        self.selenium.set_focus_to_element(locator_session)
        self.selenium.get_webelement(locator_session).click()
        self.selenium.get_webelement(locator_session).send_keys(value)

    def remove_session(self, session_name):
        """On Screen2 of wizard, clicks on 'x' to remove the session given the service session name, and validates that it is removed, checks that the warning message is not displayed and 'Add Service Session' button is displayed"""
        locator = pmm_lex_locators["service_schedule"]["remove_session"].format(
            session_name
        )
        self.selenium.set_focus_to_element(locator)
        element = self.selenium.driver.find_element_by_xpath(locator)
        self.selenium.driver.execute_script("arguments[0].click()", element)
        self.selenium.wait_until_page_does_not_contain_element(session_name, timeout=60)
        self.selenium.wait_until_page_does_not_contain_element(
            "We can only create 500 sessions for a Service Schedule. Only the sessions listed here will be created."
        )
        self.selenium.wait_until_page_contains("Add Service Session")

    def set_end_date(self, date, value):
        """On Screen1 of wizard, enters a service session end date that is different from the start date"""
        locator = pmm_lex_locators["service_schedule"]["first_session_end"].format(date)
        self.selenium.set_focus_to_element(locator)
        self.selenium.get_webelement(locator).click()
        self.selenium.clear_element_text(locator)
        self.selenium.get_webelement(locator).send_keys(value)

    def filter_participants(self, filter_value):
        """Filter participants on service schedule wizard based on filter criteria"""
        locator = pmm_lex_locators["service_schedule"]["filter"].format(filter_value)
        self.selenium.set_focus_to_element(locator)
        self.selenium.get_webelement(locator).click()
        self.selenium.get_webelement(locator).send_keys(filter_value)
        self.selenium.wait_until_page_contains(filter_value)


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
