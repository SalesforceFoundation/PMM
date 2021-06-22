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
    [Documentation]                Creates program with start date set to today/later than today/earlier than today using API
    ${ns} =                        Get PMM Namespace Prefix
    Set suite variable             ${ns}
    ${program_engagement_name} =   Generate Random String
    Set suite variable             ${program_engagement_name}
    ${contact} =                   API Create Contact
    Set suite variable             ${contact}
    ${program} =                   API Create Program
    Set suite variable             ${program}
    ${today} =                     Get Current Date               result_format=%-m/%-d/%Y
    Set suite variable             ${today}
    ${created_date} =              Get Current Date               result_format=%Y-%m-%d
    Set suite variable             ${created_date}
    ${future_date} =               Get Current Date               result_format=%Y-%m-%d            increment=5 days
    Set suite variable             ${future_date}
    ${earlier_date} =              Get Current Date               result_format=%Y-%m-%d            increment=-5 days
    Set suite variable             ${earlier_date}
    ${start_date} =                Get Current Date               result_format=%-m/%-d/%Y            increment=-5 days
    Set suite variable             ${start_date}
    ${program1} =                  API Create Program            ${ns}StartDate__c=${future_date}
    Set suite variable             ${program1}
    ${program2} =                  API Create Program            ${ns}StartDate__c=${created_date}
    Set suite variable             ${program2}
    ${program3} =                  API Create Program            ${ns}StartDate__c=${earlier_date}
    Set suite variable             ${program3}

*** Test Cases ***
Autopopulate fields when stage is set to Applied
     [Documentation]                         Autopopulates application date and PE name with anonymous when the stage is set as 
     ...                                     applied on new program engagment dialog
     [tags]                                  W-037569    perm:admin   perm:manage    perm:deliver   feature:Program Engagement
     Go To Page                              Listing                         ${ns}ProgramEngagement__c
     Click Object Button                     New
     Wait For Modal                          New                            Program Engagement
     Populate Field                          Program Engagement Name        ${program_engagement_name}
     Populate Lookup Field                   Program                        ${program}[Name]
     Select Value From Dropdown              Stage                          Applied
     Select Value From Dropdown              Role                           Volunteer
     Click Dialog Button                     Save
     Wait Until Modal Is Closed
     Verify Details                          Application Date                 contains               ${today}
     Verify Details                          Program Engagement Name          contains               Anonymous ${created_date}: ${program}[Name]           
     Save Current Record ID For Deletion     ${ns}ProgramEngagement__c

Autopopulate fields when stage is set to Completed
     [Documentation]                         Autopopulates end date and PE name with anonymous when the stage is set as 
     ...                                     completed on new program engagment dialog
     [tags]                                  W-037569       perm:admin   perm:manage     perm:deliver      feature:Program Engagement
     Go To Page                              Listing                         ${ns}ProgramEngagement__c
     Click Object Button                     New
     Wait For Modal                          New                             Program Engagement
     Populate Field                          Program Engagement Name        ${program_engagement_name}
     Populate Lookup Field                   Program                        ${program}[Name]
     Select Value From Dropdown              Stage                          Completed
     Select Value From Dropdown              Role                           Volunteer
     Click Dialog Button                     Save
     Wait Until Modal Is Closed
     Verify Details                          End Date                         contains               ${today}
     Verify Details                          Program Engagement Name          contains               Anonymous ${created_date}: ${program}[Name]           
     Save Current Record ID For Deletion     ${ns}ProgramEngagement__c

Autopopulate fields when stage is set to Withdrawn
     [Documentation]                         Autopopulates end date and PE name with anonymous when the stage is set as 
     ...                                     withdrawn on new program engagment dialog
     [tags]                                  W-037569     perm:admin   perm:manage     perm:deliver   feature:Program Engagement
     Go To Page                              Listing                         ${ns}ProgramEngagement__c
     Click Object Button                     New
     Wait For Modal                          New                             Program Engagement
     Populate Field                          Program Engagement Name        ${program_engagement_name}
     Populate Lookup Field                   Program                        ${program}[Name]
     Select Value From Dropdown              Stage                          Withdrawn
     Select Value From Dropdown              Role                           Service Provider
     Click Dialog Button                     Save
     Wait Until Modal Is Closed
     Verify Details                          End Date                         contains               ${today}
     Verify Details                          Program Engagement Name          contains               Anonymous ${created_date}: ${program}[Name]           
     Save Current Record ID For Deletion     ${ns}ProgramEngagement__c

Autopopulate fields when stage is set to Active with Program start date is later than today
     [Documentation]                         Validates that start date is not set to today when stage is 'Active' and Program
     ...                                     start date is later than 'Today'
     [tags]                                  W-8746330      perm:admin   perm:manage     perm:deliver    feature:Program Engagement
     Go To Page                              Listing                         ${ns}ProgramEngagement__c
     Click Object Button                     New
     Wait For Modal                          New                             Program Engagement
     Populate Field                          Program Engagement Name        ${program_engagement_name}
     Select Value From Dropdown              Stage               Active
     Populate Lookup Field                   Program                        ${program1}[Name]
     Select Value From Dropdown              Role                           Service Provider
     Click Dialog Button                     Save
     Wait Until Modal Is Closed
     Verify Details                          Start Date                      does not contain               ${today}
     Save Current Record ID For Deletion     ${ns}ProgramEngagement__c

Autopopulate fields when stage is set to Active with Program start date is today
     [Documentation]                         Validates that start date is set to today when stage is 'Active' and Program
     ...                                     start date is than 'Today'
     [tags]                                  W-8746330      perm:admin   perm:manage     perm:deliver    feature:Program Engagement
     Go To Page                              Listing                         ${ns}ProgramEngagement__c
     Click Object Button                     New
     Wait For Modal                          New                             Program Engagement
     Populate Field                          Program Engagement Name     ${program_engagement_name}
     Select Value From Dropdown              Stage               Active
     Populate Lookup Field                   Program                        ${program2}[Name]
     Select Value From Dropdown              Role                           Service Provider
     Click Dialog Button                     Save
     Wait Until Modal Is Closed
     Verify Details                          Start Date                      contains               ${today}
     Save Current Record ID For Deletion     ${ns}ProgramEngagement__c

Autopopulate fields when stage is set to Applied with Program start date is earlier than today
     [Documentation]                         Validates that application date is not set to today when stage is 'Active' and Program
     ...                                     start date is earlier than 'Today'
     [tags]                                  W-8746330      perm:admin   perm:manage     perm:deliver    feature:Program Engagement
     Go To Page                              Listing                         ${ns}ProgramEngagement__c
     Click Object Button                     New
     Wait For Modal                          New                             Program Engagement
     Populate Field                          Program Engagement Name       ${program_engagement_name}
     Select Value From Dropdown              Stage               Applied
     Populate Lookup Field                   Program                        ${program3}[Name]
     Select Value From Dropdown              Role                           Service Provider
     Populate Field                          Start Date               ${start_date}
     Click Dialog Button                     Save
     Wait Until Modal Is Closed
     Verify Details                          Application Date                 does not contain               ${today}
     Save Current Record ID For Deletion     ${ns}ProgramEngagement__c
