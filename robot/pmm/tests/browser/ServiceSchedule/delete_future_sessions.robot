*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/ServiceSchedulePageObject.py
...            robot/pmm/resources/ServicePageObject.py
Suite Setup     Run Keywords
...             Open test browser            useralias=${test_user}             AND
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Variables ***
${test_user}             UUser

*** Keywords ***
Setup Test Data
    [Documentation]                 Creates a Service Schedule using API.
    ${ns} =                         Get PMM Namespace Prefix
    Set suite variable              ${ns}
    ${program} =                    API Create Program
    Set suite variable              ${program}
    ${service} =                    API Create Service                  ${Program}[Id]
    Set suite variable              ${service}
    ${service_schedule} =           API Create Service Schedule         ${service}[Id]
    Set suite variable              ${service_schedule}

*** Test Cases ***
Delete Future Service Sessions quick action
    [Documentation]                        Navigates to service schedule details page, verifies the number of upcoming service sessions,
    ...                                    clicks delete future service session button, confirms toast and updated number of sessions.
    [tags]                                 W-XXXXXX     perm:admin   perm:manage     perm:deliver    feature:Service Schedule 
    Go To Page                              Details                        ServiceSchedule__c           object_id=${service_schedule}[Id]
    Verify Details                          Service Schedule Name          contains                   ${service_schedule}[Name]
    Click Quick Action Button               Delete Future Service Sessions
    Click Dialog Button                     Delete
    Verify Toast Message                    Successfully deleted 0 Service Sessions.