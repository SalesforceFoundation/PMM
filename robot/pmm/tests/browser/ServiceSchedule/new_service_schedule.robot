*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/ServiceSessionPageObject.py
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
    ${contact} =                    API Create Contact
    Set suite variable              ${contact}
    ${contact1} =                   API Create Contact
    Set suite variable              ${contact1}
    ${contact2} =                   API Create Contact
    Set suite variable              ${contact2}
    ${contact3} =                   API Create Contact
    Set suite variable              ${contact3}
    ${program_engagement1} =        API Create Program Engagement   ${Program}[Id]     ${contact1}[Id]
    Set suite variable              ${program_engagement1}
    ${program_engagement2} =        API Create Program Engagement   ${Program}[Id]     ${contact2}[Id]
    Set suite variable              ${program_engagement2}
    ${program_engagement3} =        API Create Program Engagement   ${Program}[Id]     ${contact3}[Id]
    Set suite variable              ${program_engagement3}
    ${service_schedule_name} =      Generate New String
    Set suite variable              ${service_schedule_name}
    ${particiapant_capacity} =      Generate Random String  2   [NUMBERS]12346789
    Set suite variable              ${particiapant_capacity}      

*** Test Cases ***
Create a New Service Schedule
    Go To Page                     Details                        Service__c           object_id=${service}[Id]
    Click Wrapper Related List Button      Service Schedules                New
    Wait For Modal                          New                                    Service Schedule
    Verify Wizard Screen Title              Service Schedule Information
    Populate Field                          Service Schedule Name               ${service_schedule_name}
    Populate Field                          Participant Capacity                ${particiapant_capacity}
    Populate Lightning Fields               Primary Service Provider=${contact}[Name]
    ...                                     Date=Today
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Review Service Sessions
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Add Service Participants
    Select Service Participants
       Select Service Participants 
          Select Service Participants
        Click Dialog Button                     Add Service Participants
            Click Dialog Button                     Next 
            Verify Wizard Screen Title          Review Service Schedule

          