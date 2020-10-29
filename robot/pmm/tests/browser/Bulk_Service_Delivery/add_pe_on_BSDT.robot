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
Suite Teardown  Capture Screenshot and Delete Records and Close Browser


*** Keywords ***
Setup Test Data
    ${ns} =                 Get PMM Namespace Prefix
    Set suite variable      ${ns}
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

    ${contact} =            API Create Contact
    Set suite variable      ${contact}
    ${program} =            API Create Program
    Set suite variable      ${program}
    ${service} =            API Create Service           ${Program}[Id]
    Set suite variable      ${service}

*** Test Cases ***
Create program engagement from BSDT
    [Documentation]                         This test adds service deliveries on bulk service delivery by creating
    ...                                     a new PE on bsdt page
    [tags]                                  W-040316   feature:Service Delivery
    Go To PMM App
    Go To Page                              Custom                              Bulk_Service_Deliveries
    Verify Current Page                     Bulk Service Deliveries
    Populate Bsdt Lookup                    1           Client                  ${contact}[FirstName] ${contact}[LastName]
    Populate Bsdt Dropdown                  1           Program Engagement      New Program Engagement
    Load Page Object                        NewProgramEngagement                ${ns}ProgramEngagement__c
    Verify Dialog Title                     New Program Engagement
    Populate Program Engagement Bsdt Form   Stage=Applied
    ...                                     Role=Client
    ...                                     Application Date=${application_date}
    ...                                     Start Date=${start_date}
    ...                                     Program=${program}[Name]
    Click Dialog Button                     Save
    Wait Until Modal Is Closed
    Populate Bsdt Dropdown                  1           Service                 ${service}[Name]
    Populate Bsdt Field                     1           Quantity                ${quantity}
    Verify Persist Save Icon                1           Saved
    Click Button                            Done
    Click Toast Message                     1 Service Deliveries
    Click Listview Link                     ${contact}[FirstName] ${contact}[LastName] ${today}: ${service}[Name]
    Verify Details                          Service Delivery Name           contains        ${contact}[FirstName] ${contact}[LastName] ${today}: ${service}[Name]
    Save Current Record ID For Deletion     ${ns}ServiceDelivery__c
    Save Current Record ID For Deletion     ${ns}Service__c
    Go To Page                              Listing                         ${ns}ProgramEngagement__c
    Click Listview Link                     ${contact}[FirstName] ${contact}[LastName] ${created_date}: ${program}[Name]
    Verify Details                          Program Engagement Name         contains     ${contact}[FirstName] ${contact}[LastName] ${created_date}: ${Program}[Name]
    Save Current Record ID For Deletion     ${ns}ProgramEngagement__c
