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
Clients missing phone number report on Homepage
    [Documentation]             Go to homepage and validate 'Clients missing phone number' report is displayed
    [tags]                      W-8956949   perm:admin   perm:manage   perm:deliver   perm:view   feature:Homepage
    Go to Page                  Home                    Homepage
    Maximize Browser Window
    Page Should Contain         Client Records Missing Phone

Active Program Engagements report on Homepage
    [Documentation]             Go to homepage and validate 'Active Program Engagements' report is displayed
    [tags]                      W-8956949   perm:admin   perm:manage   perm:deliver   perm:view   feature:Homepage
    Go to Page                  Home                    Homepage
    Page Should Contain         All Active Program Engagements 

Services Delivered report on Homepage
    [Documentation]             Go to homepage and validate 'Services Delivered (Year to Date)' report is displayed
    [tags]                      W-8956949   perm:admin   perm:manage   perm:deliver   perm:view   feature:Homepage
    Go to Page                  Home                    Homepage
    Page Should Contain         Services Delivered (Year to Date)
