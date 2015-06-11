*** Setting ***
Library           Selenium2Library    10 seconds
Resource          secrets.robot
Library           DebugLibrary

*** Variable ***
${SERVER}         localhost:4080/Plone2/client
${BROWSER}        chrome
${PROTOCOL}       https
${INVALID_USER_NAME}    null_user@syslab.com
${INVALID_USER_PASS}    nullpassword
${DEMO_SESSION_TOOLID}    demo/demo-garage-holder
${DEMO_SESSION_NAME}    robot_test_session
