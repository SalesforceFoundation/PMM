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
    
