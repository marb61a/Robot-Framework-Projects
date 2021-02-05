*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${Browser}  Firefox
${URL}  http://www.thetestingworld.com/testings

*** Test Cases ***
Robot Buttons First Test Case
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
    Select Radio Button  add_type  office
    Select Checkbox  name:terms
    Click Link  xpath://a[text()='Read Detail']
    #Close Browser
