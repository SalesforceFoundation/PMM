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
    ${ns} =                     Get PMM Namespace Prefix
    Set suite variable          ${ns}
    ${quantity1} =              Generate Random String          2     [NUMBERS]
    Set suite variable          ${quantity1}
    ${quantity2} =              Generate Random String          2     [NUMBERS]
    Set suite variable          ${quantity2}
    ${today} =                  Get Current Date                result_format=%Y-%m-%d
    Set suite variable          ${today}

    &{contact1} =               API Create Contact
    Set suite variable          &{contact1}
    &{program1} =               API Create Program
    Store Session Record        ${ns}Program__c                 &{program1}[Id]
    Set suite variable          &{program1}
    &{program_engagement1} =    API Create Program Engagement   &{Program1}[Id]     &{contact1}[Id]
    Set suite variable          &{program_engagement1}
    &{service1} =               API Create Service              &{Program1}[Id]
    Set suite variable          &{service1}

    &{contact2} =               API Create Contact
    Set suite variable          &{contact2}
    &{program2} =               API Create Program
    Store Session Record        ${ns}Program__c                 &{program2}[Id]
    Set suite variable          &{program2}
    &{program_engagement2} =    API Create Program Engagement   &{Program2}[Id]     &{contact2}[Id]
    Set suite variable          &{program_engagement2}
    &{service2} =               API Create Service              &{Program2}[Id]
    Set suite variable          &{service2}

    &{contact3} =               API Create Contact
    Set suite variable          &{contact3}
    &{program3} =               API Create Program
    Store Session Record        ${ns}Program__c                 &{program3}[Id]
    Set suite variable          &{program3}
    &{program_engagement3} =    API Create Program Engagement   &{Program3}[Id]     &{contact3}[Id]
    Set suite variable          &{program_engagement3}

*** Test Cases ***

Add service delivery on bulk service delivery
    [Documentation]             This test adds service deliveries on bulk service delivery
    Go To PMM App
    Go To Page                  Custom                          ${ns}Bulk_Service_Deliveries
    verify current page         Bulk Service Deliveries
    populate bsdt lookup        Search Contacts                 &{contact1}[FirstName] &{contact1}[LastName]
    populate row1 fields        Select Program Engagement       &{program_engagement1}[Name]
    populate row1 fields        Select Service                  &{service1}[Name]
    input row1 data             Quantity                        ${quantity1}
    sleep                       2s
    verify persist save icon    Saved
    click button                Add Entry
    populate bsdt lookup        Search Contacts                 &{contact2}[FirstName] &{contact2}[LastName]
    populate row2 fields        Select Program Engagement       &{program_engagement2}[Name]
    populate row2 fields        Select Service                  &{service2}[Name]
    input row2 data             Quantity                        ${quantity2}
    verify persist save icon    Saved
    sleep                       2s
    click button                Done
    Go To Page                  Listing                         ${ns}ServiceDelivery__c
    Page Should Contain         &{contact1}[FirstName] &{contact1}[LastName] ${today}: &{service1}[Name]
    Page Should Contain         &{contact2}[FirstName] &{contact2}[LastName] ${today}: &{service2}[Name]
    sleep                       2s
    click listview link         &{contact1}[FirstName] &{contact1}[LastName] ${today}: &{service1}[Name]
    verify details              Service Delivery Name           contains              &{contact1}[FirstName] &{contact1}[LastName] ${today}: &{service1}[Name]


Verify error message when there are no services associated with the program
    [Documentation]             This test verifies that an error message is displayed when there are no
    ...                         services associated with the program.
    Go To Page                  Custom                                  ${ns}Bulk_Service_Deliveries
    verify current page         Bulk Service Deliveries
    populate bsdt lookup        Search Contacts                         &{contact3}[FirstName] &{contact3}[LastName]
    populate row1 fields        Select Program Engagement               &{program_engagement3}[Name]
    verify error message        No services found, choose another program engagement.
    verify persist warning icon  No services found, choose another program engagement.
    Go To Page                  Listing                                 ${ns}ServiceDelivery__c
    click listview link         &{contact1}[FirstName] &{contact1}[LastName] ${today}: &{service1}[Name]
    verify details              Service Delivery Name                   contains                &{contact1}[FirstName] &{contact1}[LastName] ${today}: &{service1}[Name]
    ${service_delivery_id} =    Save Current Record ID For Deletion     ${ns}ServiceDelivery__c
    ${service_id} =             Save Current Record ID For Deletion     ${ns}Service__c
    ${program_engagement_id} =  Save Current Record ID For Deletion     ${ns}ProgramEngagement__c
    Go To Page                  Listing                                 ${ns}ServiceDelivery__c
    click listview link         &{contact2}[FirstName] &{contact2}[LastName] ${today}: &{service2}[Name]
    verify details              Service Delivery Name                   contains                &{contact2}[FirstName] &{contact2}[LastName] ${today}: &{service2}[Name]
    ${service_delivery_id} =    Save Current Record ID For Deletion     ${ns}ServiceDelivery__c
    ${service_id} =             Save Current Record ID For Deletion     ${ns}Service__c
    ${program_engagement_id} =  Save Current Record ID For Deletion     ${ns}ProgramEngagement__c
