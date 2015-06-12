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
     Then I start a new session  Leather & Tanning    My test session for resuming
      And I log out
     When I am logged in as a user in OiRA EU
     Then I can select the existing session    My test session for resuming

User can rename a session
    Given I am logged in as a user in OiRA EU
     Then I start a new session  Leather & Tanning    My test session for renaming
     When I open the sessions dropdown
     Then I can rename the session    My test session for renaming    My renamed session

User can delete a session
    Given I am logged in as a user in OiRA EU
     Then I start a new session  Leather & Tanning    My test session for deleting
     When I open the sessions dropdown
     Then I can delete the session    My test session for deleting


*** Keywords ***

I land on the preparation screen
    Element should be visible     xpath=//ol[@id="steps"]/li[@id="step-1" and @class="active"]

I can select the existing session
    [arguments]    ${name}
    Wait until page contains    ${name}

I open the sessions dropdown
    Click link  xpath=//a[@id='button-sessions']

I can delete the session
    [arguments]    ${session_name}
    Click link  xpath=//button[contains(text(), '${session_name}')]/../../following-sibling::td[contains(@class, 'actions')]/a[contains(@class, 'icon-trash')]
    Wait until page contains    You are about to delete the session `${session_name}`.
    Click Button    Yes, delete session
    # missing: delete confirmation
    Wait until page contains    Select an earlier session to complete or review  2

I can rename the session
    [arguments]    ${old_name}  ${new_name}
    Click link  xpath=//button[contains(text(), '${old_name}')]/../../following-sibling::td[contains(@class, 'actions')]/a[contains(@class, 'icon-pencil')]
    Wait until page contains    Rename session
    Element should be visible    xpath=//input[@value="${old_name}"]
    Input text    form.widgets.title    ${new_name}
    Click button    Save changes
    # missing: rename confirmation
    Wait until page contains    Select an earlier session to complete or review  2
    Element should be visible    xpath=//form[@class="startSessionForm"]/button[contains(text(), "${new_name}")]
