""" Locators for summer'21 """

from locators_51 import pmm_lex_locators
import copy

pmm_lex_locators = copy.deepcopy(pmm_lex_locators)

pmm_lex_locators["new_record"][
    "button"
] = "//button[contains(@class, 'slds-button') and @type='button' and text() = '{}']"
pmm_lex_locators["related"][
    "button"
] = "//article[contains(@class, 'slds-card slds-card_boundary')][.//span[@title='{}']]//a[@title='{}']"
