*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ServiceDeliveryPageObject.py
Suite Setup     Run Keywords
...             Open test browser            useralias=${test_user}             AND
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Variables ***
${test_user}             UUser

*** Keywords ***
Setup Test Data
    ${service_delivery_name} =       Generate Random String
    Set suite variable               ${service_delivery_name}
    ${ns} =                          Get PMM Namespace Prefix
    Set suite variable               ${ns}
    ${contact} =                     API Create Contact
    Set suite variable               ${contact}
    ${account1} =                    API Create Account
    Set suite variable               ${account1}
    ${program} =                     API Create Program
    Set suite variable               ${program}
    ${program_engagement} =          API Create Program Engagement   ${Program}[Id]             ${contact}[Id]
    Set suite variable               ${program_engagement}
    ${service} =                     API Create Service              ${Program}[Id]
    Set suite variable               ${service}
    ${quantity} =                    Generate Random String    2     [NUMBERS]
    Set suite variable               ${quantity}
    ${today} =                       Get Current Date                result_format=%-m/%-d/%Y 
    Set suite variable               ${today}


*** Test Cases ***
NSD1: Create a Service Delivery via UI
    [Documentation]                        This test creates Service Delivery record and verifies that the Service Delivery record
    ...                                    has all the values from the form
    [tags]                                 quadrant:Q2   perm:admin   perm:manage     perm:deliver     feature:Service Delivery
    Go To Page                             Listing                                 ${ns}ServiceDelivery__c
    Click Object Button                    New
    Wait For Modal                         New                                     Service Delivery
    Populate Field                         Service Delivery Name                   ${service_delivery_name}
    Populate Field                         Quantity                                ${quantity}
    Populate Lookup Field                  Service                                 ${service}[Name]
    Populate Lookup Field                  Client                                  ${contact}[FirstName] ${contact}[LastName]
    Populate Lookup Field                  Program Engagement                      ${program_engagement}[Name]
    Populate Lightning Fields              Delivery Date=Today                                
    Click Dialog Button                    Save
    Wait Until Modal Is Closed
    Current Page Should Be                 Details                                 ServiceDelivery__c
    Verify Lookup Details                  Service                                 contains             ${service}[Name]
    Verify Lookup Details                  Program Engagement                      contains             ${program_engagement}[Name]
    Verify Details                         Delivery Date                           contains             ${today}
    Page Should Not Contain                ${service_delivery_name}
    Verify Page Contains Related List      Files
    Save Current Record ID For Deletion    ${ns}ServiceDelivery__c

NSD2: Create a Service Delivery via UI with Auto Name Override
    [Documentation]                        This test creates Service Delivery record with auto name override selected and verifies
    ...                                    user entered name is saved as the service delivery name
    [tags]                                 quadrant:Q2   perm:admin   perm:manage    perm:deliver         feature:Service Delivery
    Go To Page                             Listing                                ${ns}ServiceDelivery__c
    Click Object Button                    New
    Wait For Modal                         New                                    Service Delivery
    Populate Field                         Service Delivery Name                   ${service_delivery_name}
    Populate Field                         Quantity                                ${quantity}
    Populate Lookup Field                  Service                                 ${service}[Name]
    Populate Lookup Field                  Client                                  ${contact}[FirstName] ${contact}[LastName]
    Populate Lookup Field                  Program Engagement                      ${program_engagement}[Name]
    Populate Lightning Fields              Delivery Date=Today
    Set Checkbox                           Auto-name Override                      checked
    Click Dialog Button                    Save
    Wait Until Modal Is Closed
    Current Page Should Be                 Details                                 ServiceDelivery__c
    Verify Details                         Service Delivery Name                   contains             ${service_delivery_name}
    Verify Details                         Delivery Date                           contains             ${today}
    Verify Page Contains Related List      Files
    Save Current Record ID For Deletion    ${ns}ServiceDelivery__c

NSD3: Validate contact and account lookup to the same household
    [Documentation]                        This test loads the new service delivery dialog and validates that an error message is displayed
    ...                                    when contact and account do not lookup to the same household
    [tags]                                 quadrant:Q2   W-042516   perm:admin   perm:manage    perm:deliver    feature:Service Delivery
    Go To Page                             Listing                                ${ns}ServiceDelivery__c
    Click Object Button                    New
    Wait For Modal                         New                                    Service Delivery
    Populate Field                         Service Delivery Name                  ${service_delivery_name}
    Populate Lookup Field                  Service                                ${service}[Name]
    Populate Lookup Field                  Client                                 ${contact}[FirstName] ${contact}[LastName]
    Populate Lookup Field                  Household Account                      ${account1}[Name]
    Click Dialog Button                    Save
    Verify Modal Error                     Select an Account that matches the related Contact.
    