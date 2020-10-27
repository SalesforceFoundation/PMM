*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ProgramPageObject.py
...            robot/pmm/resources/ProgramEngagementPageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser


*** Keywords ***
Setup Test Data
    ${ns} =               Get PMM Namespace Prefix
    Set suite variable    ${ns}
    &{program} =          API Create Program
    Set suite variable    &{program}
    &{contact} =          API Create Contact
    Set suite variable    &{contact}
    &{contact1} =          API Create Contact
    Set suite variable    &{contact1}
    &{program_cohort} =   API Create Program Cohort       &{Program}[Id]
    Set suite variable    &{program_cohort}
    ${result_date} =      Get Current Date                result_format=%Y-%m-%d
    Set suite variable    ${result_date}
    ${today} =            Get Current Date               result_format=%-m/%-d/%Y
    Set suite variable    ${today}
    &{program1} =         API Create Program
    Set suite variable    &{program1}
    &{contact} =          API Create Contact
    Set suite variable    &{contact}
    &{program_cohort1} =  API Create Program Cohort       &{Program1}[Id]
    Set suite variable    &{program_cohort1}

*** Test Cases ***
Add contact to program quick action on Program
     Go To PMM App
     Go To Page                       Details                                 Program__c                    object_id=&{program}[Id]
     page should contain              &{program}[Name]
     click quick action button        Add Contact to Program
     Load Page Object                 NewProgramEngagement                    ${ns}ProgramEngagement__c
     verify current page title        Add Contact to Program
     Populate Modal form              Client=&{contact}[FirstName] &{contact}[LastName]
     ...                              Role=Client
     ...                              Stage=Enrolled
     ...                              Start Date=Today
     Populate Lightning Fields        Program Cohort=&{program_cohort}[Name]
     Click Modal button               Save
     Wait Until Modal Is Closed
     Current Page Should Be           Details               Program__c
     Load Related List                Program Engagements
     click new related record link    &{contact}[FirstName] &{contact}[LastName] ${result_date}: &{program}[Name]
     verify details                   Program Engagement Name                 contains                      &{contact}[FirstName] &{contact}[LastName] ${result_date}: &{program}[Name]
     ${programcohort_id} =            Save Current Record ID For Deletion     ${ns}ProgramCohort__c
     ${programengagement_id} =        Save Current Record ID For Deletion     ${ns}ProgramEngagement__c

Validate cohort and PE look up to the same program
     [Documentation]                This test loads the program record, clicks on add contact to program quick action. Verifies that
     ...                            an error message is displayed when program cohort and PE do not lookup to the same program
     [tags]                         W-042769  feature:Program Engagement
     Go To Page                     Details                                  Program__c           object_id=${program}[Id]
     Verify Details                 Program Name                             contains             ${program}[Name]
     Click Quick Action Button      Add Contact to Program
     Populate Lookup Field          Client                                  ${contact}[FirstName] ${contact}[LastName]
     Populate Modal Form            Role=Client
     ...                            Stage=Applied
     ...                            Program Cohort=${program_cohort1}[Name]
     Click Modal Button             Save
     Verify Modal Error             Select a Program Cohort that matches the Program.

Autopopulate fields when stage is set to Applied and Start Date is today
     [Documentation]                Autopopulates PE name with anonymous and verifies that application date is not set to today when  
     ...                            the stage is set as applied and start date is set to today on new program engagment dialog
     [tags]                         W-037569   feature:Program Engagement
     Go To Page                              Details                                  Program__c           object_id=${program}[Id]
     Verify Details                          Program Name                             contains             ${program}[Name]
     Click Quick Action Button               Add Contact to Program 
     Populate Lookup Field                   Client                                  ${contact1}[FirstName] ${contact1}[LastName]
     Populate Modal Form                     Role=Client
     ...                                     Stage=Applied
     ...                                     Start Date=Today
     Click Modal Button                      Save
     Wait Until Modal Is Closed
     click new related record link           &{contact1}[FirstName] &{contact1}[LastName] ${result_date}: &{program}[Name]
     Verify Details                          Application Date                  does not contain       ${today}  
     Verify Details                          Program Engagement Name           contains              &{contact1}[FirstName] &{contact1}[LastName] ${result_date}: &{program}[Name]     
     Save Current Record ID For Deletion     ${ns}ProgramEngagement__c
