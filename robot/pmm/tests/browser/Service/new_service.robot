*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ServicePageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Keywords ***
Setup Test Data
    ${service__name} =          Generate Random String
    Set suite variable          ${service_name}
    ${Description} =            Generate Random String
    Set suite variable          ${Description}
    ${unit_of_measurement} =    Generate Random String
    Set suite variable          ${unit_of_measurement}
    ${ns} =                     Get PMM Namespace Prefix
    Set suite variable          ${ns}
    &{program} =                API Create Program
    Store Session Record        ${ns}Program__c         &{program}[Id]
    Set suite variable          &{program}

*** Test Cases ***
Create Service from top nav
     Go To PMM App
     Go To Page                             Listing                     ${ns}Service__c
     Click Object Button                    New
     Load Page Object                       NewService                  ${ns}Service__c
     verify current page title              New Service
     Populate Field                         Service Name                ${service_name}
     Populate Field                         Description                 ${Description}
     Populate Field                         Unit of Measurement         ${unit_of_measurement}
     Populate Lightning Fields              Program=&{program}[Name]
     ...                                    Status=Active
     click Dialog button                    Save
     Wait Until Modal Is Closed
     verify details                         Program            contains          &{program}[Name]
     verify details                         Service Name       contains          ${service_name}
     verify page contains related list      Service Deliveries
     ${service_id} =                        Save Current Record ID For Deletion     ${ns}Service__c
