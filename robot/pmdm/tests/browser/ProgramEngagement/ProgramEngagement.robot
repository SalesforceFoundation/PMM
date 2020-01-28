*** Settings ***

Resource       robot/pmdm/resources/pmdm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmdm/resources/pmdm.py
...            robot/pmdm/resources/ProgramPageObject.py
...            robot/pmdm/resources/ProgramEngagementPageObject.py
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

Create Program Engagemnet from Program Object

     Go To Page      Details              Program__c                   object_id=&{program}[Id]
     page should contain                    &{program}[Name]
     Click Wrapper Related List Button      Program Engagements     New
     Current Page Should Be                 NewProgramEngagement                   ProgramEngagement__c
     Populate New Program Engagement Form   Program Engagement Name= ${program_engagement_name}
     ...                                    Stage=Applied
     ...                                    Role=Client
     ...                                    Start Date=${start_date}
     ...                                    End Date=${end_date}
     populate lookup                        Search Contacts         &{contact}[FirstName] &{contact}[LastName]
     Click Save Button
     Wait Until Modal Is Closed
     current page should be                 Details                                 Program__c
     click new related record link          &{program}[Name]
     ${program_engagement_id} =            Save Current Record ID For Deletion     ProgramEngagement__c
     Page Should Contain                   ${program_engagement_name}