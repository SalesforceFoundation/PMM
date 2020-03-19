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
    ${program_engagement_name} =   Generate Random String
    Set suite variable      ${program_engagement_name}
    ${start_date} =         Get Current Date   result_format=%m/%d/%Y   increment=1 day
    Set suite variable      ${start_date}
    ${end_date} =           Get Current Date   result_format=%m/%d/%Y  increment=180 days
    Set suite variable      ${end_date}
    &{contact} =         API Create Contact
    Set suite variable    &{contact}
    &{program} =    API Create Program
    Store Session Record  Program__c                              &{program}[Id]
    Set suite variable    &{program}


*** Test Cases ***

Create Program Engagemnet

     [Documentation]                         Creates a Program Engagement on Program Record by clicking "New" button in Related list.
     [tags]                                  W-037565   feature:Program Engagement
     Go To Page     Listing     ProgramEngagement__c
     Click Object Button     New
     Current Page Should Be     NewProgramEngagement    ProgramEngagement__c
     Populate New Program Engagement Form   Program Engagement Name= ${program_engagement_name}
     ...                                    Stage=Applied
     ...                                    Role=Client
     ...                                    Start Date=${start_date}
     ...                                    End Date=${end_date}
     populate lookup                        Search Contacts         &{contact}[FirstName] &{contact}[LastName]
     populate lookup                        Search Programs         &{program}[Name]
     Click Save Button
     Wait Until Modal Is Closed
     current page should be                 Details                                ProgramEngagement__c
     verify details     Program     contains                  &{program}[Name]
     verify details     Client     contains                &{contact}[FirstName] &{contact}[LastName]
     Page Should Not Contain                ${program_engagement_name}
     verify page contains related list      Service Deliveries
     ${program_engagement_id} =            Save Current Record ID For Deletion     ProgramEngagement__c


Create Program Engagement with Auto Name Override

    [Documentation]                         Creates a Program Engagement on Program Record by clicking "New" button in Related list
     ...                                    and Checking Auto-Name Override checkbox. Verify PE name is same as what user added.

    [tags]                                  W-037577   feature:Program Engagement

     Go To Page                             Listing                               ProgramEngagement__c
     Click Object Button                    New
     Current Page Should Be                 NewProgramEngagement                   ProgramEngagement__c
     Populate New Program Engagement Form   Program Engagement Name= ${program_engagement_name}
     ...                                    Stage=Applied
     ...                                    Role=Client
     ...                                    Start Date=${start_date}
     ...                                    End Date=${end_date}
     populate lookup                        Search Contacts         &{contact}[FirstName] &{contact}[LastName]
     populate lookup                        Search Programs         &{program}[Name]
     Select Auto Name Override Checkbox     Auto-Name Override
     Click Save Button
     Wait Until Modal Is Closed
     current page should be                 Details                                ProgramEngagement__c
     verify details     Program Engagement Name     contains         ${program_engagement_name}
     verify page contains related list      Service Deliveries
     ${program_engagement_id} =            Save Current Record ID For Deletion     ProgramEngagement__c
