*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ProgramPageObject.py
...            robot/pmm/resources/ServicePageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Keywords ***
Setup Test Data
    ${ns} =                     Get PMM Namespace Prefix
    Set suite variable          ${ns}
    ${service__name} =          Generate Random String
    Set suite variable          ${service_name}
    ${Description} =            Generate Random String
    Set suite variable          ${Description}
    ${unit_of_measurement} =    Generate Random String
    Set suite variable          ${unit_of_measurement}
    &{program} =                API Create Program
    Store Session Record        ${ns}Program__c          &{program}[Id]
    Set suite variable          &{program}

*** Test Cases ***

Create Service from Program Object
     Go To PMM App
     Go To Page                             Details                 Program__c            object_id=&{program}[Id]
     Page Should Contain                    &{program}[Name]
     Click Wrapper Related List Button      Services                New
     Wait for Modal                         New                     Service__c
     Populate Field                         Service Name            ${service_name}
     Populate Field                         Description             ${Description}
     Populate Field                         Unit of Measurement     ${unit_of_measurement}
     Populate Lightning Fields              Status=Planned
     Click Dialog Button                    Save
     Wait Until Modal Is Closed
     Current Page Should Be                 Details                 Program__c
     Page Should Contain                    ${service_name}
     Save Current Record ID For Deletion    ${ns}Service__c
