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

    def get_namespace_prefix(self, name):
        parts = name.split('__')
        if parts[-1] == 'c':
            parts = parts[:-1]
        if len(parts) > 1:
            return parts[0] + '__'
        else:
            return ''

    def get_pmm_namespace_prefix(self):
        if not hasattr(self.cumulusci, '_describe_result'):
            self.cumulusci._describe_result = self.cumulusci.sf.describe()
        objects = self.cumulusci._describe_result['sobjects']
        program_object = [o for o in objects if o['label'] == 'Program'][0]
        return self.get_namespace_prefix(program_object['name'])

    def click_app_link(self):
        locator = pmm_lex_locators["app_link"]
        self.selenium.wait_until_page_contains_element(
            locator, error="App not found"
        )
        self.selenium.set_focus_to_element(locator)
        element = self.selenium.driver.find_element_by_xpath(locator)
        self.selenium.driver.execute_script("arguments[0].click()", element)

    def check_if_element_exists(self, xpath):
        elements =self.selenium.get_element_count(xpath)
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

    def verify_current_page_title(self, label):
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


    def populate_modal_form(self,**kwargs):
        """Populates modal form with the field-value pairs
        supported keys are any input, textarea, lookup, checkbox, date and dropdown fields"""

        for key, value in kwargs.items():
            locator = pmm_lex_locators["new_record"]["label"].format(key)
            if self.check_if_element_exists(locator):
                ele=self.selenium.get_webelements(locator)
                for e in ele:
                    classname=e.get_attribute("class")
                    #                     print("key is {} and class is {}".format(key,classname))
                    if "Lookup" in classname and "readonly" not in classname:
                        self.salesforce.populate_lookup_field(key,value)
                        print("Executed populate lookup field for {}".format(key))
                        break
                    elif "Select" in classname and "readonly" not in classname:
                        self.select_value_from_dropdown(key,value)
                        print("Executed select value from dropdown for {}".format(key))
                        break
                    elif "Checkbox" in classname and "readonly" not in classname:
                        if value == "checked":
                            locator = pmm_lex_locators["new_record"]["checkbox"].format(key)
                            self.selenium.get_webelement(locator).click()
                            break
                    elif "Date" in classname and "readonly" not in classname:
                        self.open_date_picker(key)
                        self.pick_date(value)
                        print("Executed open date picker and pick date for {}".format(key))
                        break
                    else:
                        try :
                            self.search_field_by_value(key,value)
                            print("Executed search field by value for {}".format(key))
                        except Exception :
                            try :
                                self.salesforce.populate_field(key,value)
                                print("Executed populate field for {}".format(key))

                            except Exception:
                                print ("class name for key {} did not match with field type supported by this keyword".format(key))

            else:
                raise Exception("Locator for {} is not found on the page".format(key))



    def select_value_from_dropdown(self,dropdown,value):
        """Select given value in the dropdown field"""
        locator = pmm_lex_locators['new_record']['dropdown_field'].format(dropdown)
        self.selenium.get_webelement(locator).click()
        popup_loc = pmm_lex_locators["new_record"]["dropdown_popup"]
        self.selenium.wait_until_page_contains_element(
            popup_loc, error="Status field dropdown did not open"
        )
        value_loc = pmm_lex_locators["new_record"]["dropdown_value"].format(
            value
        )
        self.selenium.click_link(value_loc)

    def open_date_picker(self, title):
        locator = pmm_lex_locators["new_record"]["open_date_picker"].format(title)
        self.selenium.set_focus_to_element(locator)
        self.selenium.get_webelement(locator).click()
        popup_loc = pmm_lex_locators['new_record']['datepicker_popup']
        self.selenium.wait_until_page_contains_element(popup_loc, error="Date picker did not open ")

    def pick_date(self, value):
        """To pick a date from the date picker"""
        locator=pmm_lex_locators["new_record"]["select_date"].format(value)
        self.selenium.set_focus_to_element(locator)
        element = self.selenium.driver.find_element_by_xpath(locator)
        self.selenium.driver.execute_script('arguments[0].click()', element)

    def search_field_by_value(self, fieldname, value):
         """ Searches the field with the placeholder given by 'fieldname' for the given 'value'
         """
         xpath = pmm_lex_locators["placeholder"].format(fieldname)
         field = self.selenium.get_webelement(xpath)
         self.selenium.clear_element_text(field)
         field.send_keys(value)
         time.sleep(2)
         field.send_keys(Keys.ENTER)

    def verify_page_header(self, label):
        """ Verify we are on the page
                    by verifying the section title"""
        locator = pmm_lex_locators["page_title"].format(label)
        self.selenium.wait_until_page_contains_element(
            locator, error="Section title is not as expected"
        )

    def logns(self):
        ns = self.get_pmm_namespace_prefix
        print("ns valus", ns)