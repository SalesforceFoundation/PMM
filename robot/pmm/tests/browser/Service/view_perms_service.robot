*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ServicePageObject.py
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
    ${service} =                API Create Service              ${Program}[Id]
    Set suite variable          ${service}

*** Test Cases ***
VPS1: View and Deliver Perm Test for Service
     [Documentation]                  Validates that New (Listing Page) and Edit buttons (Record Page) are not 
     ...                              displayed for Service (View and Deliver Perm Set)   
     [tags]                           unstable    perm:view    perm:deliver      feature:Service
     Go To Page                              Listing                               ${ns}Service__c
     Page Should Not Contain Button          New
     Go To Page                              Details              Service__c                    object_id=${service}[Id]
     Page Should Not Contain Button          Edit
