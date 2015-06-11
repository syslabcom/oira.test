*** Setting ***
Test Setup        Open OiRA
Test Teardown     Close Browser
Resource          resource/common.robot
Resource          resource/keywords.robot

*** Test Case ***

Test clickable subsections
    [Documentation]    (support #5187) testing of direct clickable subsection bullets when previous bullets and their questions are still unanswered.
    Go To    ${PROTOCOL}://${SERVER}/eu
    Log in as user    ${USER_NAME}    ${USER_PASS}
    Go To    ${PROTOCOL}://${SERVER}/fr/?set_language=fr
    # Debug
    # Wait Until Element Is Visible    jquery=select.oira_sessions_select
    Select From List By Value    jquery=select.oira_sessions_select    transportroutier/transporoutier-2-parametres
    Sleep  5s
    Click Button    next
    Sleep  5s
    Submit Form
    Sleep  5s
    Go To    ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/identification/1/2
    Click Link    xpath=//ol[@class='microns']/li[@title='1.2.1. Le conducteur descend-il de sa cabine en utilisant les marches ?']/a
    Wait Until Page Contains    Oui
    Radio Button Should Not Be Selected    answer
    Click Link    xpath=//ol[@class='microns']/li[@title='1.2.2. Le conducteur circule-t-il sur une zone propre ?']/a



Test hide report/company skipped
    [Documentation]    (support #4436) testing of .../report/company NOT showing up again (on the example page /fr) after having been skipped. With testing of button-name "Passer"
    Go To    ${PROTOCOL}://${SERVER}/eu
    Log in as user    ${USER_NAME}    ${USER_PASS}
    Go To    ${PROTOCOL}://${SERVER}/fr/?set_language=fr
    # Wait Until Element Is Visible    jquery=select.oira_sessions_select
    Select From List By Value    jquery=select.oira_sessions_select    transportroutier/transporoutier-2-parametres
    Sleep  5s
    Click Button    next
    Sleep  5s
    Submit Form
    Go To    ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/report
    Click Button    next
    Location Should Contain    report/company
    Wait Until Page Contains    Passer
    Click Button    form.buttons.skip
    Location Should Contain    report/view
    Go To    ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/report
    Click Button    next
    Location Should Contain    report/view

Test hide report/company answered
    [Documentation]    (support #4436) testing of .../report/company NOT showing up again (on the example page /fr) after having been answered.
    Go To    ${PROTOCOL}://${SERVER}/eu
    Log in as user    ${USER_NAME}    ${USER_PASS}
    Go To    ${PROTOCOL}://${SERVER}/fr/?set_language=fr
    # Wait Until Element Is Visible    jquery=select.oira_sessions_select
    Select From List By Value    jquery=select.oira_sessions_select    transportroutier/transporoutier-2-parametres
    Sleep  5s
    Click Button    next
    Sleep  5s
    Wait Until Page Contains    Transport routier
    Submit Form
    Go To    ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/report
    Click Button    next
    Location Should Contain    report/company
    Click Button    form.buttons.next
    Location Should Contain    report/view
    Go To    ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/report
    Click Button    next
    Location Should Contain    report/view


Test legal references
    [Documentation]    (support #6640) Legal references have disappeared from the evaluation and action plan. ? also needed for actionplan/1/1/1
    Go To    ${PROTOCOL}://${SERVER}/eu
    Log in as user    ${USER_NAME}    ${USER_PASS}
    Go To    ${PROTOCOL}://${SERVER}/fr/?set_language=fr
    # Wait Until Element Is Visible    jquery=select.oira_sessions_select
    Select From List By Value    jquery=select.oira_sessions_select    transportroutier/transporoutier-2-parametres
    Sleep  5s
    Click Button    next
    Sleep  5s
    Submit Form
    Sleep  5s
    Go To    ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/actionplan/1/1/1
    Wait Until Page Contains    Références juridiques et techniques
    Click Link    Voir
    Wait Until Page Contains    Le Code du travail précise que l'employeur prend toutes les mesures

Test Mesure
    [Documentation]    (support #5809) translation issues (fr) on actionplan
    Go To    ${PROTOCOL}://${SERVER}/eu
    Log in as user    ${USER_NAME}    ${USER_PASS}
    Go To    ${PROTOCOL}://${SERVER}/fr/?set_language=fr
    # Wait Until Element Is Visible    jquery=select.oira_sessions_select
    Select From List By Value    jquery=select.oira_sessions_select    transportroutier/transporoutier-2-parametres
    Sleep  5s
    Click Button    next
    Sleep  5s
    Submit Form
    Sleep  5s
    Go To    ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/actionplan/1/1/1
    Wait Until Page Contains    Mesure
    Click Button    Ajouter une autre mesure
