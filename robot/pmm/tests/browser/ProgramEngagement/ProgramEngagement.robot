*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ProgramEngagementPageObject.py
...            robot/pmm/resources/ProgramPageObject.py
Suite Setup     Run Keywords
...             Open test browser            useralias=${test_user}             AND
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Variables ***
${test_user}             UUser


*** Keywords ***
Setup Test Data
    [Documentation]                Creates Program records and program cohort using API, Sets the fields required to create a program engagment record.
    ${ns} =                        Get PMM Namespace Prefix
    Set suite variable             ${ns}
    ${program_engagement_name} =   Generate Random String
    Set suite variable             ${program_engagement_name}
    ${contact} =                   API Create Contact
    Set suite variable             ${contact}
    ${program} =                   API Create Program
    Set suite variable             ${program}
    ${program1} =                  API Create Program
    Set suite variable             ${program1}
    ${program cohort1} =           API Create Program Cohort          ${Program1}[Id]
    Set suite variable             ${program cohort1}


*** Test Cases ***
Validate Waitlisted PE Listview
    [Documentation]                        This test opens the Waitlisted PE listview and verifies that it contains 
    ...                                    Client, Program and Stage fields
    [tags]                                 perm:admin   perm:manage   perm:deliver   perm:view   feature:Program Engagement
    Go To Page                             Listing                               ${ns}ProgramEngagement__c
    Select Listview                        Waitlisted Program Engagements
    Page Should Contain                    Client
    Page Should Contain                    Program
    Page Should Contain                    Stage

Create Program Engagement
     [Documentation]                         Creates a Program Engagement on Program Record by clicking "New" button in Related list.
     [tags]                                  W-037565      perm:admin   perm:manage       perm:deliver    feature:Program Engagement
     Go To Page                              Listing                                ${ns}ProgramEngagement__c
     Click Object Button                     New
     Wait For Modal                          New                                    Program Engagement
     Populate Field                          Program Engagement Name                ${program_engagement_name}
     Populate Lookup Field                   Program                                ${program}[Name]
     Populate Lookup Field                   Client                                 ${contact}[FirstName] ${contact}[LastName]
     Select Value From Dropdown              Stage                                  Applied
     Select Value From Dropdown              Role                                   Volunteer
     Click Dialog Button                     Save
     Wait Until Modal Is Closed
     Verify Details                          Program                  contains                  ${program}[Name]
     Verify Details                          Client                   contains                  ${contact}[FirstName] ${contact}[LastName]
     Page Should Not Contain                 ${program_engagement_name}
     Verify Page Contains Related List       Service Deliveries
     Verify Page Contains Related List       Service Participants
     ${program_engagement_id} =              Save Current Record ID For Deletion                ${ns}ProgramEngagement__c


Create Program Engagement with Auto Name Override
    [Documentation]                         Creates a Program Engagement on Program Record by clicking "New" button in Related list
     ...                                    and Checking Auto-Name Override checkbox. Verify PE name is same as what user added.
    [tags]                                  W-037577        perm:admin   perm:manage      perm:deliver    feature:Program Engagement
     Go To Page                             Listing                                ${ns}ProgramEngagement__c
     Click Object Button                    New
     Wait For Modal                         New                                    Program Engagement
     Populate Field                         Program Engagement Name                ${program_engagement_name}
     Populate Lookup Field                  Program                                ${program}[Name]
     Populate Lookup Field                  Client                                 ${contact}[FirstName] ${contact}[LastName]
     Select Value From Dropdown             Stage                                  Applied
     Select Value From Dropdown             Role                                   Volunteer
     Set Checkbox                           Auto-Name Override                      checked
     Click Dialog Button                    Save
     Wait Until Modal Is Closed
     Verify Details                         Program Engagement Name                contains         ${program_engagement_name}
     Verify Page Contains Related List      Service Deliveries
     ${program_engagement_id} =             Save Current Record ID For Deletion    ${ns}ProgramEngagement__c

Date validation for PE when start date is later than end date
     [Documentation]                        This test opens the new program engagement dialog and enters a end date earlier than start date
     ...                                    and verifies that an error message is displayed
     [tags]                                 W-042238   perm:admin   perm:manage       perm:deliver    feature:Program Engagement
     Go To Page                             Listing                                ${ns}ProgramEngagement__c
     Click Object Button                    New
     Wait For Modal                         New                                    Program Engagement
     Populate Field                         Program Engagement Name       ${program_engagement_name}
     Populate Lookup Field                  Program                                ${program}[Name]
     Populate Lookup Field                  Client                                 ${contact}[FirstName] ${contact}[LastName]
     Select Value From Dropdown             Stage                                  Applied
     Select Value From Dropdown             Role                                   Volunteer
     Select From Date Picker                Start Date                               25
     Select From Date Picker                End Date                                 10
     Click Dialog Button                    Save
     Verify Modal Error                     Start Date must be before End Date
     Click Dialog Button                    Cancel

Date validation when program engagement dates are not within program date range
     [Documentation]                        This test opens the program record, edits the start and end dates and goes to the PE listing
     ...                                    page, clicks on new and verifes that an error message is displayed when PE date 
     ...                                    range is outside the program date range 
     [tags]                                 W-042238   perm:admin   perm:manage     perm:deliver    feature:Program Engagement
     Go To Page                             Details                                 Program__c                   object_id=${program}[Id]
     Click Quick Action Button              Edit
     Populate Lightning Fields              Start Date=12
     ...                                    End Date=20
     Click Dialog Button                    Save
     Wait Until Modal Is Closed
     Go To Page                             Listing                                ${ns}ProgramEngagement__c
     Click Object Button                    New
     Wait For Modal                         New                                    Program Engagement
     Populate Field                         Program Engagement Name     ${program_engagement_name}
     Populate Lookup Field                  Program                                ${program}[Name]
     Populate Lookup Field                  Client                                 ${contact}[FirstName] ${contact}[LastName]
     Select Value From Dropdown             Stage                                  Applied
     Select Value From Dropdown             Role                                   Volunteer
     Select From Date Picker                Start Date                               10
     Select From Date Picker                End Date                                 25
     Click Dialog Button                    Save
     Verify Modal Error                     Select an end date that's on or after the program start date and on or before the program end date.
     Verify Modal Error                     Select a start date that's on or after the program start date and on or before the program end date.
     Click Dialog Button                    Cancel

Validate program cohort on new PE dialog
     [Documentation]                        This test opens the new program engagement dialog, enters a cohort that does not lookup to the
     ...                                    program entered the dialog, validates that an error message is displayed when saved
     [tags]                                 W-042238    perm:admin   perm:manage     perm:deliver     feature:Program Engagement
     Go To Page                             Listing                                ${ns}ProgramEngagement__c
     Click Object Button                    New
     Wait For Modal                         New                                    Program Engagement
     Populate Field                         Program Engagement Name                ${program_engagement_name}
     Populate Lookup Field                  Program                                ${program}[Name]
     Populate Lookup Field                  Program Cohort                         ${program cohort1}[Name]
     Select Value From Dropdown             Stage                                  Applied
     Select Value From Dropdown             Role                                   Volunteer
     Click Dialog Button                    Save
     Verify Modal Error                     Select a Program Cohort that matches the Program.
