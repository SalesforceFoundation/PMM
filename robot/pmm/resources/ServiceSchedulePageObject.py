# Copyright (c) 2020, salesforce.com, inc.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
# For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause

from cumulusci.robotframework.pageobjects import BasePage
from cumulusci.robotframework.pageobjects import ListingPage
from cumulusci.robotframework.pageobjects import DetailPage
from cumulusci.robotframework.pageobjects import pageobject
from BaseObjects import BasePMMPage


@pageobject("Listing", "ServiceSchedule__c")
class ServiceScheduleListingPage(BasePMMPage, ListingPage):
    object_name = "ServiceSchedule__c"


@pageobject("New", "ServiceSchedule__c")
class NewServiceSchedulePage(BasePMMPage, BasePage):
    def _is_current_page(self):
        """Verify we are on the New Service Schedule modal page
        by verifying that the section title is 'New Service Schedule'
        """
        self.selenium.wait_until_location_contains(
            "/new", timeout=60, message="Record view did not open in 1 min"
        )
        self.selenium.location_should_contain(
            "/lightning/o/ServiceSchedule__c/",
            message="Section title is not 'New Service Schedule' as expected",
        )


@pageobject("Details", "ServiceSchedule__c")
class ServiceScheduleDetailPage(BasePMMPage, DetailPage):
    def _is_current_page(self):
        """Verify we are on the Service Schedule detail page
        by verifying that the url contains '/view'
        """
        self.selenium.wait_until_location_contains(
            "/view", timeout=60, message="Detail view did not open in 1 min"
        )
        self.selenium.wait_until_page_contains("Service Schedule Name")
