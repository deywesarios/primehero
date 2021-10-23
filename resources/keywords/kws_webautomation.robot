***Settings***
Documentation   Aqui estarão presente todas as keywords dos testes web.

Resource        ../package.robot

*** Variables ***
&{USUARIO}  
...         nome=Deywes
...         sobrenome=Rios
...         idade=3
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
Dado que o cliente está na página home do site
    Title Should Be     ${HOME.TITLE_PAGE_HOME}
    Wait until Element is Visible       xpath=${HOME.HEADER_OPTIONS}

Quando o cliente pesquisar pelo produto "${PRODUTO}" no campo de pesquisa
    Input Text      id=${HOME.INPUT_BUSCA}     ${PRODUTO}
    Click Button   name=${HOME.BTN_PESQUISAR}

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Wait until Element is Visible   id=center_column
    Page Should Contain Image       xpath=${HOME.IMG_BLOUSE}
    Title Should Be     ${HOME.TITLE_PAGE_SEARCH}

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
    Wait until Element is Visible   id=${DATA.HEADER_ACCOUNT}
    Click Element   id=${DATA.OPTION_SEX}
    Input Text  id=${DATA.INPUT_COSTUMER_FIRSTNAME}  ${USUARIO.nome}
    Input Text  id=${DATA.INPUT_FIRSTNAME}  ${USUARIO.nome}
    Input Text  id=${DATA.INPUT_COSTUMER_LASNAME}  ${USUARIO.sobrenome}
    Input Text  id=${DATA.INPUT_LASTNAME}  ${USUARIO.sobrenome}
    Input Text  id=${DATA.INPUT_PASSWORD}  ${USUARIO.senha}
    Input Text  id=${DATA.INPUT_ADDRESS}  ${USUARIO.endereco}
    Input Text  id=${DATA.INPUT_CITY}  ${USUARIO.cidade}
    Input Text  id=${DATA.INPUT_POSTCODE}  ${USUARIO.cep}
    Input Text  id=${DATA.INPUT_PHONE}  ${USUARIO.telefone}
    Input Text  id=${DATA.INPUT_ALIAS}  ${USUARIO.endereco_alt}
    Select From List By Value   id=${DATA.SELECT_DAYS}   ${USUARIO.dia}
    Select From List By Value   id=${DATA.SELECT_MONTHS}   ${USUARIO.mes}
    Select From List By Value   id=${DATA.SELECT_YEARS}   ${USUARIO.ano}
    Select From List By Value   id=${DATA.SELECT_ID_STATE}   ${USUARIO.estado}

E clicar no botão de cadastro
    Click Button    id=submitAccount

Então o cadastro deve ser efetuado com sucesso
    Title Should Be     My account - My Store
    Wait until Element is Visible     xpath=//*[@id="center_column"]//p[@class="info-account"]
    Page Should Contain Element  xpath=//*[@id="header"]//span[text()="${USUARIO.nome} ${USUARIO.sobrenome}"]