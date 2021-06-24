""" Locators for winter'21 """

from locators_52 import pmm_lex_locators
import copy

pmm_lex_locators = copy.deepcopy(pmm_lex_locators)

pmm_lex_locators[
    "contact_save"
] = "//button[contains(@class,'slds-button--neutral') and (text() or @title='Save')]"
pmm_lex_locators["related"][
    "button"
] = "//article[contains(@class, 'slds-card slds-card_boundary')][.//span[@title='{}']]//a[@title='{}']"
pmm_lex_locators["new_record"][
    "checkbox"
] = "//div[contains(@class,'uiInputCheckbox')]/label/span[text()='{}']/../following-sibling::input[@type='checkbox']"
