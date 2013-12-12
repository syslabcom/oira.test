*** Setting ***
Test Setup        Open OiRA
Test Teardown     Close Browser
Resource          resource/common.robot
Resource          resource/keywords.robot

*** Test Case ***
Language tests
    [Documentation]    testing of OiRA multiple European languages. content "Ajouter" im Css-Style - testbar wie?
    Go To    ${PROTOCOL}://${SERVER}/eu
    Log in as user    ${USER_NAME}    ${USER_PASS}
    Go To    ${PROTOCOL}://${SERVER}/cy/hairdressers/cyprus_hairdressers_el
    Click Button    next
    Wait Until Page Contains    Βοήθεια
    Wait Until Page Contains    Αξιολόγηση
    Wait Until Page Contains    Κύπρος: Κουρεία - Κομμωτήρια
    Wait Until Page Contains    Η εκτίμηση του κινδύνου δεν είναι περίπλοκη
    Go To    ${PROTOCOL}://${SERVER}/cy/civil-service/demosia-dioikese
    Click Button    next
    Wait Until Page Contains    Βοήθεια
    Wait Until Page Contains    Αξιολόγηση
    Wait Until Page Contains    Εργασίες Γραφείου - Δημόσια Διοίκηση
    Wait Until Page Contains    Μια αδιάφορη
    Wait Until Page Contains    Σχετικά
    Go To    ${PROTOCOL}://${SERVER}
    Go To    ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres
    Click Button    next
    Wait Until Page Contains    Aide
    Wait Until Page Contains    Estimation
    Wait Until Page Contains    Transport routier
    Wait Until Page Contains    L'évaluation des risques professionnels (EvRP)
    Go To    ${PROTOCOL}://${SERVER}
    Go To    ${PROTOCOL}://${SERVER}/eu/leather-tanning/leather-tanning-draft-risk-assessment-tool
    Click Button    next
    Wait Until Page Contains    Help
    Wait Until Page Contains    Evaluation
    Wait Until Page Contains    Leather & Tanning
    Wait Until Page Contains    Goal of the risk assessment tool
    Go To    ${PROTOCOL}://${SERVER}
    # Language test /fr    [Documentation]    (support #6714 bzw. #5932) testing of OiRA languages /fr !WARN wanted text-version of the comments unclear.
    # [Tags]    fixme
    # Go To    ${PROTOCOL}://${SERVER}/eu
    # Log in as user    ${USER_NAME}    ${USER_PASS}
    # Go To    ${PROTOCOL}://${SERVER}/fr?set_language=fr
    # Wait Until Page Contains    Outil d'évaluation
    # Wait Until Page Contains    des risques en ligne
    # Click Button    next
    # Click Button    css=button[type=submit]
    # Go To    ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/identification/1
    # Go To    ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/identification/1/1/1
    # Wait Until Page Contains    xpath=//textarea[@placeholder="Vous pouvez écrire ici tout commentaire se rapportant à cette question. Vous retrouverez ce commentaire dans le plan d'action."]
    # Go To    ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/evaluation/1/1/1
    # Wait Until Page Contains    Vous pouvez écrire ici tout commentaire se rapportant à cette question. Vous retrouverez ce commentaire dans le plan d'action.
    # Go To    ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/actionplan/1/1/1
    #?Wait Until Page Contains    Vous pouvez écrire ici tout commentaire se rapportant à cette question.
    # Wait Until Page Contains    Vous pouvez écrire ici tout commentaire se rapportant à cette question.
    # Go To    ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/report
    #?Wait Until Page Contains    Vous pouvez écrire ici tout commentaire se rapportant à cette question.
    # Wait Until Page Contains    Vous pouvez écrire ici tout commentaire se rapportant à cette question.
    # Language test /fr Ajouter    Log Failing test    #5932 WARN
    # Go To    ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/actionplan/1/1/1
    # Click Link    xpath=//p[contains(@class,'solutions')]
    # ${CURR_STYLE}=    Get Element Attribute    xpath=//p[contains(@class,'solutions')]/ol/li[1]@style
    # Log    ${CURR_STYLE}
    # Should Contain    ${CURR_STYLE}    Ajouter
    # Page Should Contain Element    div#standardSolutuions.solutions
    # Go To    href="#standardSolutions"

Language test /fr button-name
    [Documentation]    (support #5932) testing of button-name "Accepter et continuer"
    Go To    ${PROTOCOL}://${SERVER}/fr/logout
    Go To    ${PROTOCOL}://${SERVER}/eu?set_language=en
    Click link "register"
    Register form should open
    Fill out and send register form
    Terms of conditions should open
    Wait Until Page Contains    Agree and continue
    Go To    ${PROTOCOL}://${SERVER}/terms-and-conditions?set_language=fr
    Terms of conditions should open
    Wait Until Page Contains    Accepter et continuer
    Go To    ${PROTOCOL}://${SERVER}/eu/account-settings?set_language=en
    Go To    ${PROTOCOL}://${SERVER}/eu/account-delete
    Confirm delete account action
    Account should be deleted

Test /cy hairdressers button names
    [Documentation]    (support #6286 bzw. #6266) Test ${PROTOCOL}://${SERVER}/cy/hairdressers/hairdressers-tool-demo/report/company bzw. ${PROTOCOL}://${SERVER}/cy/hairdressers/cyprus_hairdressers_el/report/company Παράκαμψη βήματος, Αποθήκευση
    Go To    ${PROTOCOL}://${SERVER}/eu
    Log in as user    ${USER_NAME}    ${USER_PASS}
    Go To    ${PROTOCOL}://${SERVER}/cy?set_language=el
    Click Button    next
    Submit Form
    Submit Form
    Click Link    Έκθεση
    Click Button    next
    Location Should Contain    /report/company
    Wait Until Page Contains    Παράκαμψη βήματος
    Wait Until Page Contains    Αποθήκευση

Test /fr buttons outside field
    [Documentation]    (support #6266) ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/identification/1/2/2 Test to make sure, the buttons are outside/above the field below
    Go To    ${PROTOCOL}://${SERVER}/eu
    Log in as user    ${USER_NAME}    ${USER_PASS}
    Go To    ${PROTOCOL}://${SERVER}/fr?set_language=fr
    # Wait Until Element Is Visible    jquery=select.oira_sessions_select
    Select From List By Value    jquery=select.oira_sessions_select    transportroutier/transporoutier-2-parametres
    Click Button    next
    Submit Form
    Go To    ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/identification/1/2/2
    Wait Until Page Contains    Enregistrer et continuer
    ${FIRST_ELEM}=    Get Vertical Position    css=p.buttonBar
    ${SECOND_ELEM}=    Get Vertical Position    css=div.message.emphasis
    Should Be True    ${FIRST_ELEM} < ${SECOND_ELEM}
    # Test /cy button layout    [Documentation]    Test ${PROTOCOL}://${SERVER}/cy/hairdressers/cyprus_hairdressers_el/ (support #6266)
    # Go To    ${PROTOCOL}://${SERVER}/cy/hairdressers/cyprus_hairdressers_el/
    #Element Should Contain    table.id=sessionList    td.class="actions span-5"
    # Go To    ${PROTOCOL}://${SERVER}/cy
    # Element Should Contain    table.id=sessionList    td.class="actions span-5"
    # ${ELEMENT}=    Get Element Attribute    table_id@class
    # Should Be True    ${ELEMENT}="actions span-5"

Test /cy buttons outside field
    [Documentation]    (support #6266) Test ${PROTOCOL}://${SERVER}/cy/hairdressers/cyprus_hairdressers_el/identification/1/1
    Go To    ${PROTOCOL}://${SERVER}/eu
    Log in as user    ${USER_NAME}    ${USER_PASS}
    Go To    ${PROTOCOL}://${SERVER}/cy/hairdressers/cyprus_hairdressers_el?set_language=el
    Click Button    next
    Submit Form
    Go To    ${PROTOCOL}://${SERVER}/cy/hairdressers/cyprus_hairdressers_el/identification/1/1
    Wait Until Page Contains    Αποθήκευση
    ${FIRST_ELEM}=    Get Vertical Position    css=p.buttonBar
    ${SECOND_ELEM}=    Get Vertical Position    css=div.message.emphasis
    Should Be True    ${FIRST_ELEM} < ${SECOND_ELEM}
    # Test /pt buttons outside field    [Documentation]    Test ${PROTOCOL}://${SERVER}/pt/cabeleireiro/preview/identification/1/1/3 (support #6266)
    # Go To    ${PROTOCOL}://${SERVER}/eu
    # Log in as user    ${USER_NAME}    ${USER_PASS}
    # Go To    ${PROTOCOL}://${SERVER}/pt/cabeleireiro/preview/identification/1/1/3?set_language=pt
    # Click Button    next
    # Click Button    css=button[type=submit]
    # Go To    ${PROTOCOL}://${SERVER}/pt/cabeleireiro/preview/identification/1/1/3
    # Wait Until Page Contains    ...
    # ${FIRST_ELEM}=    Get Vertical Position    css=p.buttonBar
    # ${SECOND_ELEM}=    Get Vertical Position    css=div.message.emphasis
    # Should Be True    ${FIRST_ELEM} < ${SECOND_ELEM}

Test /fr identification link
    [Documentation]    (support #6204) Test ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/identification
    Go To    ${PROTOCOL}://${SERVER}/eu
    Log in as user    ${USER_NAME}    ${USER_PASS}
    Go To    ${PROTOCOL}://${SERVER}/fr/?set_language=fr
    # Wait Until Element Is Visible    jquery=select.oira_sessions_select
    Select From List By Value    jquery=select.oira_sessions_select    transportroutier/transporoutier-2-parametres
    Click Button    next
    Submit Form
    Go To    ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/identification
    # Go To    href="${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/identification/report/download"
    Click Link    link=liste de tous les risques

Test clickable subsections
    [Documentation]    (support #5187) testing of direct clickable subsection bullets when previous bullets and their questions are still unanswered.
    Go To    ${PROTOCOL}://${SERVER}/eu
    Log in as user    ${USER_NAME}    ${USER_PASS}
    Go To    ${PROTOCOL}://${SERVER}/fr/?set_language=fr
    # Wait Until Element Is Visible    jquery=select.oira_sessions_select
    Select From List By Value    jquery=select.oira_sessions_select    transportroutier/transporoutier-2-parametres
    Click Button    next
    Submit Form
    Go To    ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/identification/1/2
    Click Link    xpath=//ol[@class='microns']/li[@title='1.2.1. Le conducteur descend-il de sa cabine en utilisant les marches ?']/a
    Wait Until Page Contains    Oui
    Radio Button Should Not Be Selected    answer
    Click Link    xpath=//ol[@class='microns']/li[@title='1.2.2. Le conducteur circule-t-il sur une zone propre ?']/a

Test help headings en
    [Documentation]    (support #5648, #5170) !WARN, translations not yet updated: in the countries that show NO NUMBERS before the headings. /eu (English) /bg (Bulgarian), /ca (Catalan), /cs (Czech), /de (German), /el (Greek), /es (Spanish), /fr (French), /lt (Litauisch), /lv (Latvian), /nl-be (Flemish), /pt (Portugese), /sk (Slovakian), /sl (Slovenian), /sv (Swedish) !WARN, translations not yet updated: in the countries that show NO NUMBERS before the headings.
    Go To    ${PROTOCOL}://${SERVER}/eu/help?set_language=en
    Wait Until Page Contains    Help
    Wait Until Page Contains    Introduction
    Wait Until Page Contains    Registration
    Wait Until Page Contains    Carrying out your risk assessment
    Wait Until Page Contains    Preparation
    Wait Until Page Contains    Identification
    Wait Until Page Contains    Evaluation
    Wait Until Page Contains    Action Plan
    Wait Until Page Contains    Report
    Wait Until Page Contains    What happens next?
Test help headings bg
    Go To    ${PROTOCOL}://${SERVER}/bg/help?set_language=bg
    Wait Until Page Contains    Помощ
    Wait Until Page Contains    Въведение
    Wait Until Page Contains    Регистрация
    Wait Until Page Contains    Как Вие да извършите оценка на риска
    Wait Until Page Contains    Подготовка
    Wait Until Page Contains    Определяне
    Wait Until Page Contains    Оценяване
    Wait Until Page Contains    План за действие
    Wait Until Page Contains    Доклад
    Wait Until Page Contains    Какво се случва след това?
Test help headings ca
    Go To    ${PROTOCOL}://${SERVER}/es/help?set_language=ca
    Wait Until Page Contains    Ajuda
    Wait Until Page Contains    Introducció
    Wait Until Page Contains    Registrar-se
    Wait Until Page Contains    Sessions
    Wait Until Page Contains    Preparació
    Wait Until Page Contains    Identificació
    Wait Until Page Contains    Avaluació
    Wait Until Page Contains    Pla d'acció
    Wait Until Page Contains    Informe
    Wait Until Page Contains    Què passa després?
Test help headings cs
    Go To    ${PROTOCOL}://${SERVER}/cz/help?set_language=cs
    Wait Until Page Contains    Nápověda
    Wait Until Page Contains    Úvod
    Wait Until Page Contains    Registrace
    Wait Until Page Contains    Provedení vlastního hodnocení rizik
    Wait Until Page Contains    Příprava
    Wait Until Page Contains    Identifikace
    Wait Until Page Contains    Vyhodnocení
    Wait Until Page Contains    Akční plán
    Wait Until Page Contains    Zpráva
    Wait Until Page Contains    Co bude následovat?
Test help headings de
    Go To    ${PROTOCOL}://${SERVER}/de/help?set_language=de
    Wait Until Page Contains    Hilfe
    Wait Until Page Contains    Einführung
    Wait Until Page Contains    Authentifizierung
    Wait Until Page Contains    Sitzungen
    Wait Until Page Contains    Vorbereitung
    Wait Until Page Contains    Ermittlung
    Wait Until Page Contains    Bewertung
    Wait Until Page Contains    Aktionsplan
    Wait Until Page Contains    Bericht
    Wait Until Page Contains    Eine Bemerkung zum Schluss
Test help headings el
    Go To    ${PROTOCOL}://${SERVER}/cy/help?set_language=el
    Wait Until Page Contains    Εισαγωγή
    Wait Until Page Contains    Εγγραφή
    Wait Until Page Contains    Εκπόνηση εκτίμησης κινδύνου
    Wait Until Page Contains    Προετοιμασία
    Wait Until Page Contains    Αναγνώριση
    Wait Until Page Contains    Αξιολόγηση
    Wait Until Page Contains    Σχέδιο Δράσης
    Wait Until Page Contains    Έκθεση
    Wait Until Page Contains    Επόμενα Βήματα
Test help headings es
    Go To    ${PROTOCOL}://${SERVER}/es/help?set_language=es
    Wait Until Page Contains    Introducción
    Wait Until Page Contains    Registro
    Wait Until Page Contains    Realización de la evaluación de riesgos
    Wait Until Page Contains    Preparación
    Wait Until Page Contains    Identificación
    Wait Until Page Contains    Evaluación
    Wait Until Page Contains    Plan de Acción
    Wait Until Page Contains    Informe
    Wait Until Page Contains    ¿Que pasa después?
Test help headings fr
    Go To    ${PROTOCOL}://${SERVER}/fr/help?set_language=fr
    Wait Until Page Contains    Introduction
    Wait Until Page Contains    Inscription
    Wait Until Page Contains    Réaliser votre évaluation en ligne
    Wait Until Page Contains    Préparation
    Wait Until Page Contains    Identification
    Wait Until Page Contains    Estimation
    Wait Until Page Contains    Plan d´action
    Wait Until Page Contains    Rapport
    Wait Until Page Contains    Et ensuite ?
Test help headings lt
    Go To    ${PROTOCOL}://${SERVER}/lt/help?set_language=lt
    Wait Until Page Contains    Įvadas
    Wait Until Page Contains    Registracija
    Wait Until Page Contains    Atlikite rizikos vertinimą
    Wait Until Page Contains    Paruošimas
    Wait Until Page Contains    Nustatymas
    Wait Until Page Contains    Vertinimas
    Wait Until Page Contains    Veiksmų planas
    Wait Until Page Contains    Ataskaita
    Wait Until Page Contains    Kas toliau?
Test help headings lv
    Go To    ${PROTOCOL}://${SERVER}/lv/help?set_language=lv
    Wait Until Page Contains    Ievads
    Wait Until Page Contains    Reģistrācija
    Wait Until Page Contains    Riska novērtējums
    Wait Until Page Contains    Sagatavošanās
    Wait Until Page Contains    Identifikācija
    Wait Until Page Contains    Novērtēšana
    Wait Until Page Contains    Rīcības plāns
    Wait Until Page Contains    Pārskats
    Wait Until Page Contains    Kas notiks tālāk?
Test help headings nl-be
    Go To    ${PROTOCOL}://${SERVER}/be/help?set_language=nl-be
    # Wait Until Page Contains    ? (Help in nl-be)    ? (Help in nl-be)
    Wait Until Page Contains    Inleiding
    Wait Until Page Contains    Registratie
    Wait Until Page Contains    Sessie
    Wait Until Page Contains    Voorbereiding
    Wait Until Page Contains    Identificatie
    Wait Until Page Contains    Evaluatie
    Wait Until Page Contains    Actieplan
    Wait Until Page Contains    Rapport
    Wait Until Page Contains    Wat gebeurt er vervolgens?
Test help headings pt
    Go To    ${PROTOCOL}://${SERVER}/pt/help?set_language=pt
    Wait Until Page Contains    Ajuda
    Wait Until Page Contains    Registo
    Wait Until Page Contains    Realizar a sua avaliação de riscos
    Wait Until Page Contains    Preparação
    Wait Until Page Contains    Identificação
    Wait Until Page Contains    Avaliação
    Wait Until Page Contains    Plano de Ação
    Wait Until Page Contains    Relatório
    Wait Until Page Contains    O que acontece a seguir?
Test help headings sk
    Go To    ${PROTOCOL}://${SERVER}/sk/help?set_language=sk
    Wait Until Page Contains    Pomocník
    Wait Until Page Contains    Úvod
    Wait Until Page Contains    Registrácia
    Wait Until Page Contains    Stretnutia
    Wait Until Page Contains    Príprava
    Wait Until Page Contains    Identifikácia
    Wait Until Page Contains    Vyhodnotenie
    Wait Until Page Contains    Akčný plán
    Wait Until Page Contains    Správa
    Wait Until Page Contains    Čo sa bude diať ďalej?
Test help headings sl
    Go To    ${PROTOCOL}://${SERVER}/si/help?set_language=sl
    Wait Until Page Contains    Pomoč
    Wait Until Page Contains    Uvod
    Wait Until Page Contains    Registracija
    Wait Until Page Contains    Seje
    Wait Until Page Contains    Priprava
    Wait Until Page Contains    Identifikacija
    Wait Until Page Contains    Ovrednotenje
    Wait Until Page Contains    Akcijski načrt
    Wait Until Page Contains    Poročilo
    Wait Until Page Contains    Kaj se zgodi potem?
Test help headings sv
    Go To    ${PROTOCOL}://${SERVER}/se/help?set_language=sv
    Wait Until Page Contains    Hjälp
    Wait Until Page Contains    Introduktion
    Wait Until Page Contains    Autentisering
    Wait Until Page Contains    OiRA-verktyg
    Wait Until Page Contains    Förberedning
    Wait Until Page Contains    Identifiering
    Wait Until Page Contains    Utvärdering
    Wait Until Page Contains    Handlingsplan
    Wait Until Page Contains    Rapport
    Wait Until Page Contains    Slutord

Test hide report/company skipped
    [Documentation]    (support #4436) testing of .../report/company NOT showing up again (on the example page /fr) after having been skipped. With testing of button-name "Passer"
    Go To    ${PROTOCOL}://${SERVER}/eu
    Log in as user    ${USER_NAME}    ${USER_PASS}
    Go To    ${PROTOCOL}://${SERVER}/fr/?set_language=fr
    # Wait Until Element Is Visible    jquery=select.oira_sessions_select
    Select From List By Value    jquery=select.oira_sessions_select    transportroutier/transporoutier-2-parametres
    Click Button    next
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
    Click Button    next
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

Test in /cy button settings
    [Documentation]    (support #4404) testing of /cy button settings
    Go To    ${PROTOCOL}://${SERVER}/eu
    Log in as user    ${USER_NAME}    ${USER_PASS}
    Go To    ${PROTOCOL}://${SERVER}/cy/?set_language=el
    Click Button    next
    Submit Form
    Go To    ${PROTOCOL}://${SERVER}/cy/civil-service/demosia-dioikese
    Click Button    next
    Submit Form
    Location Should Be    ${PROTOCOL}://${SERVER}/cy/civil-service/demosia-dioikese/identification
    Wait Until Page Contains    Ρυθμίσεις
    Wait Until Page Contains    Κατάσταση
    Click Link    Κατάσταση
    Location Should Be    ${PROTOCOL}://${SERVER}/cy/civil-service/demosia-dioikese/status
    Click Link    Ρυθμίσεις
    Location Should Be    ${PROTOCOL}://${SERVER}/cy/account-settings

## The link opens in a new tab, if it were possible to open in a new window instead
## the Select Window keyword should work
# Test privacy link footer
#     [Documentation]    (support #4304) testing for the privacy link in the footer (for the client), this test only fails because the link opens in a new window
#     Go To    ${PROTOCOL}://${SERVER}/eu
#     Click Link    Privacy
#     Location Should Be ${PROTOCOL}://${SERVER}/terms-and-conditions

Test legal references
    [Documentation]    (support #6640) Legal references have disappeared from the evaluation and action plan. ? also needed for actionplan/1/1/1
    Go To    ${PROTOCOL}://${SERVER}/eu
    Log in as user    ${USER_NAME}    ${USER_PASS}
    Go To    ${PROTOCOL}://${SERVER}/fr/?set_language=fr
    # Wait Until Element Is Visible    jquery=select.oira_sessions_select
    Select From List By Value    jquery=select.oira_sessions_select    transportroutier/transporoutier-2-parametres
    Click Button    next
    Submit Form
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
    Click Button    next
    Submit Form
    Go To    ${PROTOCOL}://${SERVER}/fr/transportroutier/transporoutier-2-parametres/actionplan/1/1/1
    Wait Until Page Contains    Mesure
    Click Button    Ajouter une autre mesure

*** Keyword ***       Value                               Value                                                                                                         Value
Click link "register"
                      Click Link                          register

Register form should open
                      Location Should Contain             /eu/@@register
                      Wait Until Page Contains Element    name=email

Fill out and send register form
                      Input Text                          email                                                                                                         ${USER2_NAME}
                      Input Text                          password1:utf8:ustring                                                                                        ${USER2_PASS}
                      Input Text                          password2:utf8:ustring                                                                                        ${USER2_PASS}
                      Click Button                        xpath=//p[@class='buttonBar']/button[@value='next']
                      Wait Until Page Contains Element    id=conditions

Terms of conditions should open
                      Execute Javascript                  window.document.getElementById('conditions').scrollTop=document.getElementById('conditions').scrollHeight;
                      Element Should Be Enabled           id=agreeButton

Accept terms of conditions
                      Click Button                        id=agreeButton
                      Wait Until Page Contains Element    xpath=//a[text()='Settings']

Open account settings
                      Click Link                          Settings
                      Wait Until Page Contains Element    xpath=//h1[text()='Account settings']

Click link "delete account"
                      Click Link                          Delete account
                      Wait Until Page Contains Element    xpath=//h1[text()='Delete account']

Confirm delete account action
                      Input Text                          form.widgets.password                                                                                         ${USER2_PASS}
                      Click Button                        xpath=//button[@value='Delete account']
                      Wait Until Page Contains            Welcome

Account should be deleted
                      Try log in as user                  ${USER2_NAME}                                                                                                 ${USER2_PASS}
                      Wait Until Page Contains            Your login name and/or password were entered incorrectly.

User should be created
                      Open account settings

Change Password       [Arguments]                         ${arg1}                                                                                                       ${arg2}
                      Input Text                          form.widgets.old_password                                                                                     ${arg1}
                      Input Text                          form.widgets.new_password                                                                                     ${arg2}
                      Input Text                          form.widgets.new_password.confirm                                                                             ${arg2}
                      Click Button                        xpath=//button[@value='Save changes']
                      Wait Until Page Contains            Your password was successfully changed.

Verify new Password
                      Log in as user                      ${USER_NAME}                                                                                                  ${USER_PASS_NEW}

Reset Password        Open account settings
                      Change Password                     ${USER_PASS_NEW}                                                                                              ${USER_PASS}
