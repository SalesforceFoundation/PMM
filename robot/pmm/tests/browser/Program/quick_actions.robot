*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ProgramPageObject.py
...            robot/pmm/resources/ProgramEngagementPageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Delete Records and Close Browser


*** Keywords ***
Setup Test Data
    &{program} =          API Create Program
    Store Session Record  Program__c                 &{program}[Id]
    Set suite variable    &{program}
    &{contact} =          API Create Contact
    Set suite variable    &{contact}
    &{program_cohort} =   API Create Program Cohort  &{Program}[Id]
    Set suite variable    &{program_cohort}
    ${result_date} =       Get Current Date   result_format=%Y-%m-%d
    Set suite variable    ${result_date}

*** Test Cases ***
Add contact to program quick action
     Go To Page                       Details                                 Program__c              object_id=&{program}[Id]
     page should contain              &{program}[Name]
     click quick action button        Add Contact to Program
     Load Page Object                 NewProgramEngagement                    ProgramEngagement__c
     verify current page title        Add Contact to Program
     Populate Modal form              Client=&{contact}[FirstName] &{contact}[LastName]
     ...                              Role=Client
     ...                              Stage=Enrolled
     ...                              Program Cohort=&{program_cohort}[Name]
     ...                              Start Date=Today
     Click Modal button               Save
     Wait Until Modal Is Closed
     current page should be           Details                                 Program__c
     Load Related List                Program Engagements
     click new related record link    &{contact}[FirstName] &{contact}[LastName] ${result_date}: &{program}[Name]
     verify details                   Program Engagement Name                 contains                &{contact}[FirstName] &{contact}[LastName] ${result_date}: &{program}[Name]
     ${programcohort_id} =            Save Current Record ID For Deletion     ProgramCohort__c
     ${programengagement_id} =        Save Current Record ID For Deletion     ProgramEngagement__c
