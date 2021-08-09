*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
Suite Setup     Run Keywords
...             Open test browser            useralias=${test_user}             AND
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Variables ***
${test_user}             UUser

*** Keywords ***
Setup Test Data
    [Documentation]                Gets PMM namespace prefix.
    ${ns} =                        Get PMM Namespace Prefix
    Set suite variable             ${ns}

*** Test Cases ***
Validate Attendance Tab
    [Documentation]                        Opens Attendance tab and confirms message on screen.
    [tags]                                 W-9607506   perm:admin   perm:manage   perm:deliver   perm:view   feature:Attendance
    Select App From All Items              Attendance                         
    Page Should Contain                    This tab is used only for printing attendance from a Service Session page.