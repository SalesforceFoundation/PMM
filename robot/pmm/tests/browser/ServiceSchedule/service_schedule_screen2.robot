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
    [Documentation]                 Creates a Service and Program record using API, Sets 'Today' and 'Service Shedule Name' fields
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
    [Documentation]                 Validates that only 500 sessions are created when entering a higher value on Screen1.
    ...                             Validates that a warning message is displayed on Screen2  and is removed when one service session
    ...                             is deleted.
    [tags]                           W-8559800      perm:admin   perm:manage       feature:Service Schedule  
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
    Remove Session                          ${today}: ${service_schedule_name}
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Add Service Participants
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Review Service Schedule
    Page Should Contain                     Service Sessions (499)
    Click Dialog Button                     Save
    Wait Until Modal is Closed
    Verify Details                          Service Schedule Name             contains      ${service_schedule_name}
    Verify Details                          Number of Service Sessions        contains      600

Add new service session on Screen 2
    [Documentation]                        On service schedule wizard, add a new service session on Screen 2
    [tags]                                  W-8449817   perm:admin   perm:manage   feature:Service Schedule
    Go To Page                              Details                        Service__c           object_id=${service}[Id]
    Click Wrapper Related List Button       Service Schedules              New
    Current Page Should Be                  New                            ServiceSchedule__c
    Verify Wizard Screen Title              Service Schedule Information
    Populate Field                          Service Schedule Name               ${service_schedule_name}
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Review Service Sessions
    Click Dialog Button                     Add Service Session
    Populate Lightning Fields               Date=25
    Click Dialog Button                     Save
    Page Should Contain                     Total Sessions: 2



