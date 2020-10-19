""" Locators for summer'21 """

from locators_50 import pmm_lex_locators
import copy

pmm_lex_locators = copy.deepcopy(pmm_lex_locators)

pmm_lex_locators["bulk_service_delivery_locators"]["new_prog_engagement"][
    "text_field"
] = "//div[contains(@class,'slds-form-element')][.//label[@class='slds-form-element__label' and text()='{}']]//input[@class='slds-input']"
pmm_lex_locators["related"][
    "new_record_link"
] = "//table[contains(@class,'forceRecordLayout')]/tbody/tr/th/div[contains(@class,'outputLookupContainer')]//a[contains(text(),'{}')]"
pmm_lex_locators["related"][
    "button"
] = "//article[contains(@class, 'forceRelatedListCardDesktop')][.//img][.//span[@title='{}']]//a[@title='{}']"
pmm_lex_locators["new_record"][
    "button"
] = "//button[contains(@class, 'slds-button') and @title = '{}']"
pmm_lex_locators["new_record"][
    "error_message"
] = "//div[@class='pageLevelErrors']//ul[@class='errorsList']/li[text()='{}']"
