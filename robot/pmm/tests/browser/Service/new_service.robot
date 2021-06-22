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
    [Documentation]             Creates a Program record using API, Sets the fields required to create a service record.
    ${service__name} =          Generate Random String
    Set suite variable          ${service_name}
    ${Description} =            Generate Random String
    Set suite variable          ${Description}
    ${unit_of_measurement} =    Generate Random String
    Set suite variable          ${unit_of_measurement}
    ${ns} =                     Get PMM Namespace Prefix
    Set suite variable          ${ns}
    &{program} =                API Create Program
    Set suite variable          ${program}

*** Test Cases ***
Create Service from top nav
    [Documentation]                        This test creates Service record and verifies that the Service record
    ...                                    has all the values from the form
    [tags]                                  perm:admin   perm:manage    feature:Service
     Go To Page                             Listing                     ${ns}Service__c
     Click Object Button                    New
     Load Page Object                       NewService                  ${ns}Service__c
     Populate Field                         Service Name                ${service_name}
     Populate Field                         Description                 ${Description}
     Populate Field                         Unit of Measurement         ${unit_of_measurement}
     Populate Lookup Field                  Program                     ${program}[Name]
     Populate Lightning Fields              Status=Active
     Click Dialog button                    Save
     Wait Until Modal Is Closed
     verify details                         Program            contains          ${program}[Name]
     verify details                         Service Name       contains          ${service_name}
     verify page contains related list      Service Deliveries
     Verify Page Contains Related List      Service Schedules
     Verify Page Contains Related List      Service Participants
     ${service_id} =                        Save Current Record ID For Deletion     ${ns}Service__c
