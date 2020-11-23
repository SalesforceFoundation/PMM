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


*** Test Cases ***
Add/remove service participants on Screen3
    Go To PMM App
    Go To Page                              Details                        Service__c           object_id=${service}[Id]
    Click Wrapper Related List Button       Service Schedules              New
    Current Page Should Be                  New                            ServiceSchedule__c
    Verify Wizard Screen Title              Service Schedule Information
    Populate Field                          Service Schedule Name               ${service_schedule_name}
    Populate Lightning Fields               Date=Today
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Review Service Sessions
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Add Service Participants
    Select Service Participant              ${contact1}[Name]
    Select Service Participant              ${contact2}[Name]
    Select Service Participant              ${contact3}[Name]
    Click Dialog Button                     Add Service Participants
    Validate Participant Is Added
    Validate Participant Is Added
    Validate Participant Is Added
    