*** Setting ***

Resource  plone/app/robotframework/selenium.robot
Resource  plone/app/robotframework/keywords.robot
Resource  resource/common.robot
Resource  resource/keywords.robot

Test Setup        Prepare test browser
Test Teardown     Close all browsers

*** Variable ***

${LOCATION1}    Fleet Street
${LOCATION2}    Sunrise Avenue

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

User can answer risks
    Given I am logged in as a user in OiRA EU
     Then I start a new session  Leather & Tanning
      And I traverse to the identification phase
     When I navigate to risk    1.1
     Then I can answer the risk as Yes   1.1
     When I navigate to risk    1.2
     Then I can answer the risk as No    1.2

User can enter multiple locations in a profile
    Given I am logged in as a user in OiRA EU
     Then I start a new session  Private Security EU
      And I traverse to the profile screen
     Then I can enter two locations    Commercial manned guarding  ${LOCATION1}  ${LOCATION2}
     When I traverse to the module    Commercial manned guarding
     Then The locations are visible in the navigation    ${LOCATION1}  ${LOCATION2}

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

I traverse to the identification phase
    Click button    Start

I navigate to risk
    [arguments]  ${risk_number}
    Click element  xpath=//ol[@class='navigation questions']//a/strong[contains(text(), '${risk_number}')]
    Wait until page contains element   xpath=//fieldset[@id="${risk_number}"]  2

I can answer the risk as Yes
    [arguments]   ${risk_number}
    Click element    xpath=//fieldset[contains(@class, "pat-checklist radio")]/label[contains(text(), "Yes")]
    Click button    Save and continue
    Wait until element is visible  xpath=//ol[@class='navigation questions']//li[@class='answered ' and contains(@title, '${risk_number}')]

I can answer the risk as No
    [arguments]   ${risk_number}
    Element should not be visible     xpath=//fieldset[@id='evaluation']
    Click element    xpath=//fieldset[contains(@class, "pat-checklist radio")]/label[contains(text(), "No")]
    Wait until element is visible     xpath=//fieldset[@id='evaluation']
    Click button    Save and continue
    Wait until element is visible  xpath=//ol[@class='navigation questions']//li[@class='answered risk ' and contains(@title, '${risk_number}')]
