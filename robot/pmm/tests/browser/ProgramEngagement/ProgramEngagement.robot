*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ProgramEngagementPageObject.py
...            robot/pmm/resources/ProgramPageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Keywords ***
Setup Test Data
    ${ns} =                        Get PMM Namespace Prefix
    Set suite variable             ${ns}
    ${program_engagement_name} =   Generate Random String
    Set suite variable             ${program_engagement_name}
    ${contact} =                   API Create Contact
    Set suite variable             ${contact}
    ${program} =                   API Create Program
    Set suite variable             ${program}


*** Test Cases ***
Create Program Engagement
     [Documentation]                         Creates a Program Engagement on Program Record by clicking "New" button in Related list.
     [tags]                                  W-037565   feature:Program Engagement
     Go To PMM App
     Go To Page                              Listing                                ${ns}ProgramEngagement__c
     Click Object Button                     New
     Wait For Modal                          New                                    Program Engagement
     Populate Field                          Program Engagement Name                ${program_engagement_name}
     Populate Lightning Fields               Stage=Applied
     ...                                     Client=&{contact}[FirstName] &{contact}[LastName]
     ...                                     Program=&{program}[Name]
     ...                                     Role=Volunteer
     Click Dialog Button                     Save
     Wait Until Modal Is Closed
     Verify Details                          Program                  contains                  &{program}[Name]
     Verify Details                          Client                   contains                  &{contact}[FirstName] &{contact}[LastName]
     Page Should Not Contain                 ${program_engagement_name}
     Verify Page Contains Related List       Service Deliveries
     ${program_engagement_id} =              Save Current Record ID For Deletion                ${ns}ProgramEngagement__c


Create Program Engagement with Auto Name Override
    [Documentation]                         Creates a Program Engagement on Program Record by clicking "New" button in Related list
     ...                                    and Checking Auto-Name Override checkbox. Verify PE name is same as what user added.
    [tags]                                  W-037577   feature:Program Engagement
     Go To Page                             Listing                                ${ns}ProgramEngagement__c
     Click Object Button                    New
     Wait For Modal                         New                                    Program Engagement
     Populate Field                         Program Engagement Name                ${program_engagement_name}
     Populate Lightning fields              Stage=Applied
     ...                                    Client=&{contact}[FirstName] &{contact}[LastName]
     ...                                    Program=&{program}[Name]
     ...                                    Role=Volunteer
     Set Checkbox                           Auto-Name Override                      checked
     Click Dialog Button                    Save
     Wait Until Modal Is Closed
     Verify Details                         Program Engagement Name                contains         ${program_engagement_name}
     Verify Page Contains Related List      Service Deliveries
     ${program_engagement_id} =             Save Current Record ID For Deletion    ${ns}ProgramEngagement__c

Date validation for PE when start date is later than end date
     [Documentation]                        This test opens the new program engagement dialog and enters a end date earlier than start date
     ...                                    and verifies that an error message is displayed
     [tags]                                 W-042238   feature:Program Engagement
     Go To Page                             Listing                                ${ns}ProgramEngagement__c
     Click Object Button                    New
     Wait For Modal                         New                                    Program Engagement
     Populate Modal Form                    Program Engagement Name= ${program_engagement_name}
     Populate Lightning fields              Stage=Applied
     ...                                    Client=&{contact}[FirstName] &{contact}[LastName]
     ...                                    Program=&{program}[Name]
     ...                                    Role=Volunteer
     ...                                    Start Date=25
     ...                                    End Date=10
     Click Dialog Button                    Save
     Verify Modal Error                     Start Date must be before End Date
     Click Dialog Button                    Cancel

Date validation when program engagement dates are not within program date range
     [Documentation]                        This test opens the program record, edits the start and end dates and goes to the PE listing
     ...                                    page, clicks on new and verifes that an error message is displayed when PE date 
     ...                                    range is outside the program date range 
     [tags]                                 W-042238   feature:Program Engagement
     Go To Page                             Details                                 Program__c                   object_id=${program}[Id]
     Click Quick Action Button              Edit
     Verify Current Page Title              Edit ${program}[Name]
     Populate Lightning Fields              Start Date=12
     ...                                    End Date=20
     Click Dialog Button                    Save
     Wait Until Modal Is Closed
     Go To Page                             Listing                                ${ns}ProgramEngagement__c
     Click Object Button                    New
     Wait For Modal                         New                                    Program Engagement
     Populate Modal Form                    Program Engagement Name= ${program_engagement_name}
     Populate Lightning fields              Stage=Applied
     ...                                    Client=&{contact}[FirstName] &{contact}[LastName]
     ...                                    Program=&{program}[Name]
     ...                                    Role=Volunteer
     Select From Date Picker                Start Date                               10
     Select From Date Picker                End Date                                 25
     Click Dialog Button                    Save
     Verify Modal Error                     Select an end date that's on or after the program start date and on or before the program end date.
     Verify Modal Error                     Select a start date that's on or after the program start date and on or before the program end date.