*** Settings ***

Resource       robot/pmdm/resources/pmdm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmdm/resources/pmdm.py
...            robot/pmdm/resources/ServiceDeliveryPageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Delete Records and Close Browser

*** Keywords ***
Setup Test Data
    ${service_delivery_name} =       Generate Random String
    Set suite variable      ${service_delivery_name}
    &{service} =    API Create Service
    Set suite variable    &{service}
    &{contact} =         API Create Contact
    Set suite variable    &{contact}
    &{program_engagement} =    API Create Program Engagement
    Set suite variable    &{program_engagement}
    ${quantity} =   Generate Random String    2 [NUMBERS]


Create a Service Delivery via UI

    [Documentation]                        This test creates Service Delivery recotf and verifies that the Service Delivery record
    ...                                    has all the values from the form
    Go To Page                             Listing                               ServiceDelivery__c
    Click Object Button                    New
    Current Page Should Be                 NewServiceDelivery                           ServiceDelivery__c
    Populate New Program Form              Service Delivery Name=${service_delivery_name}
    ...                                    Delivery Date=Today
    ...                                    Quantity=${quantity}
    ...                                    Program Issue Area=Education
    populate lookup                        Service         &{service}[service_name}
    populate lookup                        Contact         &{contact}[FirstName] &{contact}[LastName]
    populate lookup                        Program Engagement         &{program_engagement}{program_engagement_name}
    populate lookup                        Service Provider         &{contact}[FirstName] &{contact}[LastName]
    populate lookup                        Household Account         &{account}[account_name}
    click Save Button
    Wait Until Modal Is Closed
    current page should be                 Details                                ServiceDelivery__c
    Page Should Contain                   ${quantity}