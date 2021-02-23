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
    ${ns} =                         Get PMM Namespace Prefix
    Set suite variable              ${ns}
    ${program} =                    API Create Program
    Set suite variable              ${program}
    ${service} =                    API Create Service                  ${Program}[Id]
    Set suite variable              ${service}
    ${service_schedule_name} =      Generate New String
    Set suite variable              ${service_schedule_name}

*** Test Cases ***
Verify screen4 when no sessions and participants are added
    [Documentation]                        On service schedule wizard, uncheck create service sessions checkbox and do not add service participants
    ...                                    and validate the message displayed on Screen 4
    [tags]                                 W-8515142    perm:admin   perm:manage        feature:Service Schedule
    Go To Page                              Details                        Service__c           object_id=${service}[Id]
    Click Wrapper Related List Button       Service Schedules              New
    Current Page Should Be                  New                            ServiceSchedule__c
    Verify Wizard Screen Title              Service Schedule Information
    Populate Field                          Service Schedule Name               ${service_schedule_name}
    Set Checkbox                            Create Service Sessions             unchecked
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Review Service Sessions
    Page Should Contain                     Create Service Sessions isn't selected, so no records will be automatically created. Click Add Service Session to manually add Service Session records.
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Add Service Participants
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Review Service Schedule
    Page Should Contain                     No participants are selected, so no Service Participants will be created.
    Page Should Contain                     No sessions were added, so no Service Sessions will be created.
