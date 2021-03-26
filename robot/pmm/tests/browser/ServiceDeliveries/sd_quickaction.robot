*** Settings ***

Resource        robot/pmm/resources/pmm.robot
Library         cumulusci.robotframework.PageObjects
...             robot/pmm/resources/pmm.py
...             robot/pmm/resources/ServiceDeliveryPageObject.py
Suite Setup     Run Keywords
...             Open test browser            useralias=${test_user}             AND
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Variables ***
${test_user}             UUser

*** Keywords ***
Setup Test Data
    ${ns} =                     Get PMM Namespace Prefix
    Set suite variable          ${ns}

    ${program} =                API Create Program
    Set suite variable          ${program}
    ${contact} =                API Create Contact
    Set suite variable          ${contact}
    ${contact2} =               API Create Contact
    Set suite variable          ${contact2}
    ${service} =                API Create Service              ${Program}[Id]
    Set suite variable          ${service}
    ${program_engagement} =     API Create Program Engagement   ${Program}[Id]      ${contact}[Id]
    Set suite variable          ${program_engagement}
    ${program_engagement2} =    API Create Program Engagement   ${Program}[Id]      ${contact2}[Id]
    Set suite variable          ${program_engagement2}
    ${service_delivery} =       API Create Service Delivery     ${contact}[Id]      ${program_engagement}[Id]  ${service}[Id]
    Set suite variable          ${service_delivery}
    ${today} =                  Get Current Date                result_format=%Y-%m-%d
    Set suite variable          ${today}
    ${quantity} =               Generate Random String    2     123456789
    Set suite variable          ${quantity}

*** Test Cases ***
Create a new service delivery on service using quick action
    [Documentation]                This test loads the service delivery record, clicks on the new service delivery quick action
    ...                            and creates a new service delivery record.
    [tags]                         W-9057513      perm:admin   perm:manage    perm:deliver    feature:Service Delivery
    Go To Page                     Details                        ServiceDelivery__c        object_id=${service_delivery}[Id]
    Verify Details                 Service Delivery Name          contains                  ${service_delivery}[Name]
    Click Quick Action Button      New Service Delivery
    Wait For Modal                 New                            Service Delivery
    Populate Field                 Quantity                       ${quantity}
    Populate Lookup Field          Client                         ${contact2}[FirstName] ${contact2}[LastName]
    Populate Lookup Field          Program Engagement             ${program_engagement2}[Name]
    Populate Lookup Field          Service                        ${service}[Name]
    Select Button On Modal         Save
    Wait Until Modal Is Closed 
    Go To Page                     Listing                        ${ns}ServiceDelivery__c
    Click Listview Link            ${contact2}[FirstName] ${contact2}[LastName] ${today}: ${service}[Name]
    Verify Details                 Service Delivery Name          contains                  ${contact2}[FirstName] ${contact2}[LastName] ${today}: ${service}[Name]
    Verify Details                 Quantity                       contains                  ${quantity}.00
    Save Current Record ID For Deletion     ${ns}ServiceDelivery__c