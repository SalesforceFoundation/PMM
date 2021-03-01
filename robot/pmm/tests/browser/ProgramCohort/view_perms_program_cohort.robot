*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ProgramCohortPageObject.py
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
    ${program} =            API Create Program
    Set suite variable      ${program}
    ${program_cohort} =     API Create Program Cohort       ${Program}[Id]
    Set suite variable      ${program_cohort}

*** Test Cases ***
View and Deliver Perm Test for Program Cohort
     [Documentation]                  Validates that New (Listing Page) and Edit buttons (Record Page) are not 
     ...                              displayed for Program Cohort (View and Deliver Perm Set) 
     [tags]                           unstable    perm:view    perm:deliver      feature:Program Cohort
     Go To Page                              Listing                               ${ns}ProgramCohort__c
     Page Should Not Contain Button          New
     Go To Page                              Details              ProgramCohort__c                    object_id=${program_cohort}[Id]
     Page Should Not Contain Button          Edit        
