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
    [Documentation]                 Creates program and service using API
    ${ns} =                         Get PMM Namespace Prefix
    Set suite variable              ${ns}
    ${program} =                    API Create Program
    Set suite variable              ${program}
    ${service} =                    API Create Service                  ${Program}[Id]
    Set suite variable              ${service}
    ${service_schedule_name} =      Generate New String
    Set suite variable              ${service_schedule_name}
    ${today} =                      Get Current Date                    result_format=%-m/%-d/%Y
    Set suite variable              ${today}
    ${earlier_date} =               Get Current Date                    result_format=%-m/%-d/%Y            increment=-5 days
    Set suite variable              ${earlier_date}

*** Test Cases ***
SS1.1: Validate data on Screen1
    [Documentation]                        Validates that start date cannot be after end date
    ...                                    Validates that if Frequency=Daily/Weekly/Monthly, a session end time or session end after is set
    [tags]                                 W-8445950   quadrant:Q2   perm:admin   perm:manage        feature:Service Schedule
    Go To PMM App
    Go To Page                              Details                        Service__c           object_id=${service}[Id]
    Click Wrapper Related List Button       Service Schedules              New
    Current Page Should Be                  New                            ServiceSchedule__c
    Verify Wizard Screen Title              Service Schedule Information
    Populate Field                          Service Schedule Name               ${service_schedule_name}
    Set End Date                            First Session End                   ${earlier_date}
    Set Frequency                           Weekly
    Click Dialog Button                     Next
    Page Should Contain                     First Session Start must be before First Session End
    Page Should Contain                     Select either a Service Schedule End Date or a Number of Service Sessions.