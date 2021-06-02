# Copyright (c) 2020, salesforce.com, inc.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
# For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause

import logging
import time
import random
import string
import warnings

from robot.libraries.BuiltIn import RobotNotRunningError
from cumulusci.robotframework.utils import selenium_retry
from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.keys import Keys
from locators_51 import pmm_lex_locators as locators_51
from locators_50 import pmm_lex_locators as locators_50
from locators_49 import pmm_lex_locators as locators_49

locators_by_api_version = {
    49.0: locators_49,  # summer '20
    50.0: locators_50,  # winter '21
    51.0: locators_51,  # winter '21
}
# will get populated in _init_locators
pmm_lex_locators = {}


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
        self._init_locators()

    def _init_locators(self):
        try:
            client = self.cumulusci.tooling
            response = client._call_salesforce(
                "GET", "https://{}/services/data".format(client.sf_instance)
            )
            self.latest_api_version = float(response.json()[-1]["version"])
            if self.latest_api_version not in locators_by_api_version:
                warnings.warn(
                    "Could not find locator library for API %d"
                    % self.latest_api_version
                )
                self.latest_api_version = max(locators_by_api_version.keys())
        except RobotNotRunningError:
            # We aren't part of a running test, likely because we are
            # generating keyword documentation. If that's the case, assume
            # the latest supported version
            self.latest_api_version = max(locators_by_api_version.keys())
        locators = locators_by_api_version[self.latest_api_version]
        pmm_lex_locators.update(locators)

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
        parts = name.split("__")
        if parts[-1] == "c":
            parts = parts[:-1]
        if len(parts) > 1:
            return parts[0] + "__"
        else:
            return ""

    def get_pmm_namespace_prefix(self):
        """ gets the namespace prefix for the objects """
        if not hasattr(self.cumulusci, "_describe_result"):
            self.cumulusci._describe_result = self.cumulusci.sf.describe()
        objects = self.cumulusci._describe_result["sobjects"]
        program_object = [o for o in objects if o["label"] == "Program"][0]
        return self.get_namespace_prefix(program_object["name"])

    def click_app_link(self):
        """ clicks on the app link on the app launcher """
        locator = pmm_lex_locators["app_link"]
        self.selenium.wait_until_page_contains_element(locator, error="App not found")
        self.selenium.set_focus_to_element(locator)
        self.salesforce._jsclick(locator)

    # element = self.selenium.driver.find_element_by_xpath(locator)
    # self.selenium.driver.execute_script("arguments[0].click()", element)

    def check_if_element_exists(self, xpath):
        elements = self.selenium.get_element_count(xpath)
        return True if elements > 0 else False

    def new_random_string(self, len=5):
        return "".join(random.choice(string.ascii_lowercase) for _ in range(len))

    def generate_new_string(self, prefix="PMM Robot"):
        """ generates a random string with PMM Robot prefix """
        return "{PREFIX} {RANDOM}".format(
            PREFIX=prefix, RANDOM=self.new_random_string(len=5)
        )

    def page_should_contain_text(self, text):
        """ Verifies if the page contains the given text """
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
        in order to delete record during suite teardown"""
        id = self.salesforce.get_current_record_id()
        self.salesforce.store_session_record(object_name, id)
        return id

    def click_new_related_record_link(self, value):
        """ clicks on a link on the related list given the link """
        locator = pmm_lex_locators["related"]["new_record_link"].format(value)
        self.selenium.set_focus_to_element(locator)
        element = self.selenium.driver.find_element_by_xpath(locator)
        self.selenium.driver.execute_script("arguments[0].click()", element)

    def verify_page_contains_related_list(self, label):
        """Check if the page contains the related list"""
        locator = pmm_lex_locators["related"]["related_list"].format(label)
        self.selenium.page_should_contain_element(locator)

    def verify_details(self, field, status, value):
        """If status is 'contains' then the specified value should be present in the field
        'does not contain' then the specified value should not be present in the field
        """
        locator = pmm_lex_locators["confirm"]["details"].format(field)
        actual_value = self.selenium.get_webelement(locator).text
        print(f"actual value is {actual_value}")
        print(f"value is {value}")
        if status == "contains":
            assert (
                value == actual_value
            ), f"Expected value to be {value} but found {actual_value}"
        elif status == "does not contain":
            assert (
                value != actual_value
            ), f"Expected value {value} should not match {actual_value}"
        else:
            raise Exception("Valid status not entered")

    def click_quick_action_button(self, title):
        """ Click on quick action buttons and verifies the title of the quick action dialog """
        locator = pmm_lex_locators["quick_actions"].format(title)
        self.selenium.wait_until_element_is_enabled(
            locator, error="Button is not enabled"
        )
        element = self.selenium.driver.find_element_by_xpath(locator)
        self.selenium.driver.execute_script("arguments[0].click()", element)
        self.selenium.wait_until_page_contains_element(
            locator, error="Section title is not as expected"
        )

    def verify_current_page_title(self, label):
        """Verify we are on the page
        by verifying the section title"""
        locator = pmm_lex_locators["new_record"]["title"].format(label)
        self.selenium.wait_until_page_contains_element(
            locator, error="Section title is not as expected"
        )

    def click_listview_link(self, title):
        """ clicks on a link on the listview page, given the link """
        locator = pmm_lex_locators["listview_link"].format(title)
        element = self.selenium.driver.find_element_by_xpath(locator)
        self.selenium.driver.execute_script("arguments[0].click()", element)

    def click_toast_message(self, value):
        """Clicks on the link on toast message"""
        locator = pmm_lex_locators["toast_link"].format(value)
        element = self.selenium.driver.find_element_by_xpath(locator)
        self.selenium.driver.execute_script("arguments[0].click()", element)

    def populate_modal_form(self, **kwargs):
        """Populates modal form with the field-value pairs
        supported keys are any input, textarea, lookup, checkbox, date and dropdown fields"""

        for key, value in kwargs.items():
            locator = pmm_lex_locators["new_record"]["label"].format(key)
            if self.check_if_element_exists(locator):
                ele = self.selenium.get_webelements(locator)
                for e in ele:
                    classname = e.get_attribute("class")
                    #                     print("key is {} and class is {}".format(key,classname))
                    if "Lookup" in classname and "readonly" not in classname:
                        self.salesforce.populate_lookup_field(key, value)
                        print("Executed populate lookup field for {}".format(key))
                        break
                    elif "Select" in classname and "readonly" not in classname:
                        self.select_value_from_dropdown(key, value)
                        print("Executed select value from dropdown for {}".format(key))
                        break
                    elif "Checkbox" in classname and "readonly" not in classname:
                        if value == "checked":
                            locator = pmm_lex_locators["new_record"]["checkbox"].format(
                                key
                            )
                            self.selenium.get_webelement(locator).click()
                            break
                    elif "Date" in classname and "readonly" not in classname:
                        self.select_date_from_datepicker(key, value)
                        print(
                            "Executed open date picker and pick date for {}".format(key)
                        )
                        break
                    else:
                        try:
                            self.search_field_by_value(key, value)
                            print("Executed search field by value for {}".format(key))
                        except Exception:
                            try:
                                self.salesforce.populate_field(key, value)
                                print("Executed populate field for {}".format(key))

                            except Exception:
                                print(
                                    "class name for key {} did not match with field type supported by this keyword".format(
                                        key
                                    )
                                )

            else:
                raise Exception("Locator for {} is not found on the page".format(key))

    def select_value_from_dropdown(self, dropdown, value):
        """Select given value in the dropdown field"""
        locator_title = pmm_lex_locators["page_title"]
        value_title = self.selenium.get_webelement(locator_title).text
        if value_title == "Add Contact to Program":
            locator = pmm_lex_locators["new_record"]["quick_dropdown_field"].format(
                dropdown
            )
            popup_loc = pmm_lex_locators["new_record"]["quick_dropdown_popup"]
            value_loc = pmm_lex_locators["new_record"]["quick_dropdown_value"].format(
                value
            )
        else:
            locator = pmm_lex_locators["new_record"]["dropdown_field"].format(dropdown)
            popup_loc = pmm_lex_locators["new_record"]["dropdown_popup"]
            value_loc = pmm_lex_locators["new_record"]["dropdown_value"].format(value)
        self.salesforce.scroll_element_into_view(locator)
        self.selenium.get_webelement(locator).click()
        self.selenium.wait_until_page_contains_element(
            popup_loc, error="Status field dropdown did not open"
        )
        self.salesforce._jsclick(value_loc)

    def select_date_from_datepicker(self, title, value):
        """ opens the date picker given the field name and picks a date from the date picker"""
        locator = pmm_lex_locators["new_record"]["open_date_picker"].format(title)
        self.selenium.set_focus_to_element(locator)
        self.selenium.get_webelement(locator).click()
        popup_loc = pmm_lex_locators["new_record"]["datepicker_popup"]
        self.selenium.wait_until_page_contains_element(
            popup_loc, error="Date picker did not open "
        )
        locator_date = pmm_lex_locators["new_record"]["select_date"].format(value)
        self.selenium.set_focus_to_element(locator_date)
        element = self.selenium.driver.find_element_by_xpath(locator_date)
        self.selenium.driver.execute_script("arguments[0].click()", element)

    def search_field_by_value(self, fieldname, value):
        """Searches the field with the placeholder given by 'fieldname' for the given 'value'"""
        xpath = pmm_lex_locators["placeholder"].format(fieldname)
        field = self.selenium.get_webelement(xpath)
        self.selenium.clear_element_text(field)
        field.send_keys(value)
        time.sleep(2)
        field.send_keys(Keys.ENTER)

    def verify_page_header(self, label):
        """Verify we are on the page
        by verifying the section title"""
        locator = pmm_lex_locators["page_title"].format(label)
        self.selenium.wait_until_page_contains_element(
            locator, error="Section title is not as expected"
        )

    def verify_modal_error(self, message):
        """ Verify error message is displayed on the modal"""
        locator = pmm_lex_locators["new_record"]["error_message"].format(message)
        self.selenium.wait_until_page_contains_element(
            locator, error="Error message is not displayed"
        )

    def verify_toast_message(self, message):
        """Verifies the toast message contains the given text"""
        locator = pmm_lex_locators["toast_msg"].format(message)
        self.selenium.wait_until_page_contains_element(
            locator, error="Toast message is not displayed"
        )
        time.sleep(1)

    def click_dialog_button(self, label):
        """ Click on a button to on the new record dialog"""
        locator = pmm_lex_locators["new_record"]["button"].format(label)
        self.selenium.wait_until_element_is_enabled(
            locator, error="Button is not enabled"
        )
        self.selenium.set_focus_to_element(locator)
        element = self.selenium.driver.find_element_by_xpath(locator)
        self.selenium.driver.execute_script("arguments[0].click()", element)

    def populate_lightning_fields(self, **kwargs):
        """During winter 2020 part of the modal fields appear as lightning elements.
        This keyword validates , identifies the element and populates value"""
        for key, value in kwargs.items():
            if key == "Start Date" or "End Date" or "Delivery Date" or "Date":
                locator = pmm_lex_locators["new_record"][
                    "c_lightning_datepicker"
                ].format(key)
                if self.check_if_element_exists(locator):
                    element = self.selenium.driver.find_element_by_xpath(locator)
                    self.selenium.driver.execute_script(
                        "arguments[0].scrollIntoView(true)", element
                    )
                    self.selenium.wait_until_element_is_visible(locator)
                    self.selenium.set_focus_to_element(locator)
                    self.select_from_date_picker(key, value)
                else:
                    self.builtin.log(f"Element {key} not found")

            elif key in ("Status", "Program Issue Area", "Stage", "Role"):
                locator = pmm_lex_locators["new_record"]["c_dd_popup"].format(key)
                selection_value = pmm_lex_locators["new_record"][
                    "c_dd_selection"
                ].format(value)
                if self.check_if_element_exists(locator):
                    self.selenium.set_focus_to_element(locator)
                    self.selenium.wait_until_element_is_visible(locator)
                    self.selenium.scroll_element_into_view(locator)
                    self.salesforce._jsclick(locator)
                    self.selenium.wait_until_element_is_visible(selection_value)
                    self.selenium._jsclick(selection_value)

            elif key in (
                "Program",
                "Client",
                "Program Engagement",
                "Service",
                "Household Account",
                "Program Cohort",
                "Contact",
                "Service Schedule",
                "Primary Service Provider",
                "Other Service Provider",
            ):
                self.salesforce.populate_lookup_field(key, value)
            else:
                raise Exception("Locator not found")

    def select_from_date_picker(self, title, value):
        """Opens the date picker by clicking on the date picker icon given the title of the field and select a date"""
        locator = pmm_lex_locators["new_record"]["c_lightning_datepicker"].format(title)
        self.selenium.scroll_element_into_view(locator)
        self.selenium.set_focus_to_element(locator)
        self.selenium.get_webelement(locator).click()
        locator_date = pmm_lex_locators["new_record"]["c_datepicker"].format(value)
        self.selenium.set_focus_to_element(locator_date)
        self.selenium.get_webelement(locator_date).click()

    def set_checkbox(self, title, status):
        """If status is 'checked' then checks the box if its not already checked. Prints a warning msg if already checked.
        If status is 'unchecked' then unchecks the box if its not already checked. Prints a warning msg if already unchecked
        """
        cb_found = False
        locator = pmm_lex_locators["new_record"]["override_checkbox"].format(title)
        if self.check_if_element_exists(locator):
            checkbox = self.selenium.get_webelement(locator)
            if (status == "checked" and checkbox.is_selected() is False) or (
                status == "unchecked" and checkbox.is_selected() is True
            ):
                self.selenium.click_element(checkbox)
            else:
                self.builtin.log(
                    "This checkbox is already in the expected status", "WARN"
                )
            cb_found = True
        assert cb_found, " Checkbox not found "

    def select_button_on_modal(self, label):
        """ Click on a button to on the new record dialog"""
        locator = pmm_lex_locators["new_record"]["modal_button"].format(label)
        self.selenium.wait_until_element_is_enabled(
            locator, error="Button is not enabled"
        )
        self.selenium.set_focus_to_element(locator)
        element = self.selenium.driver.find_element_by_xpath(locator)
        self.selenium.driver.execute_script("arguments[0].click()", element)
