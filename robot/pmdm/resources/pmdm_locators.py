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
        "details": "//div[contains(@class, 'slds-form-element')][.//span[text()='{}']]//following-sibling::div[.//span[contains(@class, 'test-id__field-value')]]/span",
     #   'check_value':'//div[contains(@class, "forcePageBlockItem")][.//span[text()="{}"]]//following-sibling::div[.//span[contains(@class, "test-id__field-value")]]/span',
     #   'check_status':'//div[contains(@class, "field-label-container")][.//span[text()="{}"]]//following-sibling::div[.//span[contains(@class, "test-id__field-value")]]/span//lightning-formatted-text',
      #  'check_numbers':'//div[contains(@class, "field-label-container")][.//span[text()="{}"]]//following-sibling::div[.//span[contains(@class, "test-id__field-value")]]/span//lightning-formatted-number',
    },
    "new_record": {
        "title": "//h2[contains(@class, 'inlineTitle') and text()='{}']",
        "text_field": "//div[contains(@class, 'uiInput')][.//label[contains(@class, 'uiLabel')][.//span[text()='{}']]]//*[self::input or self::textarea]",
        "dropdown_field": "//div[@class='slds-form-element__control']/div[.//span[text()='{}']]/div//a[@class='select']",
        "dropdown_popup": "//div[@class='select-options' and @role='menu']",
        "dropdown_value": "//div[@class='select-options']//ul//li//a[@title='{}']",
        "button": "//button[contains(@class, 'slds-button') and @type='button' and @title = '{}']",
        "lookup_field": "//div[contains(@class, 'autocompleteWrapper')]//input[@title='{}']",
        "lookup_value": "//div[contains(@class, 'listContent')]//div[contains(@class, 'slds-truncate') and @title='{}']",
        "open_date_picker": "//div[@class='slds-form-element__control']/div[.//span[text()='{}']]//div//a[contains(@class,'datePicker-openIcon display')]",
        "datepicker_popup": "//table[@class='calGrid' and @role='grid']",
        "select_date": "//div[contains(@class,'uiDatePickerGrid')]/table[@class='calGrid']//button[contains(@class,'slds-button') and text()='{}']",
    },
    'related': {
        'button': "//article[contains(@class, 'forceRelatedListCardDesktop')][.//img][.//span[@title='{}']]//a[@title='{}']",
        "new_record_link": "//table[contains(@class,'forceRecordLayout')]/tbody/tr/th/div[contains(@class,'outputLookupContainer')]//a[contains(text(),'{}')]",
        "related_list": "//span[contains(@class,'slds-card') and @title='{}']",
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
    "page_header": "//div[@class='slds-p-horizontal_small slds-text-heading_large slds-m-bottom_x-large' and text()='{}']",
    "lookup_contact": "//input[contains(@class,'slds-input slds-combobox__input') and contains(@placeholder,'{}')]",
    "select_contact": "//span[contains(@class,'slds-listbox__option-text')]/lightning-base-combobox-formatted-text[@class='slds-truncate' and @title='{}']",
    "select_value":"//span[@class='slds-media__body']/span[@class='slds-truncate' and contains(@title,'{}')]",
    "select_popup":"//div[contains(@class,'slds-listbox')]",
    "lookup_field_row1": "//div[3]//input[@placeholder='{}']",
    "lookup_field_row2": "//div[4]/c-service-delivery-row//input[@placeholder='{}']",
    "text_field_row1":"//div[3]//input[@class='slds-input' and contains(@name,'{}')]",
    "text_field_row2":"//div[4]/c-service-delivery-row//input[@class='slds-input' and contains(@name,'{}')]",
    "button":"//button[@class='slds-button slds-button_brand' and @type='button' and text()='{}']",
    "error_message":"//div[@class='slds-text-color_error' and text()='{}']",
    "persist_save":"//lightning-icon[contains(@class,'slds-icon-utility-success') and @title='{}']",
    "persist_warning":"//lightning-icon[contains(@class,'slds-icon-utility-warning') and @title='{}']",

}

account_locators = {

}

contact_locators = {

}
