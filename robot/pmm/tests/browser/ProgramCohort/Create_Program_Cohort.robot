*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ProgramPageObject.py
...            robot/pmm/resources/ProgramCohortPageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Delete Records and Close Browser

*** Keywords ***
Setup Test Data
    ${program_cohort} =     Generate Random String
    Set suite variable      ${program_cohort}
    &{program} =            API Create Program
    Store Session Record    Program__c         &{program}[Id]
    Set suite variable      &{program}


*** Test Cases ***

Create Program Cohort from Program Object

     Go To Page                             Details                                 Program__c                   object_id=&{program}[Id]
     page should contain                    &{program}[Name]
     Click Wrapper Related List Button      Program Cohorts                         New
     Current Page Should Be                 NewProgramCohort                        ProgramCohort__c
     verify current page title              New Program Cohort
     Populate modal Form                    Program Cohort= ${program_cohort}
     ...                                    Status=Planned
     ...                                    Description=New Program Cohort via Robot Test
     ...                                    Start Date=10
     ...                                    End Date=25
     Click modal button                     Save
     Wait Until Modal Is Closed
     current page should be                 Details                                 Program__c
     click new related record link          ${program_cohort}
     ${program_cohort_id} =                 Save Current Record ID For Deletion     ProgramCohort__c
     current page should be                 Details                                 ProgramCohort__c
