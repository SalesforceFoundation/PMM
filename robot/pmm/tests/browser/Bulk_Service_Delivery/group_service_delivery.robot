*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/BulkServiceDeliveryPageObject.py
...            robot/pmm/resources/ServiceDeliveryPageObject.py
...            robot/pmm/resources/ServiceSchedulePageObject.py
Suite Setup     Run Keywords
...             Open test browser            useralias=${test_user}             AND
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Variables ***
${test_user}             UUser

*** Keywords ***
Setup Test Data
    ${ns} =                     Get PMM Namespace Prefix
    Set suite variable          ${ns}
    ${quantity} =               Generate Random String          2     123456789
    Set suite variable          ${quantity}
    ${today} =                  Get Current Date                result_format=%Y-%m-%d
    Set suite variable          ${today}

    ${contact} =                API Create Contact
    Set suite variable          ${contact}
    ${contact1} =               API Create Contact
    Set suite variable          ${contact1}
    ${contact2} =               API Create Contact
    Set suite variable          ${contact2}
    ${contact3} =               API Create Contact
    Set suite variable          ${contact3}
    ${program} =                API Create Program
    Set suite variable          ${program}
    ${service} =                API Create Service              ${Program}[Id]
    Set suite variable          ${service}

    ${program_cohort1} =            API Create Program Cohort           ${Program}[Id]
    Set suite variable              ${program_cohort1}
    ${program_cohort2} =            API Create Program Cohort           ${Program}[Id]
    Set suite variable              ${program_cohort2}   

    ${program_engagement1} =        API Create Program Engagement   ${Program}[Id]     ${contact1}[Id]      ${ns}ProgramCohort__c=${program_cohort1}[Id]
    Set suite variable              ${program_engagement1}
    ${program_engagement2} =        API Create Program Engagement   ${Program}[Id]     ${contact2}[Id]      ${ns}ProgramCohort__c=${program_cohort1}[Id]
    Set suite variable              ${program_engagement2}
    ${program_engagement3} =        API Create Program Engagement   ${Program}[Id]     ${contact3}[Id]      ${ns}ProgramCohort__c=${program_cohort2}[Id]
    Set suite variable              ${program_engagement3}
    ${service_schedule_name} =      Generate New String
    Set suite variable              ${service_schedule_name}

    ${program1} =                    API Create Program
    Set suite variable              ${program1}
    ${service1} =                    API Create Service                  ${Program1}[Id]
    Set suite variable              ${service1}
    ${program_cohort1} =            API Create Program Cohort           ${Program1}[Id]
    Set suite variable              ${program_cohort1}
    ${program_cohort2} =            API Create Program Cohort           ${Program1}[Id]
    Set suite variable              ${program_cohort2}
    ${program_cohort3} =            API Create Program Cohort           ${Program1}[Id]
    Set suite variable              ${program_cohort3}
    API Update Records              ${ns}ProgramCohort__c     ${program_cohort1}[Id]     ${ns}Status__c=Completed
    ${program_engagement4} =        API Create Program Engagement   ${Program1}[Id]     ${contact1}[Id]      ${ns}ProgramCohort__c=${program_cohort1}[Id]
    Set suite variable              ${program_engagement4}
    ${program_engagement5} =        API Create Program Engagement   ${Program1}[Id]     ${contact2}[Id]      ${ns}ProgramCohort__c=${program_cohort2}[Id]
    Set suite variable              ${program_engagement5}
    ${program_engagement6} =        API Create Program Engagement   ${Program1}[Id]     ${contact3}[Id]      ${ns}ProgramCohort__c=${program_cohort3}[Id]
    Set suite variable              ${program_engagement6}
    API Update Records              ${ns}ProgramEngagement__c    ${program_engagement4}[Id]     ${ns}Stage__c=Applied

*** Test Cases ***
Setup custom bucketed values and validate on participant selector component
    [Documentation]               Create custom bucketed values for Program Cohort Status and Program Engagement Stages and
    ...                           validate the same on the participant selector component on BSDT
    [tags]                        quadrant:Q3   perm:admin
    Setup Custom Metadata Bucketed Value    Completed    Completed   ProgramCohortStatusActive   Completed
    Setup Custom Metadata Bucketed Value    Applied    Applied    Active    Applied
    Go To Page                              Custom                      Bulk_Service_Deliveries
    Click Dialog Button                     Create by Group
    Page Should Contain Text                Default Service Delivery Values
    Populate Lookup Field                   Service     ${service1}[Name]
    Page Should Contain                     ${service1}[${ns}UnitOfMeasurement__c]
    Populate Field                          Quantity    ${quantity}
    Click Dialog Button                     Next
    Page Should Contain Text                Contact Selection
    Load Page Object                        New         ServiceSchedule__c
    Page Should Contain                     Applied
    Verify dropdown Options                 Filter by: Program Cohort    contains    ${program_cohort1}[Name]
    sleep    3s
    Verify dropdown Options                 Filter by: Program Cohort    does not contain    ${program_cohort2}[Name]
    sleep    3s
    Verify dropdown Options                 Filter by: Program Cohort    does not contain    ${program_cohort3}[Name]
    sleep    3s
    Select Service Participant              ${contact1}[Name]
    Validate Participant Is Added           ${contact1}[Name]
    Click Dialog Button                     Next
    Page Should Contain                     Delivery Date

GSD1: Create service delivery using BSDT Wizard
    [Documentation]             Clicks on Create by Group on BSDT, selects default service delivery values, adds contact
    ...                         and creates service delivery using wizard
    [tags]                      W-9118269   quadrant:Q3   perm:admin   perm:manage    perm:deliver   feature:Service Delivery
    Go To Page                      Custom                      Bulk_Service_Deliveries
    Click Dialog Button             Create by Group
    Page Should Contain Text        Default Service Delivery Values
    Populate Lookup Field           Service     ${service}[Name]
    Page Should Contain             ${service}[${ns}UnitOfMeasurement__c]
    Populate Field                  Quantity    ${quantity}
    Click Dialog Button             Next
    Page Should Contain Text        Contact Selection
    Load Page Object                New         ServiceSchedule__c
    Select Service Participant      ${contact1}[Name]
    Select Service Participant      ${contact2}[Name]
    Validate Participant Is Added   ${contact1}[Name]
    Validate Participant Is Added   ${contact2}[Name]
    Click Dialog Button             Next
    Page Should Contain             Delivery Date
    Click Bsdt Button               Save
    Verify Persist Save Icon        1           Saved
    Verify Persist Save Icon        2           Saved
    Go To Page                      Listing     ${ns}ServiceDelivery__c
    Click Listview Link             ${contact1}[FirstName] ${contact1}[LastName] ${today}: ${service}[Name]
    Verify Details                  Service Delivery Name   contains   ${contact1}[FirstName] ${contact1}[LastName] ${today}: ${service}[Name]
    Verify Details                  Quantity                contains   ${quantity}.00
    Verify Details                  Unit of Measurement     contains   ${service}[${ns}UnitOfMeasurement__c]
    Go To Page                      Listing    ${ns}ServiceDelivery__c
    Click Listview Link             ${contact2}[FirstName] ${contact2}[LastName] ${today}: ${service}[Name]
    Verify Details                  Service Delivery Name   contains   ${contact2}[FirstName] ${contact2}[LastName] ${today}: ${service}[Name]
    Verify Details                  Quantity                contains   ${quantity}.00
    Verify Details                  Unit of Measurement     contains   ${service}[${ns}UnitOfMeasurement__c]

GSD2: Filter on bsdt wizard based on Program Cohort
    [Documentation]                        On BSDT wizard contact selection screen,filter based on program cohort and 
    ...                                    validate filtered results are displayed on screen 3
    [tags]                                 W-9303168   quadrant:Q2   perm:admin   perm:manage   feature:bsdt
    Go To Page                              Custom                      Bulk_Service_Deliveries
    Click Dialog Button                     Create by Group
    Page Should Contain Text                Default Service Delivery Values
    Populate Lookup Field                   Service     ${service}[Name]
    Page Should Contain                     ${service}[${ns}UnitOfMeasurement__c]
    Populate Field                          Quantity    ${quantity}
    Click Dialog Button                     Next
    Page Should Contain Text                Contact Selection
    Load Page Object                        New         ServiceSchedule__c
    Page Should Contain                     No records selected
    Select Value From Dropdown              Filter by: Program Cohort        ${program_cohort2}[Name]
    Page Should Not Contain                 ${contact1}[Name]
    Page Should Not Contain                 ${contact2}[Name]
    Page Should Contain Text                ${contact3}[Name]

GSD3: Filter on bsdt wizard based on Client Name
    [Documentation]                        On BSDT wizard contact selection screen,filter based on client name and 
    ...                                    validate filtered results are displayed on screen 3
    [tags]                                 W-9303168   quadrant:Q2   perm:admin   perm:manage   feature:bsdt
    Go To Page                              Custom                      Bulk_Service_Deliveries
    Click Dialog Button                     Create by Group
    Page Should Contain Text                Default Service Delivery Values
    Populate Lookup Field                   Service     ${service}[Name]
    Page Should Contain                     ${service}[${ns}UnitOfMeasurement__c]
    Populate Field                          Quantity    ${quantity}
    Click Dialog Button                     Next
    Page Should Contain Text                Contact Selection
    Load Page Object                        New         ServiceSchedule__c
    Page Should Contain                     No records selected
    Filter Participants                     ${contact1}[Name]
    Page Should Contain Text                ${contact1}[Name]
    Page Should Not Contain                 ${contact2}[Name]
    Page Should Not Contain                 ${contact3}[Name]

GSD4: Filter on bsdt wizard based on Stage
    [Documentation]                        On BSDT wizard contact selection screen,filter based on Stage and 
    ...                                    validate no results are displayed on screen 3
    [tags]                                 W-9303168   quadrant:Q2   perm:admin   perm:manage   feature:bsdt
    Go To Page                              Custom                      Bulk_Service_Deliveries
    Click Dialog Button                     Create by Group
    Page Should Contain Text                Default Service Delivery Values
    Populate Lookup Field                   Service     ${service}[Name]
    Page Should Contain                     ${service}[${ns}UnitOfMeasurement__c]
    Populate Field                          Quantity    ${quantity}
    Click Dialog Button                     Next
    Page Should Contain Text                Contact Selection
    Load Page Object                        New         ServiceSchedule__c
    Page Should Contain                     No records selected
    Filter Participants                     Applied
    Page Should Contain                     No records found.
