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
    ${program} =            API Create Program
    Set suite variable      ${program}

*** Test Cases ***
VPP1: View and Deliver Perm Test for Program
     [Documentation]                  Validates that New (Listing Page) and Edit buttons (Record Page) are not 
     ...                              displayed for Programs (View and Deliver Perm Set) 
     [tags]                           unstable    perm:view    perm:deliver      feature:Program
     Go To Page                              Listing                               ${ns}Program__c
     Page Should Not Contain Button          New
     Go To Page                              Details              Program__c                    object_id=${program}[Id]
     Page Should Not Contain Button          Edit
