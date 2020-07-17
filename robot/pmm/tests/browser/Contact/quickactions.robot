*** Settings ***

Resource        robot/pmm/resources/pmm.robot
Library         cumulusci.robotframework.PageObjects
...             robot/pmm/resources/pmm.py
...             robot/pmm/resources/ContactPageObject.py
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
    Store Session Record        ${ns}Program__c                 &{program}[Id]
    Set suite variable          &{program}
    &{contact} =                API Create Contact
    Set suite variable          &{contact}
    &{program_cohort} =         API Create Program Cohort       &{Program}[Id]
    Set suite variable          &{program_cohort}
    ${result_date} =            Get Current Date                result_format=%Y-%m-%d
    Set suite variable          ${result_date}
    &{program_engagement} =     API Create Program Engagement   &{Program}[Id]      &{contact}[Id]
    Set suite variable          &{program_engagement}
    &{service} =                API Create Service              &{Program}[Id]
    Set suite variable          &{service}
    ${quantity} =               Generate Random String    2     [NUMBERS]
    Set suite variable          ${quantity}
    ${today} =                  Get Current Date                result_format=%Y-%m-%d
    Set suite variable          ${today}

*** Test Cases ***
Add contact to program quick action
     [Documentation]                  Add a contact to a program using quick action and verify the record
     [tags]                           W-037575  feature:Program Engagement
     Go To PMM App
     Go To Page                       Details                                 Contact              object_id=&{contact}[Id]
     page should contain              &{contact}[Name]
     click object button              Add Contact to Program
     verify current page title        Add Contact to Program
     Populate Modal form              Program=&{program}[Name]
     ...                              Role=Client
     ...                              Stage=Active
     ...                              Program Cohort=&{program_cohort}[Name]
     ...                              Start Date=Today
     Click Modal button               Save
     Wait Until Modal Is Closed
     verify page header               Contact
     Load Related List                Program Engagements
     click new related record link    &{contact}[FirstName] &{contact}[LastName] ${result_date}: &{program}[Name]
     verify details                   Program Engagement Name                 contains                &{contact}[FirstName] &{contact}[LastName] ${result_date}: &{program}[Name]
     ${programcohort_id} =            Save Current Record ID For Deletion     ${ns}ProgramCohort__c
     ${programengagement_id} =        Save Current Record ID For Deletion     ${ns}ProgramEngagement__c
     
Add service delivery on a contact
     [Documentation]                  Add a service delivery on a contact and verify the record
     [tags]                           W-037575  feature:Service Delivery
     Go To Page                       Details                                 Contact                  object_id=&{contact}[Id]
     page should contain              &{contact}[Name]
     click object button              Create New Service Delivery
     verify current page title        Create New Service Delivery
     populate modal form              Program Engagement=&{program_engagement}[Name]
     ...                              Service=&{service}[Name]
     ...                              Quantity=${quantity}
     Click Modal button               Save
     Wait Until Modal Is Closed
     verify page header               Contact
     Load Related List                Service Deliveries
     click new related record link    &{contact}[FirstName] &{contact}[LastName] ${today}: &{service}[Name]
     verify details                   Service Delivery Name                    contains                &{contact}[FirstName] &{contact}[LastName] ${today}: &{service}[Name]
     ${servicedelivery_id} =          Save Current Record ID For Deletion      ${ns}ServiceDelivery__c
     ${service_id} =                  Save Current Record ID For Deletion      ${ns}Service__c
     ${programengagement_id} =        Save Current Record ID For Deletion      ${ns}ProgramEngagement__c