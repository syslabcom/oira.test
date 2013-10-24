*** Setting ***
Test Setup        Open OiRA EU
Test Teardown     Close Browser
Resource          resource/common.robot
Resource          resource/keywords.robot

*** Test Case ***
Register and delete User
    [Documentation]    Register a new user and delete the account again
    Click link "register"
    Register form should open
    Fill out and send register form
    Terms of conditions should open
    Accept terms of conditions
    User should be created
    Click link "delete account"
    Confirm delete account action
    Account should be deleted

Change Password
    [Documentation]    Change Password of existing user
    Log in as user    ${USER_NAME}    ${USER_PASS}
    Open account settings
    Change Password    ${USER_PASS}    ${USER_PASS_NEW}
    Verify new Password
    Reset Password

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
                      Click Button                        next
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
                      Click Button                        Delete account
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
                      Click Button                        Save changes
                      Wait Until Page Contains            Your password was successfully changed.

Verify new Password
                      Log in as user                      ${USER_NAME}                                                                                                  ${USER_PASS_NEW}

Reset Password        Open account settings
                      Change Password                     ${USER_PASS_NEW}                                                                                              ${USER_PASS}