from cumulusci.robotframework.pageobjects import BasePage
from cumulusci.robotframework.pageobjects import pageobject
from cumulusci.robotframework.pageobjects import ListingPage
from cumulusci.robotframework.pageobjects import DetailPage
from pmm import pmm_lex_locators
from BaseObjects import BasePMMPage


@pageobject("Listing", "Contact")
class ContactListingPage(BasePMMPage, ListingPage):
    object_name = "Contact"


@pageobject("NewContact", "Contact")
class NewContactPage(BasePMMPage, BasePage):
    object_name = "Contact"

    def save_contact(self):
        """Saves the contact by clicking on the save button on new contact dialog"""
        locator = pmm_lex_locators["contact_save"]
        self.selenium.wait_until_element_is_enabled(
            locator, error="Button is not enabled"
        )
        self.selenium.set_focus_to_element(locator)
        element = self.selenium.driver.find_element_by_xpath(locator)
        self.selenium.driver.execute_script("arguments[0].click()", element)


@pageobject("Details", "Contact")
class ContactDetailPage(BasePMMPage, DetailPage):
    object_name = "Contact"
