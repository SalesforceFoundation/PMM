*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ServicePageObject.py
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

*** Test Cases ***
Create Service from Program Object

     Go To Page                             Listing                               Service__c
     Click Object Button                    New
     Load Page Object  NewService  Service__c
     verify current page    New Service
     Populate New Service Form   Service Name= ${service_name}
     ...                         Description= ${Description}
     ...                         Unit of Measurement= ${unit_of_measurement}
     ...                         Status=Active
     Click Save Button
     Wait Until Modal Is Closed
     current page should be                 Details                                 Program__c
     Page Should Contain                   ${service_name}
     ${service_id} =            Save Current Record ID For Deletion     Service__c