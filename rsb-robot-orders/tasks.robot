*** Settings ***
Documentation       Orders robots from RobotSpareBin Industries Inc.
...                 Saves the order HTML receipt as a PDF file.
...                 Saves the screenshot of the ordered robot.
...                 Embeds the screenshot of the robot to the PDF receipt.
...                 Creates ZIP archive of the receipts and the images.
Library    RPA.Browser.Selenium    auto_close=${FALSE}
Library    RPA.HTTP
Library    RPA.Tables
Library    RPA.PDF
Library    RPA.Dialogs
Library    Dialogs

*** Variables ***
${order_url}    https://robotsparebinindustries.com/#/robot-order

# Form elements
${modal_ok_btn}    xpath://*[@id="root"]/div/div[2]/div/div/div/div/div/button[1]
${form_head}    id:head
${body_radio_btn}    body
${legs_input}    xpath://form/div[3]/input
${address_input}    id:address
${preview_btn}    id:preview
${submit_order_btn}    id:order
${order_another_btn}    id:order-another
${preview_btn}    id:preview
${robot_preview_image}    id:robot-preview-image

*** Tasks ***
Order robots from RobotSpareBin Industries Inc
    Open Browser
    Ask user to input download url and download csv file

    # CSV will need to be converted into a table into order to be processed
    # Robot framework has that facility available - https://robocorp.com/docs/libraries/rpa-framework/rpa-tables/keywords#read-table-from-csv
    Convert the csv file into a table

    # Everything will have to be done inside a for loop as ordering another robot has the same 
    # effect as reloading the site so the modal will reappear each time an order is to be entered
    ${orders_table}=    Convert the csv file into a table
    FOR    ${row}    IN    @{orders_table}
        Dismiss modal form
        Fill in the form using the csv file    ${row}
        Wait Until Keyword Succeeds    5x    5s    Preview Robot
        Wait Until Keyword Succeeds    5x    5s    Submit the order
        Create screenshot of each robot
        Order another robot
    END
    # For each order create a pdf file
    # Create zip file of all pdf receipts
    [Teardown]    Close the browser


*** Keywords ***
Open Browser
    Open Available Browser    ${order_url}

*** Keywords ***
# This uses the dialogs part of the robot framework to get user input
# https://robotframework.org/robotframework/latest/libraries/Dialogs.html
Ask user to input download url and download csv file
#    https://robotsparebinindustries.com/orders.csv 
    ${csv_url}=    Get Value From User    CSV file url:
    # Click Button    OK
    Download    ${csv_url}   overwrite=True

*** Keywords ***
Convert the csv file into a table
    ${table_file}=    Read table from CSV    orders.csv    overwrite=True 
    [Return]    ${table_file}

*** Keywords ***
Dismiss modal form
    Click Button    ${modal_ok_btn}

*** Keywords ***
Fill in the form using the csv file
    [Arguments]    ${row}
    Select From List By Index    ${form_head}    ${row}[Head]
    Select Radio Button    ${body_radio_btn}    ${row}[Body]
    Input Text    ${legs_input}    ${row}[Legs]
    Input Text    ${address_input}    ${row}[Address]

*** Keywords ***
Submit the order
    Click Button    ${submit_order_btn}

*** Keywords ***
Order another robot
    Wait Until Element Is Visible    ${order_another_btn}
    Click Button    ${order_another_btn}

*** Keywords ***
Preview Robot
    Click Button    ${preview_btn}

*** Keywords ***
Create screenshot of each robot
    Capture Element Screenshot    ${robot_preview_image}    ${OUTPUT_DIR}${/}file.png

# For each order create a pdf file

# Create zip file of all pdf receipts

Close the browser
    Close Browser