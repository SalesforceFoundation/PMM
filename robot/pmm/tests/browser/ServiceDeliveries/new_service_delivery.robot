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
    Set suite variable               ${service_delivery_name}
    ${ns} =                          Get PMM Namespace Prefix
    Set suite variable               ${ns}
    &{contact} =                     API Create Contact
    Set suite variable               &{contact}
    &{contact1} =                    API Create Contact
    Set suite variable               &{contact1}
    &{program} =                     API Create Program
    Store Session Record             ${ns}Program__c                 &{program}[Id]
    Set suite variable               &{program}
    &{program_engagement} =          API Create Program Engagement   &{Program}[Id]  &{contact}[Id]
    Set suite variable               &{program_engagement}
    &{service} =                     API Create Service   &{Program}[Id]
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
    Load Page Object                       NewServiceDelivery                      ${ns}ServiceDelivery__c
    verify current page title              New Service Delivery
    Populate modal Form                    Service Delivery Name=${service_delivery_name}
    ...                                    Service=&{service}[Name]
    ...                                    Client=&{contact}[FirstName] &{contact}[LastName]
    ...                                    Program Engagement=&{program_engagement}[Name]
    ...                                    Delivery Date=Today
    ...                                    Quantity=${quantity}
    click Modal button                     Save
    Wait Until Modal Is Closed
    verify page header                     Service Delivery
    verify details                         Quantity                                contains             ${quantity}
    verify details                         Service                                 contains             &{service}[Name]
    verify details                         Program Engagement                      contains             &{program_engagement}[Name]
    page should not contain                ${service_delivery_name}
    verify page contains related list      Files
    ${service_delivery_id} =               Save Current Record ID For Deletion     ${ns}ServiceDelivery__c
    ${service_id} =                        Save Current Record ID For Deletion     ${ns}Service__c
    ${program_engagement_id} =             Save Current Record ID For Deletion     ${ns}ProgramEngagement__c


Create a Service Delivery via UI with Auto Name Override
    [Documentation]                        This test creates Service Delivery record and verifies that the Service Delivery record
    ...                                    has all the values from the form
    Go To Page                             Listing                                ${ns}ServiceDelivery__c
    Click Object Button                    New
    Load Page Object                       NewServiceDelivery                     ${ns}ServiceDelivery__c
    verify current page title              New Service Delivery
    Populate modal Form                    Service Delivery Name=${service_delivery_name}
    ...                                    Service=&{service}[Name]
    ...                                    Client=&{contact}[FirstName] &{contact}[LastName]
    ...                                    Program Engagement=&{program_engagement}[Name]
    ...                                    Delivery Date=Today
    ...                                    Quantity=${quantity}
    ...                                    Auto-name Override=checked
    click modal button                     Save
    Wait Until Modal Is Closed
    verify page header                     Service Delivery
    verify details                         Service Delivery Name                   contains             ${service_delivery_name}
    verify page contains related list      Files
    ${service_delivery_id} =               Save Current Record ID For Deletion     ${ns}ServiceDelivery__c
    ${service_id} =                        Save Current Record ID For Deletion     ${ns}Service__c
    ${program_engagement_id} =             Save Current Record ID For Deletion     ${ns}ProgramEngagement__c