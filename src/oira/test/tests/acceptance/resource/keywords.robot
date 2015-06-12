*** Keyword ***
Prepare test browser
    Open test browser
    Set window size  1300  900

Open OiRA
    Open Browser    http://${SERVER}    ${BROWSER}
    # Set Selenium Speed    1 second

Open OiRA EU
    Go To    http://${SERVER}/eu/

I am logged in as a user in OiRA EU
    Open OiRA EU
    Log in as user

Open OiRA EU and log in
    Open OiRA EU
    Log in as user

Try log in as user
    [Arguments]    ${arg1}=${USER_NAME}    ${arg2}=${USER_PASS}
    Wait until page contains    Login
    Click Link    Login
    Wait until page contains    Email address
    Input Text    __ac_name    ${arg1}
    Input Text    __ac_password:utf8:ustring    ${arg2}
    Click Button    Login

Log in as user
    [Arguments]    ${arg1}=${USER_NAME}    ${arg2}=${USER_PASS}
    Try log in as user    ${arg1}    ${arg2}
    Wait until page contains element   css=a.user-status

I log out
    [Arguments]    ${loginname}=${USER_NAME}
    Click link    ${loginname}
    Click link    Logout
    Wait until page contains    Welcome

Submit Form
    Wait Until Page Contains Element    css=button[type=submit]
    Click Button    css=button[type=submit]

Click link "register"
    Click Link    register

Register form should open
    Location Should Contain             /eu/register
    Wait Until Page Contains Element    name=email

Fill out and send register form
    Input Text    email    ${USER2_NAME}
    Input Text    password1:utf8:ustring    ${USER2_PASS}
    Input Text    password2:utf8:ustring    ${USER2_PASS}
    Click Button    xpath=//p[@class='buttonBar']/button[@value='next']
    Wait Until Page Contains Element    id=conditions

Terms of conditions should open
    Execute Javascript    window.document.getElementById('conditions').scrollTop=document.getElementById('conditions').scrollHeight;
    Element Should Be Enabled    id=agree-button

Accept terms of conditions
    Click Button    id=agreeButton
    Wait Until Page Contains Element    xpath=//a[text()='Settings']

Open account settings
    Click Link    Settings
    Wait Until Page Contains Element    xpath=//h1[text()='Account settings']

Click link "delete account"
    Click Link    Delete account
    Debug
    Wait Until Page Contains Element    xpath=//h1[text()='Delete account']

Confirm delete account action
    Input Text    form.widgets.password    ${USER2_PASS}
    Click Button    Delete account
    Wait Until Page Contains    Welcome

Account should be deleted
    Open OiRA EU
    Try log in as user    ${USER2_NAME}    ${USER2_PASS}
    Wait Until Page Contains    Your login name and/or password were entered incorrectly.

User should be created
    Open account settings

Change Password    [Arguments]    ${arg1}    ${arg2}
    Input Text    form.widgets.old_password    ${arg1}
    Input Text    form.widgets.new_password    ${arg2}
    Input Text    form.widgets.new_password.confirm    ${arg2}
    Click Button    xpath=//button[@value='Save changes']
    Wait Until Page Contains    Your password was successfully changed.

Verify new Password
    Log in as user    ${USER_NAME}    ${USER_PASS_NEW}

Reset Password    Open account settings
    Change Password    ${USER_PASS_NEW}    ${USER_PASS}

I start a new session
    [arguments]    ${tool}   ${name}=My tool session name
    Click link    start a new session
    Select From List By Label    css=select.oira_sessions_select   ${tool}
    Input text    title:utf8:ustring    ${name}
    Click button    Start session
    Wait until page contains    ${tool}
