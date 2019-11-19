pmdm_lex_locators = {
    "app_launcher": {
        "app_link": "//div[contains(@class, 'slds-section slds-is-open')]//section[@id='cards']//a[@class='appTileTitle' and text()='{}']",
    },
    "placeholder_lookup": {
        "lookup1": "//div[@class='slds-lookup__result-text' and contains(text(), '{}')]",
        "lookup2": "//mark[text() = '{}']/ancestor::a",
    },
    "input": {
        "input1": "//label[text()='{}']/following::input",
        "input2": "//input[@type='text' and @data-name='{}']"
    }
}
program_locators = {
    "header_title": "//div[contains(@class, 'slds-page-header')]/descendant::span[text()='Programs']",
    "new_program": {
        "title": "//h2[contains(@class, 'inlineTitle') and text()='New Program']",
        "text_field": "//div[contains(@class, 'uiInput')][.//label[contains(@class, 'uiLabel')][.//span[text()='{}']]]//*[self::input or self::textarea]",
        "dropdown_field": "//div[@class='slds-form-element__control']/div[.//span[text()='{}']][//div[contains(@class,'uiMenu')]//a[@class='select']]",
        "dropdown_value": "//div[@class='select-options']//ul//li//a[@title='{}']",
        "save": "//button[contains(@class, 'slds-button') and @type='button' and @title = 'Save']",
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