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


@pageobject("Listing", "ServiceDelivery__c")
class ServiceDeliveryListingPage(BasePMMPage, ListingPage):
    object_name = "ServiceDelivery__c"


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
        self.selenium.wait_until_page_contains("Service Delivery Name")
