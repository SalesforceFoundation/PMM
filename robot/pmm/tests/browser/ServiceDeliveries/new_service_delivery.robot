*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ServiceDeliveryPageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser


*** Keywords ***
Setup Test Data
    ${service_delivery_name} =       Generate Random String
    Set suite variable               ${service_delivery_name}
    ${ns} =                          Get PMM Namespace Prefix
    Set suite variable               ${ns}
    &{contact} =                     API Create Contact
    Set suite variable               &{contact}
    &{account1} =                    API Create Account
    Set suite variable               &{account1}
    &{program} =                     API Create Program
    Set suite variable               &{program}
    &{program_engagement} =          API Create Program Engagement   ${Program}[Id]  ${contact}[Id]
    Set suite variable               &{program_engagement}
    &{service} =                     API Create Service   ${Program}[Id]
    Set suite variable               &{service}
    ${quantity} =                    Generate Random String    2     [NUMBERS]
    Set suite variable               ${quantity}


*** Test Cases ***
Create a Service Delivery via UI
    [Documentation]                        This test creates Service Delivery record and verifies that the Service Delivery record
    ...                                    has all the values from the form
    Go To PMM App
    Go To Page                             Listing                                 ${ns}ServiceDelivery__c
    Click Object Button                    New
    Wait For Modal                         New                                     Service Delivery
    Populate Modal Form                    Service Delivery Name=${service_delivery_name}
    ...                                    Service=${service}[Name]
    ...                                    Client=${contact}[FirstName] ${contact}[LastName]
    ...                                    Program Engagement=${program_engagement}[Name]
    ...                                    Delivery Date=Today
    ...                                    Quantity=${quantity}
    Click Modal Button                     Save
    Wait Until Modal Is Closed
    Current Page Should Be                 Details                                 ServiceDelivery__c
    Verify Details                         Service                                 contains             ${service}[Name]
    Verify Details                         Program Engagement                      contains             ${program_engagement}[Name]
    Page Should Not Contain                ${service_delivery_name}
    Verify Page Contains Related List      Files
    Save Current Record ID For Deletion     ${ns}ServiceDelivery__c

Create a Service Delivery via UI with Auto Name Override
    [Documentation]                        This test creates Service Delivery record with auto name override selected and verifies
    ...                                    user entered name is saved as the service delivery name
    Go To Page                             Listing                                ${ns}ServiceDelivery__c
    Click Object Button                    New
    Wait For Modal                         New                                    Service Delivery
    Populate Modal Form                    Service Delivery Name=${service_delivery_name}
    ...                                    Service=${service}[Name]
    ...                                    Client=${contact}[FirstName] ${contact}[LastName]
    ...                                    Program Engagement=${program_engagement}[Name]
    ...                                    Delivery Date=Today
    ...                                    Quantity=${quantity}
    ...                                    Auto-name Override=checked
    Click Modal Button                     Save
    Wait Until Modal Is Closed
    Current Page Should Be                 Details                                 ServiceDelivery__c
    Verify Details                         Service Delivery Name                   contains             ${service_delivery_name}
    Verify Page Contains Related List      Files
    Save Current Record ID For Deletion    ${ns}ServiceDelivery__c

Validate contact and account lookup to the same household
    [Documentation]                        This test loads the new service delivery dialog and validates that an error message is displayed
    ...                                    when contact and account do not lookup to the same household
    [tags]                                 W-042516  feature:Service Delivery
    Go To Page                             Listing                                ${ns}ServiceDelivery__c
    Click Object Button                    New
    Wait For Modal                         New                                    Service Delivery
    Populate Modal Form                    Service Delivery Name=${service_delivery_name}
    ...                                    Service=${service}[Name]
    ...                                    Client=${contact}[FirstName] ${contact}[LastName]
    ...                                    Household Account=${account1}[Name]
    Click Modal Button                     Save
    Verify Modal Error                     Select an Account that matches the related Contact.