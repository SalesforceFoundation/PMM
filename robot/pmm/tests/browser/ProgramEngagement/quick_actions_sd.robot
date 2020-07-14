*** Settings ***

Resource        robot/pmm/resources/pmm.robot
Library         cumulusci.robotframework.PageObjects
...             robot/pmm/resources/pmm.py
...             robot/pmm/resources/ProgramEngagementPageObject.py
...             robot/pmm/resources/ServiceDeliveryPageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser
*** Keywords ***
Setup Test Data
    ${ns} =                     Get PMM Namespace Prefix
    Set suite variable          ${ns}

    &{program} =                API Create Program
    Set suite variable          &{program}
    &{contact} =                API Create Contact
    Set suite variable          &{contact}
    &{contact1} =               API Create Contact
    Set suite variable          &{contact1}
    &{program_engagement} =     API Create Program Engagement   ${Program}[Id]      ${contact}[Id]
    Set suite variable          &{program_engagement}
    &{service} =                API Create Service              ${Program}[Id]
    Set suite variable          &{service}

    ${today} =                  Get Current Date                result_format=%Y-%m-%d
    Set suite variable          ${today}
    ${quantity} =               Generate Random String    2     [NUMBERS]
    Set suite variable          ${quantity}

*** Test Cases ***
Create a new service delivery using quick action
     [Documentation]                This test loads the program engagement record, clicks on the new service delivery quick action and creates
     ...                            new service delivery record.
     [tags]                         W-037572  feature:Service Delivery
     Go To PMM App
     Go To Page                     Details                        ProgramEngagement__c      object_id=${program_engagement}[Id]
     Verify Details                 Program Engagement Name        contains                       ${contact}[FirstName] ${contact}[LastName] ${today}: ${program}[Name]
     Click Quick Action Button      Create New Service Delivery
     Verify Current Page Title      Create New Service Delivery
     Populate Modal Form            Client=${contact}[FirstName] ${contact}[LastName]
     ...                            Service=${service}[Name]
     ...                            Quantity=${quantity}
     Click Modal Button             Save
     Wait Until Modal Is Closed
     Verify Page Header             Program Engagement
     Load Related List              Service Deliveries
     Click New Related Record Link  ${contact}[FirstName] ${contact}[LastName] ${today}: ${service}[Name]
     Verify Details                 Service Delivery Name       contains    ${contact}[FirstName] ${contact}[LastName] ${today}: ${service}[Name]
     Save Current Record ID For Deletion     ${ns}ServiceDelivery__c

Validate contact on quick action dialog
     [Documentation]                This test loads the program engagement record, clicks on the new service delivery quick action and
     ...                            validates an error message is displayed when a contact not listed on program engagement is entered
     [tags]                         W-042516  feature:Service Delivery
     Go To Page                     Details                        ProgramEngagement__c     object_id=${program_engagement}[Id]
     Verify Details                 Program Engagement Name        contains                      ${contact}[FirstName] ${contact}[LastName] ${today}: ${program}[Name]
     Click Quick Action Button      Create New Service Delivery
     Verify Current Page Title      Create New Service Delivery
     Populate Modal Form            Client=${contact1}[FirstName] ${contact1}[LastName]
     ...                            Service=${service}[Name]
     Click Modal Button             Save
     Verify Modal Error             Contact must match the Contact in the Program Engagement.
