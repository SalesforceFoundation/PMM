from cumulusci.robotframework.pageobjects import BasePage
from cumulusci.robotframework.pageobjects import ListingPage
from cumulusci.robotframework.pageobjects import DetailPage
from cumulusci.robotframework.pageobjects import pageobject
from pmm_locators import pmm_lex_locators
from BaseObjects import BasePMMPage


@pageobject("Listing", "ServiceDelivery")
class ServiceDeliveryListingPage(BasePMMPage, ListingPage):
    object_name = "None"


@pageobject("NewServiceDelivery", "ServiceDelivery__c")
class NewServiceDeliveryPage(BasePMMPage, BasePage):
    def _is_current_page(self):
        """ Verify we are on the New Service Delivery modal page
            by verifying that the section title is 'New Service Delivery'
        """
        self.selenium.wait_until_location_contains(
            "/new", timeout=60, message="Record view did not open in 1 min"
        )
        self.selenium.location_should_contain(
            "/lightning/o/ServiceDelivery__c/",
            message="Section title is not 'New Service Delivery' as expected",
        )

    def populate_new_service_delivery_form(self, **kwargs):
        """ Populates new Service Delivery form with the field-value pairs """
        for key, value in kwargs.items():
            if key == "Service Delivery Name":
                locator = pmm_lex_locators["new_record"]["text_field"].format(
                    "Service Delivery Name"
                )
                self.selenium.set_focus_to_element(locator)
                self.selenium.get_webelement(locator).send_keys(value)
            elif key == "Delivery Date":
                locator = pmm_lex_locators["new_record"]["open_date_picker"].format(
                    "Delivery Date"
                )
                self.selenium.set_focus_to_element(locator)
                self.selenium.get_webelement(locator).click()
                popup_loc = pmm_lex_locators["new_record"]["datepicker_popup"]
                self.selenium.wait_until_page_contains_element(
                    popup_loc, error="Date picker for delivery date did not open "
                )
                value_loc = pmm_lex_locators["new_record"]["select_date"].format(value)
                self.selenium.set_focus_to_element(value_loc)
                # self.selenium.click_link(value_loc)
                self.selenium.get_webelement(value_loc).click()
            elif key == "Quantity":
                locator = pmm_lex_locators["new_record"]["text_field"].format(
                    "Quantity"
                )
                self.selenium.set_focus_to_element(locator)
                self.selenium.get_webelement(locator).send_keys(value)
            else:
                assert False, "Key provided by name '{}' does not exist".format(key)


@pageobject("Details", "ServiceDelivery__c")
class ServiceDeliveryDetailPage(BasePMMPage, DetailPage):
    def _is_current_page(self):
        """ Verify we are on the Service Delivery detail page
            by verifying that the url contains '/view'
        """
        self.selenium.wait_until_location_contains(
            "/view", timeout=60, message="Detail view did not open in 1 min"
        )
        self.selenium.location_should_contain(
            "/lightning/r/ServiceDelivery__c/",
            message="Current page is not a Service Delivery record detail view",
        )

