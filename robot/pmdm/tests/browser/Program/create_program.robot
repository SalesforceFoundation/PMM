*** Settings ***

Resource       robot/pmdm/resources/pmdm.robot
Library        robot/pmdm/resources/pmdm.py
Suite Setup     Open Test Browser
Suite Teardown  Delete Records and Close Browser

*** Test Cases ***
Create a Program
     &{program} =  API Create Program
     Go To Record Home    &{program}[Id]
     page should contain text    Active
