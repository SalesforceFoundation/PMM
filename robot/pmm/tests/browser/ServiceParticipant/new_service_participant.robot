*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/ServiceParticipantPageObject.py
Suite Setup     Run Keywords
...             Open test browser            useralias=${test_user}             AND
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Variables ***
${test_user}             UUser

*** Keywords ***
Setup Test Data
    ${ns} =                         Get PMM Namespace Prefix
    Set suite variable              ${ns}
    ${service_participant_name} =   Generate Random String
    Set suite variable              ${service_participant_name}
    ${contact} =                    API Create Contact
    Set suite variable              ${contact}
    ${program} =                    API Create Program
    Set suite variable              ${program}
    ${service} =                    API Create Service              ${Program}[Id]
    Set suite variable              ${service}
    ${program_engagement} =         API Create Program Engagement   ${Program}[Id]     ${contact}[Id]
    Set suite variable              ${program_engagement}
    ${today} =                      Get Current Date   result_format=%-m/%-d/%Y 
    Set suite variable              ${today}


*** Test Cases ***
Create a new service participant
    [Documentation]                         Navigates to service participant listing page, clicks 'New' on the listing page and
    ...                                     creates a new record, validates the details on the service participant record
    [tags]                                  W-8289333     perm:admin     perm:manage     perm:deliver      feature:Service Participant
     Go To Page                              Listing                                ${ns}ServiceParticipant__c
     Click Object Button                     New
     Wait For Modal                          New                                    Service Participant
     Populate Field                          Service Participant Name               ${service_participant_name}
     Populate Lookup Field                   Service                                ${service}[Name]
     Populate Lookup Field                   Contact                                ${contact}[Name]
     Populate Lookup Field                   Program Engagement                     ${program_engagement}[Name]
     Populate Lightning Fields               Status=Waitlisted
     Click Dialog Button                     Save
     Wait Until Modal Is Closed
     Verify Details                          Service Participant Name        contains       ${service_participant_name}
     Verify Details                          Sign Up Date                    contains       ${today}
     Verify Page Contains Related List       Files
