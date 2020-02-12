*** Settings ***

Resource       robot/pmdm/resources/pmdm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmdm/resources/pmdm.py
...            robot/pmdm/resources/BulkServiceDeliveryPageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Delete Records and Close Browser

*** Keywords ***
Setup Test Data
    ${quantity} =   Generate Random String    2     [NUMBERS]
    Set suite variable      ${quantity}
    &{contact1} =         API Create Contact
    Set suite variable    &{contact1}
    &{program1} =    API Create Program
    Store Session Record  Program__c                              &{program1}[Id]
    Set suite variable    &{program1}
    &{program_engagement1} =    API Create Program Engagement   &{Program1}[Id]  &{contact1}[Id]
    Set suite variable    &{program_engagement1}
    &{service1} =    API Create Service   &{Program1}[Id]
    Set suite variable    &{service1}

*** Test Cases ***

Add service delivery on bulk service delivery

    [Documentation]                        This test adds service deliveries on bulk service delivery and
    ...                                    verifies that the record exists on service delivery listpage
    Go To Page                             BasePage                               ServiceDelivery__c
    verify current page                    Service Deliveries
    populate contact lookup           Search Contacts         &{contact1}[FirstName] &{contact1}[LastName]
    populate fields           Select Program Engagement         &{program_engagement1}[Name]
    populate fields          Select Service         &{service1}[Name]
    #input data  quantity
    input data  Quantity    ${quantity}
    sleep   2s
    #populate contact lookup     Search Contacts     Tom Higgins
    #populate fields     Select Program Engagement   School Lunch Program
    #populate fields     Select Service             Subsidized Lunch