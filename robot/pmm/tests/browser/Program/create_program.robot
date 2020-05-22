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
