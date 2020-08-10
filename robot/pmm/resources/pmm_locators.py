# Copyright (c) 2020, salesforce.com, inc.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
# For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause

pmm_lex_locators = {
    "app_link":"//div[contains(@class,'slds-app-launcher__tile-body')]//span/p[@class='slds-truncate' and text()='Program Management']",
    "text": "//*[contains(text(), '{}')]",
    "page_title":"//div[contains(@class,'entityNameTitle') and text()='{}']",
    "placeholder": "//*[contains(@placeholder,'{}')]",
    "placeholder_lookup": {
        "lookup1": "//div[@class='slds-lookup__result-text' and contains(text(), '{}')]",
        "lookup2": "//mark[text() = '{}']/ancestor::a",
    },
    "input": {
        "input1": "//label[text()='{}']/following::input",
        "input2": "//input[@type='text' and @data-name='{}']",
    },
    "page_header": "//div[contains(@class, 'slds-page-header')]/descendant::span[text()='{}}']",
    "checkbox": "//div[contains(@class,'uiInputCheckbox')]/label/span[text()='{}']/../following-sibling::input[@type='checkbox']",
    "confirm": {
         "details":"//div[contains(@class, 'forcePageBlockItem') or contains(@class, 'slds-form-element_stacked')][.//span[text()='{}']]//descendant::div[.//span[contains(@class, 'test-id__field-value')]]//*[self::a or self::lightning-formatted-number or self::lightning-formatted-text or self::lightning-formatted-name]",
    },
    "new_record": {
        "label":"//div[./*/*[text()='{}']]",
        "title": "//h2[contains(@class, 'inlineTitle') or contains(@class,'title') and text()='{}']",
        "text_field": "//div[contains(@class, 'uiInput')][.//label[contains(@class, 'uiLabel')][.//span[text()='{}']]]//*[self::input or self::textarea]",
        "dropdown_field": "//div[@class='slds-form-element__control']/div[.//span[text()='{}']]/div//a[@class='select']",
        "dropdown_popup": "//div[@class='select-options' and @role='menu']",
        "dropdown_value": "//div[@class='select-options']//ul//li//a[@title='{}']",
        "button": "//button[contains(@class, 'slds-button') and @title = '{}']",
        "lookup_field": "//div[contains(@class, 'autocompleteWrapper')]//input[@title='{}']",
        "lookup_value": "//div[contains(@class, 'listContent')]//div[contains(@class, 'slds-truncate') and @title='{}']",
        "open_date_picker": "//div[@class='slds-form-element__control']/div[.//span[text()='{}']]//div//a[contains(@class,'datePicker-openIcon display')]",
        "datepicker_popup": "//table[@class='calGrid' and @role='grid']",
        "select_date": "//div[contains(@class,'uiDatePickerGrid')]/table[@class='calGrid']//*[text()='{}']",
        "checkbox": "//div[contains(@class,'uiInputCheckbox')]/label/span[text()='{}']/../following-sibling::input[@type='checkbox']",
        'error_message':'//div[@class="pageLevelErrors"]//ul[@class="errorsList"]/li[text()="{}"]',
    },
    "related": {
        "button": "//article[contains(@class, 'forceRelatedListCardDesktop')][.//img][.//span[@title='{}']]//a[@title='{}']",
        "new_record_link": "//table[contains(@class,'forceRecordLayout')]/tbody/tr/th/div[contains(@class,'outputLookupContainer')]//a[contains(text(),'{}')]",
        "related_list": "//a[contains(@class,'slds-card')]/span[contains(@class,'slds-truncate') and @title='{}']",
    },
    "quick_actions":"//button[@class='slds-button slds-button_neutral' and text()='{}']",
    "listview_link":"//a[contains(@class,'slds-truncate') and text()='{}']",
     "toast_msg":"//span[contains(@class,'toastMessage')]/a[@class='forceActionLink']/div[contains(@title,'{}')]",

    "bulk_service_delivery_locators": {
        "page_header": "//header[contains(@class,'flexipageHeader')]//h2[@class='truncate' and text()='{}']",
        "lookup_bsdt_field": "//input[contains(@class,'slds-input slds-combobox__input') and contains(@placeholder,'{}')]",
        "select_bsdt_value": "//span[contains(@class,'slds-listbox__option-text')]/lightning-base-combobox-formatted-text[@class='slds-truncate' and @title='{}']",
        "select_value": "//span[@class='slds-media__body']/span[@class='slds-truncate' and contains(@title,'{}')]",
        "select_popup": "//div[contains(@class,'slds-listbox')]",
        "lookup_field_row1": "//div[contains(@class,'slds-box')][1]//div[contains(@class,'slds-combobox__form-element')]/input[@placeholder='{}']",
        "lookup_field_row2": "//div[contains(@class,'slds-box')][2]//div[contains(@class,'slds-combobox__form-element')]/input[@placeholder='{}']",
        "text_field_row1": "//div[contains(@class,'slds-box')][1]//div[contains(@class,'slds-form-element__control')]/input[contains(@name,'{}')]",
        "text_field_row2": "//div[contains(@class,'slds-box')][2]//div[contains(@class,'slds-form-element__control')]/input[contains(@name,'{}')]",
        "button": "//button[contains(@class,'slds-button') and text()='{}']",
        "error_message": "//div[@class='slds-text-color_error' and text()='{}']",
        "persist_save": "//lightning-icon[contains(@class,'slds-icon-utility-success') and @title='{}']",
        "persist_warning": "//lightning-icon[contains(@class,'slds-icon-utility-warning') and @title='{}']",
        "pick_listbox":"//span[@class='slds-media__body']/span[contains(text(),'{}')]",
        "new_prog_engagement": {
            "title":"//h2[contains(@class,'slds-text-heading_medium') and text()='{}']",
            "dropdown_field": "//lightning-combobox[contains(@class,'slds-form-element_stacked')][.//label[@class='slds-form-element__label' and text()='{}']]//input[contains(@class,'slds-input')]",
            "dropdown_popup": "//div[contains(@class,'slds-listbox')]",
            "dropdown_value": "//span[@class='slds-truncate' and @title='{}']",
            "text_field": "//div[contains(@class,'slds-form-element')][.//label[@class='slds-form-element__label' and text()='{}']]//input[@class='slds-input']",
            "button": "//button[contains(@class,'slds-button') and @title = '{}']",
        },
    },
}
