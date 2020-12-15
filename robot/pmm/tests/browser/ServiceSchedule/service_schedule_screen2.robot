*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/ServiceSchedulePageObject.py
...            robot/pmm/resources/ServicePageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser


*** Keywords ***
Setup Test Data
    ${ns} =                         Get PMM Namespace Prefix
    Set suite variable              ${ns}
    ${program} =                    API Create Program
    Set suite variable              ${program}
    ${service} =                    API Create Service                  ${Program}[Id]
    Set suite variable              ${service}
    ${today} =                      Get Current Date                result_format=%-m/%-d/%Y 
    Set suite variable              ${today}
    ${service_schedule_name} =      Generate New String
    Set suite variable              ${service_schedule_name}

*** Test Cases ***
Max number of service session
    Go To PMM App
    Go To Page                              Details                        Service__c           object_id=${service}[Id]
    Click Wrapper Related List Button       Service Schedules              New
    Current Page Should Be                  New                            ServiceSchedule__c
    Verify Wizard Screen Title              Service Schedule Information
    Populate Field                          Service Schedule Name               ${service_schedule_name}
    Set Frequency                           Daily
    Set Service Schedule Ends               After       Number of Service Sessions       600
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Review Service Sessions
    Page Should Contain                     We can only create 500 sessions for a Service Schedule. Only the sessions listed here will be created.
    Page Should Not Contain                 Add Service session
    Remove Session                          ${today}: ${service}[Name]
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Add Service Participants
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Review Service Schedule
    Page Should Contain                     Service Sessions (500)
    Click Dialog Button                     Save
    Wait Until Modal is Closed
    Verify Details                          Service Schedule Name             contains      ${service_schedule_name}
    Verify Details                          Number of Service Sessions        contains      600
