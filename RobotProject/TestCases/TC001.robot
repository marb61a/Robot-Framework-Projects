*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${Browser}  Firefox
${URL}  http://thetestingworld.com/testings

*** Test Cases ***
TC001
    Open Browser  ${URL} ${Browser}
    Close Browser

*** Keywords ***
