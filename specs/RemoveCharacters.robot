*Settings*
Documentation    Suite de Exclusão de Personagens na API da Marvel

Resource    ${EXECDIR}/resources/Base.robot
Library     ${EXECDIR}/resources/features/Xmen.py

Suite Setup    Super Setup    oseasbrito95@hotmail.com

*Test Cases*
Deve remover um personagem pelo Id

    ${personagem}    Factory Cyclope 
    ${cyclope}       POST New Character    ${personagem}
    ${cyclope_id}    Set Variable          ${cyclope.json()}[_id]

    ${response}    DELETE Character By Id    ${cyclope_id}

    Status Should Be    204    ${response}

    ${response2}        GET Character By Id  ${cyclope_id}

    Status Should Be    404    ${response2}


Não deve retornar o personagem pelo Id inexistente

    ${personagem_id}    Set Variable    61bb38df25804a00165684bb

    ${response}    DELETE Character By Id    ${personagem_id}    

    Status Should Be    404    ${response}

