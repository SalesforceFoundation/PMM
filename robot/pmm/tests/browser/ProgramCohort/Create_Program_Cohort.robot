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
    ${program} =                API Create Program  
    Set suite variable          ${program}
    ${program1} =                API Create Program  
    Set suite variable          ${program1}


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
     Populate Field                         Description             New Program Cohort via Robot Test
     Populate Lightning Fields              Status=Active
     ...                                    Program=${program}[Name]
     ...                                    Start Date=10
     ...                                    End Date=25
     Click Dialog Button                    Save
     Wait Until Modal Is Closed
     Verify Details                         Program Cohort          contains        ${program_cohort}
     Verify Details                         Status                  contains        Active
     Verify Details                         Program                 contains        ${program}[Name]
     Verify Page Contains Related List      Program Engagements
     Verify Page Contains Related List      Files
     ${program_cohort_id} =                 Save Current Record ID For Deletion     ${ns}ProgramCohort__c


Date validation for cohort when Start date is later than end date
     [Documentation]                        This test opens the new program cohort dialog and enters a end date earlier than start date
     ...                                    and verifies that an error message is displayed
     [tags]                                 W-037572  feature:Program Cohort
     Go To Page                             Listing                 ${ns}ProgramCohort__c   
     Click Object Button                    New
     Wait For Modal                         New                     Program Cohort
     Populate Field                         Program Cohort          ${program_cohort}
     Populate Field                         Description             New Program Cohort via Robot Test  
     Populate Lightning Fields              Status=Active
     ...                                    Program=${program}[Name]
     ...                                    Start Date=25
     ...                                    End Date=10
     Click Dialog Button                    Save
     Verify Modal Error                     Start Date must be before End Date
     Click Dialog Button                    Cancel

Date validation when cohort dates are not within program date range
     [Documentation]                        This test opens the program record, edits the start and end dates and opens new program
     ...                                    cohort dialog from related list and verifes that an error message is displayed when cohort date 
     ...                                    range is outside the program date range 
     [tags]                                 W-037572  feature:Program Cohort
     Go To Page                             Details                                 Program__c                   object_id=${program1}[Id]
     Click Quick Action Button              Edit
     Verify Current Page Title              Edit ${program1}[Name]
     Populate Lightning Fields              Start Date=15
     ...                                    End Date=20
     Click Dialog Button                    Save
     Wait Until Modal Is Closed
     Load Related List                      Program Cohorts
     Click Related List Button              Program Cohorts                        New
     Populate Field                         Program Cohort                         ${program_cohort}
     Populate Lightning Fields              Status=Completed
     Select From Date Picker                Start Date                               10
     Select From Date Picker                End Date                                 25
     Click Dialog Button                    Save
     Verify Modal Error                     End Date must be within the Program Start and End Dates
     Verify Modal Error                     Start Date must be within the range of the related Program Start and End Dates.

     