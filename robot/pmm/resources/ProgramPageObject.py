# Copyright (c) 2020, salesforce.com, inc.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
# For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause

from cumulusci.robotframework.pageobjects import BasePage
from cumulusci.robotframework.pageobjects import ListingPage
from cumulusci.robotframework.pageobjects import DetailPage
from cumulusci.robotframework.pageobjects import pageobject
from pmm_locators import pmm_lex_locators
from BaseObjects import BasePMMPage


@pageobject("Listing", "Program")
class ProgramListingPage(BasePMMPage, ListingPage):
    object_name = "None"


@pageobject("NewProgram", "Program__c")
class NewProgramPage(BasePMMPage, BasePage):
    def _is_current_page(self):
        """ Verify we are on the New Program modal page
            by verifying that the section title is 'New Program'
        """
        self.selenium.wait_until_location_contains(
            "/new", timeout=60, message="Record view did not open in 1 min"
        )
        self.selenium.location_should_contain(
            "/lightning/o/Program__c/",
            message="Section title is not 'New Program' as expected",
        )

    def click_save_button(self):
        """ Click on the save button """
        locator_save = pmm_lex_locators["new_record"]["button"].format("Save")
        self.selenium.wait_until_element_is_enabled(
            locator_save, error="Save button is not enabled"
        )
        self.selenium.click_element(locator_save)

    def populate_new_program_form(self, **kwargs):
        """ Populates new program form with the field-value pairs """
        for key, value in kwargs.items():
            if key == "Program Name":
                locator = pmm_lex_locators["new_record"]["text_field"].format(
                    "Program Name"
                )
                self.selenium.set_focus_to_element(locator)
                self.selenium.get_webelement(locator).send_keys(value)
            elif key == "Short Summary":
                locator = pmm_lex_locators["new_record"]["text_field"].format(
                    "Short Summary"
                )
                self.selenium.set_focus_to_element(locator)
                self.selenium.get_webelement(locator).send_keys(value)
            elif key == "Description":
                locator = pmm_lex_locators["new_record"]["text_field"].format(
                    "Description"
                )
                self.selenium.set_focus_to_element(locator)
                self.selenium.get_webelement(locator).send_keys(value)
            elif key == "Target Population":
                locator = pmm_lex_locators["new_record"]["text_field"].format(
                    "Target Population"
                )
                self.selenium.set_focus_to_element(locator)
                self.selenium.get_webelement(locator).send_keys(value)
            elif key == "Status":
                locator = pmm_lex_locators["new_record"]["dropdown_field"].format(
                    "Status"
                )
                self.selenium.get_webelement(locator).click()
                popup_loc = pmm_lex_locators["new_record"]["dropdown_popup"]
                self.selenium.wait_until_page_contains_element(
                    popup_loc, error="Status field dropdown did not open"
                )
                value_loc = pmm_lex_locators["new_record"]["dropdown_value"].format(
                    value
                )
                self.selenium.click_link(value_loc)
            elif key == "Start Date":
                locator = pmm_lex_locators["new_record"]["text_field"].format(
                    "Start Date"
                )
                self.selenium.set_focus_to_element(locator)
                self.selenium.get_webelement(locator).send_keys(value)
            elif key == "End Date":
                locator = pmm_lex_locators["new_record"]["text_field"].format(
                    "End Date"
                )
                self.selenium.set_focus_to_element(locator)
                self.selenium.get_webelement(locator).send_keys(value)
            elif key == "Program Issue Area":
                locator = pmm_lex_locators["new_record"]["dropdown_field"].format(
                    "Program Issue Area"
                )
                self.selenium.set_focus_to_element(locator)
                self.selenium.get_webelement(locator).click()
                popup_loc = pmm_lex_locators["new_record"]["dropdown_popup"]
                self.selenium.wait_until_page_contains_element(
                    popup_loc, error="Program Issue Area field dropdown did not open"
                )
                value_loc = pmm_lex_locators["new_record"]["dropdown_value"].format(
                    value
                )
                self.selenium.click_link(value_loc)
            else:
                assert False, "Key provided by name '{}' does not exist".format(key)


@pageobject("Details", "Program__c")
class ProgramDetailPage(BasePMMPage, DetailPage):
    def _is_current_page(self):
        """ Verify we are on the Program detail page
            by verifying that the url contains '/view'
        """
        self.selenium.wait_until_location_contains(
            "/view", timeout=60, message="Detail view did not open in 1 min"
        )
        self.selenium.location_should_contain(
            "/lightning/r/Program__c/",
            message="Current page is not a Program record detail view",
        )
