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
Resource        pages/pages_clientes.robot

##################################################
#                    Hooks                       #
##################################################
Resource        hooks.robot