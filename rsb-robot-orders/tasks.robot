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


*** Tasks ***
Order robots from RobotSpareBin Industries Inc
    Open the robot order website
    Dismiss modal form
    Download the csv file
    Fill in the form using the csv file
    Create screenshot of each order
    For each order create a pdf file
    Create zip file of all pdf receipts
    [Teardown]    Close the browser


*** Keywords ***
Open the robot order website
    Open Available Browser    https://robotsparebinindustries.com/#/robot-order

Dismiss modal form
    Click Button    OK

Download the csv file
    Download    https://robotsparebinindustries.com/orders.csv    overwrite=True

Fill in the form using the csv file
    FOR
    END

Create screenshot of each order

For each order create a pdf file

Create zip file of all pdf receipts