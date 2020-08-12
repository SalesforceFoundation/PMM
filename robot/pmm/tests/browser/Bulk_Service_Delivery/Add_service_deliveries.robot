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
    ${ns} =                     Get PMM Namespace Prefix
    Set suite variable          ${ns}
    ${quantity1} =              Generate Random String          2     [NUMBERS]
    Set suite variable          ${quantity1}
    ${quantity2} =              Generate Random String          2     [NUMBERS]
    Set suite variable          ${quantity2}
    ${today} =                  Get Current Date                result_format=%Y-%m-%d
    Set suite variable          ${today}

    ${contact1} =               API Create Contact
    Set suite variable          ${contact1}
    ${program1} =               API Create Program
    Set suite variable          ${program1}
    ${program_engagement1} =    API Create Program Engagement   ${Program1}[Id]     ${contact1}[Id]
    Set suite variable          ${program_engagement1}
    ${service1} =               API Create Service              ${Program1}[Id]
    Set suite variable          ${service1}

    ${contact2} =               API Create Contact
    Set suite variable          ${contact2}
    ${program2} =               API Create Program
    Set suite variable          ${program2}
    ${program_engagement2} =    API Create Program Engagement   ${Program2}[Id]     ${contact2}[Id]
    Set suite variable          ${program_engagement2}
    ${service2} =               API Create Service              ${Program2}[Id]
    Set suite variable          ${service2}

    ${contact3} =               API Create Contact
    Set suite variable          ${contact3}
    ${program3} =               API Create Program
    Set suite variable          ${program3}
    ${program_engagement3} =    API Create Program Engagement   ${Program3}[Id]     ${contact3}[Id]
    Set suite variable          ${program_engagement3}

*** Test Cases ***

Add service delivery on bulk service delivery
    [Documentation]             This test adds two service deliveries on bulk service delivery and 
    ...                         navigates to service delivery listview and verifies that the service delivery 
    ...                         records are displayed
    [tags]                      W-040316   feature:Service Delivery
    Go To PMM App
    Go To Page                  Custom                              Bulk_Service_Deliveries
    Verify Current Page         Bulk Service Deliveries
    Populate Bsdt Lookup        1           Client                  ${contact1}[FirstName] ${contact1}[LastName]
    Populate Bsdt Dropdown      1           Program Engagement      ${program_engagement1}[Name]
    Populate Bsdt Dropdown      1           Service                 ${service1}[Name]
    Populate Bsdt Field         1           Quantity                ${quantity1}
    Verify Persist Save Icon    1           Saved
    Click Button                Add Entry
    Populate Bsdt Lookup        2           Client                  ${contact2}[FirstName] ${contact2}[LastName]
    Populate Bsdt Dropdown      2           Program Engagement      ${program_engagement2}[Name]
    Populate Bsdt Dropdown      2           Service                 ${service2}[Name]
    Populate Bsdt Field         2           Quantity                ${quantity2}
    Verify Persist Save Icon    2           Saved
    Click Button                Done
    Go To Page                  Listing                             ${ns}ServiceDelivery__c
    Page Should Contain         ${contact1}[FirstName] ${contact1}[LastName] ${today}: ${service1}[Name]
    Page Should Contain         ${contact2}[FirstName] ${contact2}[LastName] ${today}: ${service2}[Name]
    Click Listview Link         ${contact1}[FirstName] ${contact1}[LastName] ${today}: ${service1}[Name]
    Verify Details              Service Delivery Name           contains              ${contact1}[FirstName] ${contact1}[LastName] ${today}: ${service1}[Name]
    Save Current Record ID For Deletion     ${ns}ServiceDelivery__c
    Save Current Record ID For Deletion     ${ns}Service__c
    Save Current Record ID For Deletion     ${ns}ProgramEngagement__c


Verify error message when there are no services associated with the program
    [Documentation]             This test verifies that an error message is displayed when there are no
    ...                         services associated with the program.
    [tags]                      W-040316   feature:Service Delivery
    Go To Page                  Custom                              Bulk_Service_Deliveries
    Verify Current Page         Bulk Service Deliveries
    Populate Bsdt Lookup        1           Client                  ${contact3}[FirstName] ${contact3}[LastName]
    Populate Bsdt Dropdown      1           Program Engagement      ${program_engagement3}[Name]
    verify error message        No services found, choose another program engagement.
    verify persist warning icon  1          No services found, choose another program engagement.

Delete service delivery on bsdt
    [Documentation]             This test creates a service delivery on BSDT and then deletes it, verifies
    ...                         that a warning dialog is displayed when deleted.
    [tags]                      W-042916   feature:Service Delivery
    Go To Page                  Custom                              Bulk_Service_Deliveries
    Verify Current Page         Bulk Service Deliveries
    Populate Bsdt Lookup        1           Client                  ${contact1}[FirstName] ${contact1}[LastName]
    Populate Bsdt Dropdown      1           Program Engagement      ${program_engagement1}[Name]
    Populate Bsdt Dropdown      1           Service                 ${service1}[Name]
    Populate Bsdt Field         1           Quantity                ${quantity1}
    Verify Persist Save Icon    1           Saved
    Click Bsdt Icon             Delete
    Verify Dialog Title         Confirm deletion?
    Click Dialog Button         Delete
    Wait Until Modal Is Closed
    Page Should Not Contain     ${contact1}[FirstName] ${contact1}[LastName]
    Page Should Not Contain     ${program_engagement1}[Name]
    Page Should Not Contain     ${service1}[Name]
    
