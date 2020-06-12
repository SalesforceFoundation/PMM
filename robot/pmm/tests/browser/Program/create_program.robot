*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ProgramPageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Delete Records and Close Browser

*** Keywords ***
Setup Test Data
    ${ns} =                 Get PMM Namespace Prefix
    Set suite variable      ${ns}
    ${program_name} =       Generate Random String
    Set suite variable      ${program_name}
    ${short_summary} =      Generate Random String
    Set suite variable      ${short_summary}
    ${target_population} =  Generate Random String
    Set suite variable      ${target_population}
    ${description} =        Generate Random String
    Set suite variable      ${description}



*** Test Cases ***

Create a Program via UI
    [Documentation]                        This test creates Program and verifies that the Program record
    ...                                    has all the values from the form
    Go To PMM App
    Go To Page                             Listing                               ${ns}Program__c
    Click Object Button                    New
    verify current page title              New Program
    Populate modal Form                    Program Name=${program_name}
    ...                                    Status=Active
    ...                                    Short Summary=${short_summary}
    ...                                    Target Population=${target_population}
    ...                                    Description=${description}
    ...                                    Start Date=10
    ...                                    End Date=25
    ...                                    Program Issue Area=Education
    Click modal button                     Save
    Wait Until Modal Is Closed
    verify page header                     Program
    verify details                         Program Name    contains    ${program_name}
    verify page contains related list      Services
    verify page contains related list      Program Engagements
    verify page contains related list      Program Cohorts
    verify page contains related list      Files

Date validation on new program dialog
    [Documentation]                        This test opens the new program dialog and enters a end date earlier than start date
    ...                                    and verifies that an error message is displayed
    [tags]                                 W-041962  feature:Program
    Go To PMM App
    Go To Page                             Listing                               ${ns}Program__c
    Click Object Button                    New
    verify current page title              New Program
    Populate modal Form                    Program Name=${program_name}
    ...                                    Status=Active
    ...                                    Start Date=25
    ...                                    End Date=10
    Click modal button                     Save
    verify modal error                     Start Date must be before End Date
