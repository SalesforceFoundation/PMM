*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ProgramPageObject.py
...            robot/pmm/resources/ProgramEngagementPageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Delete Records and Close Browser


*** Keywords ***
Setup Test Data
    &{program} =    API Create Program
    Store Session Record  Program__c                              &{program}[Id]
    Set suite variable    &{program}
    &{contact} =         API Create Contact
    Set suite variable    &{contact}
    &{program_cohort} =    API Create Program Cohort  &{Program}[Id]
    Set suite variable    &{program_cohort}
    ${start_date} =         Get Current Date   result_format=%m/%d/%Y   increment=1 day
    Set suite variable      ${start_date}

*** Test Cases ***
Add contact to program quick action
     Go To Page      Details              Program__c                   object_id=&{program}[Id]
     page should contain                    &{program}[Name]
     click quick action button   Add Contact to Program
     Load Page Object  NewProgramEngagement  ProgramEngagement__c
     verify current page    Add Contact to Program
     Populate Program Engagement quickaction form             Role=Client
     ...                                                      Stage=Enrolled
     ...                                                      Start Date=${start_date}
     populate lookup                        Search Contacts         &{contact}[FirstName] &{contact}[LastName]
     populate lookup                        Search Program Cohorts         &{program_cohort}[Name]
     Click Modal button     Save
     Wait Until Modal Is Closed
     current page should be                 Details                                 Program__c
     Load Related List  Program Engagements
     click new related record link    &{program}[Name] - &{contact}[FirstName] &{contact}[LastName]
     verify details     Program Engagement Name     contains    &{program}[Name] - &{contact}[FirstName] &{contact}[LastName]
     ${programcohort_id} =            Save Current Record ID For Deletion     ProgramCohort__c
     ${programengagement_id} =            Save Current Record ID For Deletion     ProgramEngagement__c
