*** Setting ***

Resource  plone/app/robotframework/selenium.robot
Resource  plone/app/robotframework/keywords.robot
Resource  resource/common.robot
Resource  resource/keywords.robot

Test Setup        Prepare test browser
Test Teardown     Close all browsers

*** Test Case ***
User can start a new session
    Given I am logged in as a user in OiRA EU
     When I start a new session  Leather & Tanning
     Then I land on the preparation screen

User can resume a session
    Given I am logged in as a user in OiRA EU
     Then I start a new session  Leather & Tanning  My test session for resuming
      And I log out
     When I am logged in as a user in OiRA EU
     Then I can select the existing session  My test session for resuming

User can rename a session
    Given I am logged in as a user in OiRA EU
     Then I start a new session  Leather & Tanning  My test session for renaming


*** Keywords ***
I start a new session
    [arguments]    ${tool}   ${name}=My tool session name
    Click link    start a new session
    Select From List By Label    css=select.oira_sessions_select   ${tool}
    Input text    title:utf8:ustring    ${name}
    Click button    Start session
    Wait until page contains    ${tool}

I land on the preparation screen
    Element should be visible     xpath=//ol[@id="steps"]/li[@id="step-1" and @class="active"]

I can select the existing session
    [arguments]    ${name}
    Wait until page contains    ${name}