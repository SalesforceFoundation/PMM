from cumulusci.robotframework.pageobjects import BasePage
from cumulusci.robotframework.pageobjects import ListingPage
from cumulusci.robotframework.pageobjects import DetailPage
from cumulusci.robotframework.pageobjects import pageobject
from pmdm_locators import pmdm_lex_locators


@pageobject("Listing", "Program")
class ProgramListingPage(ListingPage):
    object_name = "None"

    def _go_to_page(self, **kwargs):
        """To go to Home page"""
        url = self.cumulusci.org.lightning_base_url
        url = "{}/lightning/o/Program__c/list".format(url)
        self.selenium.go_to(url)
        self.salesforce.wait_until_loading_is_complete()

    def _is_current_page(self):
        """
        Waits for the current page to be a Program List page
        """
        self.selenium.wait_until_location_contains("/list",timeout=60, message="Programs list page did not load for 1 minute")


@pageobject("NewProgram", "Program")
class NewProgramPage(BasePage):

    @property
    def pmdm(self):
        return self.builtin.get_library_instance('PMDM')

    def _is_current_page(self):
        """ Verify we are on the New Program page
            by verifying that the header title is 'New Program'
        """
        locator_title = pmdm_lex_locators["new_record"]["title"]
        self.selenium.page_should_contain_element(locator_title,
                                                  message="Title is not 'New Program' as expected")

    def click_save_button(self):
        """ Click on the save button """
        locator_save = pmdm_lex_locators["new_record"]["button"]
        self.selenium.wait_until_element_is_enabled(locator_save, error="Save button is not enabled")
        self.selenium.click_element(locator_save)

    def populate_new_program_form(self, **kwargs):
        """ Populates new program form with the field-value pairs """
        for key, value in kwargs.items():
            if key == 'Program Name':
                locator = pmdm_lex_locators["new_record"]["text_field"]
                self.selenium.get_webelement(locator).send_keys(value)
            elif key == 'Short Summary':
                locator = pmdm_lex_locators["new_record"]["text_field"]
                self.selenium.get_webelement(locator).send_keys(value)
            elif key == 'Description':
                locator = pmdm_lex_locators["new_record"]["text_field"]
                self.selenium.get_webelement(locator).send_keys(value)
            elif key == 'Target Population':
                locator = pmdm_lex_locators["new_record"]["text_field"]
                self.selenium.get_webelement(locator).send_keys(value)
            elif key == 'Status':
                self.pmdm.select_value_from_listbox(key, value)
            else:
                assert False, "Key provided by name '{}' does not exist".format(key)