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

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains          text=${FRASE}
    Wait Until Element Is Visible     locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

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