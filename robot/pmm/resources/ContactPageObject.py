from cumulusci.robotframework.pageobjects import BasePage
from cumulusci.robotframework.pageobjects import pageobject
from cumulusci.robotframework.pageobjects import ListingPage
from cumulusci.robotframework.pageobjects import DetailPage
from pmm_locators import pmm_lex_locators
from BaseObjects import BasePMMPage


@pageobject("Listing", "Contact")
class ContactListingPage(BasePMMPage, ListingPage):
    object_name = "Contact"

@pageobject("NewContact", "Contact")
class NewContactPage(BasePMMPage, BasePage):
    object_name = "Contact"

@pageobject("Details", "Contact")
class ContactDetailPage(BasePMMPage,DetailPage):
    object_name = "Contact"