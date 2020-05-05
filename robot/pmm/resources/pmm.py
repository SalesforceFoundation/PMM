# Copyright (c) 2020, salesforce.com, inc.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
# For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause

import logging
import time, random, string

import logging
import warnings
import time
import random
import string


from cumulusci.robotframework.utils import selenium_retry
from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.keys import Keys

from pmm_locators import pmm_lex_locators


@selenium_retry
class pmm(object):
    ROBOT_LIBRARY_SCOPE = "GLOBAL"
    ROBOT_LIBRARY_VERSION = 1.0

    def __init__(self, debug=False):
        self.debug = debug
        self.current_page = None
        self._session_records = []
        # Turn off info logging of all http requests
        logging.getLogger("requests.packages.urllib3.connectionpool").setLevel(
            logging.WARN
        )

    @property
    def builtin(self):
        return BuiltIn()

    @property
    def cumulusci(self):
        return self.builtin.get_library_instance("cumulusci.robotframework.CumulusCI")

    @property
    def salesforce(self):
        return self.builtin.get_library_instance("cumulusci.robotframework.Salesforce")

    @property
    def selenium(self):
        return self.builtin.get_library_instance("SeleniumLibrary")

    def check_if_element_exists(self, xpath):
        elements = int(self.selenium.get_matching_xpath_count(xpath))
        return True if elements > 0 else False

    def new_random_string(self, len=5):
        return "".join(random.choice(string.ascii_lowercase) for _ in range(len))

    def generate_new_string(self, prefix="PMM Robot"):
        return "{PREFIX} {RANDOM}".format(
            PREFIX=prefix, RANDOM=self.new_random_string(len=5)
        )

    def page_should_contain_text(self, text):
        locator = pmm_lex_locators["text"].format(text)
        self.selenium.page_should_contain_element(locator)

    def click_wrapper_related_list_button(self, heading, button_title):
        """Clicks a button in the heading of a related list when the related list is enclosed in wrapper.
           Waits for a modal to open after clicking the button.
        """
        locator = pmm_lex_locators["related"]["button"].format(heading, button_title)
        element = self.selenium.driver.find_element_by_xpath(locator)
        self.selenium.driver.execute_script("arguments[0].click()", element)

    def populate_lookup(self, title, value):
        """populate the lookup field"""
        locator = pmm_lex_locators["new_record"]["lookup_field"].format(title)
        self.selenium.click_element(locator)
        self.selenium.clear_element_text(locator)
        self.selenium.get_webelement(locator).send_keys(value)

        locator_val = pmm_lex_locators["new_record"]["lookup_value"].format(value)
        self.selenium.wait_until_page_contains_element(
            locator_val, error="value is not available"
        )
        self.selenium.click_element(locator_val)

    def click_dialog_button(self,title):
        """ Click on the save button """
        locator_save = pmm_lex_locators["new_record"]["button"].format(title)
        self.selenium.wait_until_element_is_enabled(
            locator_save, error="button is not enabled"
        )
        self.selenium.click_element(locator_save)

    def save_current_record_id_for_deletion(self, object_name):
        """Gets the current page record id and stores it for specified object
           in order to delete record during suite teardown """
        id = self.salesforce.get_current_record_id()
        self.salesforce.store_session_record(object_name, id)
        return id

    def click_new_related_record_link(self, value):
        locator = pmm_lex_locators["related"]["new_record_link"].format(value)
        self.selenium.set_focus_to_element(locator)
        element = self.selenium.driver.find_element_by_xpath(locator)
        self.selenium.driver.execute_script("arguments[0].click()", element)

    def select_auto_name_override_checkbox(self, label):
        locator = pmm_lex_locators["checkbox"].format(label)
        self.selenium.get_webelement(locator).click()

    def verify_page_contains_related_list(self, label):
        """Check if the page contains the related list"""
        locator = pmm_lex_locators["related"]["related_list"].format(label)
        self.selenium.page_should_contain_element(locator)

    def verify_details(self, field, status, value):
        """verify information on the account details page"""
        locator = pmm_lex_locators["confirm"]["details"].format(field)
        actual_value = self.selenium.get_webelement(locator).text
        if status.upper() == "contains":
            assert value == actual_value, "Expected value to be {} but found {}".format(
                value, actual_value
            )
        elif status.upper() == "does not contain":
            assert (
                value != actual_value
            ), "Expected value {} and actual value {} should not match".format(
                value, actual_value
            )

    def click_quick_action_button(self, title):
        """ Click on quick action buttons """
        locator = pmm_lex_locators["quick_actions"].format(title)
        self.selenium.wait_until_element_is_enabled(
            locator, error="Button is not enabled"
        )
        element = self.selenium.driver.find_element_by_xpath(locator)
        self.selenium.driver.execute_script("arguments[0].click()", element)

    def verify_current_page(self, label):
        """ Verify we are on the page
                    by verifying the section title"""
        locator = pmm_lex_locators["new_record"]["title"].format(label)
        self.selenium.wait_until_page_contains_element(
            locator, error="Section title is not as expected"
        )

    def click_listview_link(self,title):
        locator=pmm_lex_locators["listview_link"].format(title)
        element = self.selenium.driver.find_element_by_xpath(locator)
        self.selenium.driver.execute_script('arguments[0].click()', element)

    def click_toast_message(self,value):
        """Verifies that toast contains specified value"""
        locator=pmm_lex_locators["toast_msg"].format(value)
        element = self.selenium.driver.find_element_by_xpath(locator)
        self.selenium.driver.execute_script('arguments[0].click()', element)