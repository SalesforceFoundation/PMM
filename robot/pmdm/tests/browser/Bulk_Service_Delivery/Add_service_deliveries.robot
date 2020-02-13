*** Settings ***

Resource       robot/pmdm/resources/pmdm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmdm/resources/pmdm.py
...            robot/pmdm/resources/BulkServiceDeliveryPageObject.py
...            robot/pmdm/resources/ServiceDeliveryPageObject.py
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
    &{contact2} =         API Create Contact
    Set suite variable    &{contact2}
    &{program2} =    API Create Program
    Store Session Record  Program__c                              &{program2}[Id]
    Set suite variable    &{program2}
    &{program_engagement2} =    API Create Program Engagement   &{Program2}[Id]  &{contact2}[Id]
    Set suite variable    &{program_engagement2}
    &{service2} =    API Create Service   &{Program2}[Id]
    Set suite variable    &{service2}
    &{contact3} =         API Create Contact
    Set suite variable    &{contact3}

*** Test Cases ***

Add service delivery on bulk service delivery

    [Documentation]                        This test adds service deliveries on bulk service delivery and
    ...                                    verifies that the record exists on service delivery listpage
    Go To Page                             BasePage                               ServiceDelivery__c
    verify current page                    Service Deliveries
    populate contact lookup           Search Contacts         &{contact1}[FirstName] &{contact1}[LastName]
    populate row1 fields           Select Program Engagement         &{program_engagement1}[Name]
    populate row1 fields          Select Service         &{service1}[Name]
    #input data  quantity
    input row1 data  Quantity    ${quantity}
    sleep   2s
    click button    Add Service Delivery
    populate contact lookup           Search Contacts         &{contact2}[FirstName] &{contact2}[LastName]
    populate row2 fields           Select Program Engagement         &{program_engagement2}[Name]
    populate row2 fields          Select Service         &{service2}[Name]
    input row2 data  Quantity    ${quantity}
    sleep   2s

Verify Service delivery on service delivery listview page
    Go To Page                             Listing                               ServiceDelivery__c
    Page Should Contain                    &{contact1}[FirstName] &{contact1}[LastName]
    Page Should Contain                    &{contact2}[FirstName] &{contact2}[LastName]


Verify error message when contact is not enrolled on a program
    Go To Page                             BasePage                               ServiceDelivery__c
    verify current page                    Service Deliveries
    populate contact lookup           Search Contacts         &{contact3}[FirstName] &{contact3}[LastName]
    verify error message    To save a service delivery, first enroll this client in a program with active services.
