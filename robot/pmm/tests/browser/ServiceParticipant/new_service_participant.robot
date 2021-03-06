*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/ServiceParticipantPageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser


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
    [tags]                                  W-8289333        feature:Service Participant
     Go To PMM App
     Go To Page                              Listing                                ${ns}ServiceParticipant__c
     Click Object Button                     New
     Wait For Modal                          New                                    Service Participant
     Populate Field                          Service Participant Name               ${service_participant_name}
     Populate Lightning Fields               Contact=${contact}[Name]
     ...                                     Status=Waitlisted
     ...                                     Service=${service}[Name]
     ...                                     Program Engagement=${program_engagement}[Name]     
     Click Dialog Button                     Save
     Wait Until Modal Is Closed
     Verify Details                          Service Participant Name        contains       ${service_participant_name}
     Verify Details                          Sign Up Date                    contains       ${today}
     Verify Page Contains Related List       Files
