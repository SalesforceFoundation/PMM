from cumulusci.robotframework.pageobjects import BasePage
from cumulusci.robotframework.pageobjects import pageobject


@pageobject("Home", "Homepage")
class CasemanHomePage(BasePage):
    object_name = None

    def _go_to_page(self, **kwargs):
        """To go to Home page"""
        url = self.cumulusci.org.lightning_base_url
        url = "{}/lightning/page/home".format(url)
        self.selenium.go_to(url)
        self.salesforce.wait_until_loading_is_complete()
