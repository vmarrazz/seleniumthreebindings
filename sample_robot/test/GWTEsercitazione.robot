*** Settings ***
Documentation	Test Automation Exercises Given-When-Then
Metadata	Version		1.0alfa
Metadata	More Info	For more information about *Robot Framework* see http://robotframework.org
Metadata	Executed At	${CURDIR}

# Load Given-When-Then Demo Wrapper
Resource	./GWTWrapper.robot

# default parameters
# Variables	../resources/parameters.yaml

*** Test Cases ***
Scenario Add Remove Elements
	Given browser is open
	And user is on the "https://the-internet.herokuapp.com/add_remove_elements/" page
	When user clicks on "Add Element"
	Then "Delete" button should be visible
	When user clicks on the "Delete" button
	Then "Delete" button should not be visible

Scenario Dropdown
	Given browser is open
	And user is on the "https://the-internet.herokuapp.com/dropdown" page
	When no option is selected
	Then "Please select an option" should be displayed
	When user selects "Option 1"
	Then "Option 1" should be selected
	When user selects "Option 2"
	Then "Option 2" should be selected

Scenario Login
	Given browser is open
	And user is on the "https://the-internet.herokuapp.com/login" page
	When user enters username "tomsmith"
	Then username "tomsmith" should be visible in the input field
	When user enters password "SuperSecretPassword!"
	Then password should not be visible in the input field

Scenario Horizontal Slider
	Given browser is open
	And user is on the "https://the-internet.herokuapp.com/horizontal_slider" page
	When  the user randomly chooses a number between 1 and 5
	And user moves the slider to the chosen value
	Then  the chosen number should be displayed near the slider
	When  the user moves the slider back to zero
	Then  zero should be displayed near the slider

Scenario Checkboxes
	Given browser is open
	And user is on the "https://the-internet.herokuapp.com/checkboxes" page
	Then "checkbox 1" should be unchecked and "checkbox 2" should be checked
	When user selects "checkbox 1"
	Then all checkboxes should be selected
	When user deselects all checkboxes
	Then checkboxes should be deselected

Scenario Basic Auth
	Given browser is open
	And user is on the "https://the-internet.herokuapp.com/basic_auth" page
	When user enters "admin" as username
	And user enters "admin" as password
	And user clicks the "Sign in" button
	Then user should be successfully authenticated

Scenario JQuery UI
	Given browser is open
	And user is on the "https://the-internet.herokuapp.com/jqueryui" page
	When user clicks on the "menu" link
	Then "Disable/Enable" menu should be displayed
	When user hovers over the "Enable" menu
	Then submenu with "Downloads" should appear
	When user randomly selects and clicks on either PDF, CSV, or Excel
	Then a file of the selected type should be downloaded

Scenario Key Presses
	Given browser is open
	And user is on the "https://the-internet.herokuapp.com/key_presses" page
	When user selects the text field with the mouse cursor
	Then no character should be indicated as "pressed"
	When user types "supercalifragilistichespiralidoso"
	Then "O" should be displayed as the last pressed character
	When user deletes the entered text
	And user types "supercalifragilis"
	Then "S" should be displayed as the last pressed character

Scenario Context Menu
	Given browser is open
	And user is on the "https://the-internet.herokuapp.com/context_menu" page
	When user moves the mouse pointer to the center of the dashed area
	And user right-clicks
	Then context menu should appear
	When user clicks OK on the context menu
	Then context menu should disappear
	When user moves the mouse focus 100px from the right edge of the window
	And user right-clicks
	Then context menu should not appear

Scenario Entry Ad
	Given browser is open
	And user is on the "https://the-internet.herokuapp.com/entry_ad" page
	When a modal window is displayed
	And user clicks "Close"
	Then modal window should not be visible
	When user refreshes the page three times
	Then modal window should not be displayed
	When user clicks on the "click here" link
	And refreshes the page once
	Then modal window should be displayed

Scenario Download
	Given browser is open
	And user is on the "https://the-internet.herokuapp.com/download" page
	When user randomly selects one of the displayed links
	And clicks on the selected link
	Then file should be correctly downloaded to the user's PC

Scenario TinyMCE
	Given browser is open
	And user is on the "https://the-internet.herokuapp.com/tinymce" page
	When user enters a random 100-character text
	Then text should be correctly displayed
	When user selects all the text and presses CTRL+B
	Then text should be transformed to "bold"

Scenario Status Codes
	Given browser is open
	And user is on the "https://the-internet.herokuapp.com/status_codes" page
	When user randomly chooses a number among 200, 301, 404, and 500
	And clicks on the link showing the chosen number
	Then a page should be loaded with an HTTP Status equal to the number chosen

Scenario Upload
	Given browser is open
	And user is on the "https://the-internet.herokuapp.com/upload" page
	When user creates a file containing 100 random characters
	And uploads the file using the "Choose File" and "Upload" buttons
	Then successful upload message should display the name of the used file
	When user uploads the file using drag&drop and the "Upload" button
	Then successful upload message should display the name of the used file
