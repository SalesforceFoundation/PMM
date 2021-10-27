*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/BulkServiceDeliveryPageObject.py
...            robot/pmm/resources/ServiceDeliveryPageObject.py
...            robot/pmm/resources/ProgramEngagementPageObject.py
...            robot/pmm/resources/ServiceSchedulePageObject.py
Suite Setup     Run Keywords
...             Open test browser            useralias=${test_user}             AND
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Variables ***
${test_user}             UUser

*** Keywords ***
Setup Test Data
    [Documentation]         Create data using API, assign fieldsets to the service record
    ${ns} =                     Get PMM Namespace Prefix
    Set suite variable          ${ns}
    ${quantity} =               Generate Random String          2     123456789
    Set suite variable          ${quantity}
    ${contact1} =               API Create Contact
    Set suite variable          ${contact1}
    ${contact2} =               API Create Contact
    Set suite variable          ${contact2}
    ${contact3} =               API Create Contact
    Set suite variable          ${contact3}
    ${program1} =               API Create Program
    Set suite variable          ${program1}
    ${program2} =               API Create Program
    Set suite variable          ${program2}
    ${program3} =               API Create Program
    Set suite variable          ${program3}
    ${program_engagement1} =    API Create Program Engagement   ${Program1}[Id]     ${contact1}[Id]
    Set suite variable          ${program_engagement1}
    ${program_engagement2} =    API Create Program Engagement   ${Program2}[Id]     ${contact2}[Id]
    Set suite variable          ${program_engagement2}
    ${program_engagement3} =    API Create Program Engagement   ${Program3}[Id]     ${contact3}[Id]
    Set suite variable          ${program_engagement3}
    ${service1} =               API Create Service              ${Program1}[Id]
    Set suite variable          ${service1}
    ${service2} =               API Create Service              ${Program2}[Id]
    Set suite variable          ${service2}
    ${service3} =               API Create Service              ${Program3}[Id]
    Set suite variable          ${service3}
    API Update Records          ${ns}Service__c     ${service2}[Id]     ${ns}ServiceDeliveryFieldSet__c=Alternate_no_service
    API Update Records          ${ns}Service__c     ${service3}[Id]     ${ns}ServiceDeliveryFieldSet__c=Alternate
    ${service_schedule} =       API Create Service Schedule     ${service2}[Id]
    Set suite variable          ${service_schedule}
    ${service_session} =        API Create Service Session      ${service_schedule}[Id]     Pending
    Set suite variable          ${service_session}


*** Test Cases ***
Switch to a fieldset without service field
    [Documentation]             Switch to a fieldset without service field and validate that the service field is
    ...                         displayed on BSDT
    [tags]                      W-9654524    perm:admin   perm:manage    perm:deliver   feature:Service Delivery
    Go To Page                  Custom                              Bulk_Service_Deliveries
    Click Dialog Button         Create by Individual
    Maximize Browser Window
    Populate Bsdt Lookup        1           Client                  ${contact1}[Name]
    Populate Bsdt Dropdown      1           Program Engagement      ${program_engagement1}[Name]
    Populate Bsdt Dropdown      1           Service                 ${service1}[Name]
    Populate Bsdt Field         1           Quantity                ${quantity}
    Click Bsdt Button           Add Entry
    Populate Bsdt Lookup        2           Client                  ${contact2}[Name]
    Populate Bsdt Dropdown      2           Program Engagement      ${program_engagement2}[Name]
    Populate Bsdt Dropdown      2           Service                 ${service2}[Name]
    Page Should Contain         ${service2}[Name]
    Populate Bsdt Field         2           Quantity                ${quantity}
    Populate Bsdt Lookup        2           Service Session         ${service_session}[Name]
    Populate Bsdt Dropdown      2           Attendance Status       Excused Absence  
    Click Bsdt Button           Save
    Verify Persist Save Icon    1           Saved
    Verify Persist Save Icon    2           Saved

Switch fieldsets on wizard screen 4
    [Documentation]             Fieldset switching scenarios via group service delivery -
    ...                         a. Switch from fieldset with Contact+PE+Service fields to a fieldset with Service field
    ...                         b. Switch from fieldset with Service field to a fieldset with Contact field
    [tags]                      W-9654524    perm:admin   perm:manage    perm:deliver   feature:Service Delivery
    # Add Program Engagement field to alternate_no_service fieldset
    Run task                        add_fields_to_field_set
    ...                             field_set=${ns}ServiceDelivery__c.Alternate_no_service
    ...                             fields=${{ ["${ns}Contact__c"]}}
    Go To Page                      Custom      Bulk_Service_Deliveries
    Maximize Browser Window
    Click Dialog Button             Create by Group
    Page Should Contain Text        Default Service Delivery Values
    Populate Lookup Field           Service     ${service1}[Name]
    Page Should Contain             ${service1}[${ns}UnitOfMeasurement__c]
    Populate Field                  Quantity    ${quantity}
    Click Dialog Button             Next
    Page Should Contain Text        Contact Selection
    Load Page Object                New         ServiceSchedule__c
    Click Add All Button
    Click Dialog Button             Next
    Page Should Contain             Delivery Date
    Click Bsdt Button               Add Entry
    # Switch to alternate fieldset (Switching from fieldset with Contact+PE+Service fields to a fieldset with Service field )
    Populate Bsdt Lookup            2           Client                  ${contact3}[Name]
    Populate Bsdt Dropdown          2           Program Engagement      ${program_engagement3}[Name]
    Populate Bsdt Dropdown          2           Service                 ${service3}[Name]
    Sleep                           1s
    Page Should Not Contain         ${contact3}[Name]
    Page Should Not Contain         ${program_engagement3}[Name]
    Populate Bsdt Field             2           Quantity                ${quantity}
    Populate Bsdt Lookup            2           Service Session         ${service_session}[Name]
    Populate Bsdt Dropdown          2           Attendance Status       Excused Absence
    Click Bsdt Button               Add Entry
    # Switch to alternate_no_service fieldset (Switching from fieldset with Service field to a fieldset with Contact field )
    Populate Bsdt Lookup            3           Client                  ${contact2}[Name]
    Populate Bsdt Dropdown          3           Program Engagement      ${program_engagement2}[Name]
    Populate Bsdt Dropdown          3           Service                 ${service2}[Name]
    Sleep                           1s
    Page Should Contain             ${contact2}[Name]
    Page Should Not Contain         ${program_engagement2}[Name]
    Populate Bsdt Field             3           Quantity                ${quantity}
    Populate Bsdt Dropdown          3           Attendance Status       Excused Absence
    Click Bsdt Button               Save    
    Verify Persist Save Icon        1           Saved
    Verify Persist Save Icon        2           Saved
    Verify Persist Save Icon        3           Saved

Switch fieldsets via create by individal
    [Documentation]             Fieldset switching scenarios via group service delivery -
    ...                         a. switch from fieldset with PE+Service fields to a fieldset with Contact+PE+Service field
    ...                         b. Switch from fieldset with Contact+PE+Service field to a fieldset with Contact+PE field
    [tags]                      W-9654524    perm:admin   perm:manage    perm:deliver   feature:Service Delivery
    # Add Program Engagement field to Alternate fieldset
    Run task                        add_fields_to_field_set
    ...                             field_set=${ns}ServiceDelivery__c.Alternate
    ...                             fields=${{ ["${ns}ProgramEngagement__c"] }}  
    Go To Page                      Custom                              Bulk_Service_Deliveries
    Click Dialog Button             Create by Individual
    Maximize Browser Window
    # Switch to alternate fieldset (Switching from fieldset with PE+Service field to a fieldset with Contact+PE+Service field )
    Populate Bsdt Lookup            1           Client                  ${contact3}[Name]
    Populate Bsdt Dropdown          1           Program Engagement      ${program_engagement3}[Name]
    Populate Bsdt Dropdown          1           Service                 ${service3}[Name]
    Sleep                           1s
    Populate Bsdt Dropdown          1           Attendance Status       Present
    Click Bsdt Button               Add Entry
    Populate Bsdt Lookup            2           Program Engagement      ${program_engagement1}[Name]
    Populate Bsdt Dropdown          2           Service                 ${service1}[Name]
    Sleep                           1s
    Populate Bsdt Lookup            2           Client                  ${contact1}[Name]
    Populate Bsdt Dropdown          2           Program Engagement      ${program_engagement1}[Name]
    Populate Bsdt Dropdown          2           Service                 ${service1}[Name]
    Populate Bsdt Field             2           Quantity                ${quantity}
    Click Bsdt Button               Add Entry
    # Switch to alternate fieldset (Switching from fieldset with Contact+PE+Service field to a fieldset with Contact+PE field )
    Populate Bsdt Lookup            3           Client                  ${contact2}[Name]
    Populate Bsdt Dropdown          3           Program Engagement      ${program_engagement2}[Name]
    Populate Bsdt Dropdown          3           Service                 ${service2}[Name]
    Sleep                           1s
    Populate Bsdt Dropdown          3           Attendance Status       Unexcused Absence
    Click Bsdt Button               Save
    Verify Persist Save Icon        1           Saved
    Verify Persist Save Icon        2           Saved
    Verify Persist Save Icon        3           Saved
