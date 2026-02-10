*** Settings ***
Library    SeleniumLibrary
Library    String
Library    webdriver_manager.chrome
Library    webdriver_manager.firefox
Library    webdriver_manager.microsoft

*** Variables ***
${BROWSER}    Chrome
${URL}        https://www.saucedemo.com/
${HEADLESS}   False

*** Keywords ***
Open Application
    ${options}=    Set Variable    add_argument("--incognito")
    IF    ${HEADLESS}
        ${options}=    Catenate    SEPARATOR=;    ${options}    add_argument("--headless")
    END
    
    # Auto-install driver based on browser selection
    IF    '${BROWSER}' == 'Chrome'
        ${driver_path}=    ChromeDriverManager.Install
    ELSE IF    '${BROWSER}' == 'Firefox'
        ${driver_path}=    GeckoDriverManager.Install
    ELSE IF    '${BROWSER}' == 'Edge'
        ${driver_path}=    EdgeChromiumDriverManager.Install
    END
    
    # Open browser with specific driver path if available
    IF    $driver_path
        Open Browser    ${URL}    ${BROWSER}    options=${options}    executable_path=${driver_path}
    ELSE
        Open Browser    ${URL}    ${BROWSER}    options=${options}
    END

    Maximize Browser Window
    Set Selenium Speed    0.2s
    Register Keyword To Run On Failure    Capture Screenshot On Failure

Capture Screenshot On Failure
    ${test_name_formatted}=    Replace String    ${TEST NAME}    ${SPACE}    _
    Capture Page Screenshot    filename=${test_name_formatted}_screenshot.png

Close Application
    Close Browser
