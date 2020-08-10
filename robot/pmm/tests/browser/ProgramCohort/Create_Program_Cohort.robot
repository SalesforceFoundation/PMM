*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ProgramPageObject.py
...            robot/pmm/resources/ProgramCohortPageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Keywords ***
Setup Test Data
    ${ns} =                     Get PMM Namespace Prefix
    Set suite variable          ${ns}
    ${program_cohort} =         Generate Random String
    Set suite variable          ${program_cohort}      
    &{program} =                API Create Program  
    Set suite variable          &{program}


*** Test Cases ***
Create Program Cohort
     [Documentation]                        This test creates a program cohort and verifies the cohort
     ...                                    record matches the values entered in the form
     [tags]                                 W-037572    feature:Program Cohort
     Go To PMM App
     Go To Page                             Listing                 ${ns}ProgramCohort__c   
     Click Object Button                    New
     Wait For Modal                         New                     Program Cohort
     Populate Field                         Program Cohort          ${program_cohort}  
     Select Value From Dropdown             Status                  Planned
     Populate Lookup Field                  Program                 ${program}[Name]
     Populate Field                         Description             New Program Cohort via Robot Test
     Select Date From Datepicker            Start Date              10
     Select Date From Datepicker            End Date                25
     Click Modal Button                     Save
     Wait Until Modal Is Closed
     Verify Page Header                     Program Cohort
     Verify Details                         Program Cohort          contains        ${program_cohort}
     Verify Details                         Status                  contains        Planned
     Verify Details                         Program                 contains        ${program}[Name]
     Verify Page Contains Related List      Program Engagements
     Verify Page Contains Related List      Files
     ${program_cohort_id} =                 Save Current Record ID For Deletion     ${ns}ProgramCohort__c


Date validation when Start date is later than end date
     [Documentation]                        This test opens the new program cohort dialog and enters a end date earlier than start date
     ...                                    and verifies that an error message is displayed
     [tags]                                 W-037572  feature:Program Cohort
     Go To Page                             Listing                 ${ns}ProgramCohort__c   
     Click Object Button                    New
     Wait For Modal                         New                     Program Cohort
     Populate Field                         Program Cohort          ${program_cohort}  
     Select Value From Dropdown             Status                  Planned
     Populate Lookup Field                  Program                 ${program}[Name]
     Populate Field                         Description             New Program Cohort via Robot Test
     Select Date From Datepicker            Start Date              25
     Select Date From Datepicker            End Date                10
     Click Modal Button                     Save
     Verify Modal Error                     Start Date must be before End Date

Date validation when cohort dates are not within program date range
     [Documentation]                        This test opens the program record, edits the start and end dates and opens new program
     ...                                    cohort dialog from related list and verifes that an error message is displayed when cohort date 
     ...                                    range is outside the program date range 
     [tags]                                 W-037572  feature:Program Cohort
     Go To Page                             Details                                 ${ns}Program__c                   object_id=${program}[Id]
     Click Quick Action Button              Edit
     Verify Current Page Title              Edit ${program}[Name]
     Populate Modal Form                    Start Date=12
     ...                                    End Date=20
     Click Modal Button                     Save
     Wait Until Modal Is Closed
     Load Related List                      Program Cohorts
     Click Related List Button              Program Cohorts                        New
     Verify Current Page Title              New Program Cohort
     Populate Modal Form                    Program Cohort=${program_cohort} 
     ...                                    Status=Active
     ...                                    Start Date=10
     ...                                    End Date=25
     Click Modal Button                     Save
     Verify Modal Error                     End Date must be within the Program Start and End Dates
     Verify Modal Error                     Start Date must be within the range of the related Program Start and End Dates.
     Click Modal Button                     Cancel
     