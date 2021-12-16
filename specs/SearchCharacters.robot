*Settings*
Documentation    Suite de Teste de Busca de personagens na API da Marvel

Resource    ${EXECDIR}/resources/Base.robot
Library     ${EXECDIR}/resources/features/Xmen.py

Suite Setup    Super Setup    oseasbrito95@gmail.com

*Test Cases*
Deve buscar um personagem pelo Id

    ${personagem}    Factory Logan
    ${logan}         POST New Character    ${personagem}
    ${logan_id}      Set Variable          ${logan.json()}[_id]

    ${response}    GET Character By Id    ${logan_id}

    Status Should Be    200    ${response}

    Should Be Equal     ${logan.json()}[name]          ${personagem}[name]
    Should Be Equal     ${logan.json()}[aliases]       ${personagem}[aliases]
    Should Be Equal     ${logan.json()}[age]           ${personagem}[age]
    Should Be Equal     ${logan.json()}[team]          ${personagem}[team]
    Should Be Equal     ${logan.json()}[active]        ${personagem}[active]

Não deve retornar o personagem pelo Id

    ${personagem_id}        Set Variable             61bb2f9125804a0016568470

    ${response}             GET Character By Id      ${personagem_id}  

    Status Should Be    404    ${response}

