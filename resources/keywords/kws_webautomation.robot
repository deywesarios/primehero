***Settings***
Documentation   Aqui estarão presente todas as keywords dos testes web.

*** Variables ***
${BROWSER}  chrome
${URL}      http://automationpractice.com/
&{USUARIO}  
...         nome=Deywes
...         sobrenome=Rios
...         idade=21
...         senha=12345
...         cidade=PhoenixVille
...         endereco=1st Avenue
...         estado=38
...         endereco_alt=nenhum
...         telefone=+1 941 256 286
...         cep=19460
...         dia=10
...         mes=7
...         ano=2000

*** Keywords ***
#SETUP E TEARDOWN
Abrir navegador
    Open BROWSER        ${URL}      ${BROWSER}
    Maximize BROWSER Window

Fechar navegador
    Set Screenshot Directory         ./evidencias/
    Capture Page Screenshot
    Close BROWSER

Dado que o cliente está na página home do site
    Title Should Be     My Store
    Wait until Element is Visible       xpath=//*[@id="block_top_menu"]

Quando o cliente pesquisar pelo produto "${PRODUTO}" no campo de pesquisa
    Input Text      id=search_query_top     ${PRODUTO}
    Click Button   name=submit_search

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Wait until Element is Visible   id=center_column
    Page Should Contain Image       xpath=//*[@id="center_column"]//*[@src="${URL}img/p/7/7-home_default.jpg"]
    Title Should Be     Search - My Store

Então deve retornar a mensagem "${MSG_ERROR}"
    Wait Until Element is Visible   xpath=//*[@id="center_column"]/p[@class="alert alert-warning"]
    Element Text Should Be          xpath=//*[@id="center_column"]/p[@class="alert alert-warning"]      ${MSG_ERROR}

Quando o cliente passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
    Mouse Over      xpath=//*[@id="block_top_menu"]//a[@title="${CATEGORIA}"]

E clicar na sub categoria "${SUB_CATEGORIA}"
    Click Element   xpath=//*[@id="block_top_menu"]//ul[@class="sf-menu clearfix menu-content sf-js-enabled sf-arrows"]//a[@title="${SUB_CATEGORIA}"]

Então deve aparecer os produtos da sub-categoria "${SUB_CATEGORIA}" na página
    Title Should Be     Summer Dresses - My Store
    Wait Until Element is Visible   id=center_column
    Element Text Should Be          xpath=//*[@id="center_column"]//span[@class="category-name"]     ${SUB_CATEGORIA}

Quando o cliente clicar em "${SIGN_IN}"
    Click Element   xpath=//*[@id="header"]//a[@class="login"]

E informar um e-mail válido
    Wait Until Element is Visible   id=email_create
    ${EMAIL}  Catenate   ${USUARIO.nome}_${USUARIO.sobrenome}_${USUARIO.idade}@robot.com
    ${EMAIL}    Convert To Lower Case  ${EMAIL}
    [Return]    ${EMAIL}
    Input Text      id=email_create     ${EMAIL}
    Click Element   id=center_column
    Wait Until Element is Visible       xpath=//*[@id="create-account_form"]//div[@class="form-group form-ok"]

E clicar em "Create an account"
    Click Element   id=SubmitCreate

E preencher os dados obrigatórios
    Wait until Element is Visible   id=account-creation_form
    Click Element   id=id_gender1
    Input Text  id=customer_firstname  ${USUARIO.nome}
    Input Text  id=firstname  ${USUARIO.nome}
    Input Text  id=customer_lastname  ${USUARIO.sobrenome}
    Input Text  id=lastname  ${USUARIO.sobrenome}
    Input Text  id=passwd  ${USUARIO.senha}
    Input Text  id=address1  ${USUARIO.endereco}
    Input Text  id=city  ${USUARIO.cidade}
    Input Text  id=postcode  ${USUARIO.cep}
    Input Text  id=phone_mobile  ${USUARIO.telefone}
    Input Text  id=alias  ${USUARIO.endereco_alt}
    Select From List By Value   id=days   ${USUARIO.dia}
    Select From List By Value   id=months   ${USUARIO.mes}
    Select From List By Value   id=years   ${USUARIO.ano}
    Select From List By Value   id=id_state   ${USUARIO.estado}

E clicar no botão de cadastro
    Click Button    id=submitAccount

Então o cadastro deve ser efetuado com sucesso
    Title Should Be     My account - My Store
    Wait until Element is Visible     xpath=//*[@id="center_column"]//p[@class="info-account"]
    Page Should Contain Element  xpath=//*[@id="header"]//span[text()="${USUARIO.nome} ${USUARIO.sobrenome}"]