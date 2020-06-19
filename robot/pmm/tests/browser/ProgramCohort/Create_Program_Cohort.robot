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
    ${ns} =                 Get PMM Namespace Prefix
    Set suite variable      ${ns}
    ${program_cohort} =     Generate Random String
    Set suite variable      ${program_cohort}      
    &{program} =                API Create Program  
    Store Session Record        ${ns}Program__c         ${program}[Id]
    Set suite variable          &{program}


*** Test Cases ***
Create Program Cohort
     [Documentation]                        This test creates a program cohort and verifies the details of the page
     [tags]                                 feature:Program Cohort
     Go To PMM App
     Go To Page                             Listing                                 ${ns}ProgramCohort__c   
     Click Object Button                    New
     wait for modal                         New                                     Program Cohort
     Populate modal Form                    Program Cohort=${program_cohort}
     ...                                    Status=Planned
     ...                                    Program=${program}[Name]
     ...                                    Description=New Program Cohort via Robot Test
     ...                                    Start Date=10
     ...                                    End Date=25
     Click modal button                     Save
     Wait Until Modal Is Closed
     verify page header                     Program
     click new related record link          ${program_cohort}
     verify details                         Program Cohort                          contains                        ${program_cohort}
     ${program_cohort_id} =                 Save Current Record ID For Deletion     ${ns}ProgramCohort__c

Date validation when Start date is later than end date
     [Documentation]                        This test opens the new program cohort dialog and enters a end date earlier than start date
     ...                                    and verifies that an error message is displayed
     [tags]                                 W-037572  feature:Program Cohort
     Go To Page                             Listing                                 ${ns}ProgramCohort__c   
     Click Object Button                    New
     wait for modal                         New                                     Program Cohort
     Populate modal Form                    Program Cohort=${program_cohort} 
     ...                                    Status=Planned
     ...                                    Program=${program}[Name]
     ...                                    Start Date=25
     ...                                    End Date=10
     Click modal button                     Save
     verify modal error                     Start Date must be before End Date

Date validation
    [Documentation]                         This test opens the new program dialog and enters a end date earlier than start date
    ...                                     and verifies that an error message is displayed
    [tags]                                  W-037572  feature:Program Cohort
     Go To Page                             Details                                 ${ns}Program__c                   object_id=${program}[Id]
     click quick action button              Edit
     verify current page title              Edit ${program}[Name]
     Populate modal Form                    Start Date=12
     ...                                    End Date=20
     Click modal button                     Save
     Wait Until Modal Is Closed
     Load related list                      Program Cohorts
     Click related list button              Program Cohorts                        New
     verify current page title              New Program Cohort
     Populate modal Form                    Program Cohort=${program_cohort} 
     ...                                    Status=Active
     ...                                    Start Date=10
     ...                                    End Date=25
     Click modal button                     Save
     verify modal error                     End Date must be within the Program Start and End Dates
     verify modal error                     Start Date must be within the range of the related Program Start and End Dates.