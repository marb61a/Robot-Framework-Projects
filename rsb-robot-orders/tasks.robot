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

*** Variables ***


*** Tasks ***
Order robots from RobotSpareBin Industries Inc
    Open Browser
    Ask user to input url
    # Download the csv file

    # CSV will need to be converted into a table into order to be processed
    # Robot framework has that facility available - https://robocorp.com/docs/libraries/rpa-framework/rpa-tables/keywords#read-table-from-csv
    # Convert the csv file into a table

    # Everything will have to be done inside a for loop as ordering another robot has the same 
    # effect as reloading the site so the modal will reappear each time an order is to be entered
    # Open the robot order website
    # Dismiss modal form
    # Fill in the form using the csv file
    # Create screenshot of each order
    # For each order create a pdf file
    # Create zip file of all pdf receipts
    # [Teardown]    Close the browser


*** Keywords ***
Open Browser
    Open Available Browser    https://www.google.com/

Ask user to input url
    # https://robotsparebinindustries.com/orders.csv 
    ${csv_url} = Dialogs.Get Value From User    CSV file url:
    [return] ${csv_url}

# Download the csv file
#     Download    ${csv_url}   overwrite=True

# Convert the csv file into a table
#     ${table_file}=    Read table from CSV    orders.csv    overwrite=True 

# Open the robot order website
#     Open Available Browser    https://robotsparebinindustries.com/#/robot-order

# Dismiss modal form
#     Click Button    OK

# Fill in the form using the csv file
    # FOR 
    # END

# Create screenshot of each order

# For each order create a pdf file

# Create zip file of all pdf receipts

# Close the browser
#     Close Browser