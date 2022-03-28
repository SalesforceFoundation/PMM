import time

from cumulusci.robotframework.pageobjects import BasePage
from cumulusci.robotframework.pageobjects import pageobject
from pmm import pmm_lex_locators
from BaseObjects import BasePMMPage


@pageobject("Home", "Homepage")
class PMMHomePage(BasePMMPage, BasePage):
    object_name = None

    def _go_to_page(self, **kwargs):
        """To go to Home page"""
        url = self.cumulusci.org.lightning_base_url
        url = "{}/lightning/page/home".format(url)
        self.selenium.go_to(url)
        self.salesforce.wait_until_loading_is_complete()
        time.sleep(2)

    def verify_component_on_homepage(self, component_name):
        """Validates the component is displayed on home page given component name"""
        locator = pmm_lex_locators["homepage"]["component_link"].format(component_name)
        self.selenium.wait_until_page_contains_element(
            locator, error=f"Component '{component_name}' is not displayed"
        )

    def verify_recent_sessions_component_contains(self, text):
        """Validates that the recents sessions component contians the given data"""
        locator = pmm_lex_locators["homepage"]["recent_sessions_info"].format(text)
        self.pmm.scroll_element_into_view(locator)
        self.selenium.wait_until_page_contains_element(
            locator, error=f"Recent sessions component does not contain '{text}' "
        )


