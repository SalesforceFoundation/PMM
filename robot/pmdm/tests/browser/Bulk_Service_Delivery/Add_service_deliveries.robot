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
    ${quantity1} =   Generate Random String    2     [NUMBERS]
    Set suite variable      ${quantity1}
    ${quantity2} =   Generate Random String    2     [NUMBERS]
    Set suite variable      ${quantity2}

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
    &{program3} =    API Create Program
    Store Session Record  Program__c                              &{program3}[Id]
    Set suite variable    &{program3}
    &{program_engagement3} =    API Create Program Engagement   &{Program3}[Id]  &{contact3}[Id]
    Set suite variable    &{program_engagement3}

    &{contact4} =         API Create Contact
    Set suite variable    &{contact4}

*** Test Cases ***

Add service delivery on bulk service delivery
    [tags]  unstable
    [Documentation]                        This test adds service deliveries on bulk service delivery
    Go To Page                             BasePage                               ServiceDelivery__c
    verify current page                    Service Deliveries
    populate contact lookup           Search Contacts         &{contact1}[FirstName] &{contact1}[LastName]
    populate row1 fields           Select Program Engagement         &{program_engagement1}[Name]
    populate row1 fields          Select Service         &{service1}[Name]
    input row1 data  Quantity    ${quantity1}
    sleep   2s
    verify persist save icon    Saved
    click button    Add Service Delivery
    populate contact lookup           Search Contacts         &{contact2}[FirstName] &{contact2}[LastName]
    populate row2 fields           Select Program Engagement         &{program_engagement2}[Name]
    populate row2 fields          Select Service         &{service2}[Name]
    input row2 data  Quantity    ${quantity2}
    sleep   2s
    verify persist save icon    Saved

Verify Service delivery on service delivery listview page
    [tags]  unstable
    [Documentation]                        This test verifies that the added service deliveries on bulk service delivery
    ...                                    exists on service delivery list page.
    Go To Page                             Listing                               ServiceDelivery__c
    Page Should Contain                    &{contact1}[FirstName] &{contact1}[LastName]
    Page Should Contain                    &{contact2}[FirstName] &{contact2}[LastName]

Verify error message when there are no services associated with the program
    [tags]  unstable
    [Documentation]                        This test verifies that an error message is displayed when there are no
    ...                                    services associated with the program.
    Go To Page                             BasePage                               ServiceDelivery__c
    verify current page                    Service Deliveries
    populate contact lookup           Search Contacts         &{contact3}[FirstName] &{contact3}[LastName]
    populate row1 fields           Select Program Engagement         &{program_engagement3}[Name]
    verify error message    No services found, choose another program engagement.
    verify persist warning icon    No services found, choose another program engagement.

Verify error message when contact is not enrolled on a program
    [tags]  unstable
    [Documentation]                        This test verifies that an error message is displayed when the contact is
    ...                                    not associated with any program
    Go To Page                             BasePage                               ServiceDelivery__c
    verify current page                    Service Deliveries
    populate contact lookup           Search Contacts         &{contact4}[FirstName] &{contact4}[LastName]
    verify error message    To save a service delivery, first enroll this client in a program with active services.
    verify persist warning icon    To save a service delivery, first enroll this client in a program with active services.


