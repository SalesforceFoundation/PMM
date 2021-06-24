*** Settings ***

Resource        robot/pmm/resources/pmm.robot
Library         cumulusci.robotframework.PageObjects
...             robot/pmm/resources/pmm.py
...             robot/pmm/resources/ContactPageObject.py
Suite Setup     Run Keywords
...             Open test browser            useralias=${test_user}             AND
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Variables ***
${test_user}             UUser

*** Keywords ***
Setup Test Data
    [Documentation]         Sets the fields required to create a contact record.
    ${first_name} =         Generate Random String
    Set suite variable      ${first_name}
    ${last_name} =          Generate Random String
    Set suite variable      ${last_name}
    ${description} =        Generate Random String
    Set suite variable      ${description}

*** Test Cases ***
Create a Contact 
    [Documentation]                        This test creates a Contact and verifies the details of the contact
    [tags]                                 perm:admin   perm:manage      perm:deliver    perm:view    feature:Contact
    Go To Page                             Listing                              Contact
    Click Object Button                    New
    Load Page object                       NewContact                           Contact
    verify current page title              New Contact
    Populate Field                         First Name       ${first_name}
    Populate Field                         Last Name        ${last_name}
    Populate Field                         Email            user@example.com
    Save Contact
    Wait Until Modal Is Closed
    Verify Details                         Name                                 contains            ${first_name} ${last_name}
    Verify Details                         Email                                contains            user@example.com
    Verify Page Contains Related List      Program Engagements
    Verify Page Contains Related List      Service Deliveries
    Verify Page Contains Related List      Files
    Verify Page Contains Related List      Service Participants
    Page Should Contain                    Client