*** Settings ***

Resource        robot/pmm/resources/pmm.robot
Library         cumulusci.robotframework.PageObjects
...             robot/pmm/resources/pmm.py
...             robot/pmm/resources/ContactPageObject.py
...             robot/pmm/resources/ProgramEngagementPageObject.py
...             robot/pmm/resources/ServiceDeliveryPageObject.py
Suite Setup     Run Keywords
...             Open test browser            useralias=${test_user}             AND
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Variables ***
${test_user}             UUser

*** Keywords ***
Setup Test Data
    ${ns} =                     Get PMM Namespace Prefix
    Set suite variable          ${ns}
    ${program} =                API Create Program
    Set suite variable          ${program}
    ${contact} =                API Create Contact
    Set suite variable          ${contact}
    ${program_cohort} =         API Create Program Cohort       ${Program}[Id]
    Set suite variable          ${program_cohort}
    ${result_date} =            Get Current Date                result_format=%Y-%m-%d
    Set suite variable          ${result_date}
    ${program_engagement} =     API Create Program Engagement   ${Program}[Id]      ${contact}[Id]
    Set suite variable          ${program_engagement}
    ${service} =                API Create Service              ${Program}[Id]
    Set suite variable          ${service}
    ${quantity} =               Generate Random String    2     [NUMBERS]
    Set suite variable          ${quantity}
    ${today} =                  Get Current Date                result_format=%Y-%m-%d
    Set suite variable          ${today}

*** Test Cases ***
Add contact to program quick action
     [Documentation]                  Add a contact to a program using quick action and verify the record
     [tags]                           W-037575    perm:admin   perm:manage      perm:deliver    feature:Program Engagement
     Go To Page                       Details                                 Contact              object_id=${contact}[Id]
     Verify Details                   Name                                    contains             ${contact}[Name]
     Click Quick Action Button        Add Contact to Program
     Populate Lookup Field            Program          ${program}[Name]    
     Select Value From Dropdown       Role             Client
     Select Value From Dropdown       Stage            Active
     Populate Lookup Field            Program Cohort   ${program_cohort}[Name]
     Select Date From Datepicker      Start Date       Today
     Select Button On Modal           Save
     Wait Until Modal Is Closed
     Load Related List                Program Engagements
     Click New Related Record Link    ${contact}[FirstName] ${contact}[LastName] ${result_date}: ${program}[Name]
     Verify Details                   Program Engagement Name                 contains                ${contact}[FirstName] ${contact}[LastName] ${result_date}: ${program}[Name]
     Save Current Record ID For Deletion     ${ns}ProgramCohort__c
     Save Current Record ID For Deletion     ${ns}ProgramEngagement__c
     
Add service delivery on a contact
     [Documentation]                  Add a service delivery on a contact and verify the record
     [tags]                           W-037575    perm:admin   perm:manage     perm:deliver    feature:Service Delivery
     Go To Page                       Details                                 Contact                  object_id=${contact}[Id]
     Verify Details                   Name                                    contains             ${contact}[Name]
     Click Quick Action Button        Create New Service Delivery
     Populate Lookup Field            Program Engagement              ${program_engagement}[Name]
     Populate Lookup Field            Service                         ${service}[Name]
     Populate Field                   Quantity                        ${quantity}
     Select Button On Modal           Save
     Wait Until Modal Is Closed
     Load Related List                Service Deliveries
     Click New Related Record Link    ${contact}[FirstName] ${contact}[LastName] ${today}: ${service}[Name]
     Verify Details                   Service Delivery Name                    contains                ${contact}[FirstName] ${contact}[LastName] ${today}: ${service}[Name]
     Save Current Record ID For Deletion      ${ns}ServiceDelivery__c
     Save Current Record ID For Deletion      ${ns}Service__c
     Save Current Record ID For Deletion      ${ns}ProgramEngagement__c
