*** Setting ***
Test Setup        Open OiRA
Test Teardown     Close Browser
Resource          resource/common.robot
Resource          resource/keywords.robot

*** Test Case ***
Log in
    [Documentation]    Log in with valid credentials.
    Set Test Message    Seems to work
    Go To    http://${SERVER}/eu/@@login
    Wait Until Page Contains Element    id=login_name
    Input Text    __ac_name    ${USER_NAME}
    Input Text    __ac_password:utf8:ustring    ${USER_PASS}
    Click Button    id=login_submit
    Wait Until Page Contains    Welcome

Log in fail
    [Documentation]    Log in fails when entering invalid credentials.
    Go To    http://${SERVER}/eu/@@login
    Wait Until Page Contains Element    id=login_name
    Input Text    __ac_name    ${INVALID_USER_NAME}
    Input Text    __ac_password:utf8:ustring    ${INVALID_USER_PASS}
    Click Button    id=login_submit
    Wait Until Page Contains    Your login name and/or password were entered incorrectly.
