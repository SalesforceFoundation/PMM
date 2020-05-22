*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ProgramEngagementPageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Delete Records and Close Browser

*** Keywords ***
Setup Test Data
    ${ns} =                        Get PMM Namespace Prefix
    Set suite variable             ${ns}
    ${program_engagement_name} =   Generate Random String
    Set suite variable             ${program_engagement_name}
    &{contact} =                   API Create Contact
    Set suite variable             &{contact}
    &{program} =                   API Create Program
    Store Session Record           ${ns}Program__c         &{program}[Id]
    Set suite variable             &{program}


*** Test Cases ***

Create Program Engagemnet

     [Documentation]                         Creates a Program Engagement on Program Record by clicking "New" button in Related list.
     [tags]                                  W-037565   feature:Program Engagement
     Go To PMM App
     Go To Page                              Listing                                ${ns}ProgramEngagement__c
     Click Object Button                     New
     Load Page Object                        NewProgramEngagement                   ${ns}ProgramEngagement__c
     verify current page title               New Program Engagement
     Populate modal Form                     Program Engagement Name= ${program_engagement_name}
     ...                                     Stage=Applied
     ...                                     Client=&{contact}[FirstName] &{contact}[LastName]
     ...                                     Program=&{program}[Name]
     ...                                     Role=Client
     ...                                     Start Date=10
     ...                                     End Date=25
     Click modal button                      Save
     Wait Until Modal Is Closed
     verify page header                      Program Engagement
     verify details                          Program                  contains                  &{program}[Name]
     verify details                          Client                   contains                  &{contact}[FirstName] &{contact}[LastName]
     Page Should Not Contain                 ${program_engagement_name}
     verify page contains related list       Service Deliveries
     ${program_engagement_id} =              Save Current Record ID For Deletion                ${ns}ProgramEngagement__c


Create Program Engagement with Auto Name Override

    [Documentation]                         Creates a Program Engagement on Program Record by clicking "New" button in Related list
     ...                                    and Checking Auto-Name Override checkbox. Verify PE name is same as what user added.

    [tags]                                  W-037577   feature:Program Engagement
     Go To Page                             Listing                                ${ns}ProgramEngagement__c
     Click Object Button                    New
     Load Page Object                       NewProgramEngagement                   ${ns}ProgramEngagement__c
     verify current page title              New Program Engagement
     Populate modal Form                    Program Engagement Name= ${program_engagement_name}
     ...                                    Auto-Name Override=checked
     ...                                    Stage=Applied
     ...                                    Client=&{contact}[FirstName] &{contact}[LastName]
     ...                                    Program=&{program}[Name]
     ...                                    Role=Client
     ...                                    Start Date=10
     ...                                    End Date=25
     Click modal button                     Save
     Wait Until Modal Is Closed
     verify page header                     Program Engagement
     verify details                         Program Engagement Name                contains         ${program_engagement_name}
     verify page contains related list      Service Deliveries
     ${program_engagement_id} =             Save Current Record ID For Deletion    ${ns}ProgramEngagement__c
