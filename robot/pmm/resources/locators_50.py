""" Locators for summer'21 """

from locators_51 import pmm_lex_locators
import copy

pmm_lex_locators = copy.deepcopy(pmm_lex_locators)

pmm_lex_locators["new_record"][
    "button"
] = "//button[contains(@class, 'slds-button') and @type='button' and (text() or @title = '{}')]"
pmm_lex_locators["related"][
    "button"
] = "//article[contains(@class, 'slds-card slds-card_boundary')][.//span[@title='{}']]//a[@title='{}']"
pmm_lex_locators["new_record"][
    "checkbox"
] = "//div[contains(@class,'uiInputCheckbox')]/label/span[text()='{}']/../following-sibling::input[@type='checkbox']"
