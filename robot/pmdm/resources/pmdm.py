import logging
import time, random, string

from cumulusci.robotframework.utils import selenium_retry
from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.keys import Keys

from pmdm_locators import pmdm_lex_locators


@selenium_retry
class pmdm(object):
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
        return ''.join(random.choice(string.ascii_lowercase) for _ in range(len))

    def generate_new_string(self, prefix="PMDM Robot"):
        return "{PREFIX} {RANDOM}".format(
            PREFIX=prefix,
            RANDOM=self.new_random_string(len=5)
        )
