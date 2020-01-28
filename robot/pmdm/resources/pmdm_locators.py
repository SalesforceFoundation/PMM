pmdm_lex_locators = {
    "app_launcher": {
        "waffle": "//div[contains(@class, 'slds-icon-waffle')]",
        "select-option": "//li[contains(@class,'oneAppLauncherItem')]//a[@title='{}']",
        "app_link": "//div[contains(@class, 'slds-section slds-is-open')]//section[@id='cards']//a[@class='appTileTitle' and text()='{}']",
     },
    "text": "//*[contains(text(), '{}')]",

    "placeholder_lookup": {
        "lookup1": "//div[@class='slds-lookup__result-text' and contains(text(), '{}')]",
        "lookup2": "//mark[text() = '{}']/ancestor::a",
    },
    "input": {
        "input1": "//label[text()='{}']/following::input",
        "input2": "//input[@type='text' and @data-name='{}']"
    },
    "page_header": "//div[contains(@class, 'slds-page-header')]/descendant::span[text()='{}}']",
    "checkbox": "//div[contains(@class,'uiInputCheckbox')]/label/span[text()='{}']/../following-sibling::input[@type='checkbox']",
    'confirm': {
        'check_value':'//div[contains(@class, "forcePageBlockItem")][.//span[text()="{}"]]//following-sibling::div[.//span[contains(@class, "test-id__field-value")]]/span',
        'check_status':'//div[contains(@class, "field-label-container")][.//span[text()="{}"]]//following-sibling::div[.//span[contains(@class, "test-id__field-value")]]/span//lightning-formatted-text',
        'check_numbers':'//div[contains(@class, "field-label-container")][.//span[text()="{}"]]//following-sibling::div[.//span[contains(@class, "test-id__field-value")]]/span//lightning-formatted-number',
    },
    "new_record": {
        "title": "//h2[contains(@class, 'inlineTitle') and text()='{}']",
        "text_field": "//div[contains(@class, 'uiInput')][.//label[contains(@class, 'uiLabel')][.//span[text()='{}']]]//*[self::input or self::textarea]",
        "dropdown_field": "//div[@class='slds-form-element__control']/div[.//span[text()='{}']]/div//a[@class='select']",
        "dropdown_popup": "//div[@class='select-options' and @role='menu']",
        "dropdown_value": "//div[@class='select-options']//ul//li//a[@title='{}']",
        "button": "//button[contains(@class, 'slds-button') and @type='button' and @title = '{}']",
        "lookup_field": "//div[contains(@class, 'autocompleteWrapper')]//input[@title='{}']",
        "lookup_value": "//div[contains(@class, 'listContent')]//div[contains(@class, 'slds-truncate') and @title='{}']"
    },
    'related': {
        'button': "//article[contains(@class, 'forceRelatedListCardDesktop')][.//img][.//span[@title='{}']]//a[@title='{}']",
        "new_record_link": "//table[contains(@class,'forceRecordLayout')]/tbody/tr/th/div[contains(@class,'outputLookupContainer')]//a[contains(text(),'{}')]"
    }
}

program_engagement_locators = {

}

program_cohort_locators = {

}

service_locators = {

}

service_delivery_locators = {

}

bulk_service_delivery_locators = {

}

account_locators = {

}

contact_locators = {

}
