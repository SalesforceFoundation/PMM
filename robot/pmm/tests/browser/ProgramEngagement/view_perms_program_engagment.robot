*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ProgramEngagementPageObject.py
Suite Setup     Run Keywords
...             Open test browser            useralias=${test_user}             AND
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Variables ***
${test_user}             UUser

*** Keywords ***
Setup Test Data
    ${ns} =                 Get PMM Namespace Prefix
    Set suite variable      ${ns}
    ${program} =                API Create Program
    Set suite variable          ${program}
    ${contact} =                API Create Contact
    Set suite variable          ${contact}
    ${program_engagement} =     API Create Program Engagement   ${Program}[Id]      ${contact}[Id]
    Set suite variable          ${program_engagement}

*** Test Cases ***
VPPE1: View Perm Test for Program Engagement
     [Documentation]                  Validates that New (Listing Page) and Edit buttons (Record Page) are not 
     ...                              displayed for Program Engagement (View Perm Set) 
     [tags]                           unstable    quadrant:Q2   perm:view    feature:Program Engagement
     Go To Page                              Listing                               ${ns}ProgramEngagement__c
     Page Should Not Contain Button          New
     Go To Page                              Details              ProgramEngagement__c                    object_id=${program_engagement}[Id]
     Page Should Not Contain Button          Edit
