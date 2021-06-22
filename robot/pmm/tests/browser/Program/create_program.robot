*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ProgramPageObject.py
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
    [tags]                                 perm:admin   perm:manage         feature:Program
    Go To Page                              Listing                               ${ns}Program__c
    Click Object Button                     New
    Wait for Modal                          New                     Program__c
    Populate Field                          Program Name            ${program_name}
    Populate Field                          Short Summary           ${short_summary}
    Populate Field                          Target Population       ${target_population}
    Populate Field                          Description             ${description}
    Populate Lightning Fields               Start Date=10
    ...                                     End Date=25
    ...                                     Status=Active
    ...                                     Program Issue Area=Education
    Click Dialog button                            Save
    Wait Until Modal Is Closed  
    Verify Details                         Program Name    contains    ${program_name}
    Verify Page Contains Related List      Services
    Verify Page Contains Related List      Program Engagements
    Verify Page Contains Related List      Program Cohorts
    Verify Page Contains Related List      Files

Verify Programs listview
    [Documentation]                        This test opens the programs listview and verifies that it contains 
    ...                                    the program name and short summary fields
    [tags]                                 W-9056626    perm:admin   perm:manage   perm:deliver   perm:view   feature:Program
    Go To Page                             Listing                               ${ns}Program__c
    Page Should Contain                    Program Name
    Page Should Contain                    Short Summary

Date validation on new program dialog
    [Documentation]                        This test opens the new program dialog and enters a end date earlier than start date
    ...                                    and verifies that an error message is displayed
    [tags]                                 W-041962    perm:admin   perm:manage    feature:Program
    Go To Page                             Listing                               ${ns}Program__c
    Click Object Button                    New
    Verify Current Page Title              New Program
    Populate Field                         Program Name     ${program_name}
    Select Value From Dropdown             Status           Active
    Populate Lightning Fields              Start Date=25
    ...                                    End Date=10
    Click Dialog button                    Save
    Verify Modal Error                     Start Date must be before End Date
