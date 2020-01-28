*** Settings ***

Resource       robot/pmdm/resources/pmdm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmdm/resources/pmdm.py
...            robot/pmdm/resources/ProgramPageObject.py
...            robot/pmdm/resources/ServicePageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Delete Records and Close Browser

*** Keywords ***
Setup Test Data
    ${service__name} =   Generate Random String
    Set suite variable      ${service_name}
    ${Description} =   Generate Random String
    Set suite variable      ${Description}
    ${unit_of_measurement} =   Generate Random String
    Set suite variable      ${unit_of_measurement}
    &{program} =    API Create Program
    Store Session Record  Program__c                              &{program}[Id]
    Set suite variable    &{program}

*** Test Cases ***

Create Service from Program Object

     Go To Page      Details              Program__c                   object_id=&{program}[Id]
     page should contain                    &{program}[Name]
     Click Wrapper Related List Button      Services     New
     Current Page Should Be                 NewService                   Service__c
     Populate New Service Form   Service Name= ${service_name}
     ...                         Description= ${Description}
     ...                         Unit of Measurement= ${unit_of_measurement}
     ...                         Status=Active
     Click Save Button
     Wait Until Modal Is Closed
     current page should be                 Details                                 Program__c
     Page Should Contain                   ${service_name}