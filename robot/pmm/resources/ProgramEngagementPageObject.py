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


@pageobject("Listing", "ProgramEngagement")
class ProgramEngagementListingPage(BasePMMPage, ListingPage):
    object_name = "ProgramEngagement"


@pageobject("NewProgramEngagement", "ProgramEngagement__c")
class NewProgramEngagementPage(BasePMMPage, BasePage):
    def _is_current_page(self):
        """ Verify we are on the New Program Engagement modal page
            by verifying that the section title is 'New Program Engagement'
        """
        self.selenium.wait_until_location_contains(
            "/new", timeout=60, message="Record view did not open in 1 min"
        )
        self.selenium.location_should_contain(
            "/lightning/o/ProgramEngagement__c/",
            message="Section title is not 'New Program Engagement' as expected",
        )

    def populate_program_engagement_bsdt_form(self, **kwargs):
        """ Populates new program engagement form with the field-value pairs """
        for key, value in kwargs.items():
            if key == "Role":
                locator = pmm_lex_locators["bulk_service_delivery_locators"]["new_prog_engagement"]["dropdown_field"].format( "Role")
                self.selenium.set_focus_to_element(locator)
                self.selenium.get_webelement(locator).click()
                popup_loc = pmm_lex_locators["bulk_service_delivery_locators"]["new_prog_engagement"]["dropdown_popup"]
                self.selenium.wait_until_page_contains_element(
                    popup_loc, error="Role field dropdown did not open"
                )
                value_loc = pmm_lex_locators["bulk_service_delivery_locators"]["new_prog_engagement"]["dropdown_value"].format(value)
                element = self.selenium.driver.find_element_by_xpath(value_loc)
                self.selenium.driver.execute_script("arguments[0].click()", element)
            elif key == "Stage":
                locator = pmm_lex_locators["bulk_service_delivery_locators"]["new_prog_engagement"]["dropdown_field"].format("Stage")
                self.selenium.get_webelement(locator).click()
                popup_loc = pmm_lex_locators["bulk_service_delivery_locators"]["new_prog_engagement"]["dropdown_popup"]
                self.selenium.wait_until_page_contains_element(
                    popup_loc, error="Stage field dropdown did not open"
                )
                value_loc = pmm_lex_locators["bulk_service_delivery_locators"]["new_prog_engagement"]["dropdown_value"].format(value)
                element = self.selenium.driver.find_element_by_xpath(value_loc)
                self.selenium.driver.execute_script("arguments[0].click()", element)
            elif key == "Application Date":
                locator = pmm_lex_locators["bulk_service_delivery_locators"]["new_prog_engagement"]["text_field"].format("Application Date")
                self.selenium.set_focus_to_element(locator)
                self.selenium.get_webelement(locator).send_keys(value)
            elif key == "Start Date":
                locator = pmm_lex_locators["bulk_service_delivery_locators"]["new_prog_engagement"]["text_field"].format("Start Date")
                self.selenium.set_focus_to_element(locator)
                self.selenium.get_webelement(locator).send_keys(value)
            else:
                assert False, "Key provided by name '{}' does not exist".format(key)


@pageobject("Details", "ProgramEngagement__c")
class ProgramEngagementDetailPage(BasePMMPage, DetailPage):
    def _is_current_page(self):
        """ Verify we are on the Program detail page
            by verifying that the url contains '/view'
        """
        self.selenium.wait_until_location_contains(
            "/view", timeout=60, message="Detail view did not open in 1 min"
        )
        self.selenium.location_should_contain(
            "/lightning/r/ProgramEngagement__c/",
            message="Current page is not a Program Engagement record detail view",
        )
        self.selenium.wait_until_page_contains("Program Engagement Name")