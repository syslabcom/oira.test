*** Keyword ***
Open OiRA
    Open Browser    http://${SERVER}    ${BROWSER}
    # Set Selenium Speed    1 second

Open OiRA EU
    Open OiRA
    Go To    http://${SERVER}/eu/

Open OiRA EU and log in
    Open OiRA EU
    Log in as user

Try log in as user
    [Arguments]    ${arg1}=${USER_NAME}    ${arg2}=${USER_PASS}
    Go To    http://${SERVER}/eu/@@login
    Wait Until Page Contains Element    id=login_name
    Input Text    __ac_name    ${arg1}
    Input Text    __ac_password:utf8:ustring    ${arg2}
    Click Button    id=login_submit

Log in as user
    [Arguments]    ${arg1}=${USER_NAME}    ${arg2}=${USER_PASS}
    Try log in as user    ${arg1}    ${arg2}
    Wait Until Page Contains    Welcome
    Go To    http://${SERVER}/eu/
    Wait Until Page Contains Element    xpath=//a[text()='Settings']

Submit Form
    Wait Until Page Contains Element    css=button[type=submit]
    Click Button    css=button[type=submit]