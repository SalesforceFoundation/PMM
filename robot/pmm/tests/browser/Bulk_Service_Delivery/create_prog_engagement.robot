*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/BulkServiceDeliveryPageObject.py
...            robot/pmm/resources/ServiceDeliveryPageObject.py
...            robot/pmm/resources/ProgramEngagementPageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Delete Records and Close Browser


*** Keywords ***
Setup Test Data
    ${quantity} =   Generate Random String    2     [NUMBERS]
    Set suite variable      ${quantity}
    ${application_date} =         Get Current Date   result_format=%m/%d/%Y   increment=1 day
    Set suite variable      ${application_date}
    ${start_date} =           Get Current Date   result_format=%m/%d/%Y  increment=30 days
    Set suite variable      ${start_date}

    &{contact} =         API Create Contact
    Set suite variable    &{contact}
    &{program} =    API Create Program
    Store Session Record  Program__c                              &{program}[Id]
    Set suite variable    &{program}
    &{program_cohort} =    API Create Program Cohort  &{Program}[Id]
    Set suite variable    &{program_cohort}
    &{service} =    API Create Service   &{Program}[Id]
    Set suite variable    &{service}

*** Test Cases ***
Create program engagement from BSDT
    [Documentation]                        This test adds service deliveries on bulk service delivery
    Go To Page                             BasePage                               ServiceDelivery__c
    verify current page                    Service Deliveries
    populate bsdt lookup           Search Contacts         &{contact}[FirstName] &{contact}[LastName]
    select listbox      Select Program Engagement   New Program Engagement
    Load Page Object  NewProgramEngagement  ProgramEngagement__c
    verify dialog title    New Program Engagement
    Populate Program Engagement bsdt form   Stage=Applied
    ...                                    Role=Client
    ...                                    Application Date=${application_date}
    ...                                    Start Date=${start_date}
    populate bsdt lookup     Search Programs         &{program}[Name]
    Click dialog button     Save
    Wait Until Modal Is Closed
    populate row1 fields          Select Service         &{service}[Name]
    input row1 data  Quantity    ${quantity}
    sleep   2s
    verify persist save icon    Saved
    Go To Page                             Listing                               ServiceDelivery__c
    Page Should Contain                    &{contact}[FirstName] &{contact}[LastName] - &{service}[Name]