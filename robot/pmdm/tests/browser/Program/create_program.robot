*** Settings ***

Resource       robot/pmdm/resources/pmdm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmdm/resources/pmdm.py
...            robot/pmdm/resources/ProgramPageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Delete Records and Close Browser

*** Keywords ***
Setup Test Data
    ${program_name} =       Generate Random String
    Set suite variable      ${program_name}
    ${short_summary} =      Generate Random String
    Set suite variable      ${short_summary}
    ${target_population} =  Generate Random String
    Set suite variable      ${target_population}
    ${description} =        Generate Random String
    Set suite variable      ${description}
    ${start_date} =         Get Current Date   result_format=%m/%d/%Y   increment=1 day
    Set suite variable      ${start_date}
    ${end_date} =           Get Current Date   result_format=%m/%d/%Y  increment=180 days
    Set suite variable      ${end_date}


*** Test Cases ***

Create a Program via UI

    [Documentation]                        This test creates Program and verifies that the Program record
    ...                                    has all the values from the form
    Go To Page                             Listing                               Program__c
    Click Object Button                    New
    Current Page Should Be                 NewProgram                           Program__c
    Populate New Program Form              Program Name=${program_name}
    ...                                    Short Summary=${short_summary}
    ...                                    Status=Active
    ...                                    Target Population=${target_population}
    ...                                    Description=${description}
    ...                                    Start Date=${start_date}
    ...                                    End Date=${end_date}
    ...                                    Program Issue Area=Education
    Click Save Button
    Wait Until Modal Is Closed
    current page should be                 Details                                 Program__c
    Page Should Contain                   ${program_name}




