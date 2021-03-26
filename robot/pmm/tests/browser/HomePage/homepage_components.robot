*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/HomePageObject.py
Suite Setup     Run Keywords
...             Open test browser            useralias=${test_user}             AND
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Variables ***
${test_user}             UUser

*** Keywords ***
Setup Test Data
    ${ns} =                     Get PMM Namespace Prefix
    Set suite variable          ${ns}

*** Test Cases ***
Today's tasks on homepage
    [Documentation]                 Go to homepage and validate 'Today's task' component is displayed
    [tags]                          W-037575   perm:admin   perm:manage   perm:deliver   perm:view   feature:Homepage
    Go to Page                      Home                    Homepage
    Verify Component On HomePage    Today’s Tasks

Recent Items on Homepage
    [Documentation]                 Go to homepage and validate 'Recent Items' component is displayed
    [tags]                          W-037575   perm:admin   perm:manage   perm:deliver   perm:view   feature:Homepage
    Go to Page                      Home                    Homepage
    Verify Component On HomePage    Recent Items
