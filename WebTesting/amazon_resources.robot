*** Settings ***
Library          SeleniumLibrary

*** Variables ***
${BROWSER}             chrome
${URL}                 https://www.amazon.com.br/
${MENU_ELETRONICOS}    //a[contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}  //h1[contains(.,'Eletrônicos e Tecnologia')]
${MENU_COMPEINFO}      //img[@src='https://images-na.ssl-images-amazon.com/images/G/32/BR-hq/2021/img/Consumer_Electronics/Storefronts/Electronics/956.Storefront_categoria_computadores_icons_240x270.jpg']
${MENU_TABLETS}        //img[contains(@alt,'Tablets')]
${Xbox Series S}       //input[contains(@type,'text')]
${SEARCH_BUTTON}       //input[contains(@type,'submit')]

*** Keywords ***
Abrir o navegador
    Open Browser               browser=${BROWSER} 
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a homepage do site Amazon.com.br
    Go To                            url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains          text=Eletrônicos e Tecnologia
    Wait Until Element Is Visible     locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "Amazon.com.br|Tudo pra você, de A a Z."
    Title Should Be    title=Amazon.com.br | Tudo pra você, de A a Z.

Verificar se o título da página fica "Eletrônicos e Tecnologia|Amazon.com.br"
    Title Should Be    title=Eletrônicos e Tecnologia | Amazon.com.br

Verificar se o título da página fica "Amazon.com.br : Xbox Series S"
    Title Should Be    title=Amazon.com.br : Xbox Series S

Verificar se aparece a categoria "Computadores e Informática"
    Element Should Be Visible    locator=${MENU_COMPEINFO}

Verificar se aparece a categoria "Tablets"
    Element Should Be Visible    locator=${MENU_TABLETS}


Digitar o nome de produto "${PESQUISA}" no campo de pesquisa
    Click Element    locator=${Xbox Series S}
    Input Text       locator=${Xbox Series S}    text=${PESQUISA}

Clicar no botão de pesquisa
    Click Element    locator=${SEARCH_BUTTON}

Verificar o resultado da pesquisa se está listando o produto pesquisado
    Wait Until Page Contains    text=resultados para "Xbox Series S"



# GHERKIN STEPS
Dado que estou na home page da Amazon.com.br
    Acessar a homepage do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br|Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia|Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia|Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página  
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto pesquisado