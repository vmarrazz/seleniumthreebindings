*** Settings ***
Documentation    Given-When-Then Demo Wrapper

*** Keywords ***
browser is open
    Log    Browser is open

user is on the "${url}" page
    Log    User is on the ${url} page

user clicks on "${element}"
    Log    User clicks on ${element}

"${element}" button should be visible
    Log    Checking if ${element} button is visible

"${element}" button should not be visible
    Log    Checking if ${element} button is not visible

user clicks on the "${element}" button
    Log    After user clicks on ${element} button
