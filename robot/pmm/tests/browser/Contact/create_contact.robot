*** Settings ***

Resource        robot/pmm/resources/pmm.robot
Library         cumulusci.robotframework.PageObjects
...             robot/pmm/resources/pmm.py
...             robot/pmm/resources/ContactPageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Delete Records and Close Browser

*** Keywords ***
Setup Test Data
    ${first_name} =         Generate Random String
    Set suite variable      ${first_name}
    ${last_name} =          Generate Random String
    Set suite variable      ${last_name}
    ${description} =        Generate Random String
    Set suite variable      ${description}

*** Test Cases ***

Create a Contact 

    [Documentation]                        This test creates a Contact and verifies the details of the contact
    Go To PMM App
    Go To Page                             Listing                              Contact
    Click Object Button                    New
    Load Page object                       NewContact                           Contact
    verify current page title              New Contact
    Populate modal Form                    First Name=${first_name}
    ...                                    Last Name=${last_name}
    ...                                    Client=checked
    ...                                    Email=user@example.com
    ...                                    Description=${description}
    Click modal button                     Save
    Wait Until Modal Is Closed
    current page should be                 Details                              Contact
    verify details                         Name                                 contains            ${first_name} ${last_name}
    verify details                         Email                                contains            user@example.com
    verify details                         Description                          contains            ${description}
    verify page contains related list      Program Engagements
    verify page contains related list      Service Deliveries
    verify page contains related list      Files