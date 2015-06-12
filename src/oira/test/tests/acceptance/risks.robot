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
     Then I start a new session  Private Security EU    Private Security multiple locations
      And I traverse to the profile screen
     Then I can enter two locations    Commercial manned guarding  ${LOCATION1}  ${LOCATION2}
     When I traverse to the module    Commercial manned guarding
     Then The locations are visible in the navigation    ${LOCATION1}  ${LOCATION2}

User can create an action plan
    Given I am logged in as a user in OiRA EU
     Then I can select an existing session   My tool session name
     Then I can start an action plan module
     Then I fill in a measure description  Assess the team members and assign someone
     Then I fill in a prevention plan  Assess each person
     Then I fill in the requirements  Three years experience
     Then I fill in the responsible person  Anne Briggs
     Then I save and continue

User can create a report
    Given I am logged in as a user in OiRA EU
     Then I can select an existing session   My tool session name
     Then I can prepare a report
     Then I save and continue
     Then I give some feedback
     Then I save and continue
     Then I can download the action plan


*** Keywords ***

I can prepare a report
    Click Link  Report

I can download the action plan
    Wait Until Page Contains  Download the action plan

I give some feedback
    Select From List  form.widgets.country  Germany
    Select Radio Button  form.widgets.employees  1-9

I save and continue
    Click Button  Save and continue

I fill in a measure description
    [arguments]    ${description}
    Input Text  measure.action_plan:utf8:ustring:records  ${description}

I fill in a prevention plan
    [arguments]    ${prevention_plan}
    Input Text  measure.prevention_plan:utf8:ustring:records  ${prevention_plan}

I fill in the requirements
    [arguments]    ${requirements}
    Input Text  measure.requirements:utf8:ustring:records  ${requirements}

I fill in the responsible person
    [arguments]    ${responsible}
    Input Text  measure.responsible:utf8:ustring:records  ${responsible}

I continue
    Click Link  Save and continue

I can start an action plan module
    Click Link  Action Plan
    Click Link  Create action plan
    Click Link  Start module

I can select an existing session
    [arguments]  ${session_name}
    Click Element  xpath=//button[text()='${session_name}']

I can enter two locations
    [arguments]    ${module}  ${location1}  ${location2}
    Element should not be visible  xpath=//form//h2[contains(text(), "${module}")]/../fieldset[contains(@class, 'pat-checklist radio pat-depends')]
    Click element  xpath=//form//h2[contains(text(), "${module}")]/../fieldset[contains(@class, 'pat-checklist radio')]/label[contains(text(), 'Yes')]
    Element should be visible  xpath=//form//h2[contains(text(), "${module}")]/../fieldset[contains(@class, 'pat-checklist radio pat-depends')]
    Click element  xpath=//form//h2[contains(text(), "${module}")]/../fieldset[contains(@class, 'pat-checklist radio pat-depends')]/label[contains(text(), 'Yes')]
    Input text  xpath=//form//h2[contains(text(), "${module}")]/../fieldset[contains(@class, 'group')]/fieldset[contains(@class, 'pat-clone')]/label[@class='clone']/input  ${location1}
    Click button    Add another item
    Input text   xpath=//form//h2[contains(text(), "${module}")]/../fieldset[contains(@class, 'group')]/fieldset[contains(@class, 'pat-clone')]/label[@class='clone']/following-sibling::label/input  ${location2}
    Click button    Save and continue

I traverse to the module
    [arguments]     ${module}
    Click element  partial link=${module}
    Wait until page contains element    xpath=//h1[contains(text(), "${module}")]

The locations are visible in the navigation
    [arguments]    ${location1}  ${location2}
    Element should be visible  xpath=//h4[@class="location-tag" and .="${location1}"]
    Element should be visible  xpath=//h4[@class="location-tag" and .="${location2}"]

I traverse to the identification phase
    Click button    Start
    Wait until page contains element     xpath=//ol[@id="steps"]/li[@id="step-2" and @class="active"]

I traverse to the profile screen
    Click button    Start
    Wait until page contains    Tailor the risk assessment to your organisation

I navigate to risk
    [arguments]  ${risk_number}
    Click element  xpath=//ol[@class='navigation questions']//a/strong[.='${risk_number}']
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
