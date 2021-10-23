*** Settings ***
Documentation       Todas as configurações de SETUP e TEARDOWN do projeto estarão aqui.

Resource        package.robot

*** Variables ***
${BROWSER}  chrome
${URL}      http://automationpractice.com/

*** Keywords ***
#SETUP E TEARDOWN
Abrir navegador
    Open BROWSER        ${URL}      ${BROWSER}
    Maximize BROWSER Window

Fechar navegador
    Set Screenshot Directory         ./evidencias/
    Capture Page Screenshot
    Close BROWSER