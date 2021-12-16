*Settings*
Documentation    Suite de Teste do cadastro de personagens na API da Marvel

Resource    ${EXECDIR}/resources/Base.robot
Library     ${EXECDIR}/resources/features/Guardians.py

Suite Setup      Super Setup  oseasbj@hotmail.com

*Test Cases*
Deve cadastrar um personagem

    ${personagem}    Factory Star Lord
    ${response}      POST New Character    ${personagem}

    Status Should Be    200    ${response}

Não deve casdatrar com o mesmo nome
    [Tags]      dup

    ${personagem}         Factory Groot
    POST New Character    ${personagem}

    ${response}    POST New Character    ${personagem}

    Status Should Be    409                          ${response}
    Should Be Equal     ${response.json()}[error]    Character already exists :(




