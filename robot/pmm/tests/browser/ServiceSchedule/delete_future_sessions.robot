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
    [Documentation]                 Creates a Service Schedule and Service Sessions using API.
    ${ns} =                         Get PMM Namespace Prefix
    Set suite variable              ${ns}
    ${program} =                    API Create Program
    Set suite variable              ${program}
    ${service} =                    API Create Service                  ${Program}[Id]
    Set suite variable              ${service}
    ${service_schedule} =           API Create Service Schedule         ${service}[Id]
    Set suite variable              ${service_schedule}
    
    ${past_date} =                  Get Current Date                    increment=-2 days           result_format=%Y-%m-%dT%H:%M:%S.%f   
    Set suite variable              ${past_date}
    ${service_session1} =           API Create Service Session          ${service_schedule}[Id]     Complete
    Set suite variable              ${service_session1}
    API Update Records              ${ns}ServiceSession__c              ${service_session1}[Id]     ${ns}SessionStart__c=${past_date}
    
    ${future_date} =                Get Current Date                    increment=2 days            result_format=%Y-%m-%dT%H:%M:%S.%f   
    Set suite variable              ${future_date}
    ${service_session2} =           API Create Service Session          ${service_schedule}[Id]     Pending 
    Set suite variable              ${service_session2}
    API Update Records              ${ns}ServiceSession__c              ${service_session2}[Id]     ${ns}SessionStart__c=${future_date}

*** Test Cases ***
Delete Future Service Sessions quick action
    [Documentation]                        Navigates to service schedule details page, clicks delete future service session button,
    ...                                    confirms session has been deleted.
    [tags]                                 W-9597787     perm:admin   perm:manage    feature:Service Schedule 
    Go To Page                              Details                        ServiceSchedule__c           object_id=${service_schedule}[Id]
    Verify Details                          Service Schedule Name          contains                   ${service_schedule}[Name]
    Click Quick Action Button               Delete Future Service Sessions
    Populate Lightning Fields               Date=Today
    Click Dialog Button                     Delete
    Page Should Not Contain                 ${service_session2}
