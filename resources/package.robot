*** Settings ***
Documentation       Aqui estarão presentes todos os recursos que compõem o projeto.

##################################################
#                  Libraries                     #
##################################################
Library     SeleniumLibrary
Library     String

##################################################
#                  Keywords                      #
##################################################
Resource        keywords/kws_webautomation.robot   

##################################################
#                    Pages                       #
##################################################
Resource        pages/pages_home.robot
Resource        pages/pages_cadastro.robot
Resource        pages/pages_procurar.robot
Resource        pages/pages_categoria.robot
Resource        pages/pages_summer_dresses.robot
Resource        pages/pages_minha_conta.robot

##################################################
#                    Hooks                       #
##################################################
Resource        hooks.robot