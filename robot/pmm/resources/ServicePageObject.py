# Copyright (c) 2020, salesforce.com, inc.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
# For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause

from cumulusci.robotframework.pageobjects import BasePage
from cumulusci.robotframework.pageobjects import ListingPage
from cumulusci.robotframework.pageobjects import DetailPage
from cumulusci.robotframework.pageobjects import pageobject
from BaseObjects import BasePMMPage


@pageobject("Listing", "Service")
class ServiceListingPage(BasePMMPage, ListingPage):
    object_name = "Service"


@pageobject("NewService", "Service")
class NewServicePage(BasePMMPage, BasePage):
    def _is_current_page(self):
        """ Verify we are on the New Service modal page
            by verifying that the section title is 'New Service'
        """
        self.selenium.wait_until_location_contains(
            "/new", timeout=60, message="Record view did not open in 1 min"
        )
        self.selenium.location_should_contain(
            "/lightning/o/Service__c/",
            message="Section title is not 'New Service' as expected",
        )


@pageobject("Details", "Service__c")
class ServiceDetailPage(BasePMMPage, DetailPage):
    def _is_current_page(self):
        """ Verify we are on the Service Delivery detail page
            by verifying that the url contains '/view'
        """
        self.selenium.wait_until_location_contains(
            "/view", timeout=60, message="Detail view did not open in 1 min"
        )
        self.selenium.location_should_contain(
            "/lightning/r/Service__c/",
            message="Current page is not a Service Delivery record detail view",
        )
        self.selenium.wait_until_page_contains("Service Name")
