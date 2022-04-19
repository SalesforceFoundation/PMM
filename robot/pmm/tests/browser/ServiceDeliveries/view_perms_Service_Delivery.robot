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
    ${ns} =                 Get PMM Namespace Prefix
    Set suite variable      ${ns}
    ${program} =                API Create Program
    Set suite variable          ${program}
    ${contact} =                API Create Contact
    Set suite variable          ${contact}
    ${service} =                API Create Service               ${Program}[Id]
    Set suite variable          ${service}
    ${program_engagement} =     API Create Program Engagement    ${Program}[Id]      ${contact}[Id]
    Set suite variable          ${program_engagement}
    ${service_delivery} =       API Create Service Delivery      ${contact}[Id]      ${program_engagement}[Id]      ${service}[Id]
    Set suite variable          ${service_delivery}

*** Test Cases ***
VPSD1: View Perm Test for Service Delivery
     [Documentation]                  Validates that New (Listing Page) and Edit buttons (Record Page) are not 
     ...                              displayed for Service Delivery (View Perm Set) 
     [tags]                           unstable    perm:view    feature:Service Delivery
     Go To Page                              Listing                               ${ns}ServiceDelivery__c
     Page Should Not Contain Button          New
     Go To Page                              Details              ServiceDelivery__c                    object_id=${service_delivery}[Id]
     Page Should Not Contain Button          Edit
