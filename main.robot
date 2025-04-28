*** Settings ***

Documentation  Day la mo ta
Library    SeleniumLibrary

*** Variables ***
${URL}     https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${name}    Admin
${name1}    Admi
${pass}    admin123

*** Test Cases ***
Vaild login
    Mo trinh duyet
    truy cap URL
    Dang nhap
    kiem tra dang nhap thanh cong

invalid login
    Mo trinh duyet
    truy cap URL
    Dang nhap sai
    kiem tra dang nhap khong thanh cong

*** Keywords *** 
Mo trinh duyet
    Open Browser    ${URL}    chrome

truy cap URL
    Go To    ${URL}

Dang nhap
    Wait Until Element Is Visible    xpath=//*[@name='username']    timeout=10
    Input Text    xpath=//*[@name='username']    ${name}
    Input Text    xpath=//*[@name='password']    ${pass}
    Click Element    xpath=//button[@type='submit']

Dang nhap sai
    Wait Until Element Is Visible    xpath=//*[@name='username']    timeout=10
    Input Text    xpath=//*[@name='username']    ${name1}
    Input Text    xpath=//*[@name='password']    ${pass}
    Click Element    xpath=//button[@type='submit']

kiem tra dang nhap thanh cong
    Wait Until Element Is Visible    xpath=//h6[text()='Dashboard']    timeout=10
    Page Should Contain    Dashboard

kiem tra dang nhap khong thanh cong
    Wait Until Element Is Visible    xpath=//p[@class='oxd-text oxd-text--p oxd-alert-content-text']    timeout=20
    Page Should Contain    Invalid credentials