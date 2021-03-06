*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${Browser}  Firefox
${URL}  http://www.thetestingworld.com/testings

*** Test Cases ***
Robot Open And Close Browser Test Case
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
    Input Text  name:fld_username  Joe Bloggs
    Input Text  xpath://input[@name='fld_email']  abcd@example.com
    Clear Element Text  name:fld_username
    Close Browser
