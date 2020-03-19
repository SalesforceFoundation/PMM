*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ServiceDeliveryPageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Delete Records and Close Browser


*** Keywords ***
Setup Test Data
    ${service_delivery_name} =       Generate Random String
    Set suite variable      ${service_delivery_name}
    &{contact} =         API Create Contact
    Set suite variable    &{contact}
    &{program} =    API Create Program
    Store Session Record  Program__c                              &{program}[Id]
    Set suite variable    &{program}
    &{program_engagement} =    API Create Program Engagement   &{Program}[Id]  &{contact}[Id]
    Set suite variable    &{program_engagement}
    &{service} =    API Create Service   &{Program}[Id]
    Set suite variable    &{service}
    ${quantity} =   Generate Random String    2     [NUMBERS]
    Set suite variable      ${quantity}


*** Test Cases ***

Create a Service Delivery via UI
    [Documentation]                        This test creates Service Delivery record and verifies that the Service Delivery record
    ...                                    has all the values from the form
    Go To Page                             Listing                               ServiceDelivery__c
    Click Object Button                    New
    Current Page Should Be                 NewServiceDelivery                           ServiceDelivery__c
    Populate New Service Delivery Form     Service Delivery Name=${service_delivery_name}
    ...                                    Delivery Date=Today
    ...                                    Quantity=${quantity}

    populate lookup                        Search Contacts         &{contact}[FirstName] &{contact}[LastName]
    populate lookup                        Search Program Engagements         &{program_engagement}[Name]
    populate lookup                        Search Services         &{service}[Name]
    click Save Button
    Wait Until Modal Is Closed
    current page should be                 Details                                ServiceDelivery__c
    verify details  Quantity    contains    ${quantity}
    verify details     Service     contains     &{service}[Name]
    verify details  Program Engagement  contains    &{program_engagement}[Name]
    page should not contain      ${service_delivery_name}
    verify page contains related list   Files
    ${service_delivery_id} =            Save Current Record ID For Deletion     ServiceDelivery__c
    ${service_id} =            Save Current Record ID For Deletion     Service__c
    ${program_engagement_id} =            Save Current Record ID For Deletion     ProgramEngagement__c


Create a Service Delivery via UI with Auto Name Override
    [Documentation]                        This test creates Service Delivery record and verifies that the Service Delivery record
    ...                                    has all the values from the form
    Go To Page                             Listing                               ServiceDelivery__c
    Click Object Button                    New
    Current Page Should Be                 NewServiceDelivery                           ServiceDelivery__c
    Populate New Service Delivery Form     Service Delivery Name=${service_delivery_name}
    ...                                    Delivery Date=Today
    ...                                    Quantity=${quantity}

    populate lookup                        Search Contacts         &{contact}[FirstName] &{contact}[LastName]
    populate lookup                        Search Program Engagements         &{program_engagement}[Name]
    populate lookup                        Search Services         &{service}[Name]
    Select Auto Name Override Checkbox     Auto-name Override
    click Save Button
    Wait Until Modal Is Closed
    current page should be                 Details                                ServiceDelivery__c
    verify details  Service Delivery Name   contains    ${service_delivery_name}
    verify page contains related list   Files
    ${service_delivery_id} =            Save Current Record ID For Deletion     ServiceDelivery__c
    ${service_id} =            Save Current Record ID For Deletion     Service__c
    ${program_engagement_id} =            Save Current Record ID For Deletion     ProgramEngagement__c