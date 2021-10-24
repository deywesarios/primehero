Documentation       Aqui estarão presente todos as variáveis/elementos da tela de busca do site automationpractice.

*** Variables ***
##################################################
#                PROCURAR PRODUTO                #
##################################################
&{SEARCH}     
...         INPUT_BUSCA=search_query_top
...         BTN_PESQUISAR=submit_search
...         IMG_BLOUSE=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
...         TITLE_PAGE_SEARCH=Search - My Store
...         ID_COLUNA=center_column
...         ALERT=//*[@id="center_column"]/p[@class="alert alert-warning"]