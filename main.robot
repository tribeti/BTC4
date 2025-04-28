*** Settings ***

Documentation  Day la mo ta
Library    SeleniumLibrary

*** Variables ***
${URL}     https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${name}    Admin
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
    Dang nhap
    kiem tra dang nhap khong thanh cong

*** Keywords *** 
Mo trinh duyet
    Open Browser    ${URL}    chrome
    Maximize Browser Window

truy cap URL
    Go To    ${URL}

Dang nhap
    Input Text    xpath=//input[@name='username']    ${name}
    Input Text    xpath=//input[@name='password']    ${pass}
    Click Element    class=oxd-button oxd-button--medium oxd-button--main orangehrm-login-button

kiem tra dang nhap thanh cong
    Page Should Contain  Dashboard

kiem tra dang nhap khong thanh cong
    Page Should Contain  Invalid credentials