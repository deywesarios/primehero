Documentation       Aqui estarão presente todos as variáveis/elementos de Cadastro do site automationpractice.

*** Variables ***
##################################################
#               PAGINA DE CADASTRO               #
##################################################
&{REG}     
...         EMAIL=email_create
...         OUT_OF_PAGE=center_column
...         OK=//*[@id="create-account_form"]//div[@class="form-group form-ok"]
...         BTN_SUBMIT_EMAIL=SubmitCreate
...         BTN_SUBMIT=submitAccount

##################################################
#                CAMPOS DE DADOS                 #
##################################################
&{DATA} 
...         HEADER_ACCOUNT=account-creation_form
...         OPTION_SEX=id_gender1
...         INPUT_FIRSTNAME=firstname
...         INPUT_COSTUMER_FIRSTNAME=customer_firstname
...         INPUT_LASTNAME=lastname
...         INPUT_COSTUMER_LASNAME=customer_lastname
...         INPUT_PASSWORD=passwd
...         INPUT_ADDRESS=address1
...         INPUT_CITY=city
...         INPUT_POSTCODE=postcode
...         INPUT_PHONE=phone_mobile
...         INPUT_ALIAS=alias
...         SELECT_DAYS=days
...         SELECT_MONTHS=months
...         SELECT_YEARS=years
...         SELECT_ID_STATE=id_state 