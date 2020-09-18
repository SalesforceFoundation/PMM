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
    &{contact} =                   API Create Contact
    Set suite variable             &{contact}
    &{program} =                   API Create Program
    Set suite variable             &{program}
    ${today} =                     Get Current Date               result_format=%-m/%-d/%Y
    Set suite variable             ${today}
    ${created_date} =              Get Current Date               result_format=%Y-%m-%d
    Set suite variable             ${created_date}

*** Test Cases ***
Autopopulate fields when stage is set to Applied
     [Documentation]                         Autopopulates application date and PE name with anonymous when the stage is set as 
     ...                                     applied on new program engagment dialog
     [tags]                                  W-037569   feature:Program Engagement
     Go To PMM App
     Go To Page                              Listing                         ${ns}ProgramEngagement__c
     Click Object Button                     New
     Wait For Modal                          New                             Program Engagement
     Populate Modal Form                     Program Engagement Name= ${program_engagement_name}
     Populate Lightning fields               Stage=Applied
     ...                                     Program=&{program}[Name]
     ...                                     Role=Volunteer
     Click Dialog Button                     Save
     Wait Until Modal Is Closed
     Verify Details                          Application Date                 contains               ${today}
     Verify Details                          Program Engagement Name          contains               Anonymous ${created_date}: ${program}[Name]           
     Save Current Record ID For Deletion     ${ns}ProgramEngagement__c

Autopopulate fields when stage is set to Completed
     [Documentation]                         Autopopulates end date and PE name with anonymous when the stage is set as 
     ...                                     completed on new program engagment dialog
     [tags]                                  W-037569   feature:Program Engagement
     Go To PMM App
     Go To Page                              Listing                         ${ns}ProgramEngagement__c
     Click Object Button                     New
     Wait For Modal                          New                             Program Engagement
     Populate Modal Form                     Program Engagement Name= ${program_engagement_name}
     Populate Lightning fields               Stage=Completed
     ...                                     Program=&{program}[Name]
     ...                                     Role=Volunteer
     Click Dialog Button                     Save
     Wait Until Modal Is Closed
     Verify Details                          End Date                         contains               ${today}
     Verify Details                          Program Engagement Name          contains               Anonymous ${created_date}: ${program}[Name]           
     Save Current Record ID For Deletion     ${ns}ProgramEngagement__c

Autopopulate fields when stage is set to Withdrawn
     [Documentation]                         Autopopulates end date and PE name with anonymous when the stage is set as 
     ...                                     withdrawn on new program engagment dialog
     [tags]                                  W-037569   feature:Program Engagement
     Go To PMM App
     Go To Page                              Listing                         ${ns}ProgramEngagement__c
     Click Object Button                     New
     Wait For Modal                          New                             Program Engagement
     Populate Modal Form                     Program Engagement Name= ${program_engagement_name}
     Populate Lightning fields               Stage=Withdrawn
     ...                                     Program=&{program}[Name]
     ...                                     Role=Service Provider
     Click Dialog Button                     Save
     Wait Until Modal Is Closed
     Verify Details                          End Date                         contains               ${today}
     Verify Details                          Program Engagement Name          contains               Anonymous ${created_date}: ${program}[Name]           
     Save Current Record ID For Deletion     ${ns}ProgramEngagement__c
