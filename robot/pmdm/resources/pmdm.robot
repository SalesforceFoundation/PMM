*** Settings ***

Resource       cumulusci/robotframework/Salesforce.robot
Library        pmdm.py
Library        DateTime

*** Keywords ***
Go To PMDM App
    Open App Launcher
    Wait Until Element Is visible           //div[contains(@class,'slds-app-launcher__tile-body')]//a[ text()='Program Management']
    Click Link                              //div[contains(@class,'slds-app-launcher__tile-body')]//a[ text()='Program Management']

API Create Program
    [Arguments]      &{fields}
    ${program_name} =  Generate New String
    ${program_id} =  Salesforce Insert  Program__c
    ...               Name=${program_name}
    ...               ProgramIssueArea__c=Employment
    ...               Description__c=PMDM Robot Program
    ...               ShortSummary__c=created via API
    ...               TargetPopulation__c=Youth Target Population
    ...               Status__c=Active
    &{program} =     Salesforce Get  Program__c  ${program_id}
    Store Session Record    Program__c  ${program_id}
    [Return]         &{program}

API Create Contact
    [Arguments]      &{fields}
    ${first_name} =  Generate Random String
    ${last_name} =   Generate Random String
    ${legal_name} =  Generate Random String
    ${contact_id} =  Salesforce Insert  Contact
    ...                  FirstName=${first_name}
    ...                  LastName=${last_name}
    ...                  &{fields}
    &{contact} =     Salesforce Get  Contact  ${contact_id}
    Store Session Record      Contact  ${contact_id}
    [Return]         &{contact}
