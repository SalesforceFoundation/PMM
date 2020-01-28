from cumulusci.robotframework.pageobjects import BasePage
from cumulusci.robotframework.pageobjects import ListingPage
from cumulusci.robotframework.pageobjects import DetailPage
from cumulusci.robotframework.pageobjects import pageobject
from pmdm_locators import pmdm_lex_locators
from BaseObjects import BasePMDMPage


@pageobject("Listing", "ProgramCohort__c")
class ProgramCohortListingPage(BasePMDMPage, ListingPage):
    object_name = "None"


@pageobject("NewProgramCohort", "ProgramCohort__c")
class NewProgramCohortPage(BasePMDMPage, BasePage):

    def _is_current_page(self):
        """ Verify we are on the New Program Engagement modal page
            by verifying that the section title is 'New Program Cohort'
        """
        self.selenium.wait_until_location_contains("/new", timeout=60, message="Record view did not open in 1 min")
        self.selenium.location_should_contain("/lightning/o/ProgramCohort__c/",message="Section title is not 'New Program Cohort' as expected")

    def populate_new_program_cohort_form(self, **kwargs):

        """ Populates new Program Cohort form with the field-value pairs """

        for key, value in kwargs.items():
            if key == 'Program Cohort':
                locator = pmdm_lex_locators["new_record"]["text_field"].format("Program Cohort")
                self.selenium.set_focus_to_element(locator)
                self.selenium.get_webelement(locator).send_keys(value)
            elif key == 'Status':
                locator = pmdm_lex_locators["new_record"]["dropdown_field"].format("Status")
                self.selenium.get_webelement(locator).click()
                popup_loc = pmdm_lex_locators['new_record']['dropdown_popup']
                self.selenium.wait_until_page_contains_element(popup_loc, error="Stage field dropdown did not open")
                value_loc=pmdm_lex_locators["new_record"]["dropdown_value"].format(value)
                self.selenium.click_link(value_loc)
            elif key == 'Start Date':
                locator = pmdm_lex_locators["new_record"]["text_field"].format("Start Date")
                self.selenium.set_focus_to_element(locator)
                self.selenium.get_webelement(locator).send_keys(value)
            elif key == 'End Date':
                locator = pmdm_lex_locators["new_record"]["text_field"].format("End Date")
                self.selenium.set_focus_to_element(locator)
                self.selenium.get_webelement(locator).send_keys(value)
            elif key == 'Description':
                locator = pmdm_lex_locators["new_record"]["text_field"].format("Description")
                self.selenium.set_focus_to_element(locator)
                self.selenium.get_webelement(locator).send_keys(value)
            else:
                assert False, "Key provided by name '{}' does not exist".format(key)


@pageobject("Details", "ProgramCohort__c")
class ProgramCohortDetailPage(BasePMDMPage, DetailPage):

    def _is_current_page(self):
        """ Verify we are on the Program detail page
            by verifying that the url contains '/view'
        """
        self.selenium.wait_until_location_contains("/view", timeout=60, message="Detail view did not open in 1 min")
        self.selenium.location_should_contain("/lightning/r/ProgramCohort__c/",
                                              message="Current page is not a Program Cohort record detail view")
