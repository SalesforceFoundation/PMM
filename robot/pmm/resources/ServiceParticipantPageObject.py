# Copyright (c) 2020, salesforce.com, inc.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
# For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause

from cumulusci.robotframework.pageobjects import BasePage
from cumulusci.robotframework.pageobjects import ListingPage
from cumulusci.robotframework.pageobjects import DetailPage
from cumulusci.robotframework.pageobjects import pageobject
from BaseObjects import BasePMMPage


@pageobject("Listing", "ServiceParticipant__c")
class ServiceParticipantListingPage(BasePMMPage, ListingPage):
    object_name = "ServiceParticipant__c"


@pageobject("NewServiceParticipant", "ServiceParticipant__c")
class NewServiceParticipantPage(BasePMMPage, BasePage):
    def _is_current_page(self):
        """Verify we are on the New Service Participant modal page
        by verifying that the section title is 'New Service Participant'
        """
        self.selenium.wait_until_location_contains(
            "/new", timeout=60, message="Record view did not open in 1 min"
        )
        self.selenium.location_should_contain(
            "/lightning/o/ServiceParticipant__c/",
            message="Section title is not 'New Service Participant' as expected",
        )


@pageobject("Details", "ServiceParticipant__c")
class ServiceParticipantDetailPage(BasePMMPage, DetailPage):
    def _is_current_page(self):
        """Verify we are on the Service Participant detail page
        by verifying that the url contains '/view'
        """
        self.selenium.wait_until_location_contains(
            "/view", timeout=60, message="Detail view did not open in 1 min"
        )
        self.selenium.wait_until_page_contains("Service Participant Name")
