*** Settings ***
Documentation       Aqui estarão presente todos os tests cases dos testes web.
Test Setup          Abrir navegador
Test Teardown       Fechar navegador
Resource            ../resources/keywords/kws_webautomation.robot
Resource            ../resources/libraries/lbs_webautomation.robot

*** Variables ***
${URL}      http://automationpractice.com/
${BROWSER}  chrome

*** Test Cases ***
Caso de Teste 01: Pesquisar produto existeste
    [Tags]      PESQUISAR
    Dado que o cliente está na página home do site
    Quando o cliente pesquisar pelo produto "Blouse" no campo de pesquisa
    Então o produto "Blouse" deve ser listado na página de resultado da busca
    
Caso de Teste 02: Pesquisar produto não existente
    [Tags]      PRODUTO_N
    Dado que o cliente está na página home do site
    Quando o cliente pesquisar pelo produto "itemNãoExistente" no campo de pesquisa
    Então deve retornar a mensagem "No results were found for your search "itemNãoExistente""

Caso de Teste 03: Listar Produtos
    [Tags]      LISTA
    Dado que o cliente está na página home do site
    Quando o cliente passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    E clicar na sub categoria "Summer Dresses"
    Então deve aparecer os produtos da sub-categoria "Summer Dresses" na página

Caso de Teste 04: Adicionar Cliente
    [Tags]      CLIENTE
    Dado que o cliente está na página home do site
    Quando o cliente clicar em "Sign in"
    E informar um e-mail válido 
    E clicar em "Create an account"
    E preencher os dados obrigatórios
    E clicar no botão de cadastro
    Então o cadastro deve ser efetuado com sucesso
