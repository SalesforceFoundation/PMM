*** Settings ***

Resource        robot/pmm/resources/pmm.robot
Library         cumulusci.robotframework.PageObjects
...             robot/pmm/resources/pmm.py
...             robot/pmm/resources/ServiceDeliveryPageObject.py
...             robot/pmm/resources/ServicePageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Keywords ***
Setup Test Data
    ${ns} =                     Get PMM Namespace Prefix
    Set suite variable          ${ns}

    &{program} =                API Create Program
    Set suite variable          &{program}
    &{contact} =                API Create Contact
    Set suite variable          &{contact}
    &{service} =                API Create Service              ${Program}[Id]
    Set suite variable          &{service}
    &{program_engagement} =     API Create Program Engagement   ${Program}[Id]      ${contact}[Id]
    Set suite variable          &{program_engagement}

    &{program1} =               API Create Program
    Set suite variable          &{program1}
    &{program_engagement1} =    API Create Program Engagement   ${Program1}[Id]      ${contact}[Id]
    Set suite variable          &{program_engagement1}

    ${today} =                  Get Current Date                result_format=%Y-%m-%d
    Set suite variable          ${today}
    ${quantity} =               Generate Random String    2     [NUMBERS]
    Set suite variable          ${quantity}

*** Test Cases ***
Create a new service delivery on service using quick action
     [Documentation]                This test loads the service record, clicks on the new service delivery quick action and creates
     ...                            new service delivery record.
     [tags]                         W-042516  feature:Service Delivery
     Go To PMM App
     Go To Page                     Details                        Service__c           object_id=${service}[Id]
     Verify Details                 Service Name                   contains                  ${service}[Name]
     Click Quick Action Button      Create New Service Delivery
     Populate Modal Form            Client=${contact}[FirstName] ${contact}[LastName]
     ...                            Program Engagement=${program_engagement}[Name]
     ...                            Quantity=${quantity}
     Click Modal Button             Save
     Wait Until Modal Is Closed
     Current Page Should Be         Details                        Service__c
     Load Related List              Service Deliveries
     Click New Related Record Link  ${contact}[FirstName] ${contact}[LastName] ${today}: ${service}[Name]
     Verify Details                 Service Delivery Name      contains     ${contact}[FirstName] ${contact}[LastName] ${today}: ${service}[Name]
     Save Current Record ID For Deletion     ${ns}ServiceDelivery__c

Validate service and program engagement lookup to same program
     [Documentation]                This test loads the program engagement record, clicks on the new service delivery quick action and
     ...                            validates an error message is displayed when service and program engagement do not lookup to the same program
     [tags]                         W-042516  feature:Service Delivery
     Go To Page                     Details                        Service__c           object_id=${service}[Id]
     Verify Details                 Service Name                   contains                  ${service}[Name]
     Click Quick Action Button      Create New Service Delivery
     Populate Modal Form            Client=${contact}[FirstName] ${contact}[LastName]
     ...                            Program Engagement=${program_engagement1}[Name]
     ...                            Quantity=${quantity}
     Click Modal Button             Save
     verify modal Error             Select a Program Engagement that matches the Program of the related Service.
