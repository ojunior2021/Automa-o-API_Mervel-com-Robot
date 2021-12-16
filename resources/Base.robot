*Settings*
Documentation    Base para as ações do teste de API

Library    RequestsLibrary

Resource    routes/characters.robot

*Variables*
${BASE_URL}    http://marvel.qaninja.academy

#Criando minhas proprias palavras-chave
*Keywords*
Super Setup
    [Arguments]            ${email}
    Set Client Keywords    ${email}
    Reset Database

Set Client Keywords
    [Arguments]    ${email}

        #criando um dicionario simples que recebe um email para montar a requisição e o client_key
    &{usuario}    Create Dictionary    email=${email}

    ${response}    POST
    ...            ${BASE_URL}/accounts
    ...            json=${usuario}

    ${client_key}    Set Variable         ${response.json()}[client_key]
    &{HEADERS}       Create Dictionary    client_key=${client_key}

    Set Suite Variable    ${HEADERS}

Reset Database

    DELETE    ${BASE_URL}/delorean    headers=${HEADERS}




