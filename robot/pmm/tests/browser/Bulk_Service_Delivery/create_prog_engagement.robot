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
    ${quantity} =           Generate Random String    2     [NUMBERS]
    Set suite variable      ${quantity}
    ${application_date} =   Get Current Date   result_format=%m/%d/%Y   increment=1 day
    Set suite variable      ${application_date}
    ${start_date} =         Get Current Date   result_format=%m/%d/%Y  increment=30 days
    Set suite variable      ${start_date}
    ${today} =              Get Current Date   result_format=%Y-%m-%d
    Set suite variable      ${today}
    ${created_date} =       Get Current Date   result_format=%Y-%m-%d  increment=30 days
    Set suite variable      ${created_date}

    &{contact} =            API Create Contact
    Set suite variable      &{contact}
    &{program} =            API Create Program
    Store Session Record    Program__c                   &{program}[Id]
    Set suite variable      &{program}
    &{program_cohort} =     API Create Program Cohort    &{Program}[Id]
    Set suite variable      &{program_cohort}
    &{service} =            API Create Service           &{Program}[Id]
    Set suite variable      &{service}

*** Test Cases ***
Create program engagement from BSDT
    [Documentation]                         This test adds service deliveries on bulk service delivery
    [tags]                                  W-040316   feature:Service Delivery
    Go To Page                              BasePage                        ServiceDelivery__c
    verify current page                     Bulk Service Deliveries
    populate bsdt lookup                    Search Contacts                 &{contact}[FirstName] &{contact}[LastName]
    select listbox                          Select Program Engagement       New Program Engagement
    Load Page Object                        NewProgramEngagement            ProgramEngagement__c
    verify dialog title                     New Program Engagement
    Populate Program Engagement bsdt form   Stage=Applied
    ...                                     Role=Client
    ...                                     Application Date=${application_date}
    ...                                     Start Date=${start_date}
    populate bsdt lookup                    Search Programs             &{program}[Name]
    Click dialog button                     Save
    Wait Until Modal Is Closed
    populate row1 fields                    Select Service                  &{service}[Name]
    input row1 data                         Quantity                        ${quantity}
    sleep                                   2s
    verify persist save icon                Saved
    sleep                                   2s
    click button                            Done
    click toast message                     1 Service Deliveries Added
    click listview link                     &{contact}[FirstName] &{contact}[LastName] ${today}: &{service}[Name]
    current page should be                  Details                         ServiceDelivery__c
    verify details                          Service Delivery Name           contains     &{contact}[FirstName] &{contact}[LastName] ${today}: &{service}[Name]
    ${service_delivery_id} =                Save Current Record ID For Deletion    ServiceDelivery__c
    ${service_id} =                         Save Current Record ID For Deletion    Service__c
    Go To Page                              Listing                         ProgramEngagement__c
    click listview link                     &{contact}[FirstName] &{contact}[LastName] ${created_date}: &{program}[Name]
    verify details                          Program Engagement Name     contains     &{contact}[FirstName] &{contact}[LastName] ${created_date}: &{Program}[Name]
    ${programengagement_id} =               Save Current Record ID For Deletion      ProgramEngagement__c
