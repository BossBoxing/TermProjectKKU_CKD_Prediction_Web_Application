*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${AGE}     42
${BP}   120
${Albumin}    0
${Sugar}    0
${BGR}    80
${BUN}    90
${SC}    0.8
${HEMO}    14.2
${PCV}    51
${RBC}    4.7
${HP}    0
${DM}    0
${CAD}    0
${APPE}    0
${ANE}    0

${AGE_CKD}     48
${BP_CKD}   70
${Albumin_CKD}    4
${Sugar_CKD}    0
${BGR_CKD}    117
${BUN_CKD}    56
${SC_CKD}    3.8
${HEMO_CKD}    11.2
${PCV_CKD}    32
${RBC_CKD}    3.9
${HP_CKD}    1
${DM_CKD}    0
${CAD_CKD}    0
${APPE_CKD}    1
${ANE_CKD}    1

*** Test Cases ***

NotCKD
    Open Login
    Input Parameter NotCKD

CKD
    Open Login
    Input Parameter CKD

*** Keywords ***
Open Login
    Open Browser    http://localhost:5000   chrome

Input Parameter NotCKD
    Wait Until Element Is Visible  name:age
    Input Text  age     ${AGE}
    Wait Until Element Is Visible  name:blood_pressure
    Input Text  blood_pressure     ${BP}
    Wait Until Element Is Visible  name:albumin
    Select From List By Index    name:albumin    ${Albumin}
    Wait Until Element Is Visible  name:sugar
    Select From List By Index    name:sugar    ${Sugar}
    Wait Until Element Is Visible  name:blood_glucose_random
    Input Text  blood_glucose_random     ${BGR}
    Wait Until Element Is Visible  name:blood_urea
    Input Text  blood_urea     ${BUN}
    Wait Until Element Is Visible  name:serum_creatinine
    Input Text  serum_creatinine     ${SC}
    Wait Until Element Is Visible  name:haemoglobin
    Input Text  haemoglobin     ${HEMO}
    Wait Until Element Is Visible  name:packed_cell_volume
    Input Text  packed_cell_volume     ${PCV}
    Wait Until Element Is Visible  name:red_blood_cell_count
    Input Text  red_blood_cell_count     ${RBC}
    Wait Until Element Is Visible  name:hypertension
    Select From List By Index    name:hypertension    ${HP}
    Wait Until Element Is Visible  name:diabetes_mellitus
    Select From List By Index    name:diabetes_mellitus    ${DM}
    Wait Until Element Is Visible  name:coronaru_artery_disease
    Select From List By Index    name:coronaru_artery_disease    ${CAD}
    Wait Until Element Is Visible  name:appetite
    Select From List By Index    name:appetite    ${APPE}
    Wait Until Element Is Visible  name:anemia
    Select From List By Index    name:anemia    ${ANE}

Input Parameter CKD
    Wait Until Element Is Visible  name:age
    Input Text  age     ${AGE_CKD}
    Wait Until Element Is Visible  name:blood_pressure
    Input Text  blood_pressure     ${BP_CKD}
    Wait Until Element Is Visible  name:albumin
    Select From List By Index    name:albumin    ${Albumin_CKD}
    Wait Until Element Is Visible  name:sugar
    Select From List By Index    name:sugar    ${Sugar_CKD}
    Wait Until Element Is Visible  name:blood_glucose_random
    Input Text  blood_glucose_random     ${BGR_CKD}
    Wait Until Element Is Visible  name:blood_urea
    Input Text  blood_urea     ${BUN_CKD}
    Wait Until Element Is Visible  name:serum_creatinine
    Input Text  serum_creatinine     ${SC_CKD}
    Wait Until Element Is Visible  name:haemoglobin
    Input Text  haemoglobin     ${HEMO_CKD}
    Wait Until Element Is Visible  name:packed_cell_volume
    Input Text  packed_cell_volume     ${PCV_CKD}
    Wait Until Element Is Visible  name:red_blood_cell_count
    Input Text  red_blood_cell_count     ${RBC_CKD}
    Wait Until Element Is Visible  name:hypertension
    Select From List By Index    name:hypertension    ${HP_CKD}
    Wait Until Element Is Visible  name:diabetes_mellitus
    Select From List By Index    name:diabetes_mellitus    ${DM_CKD}
    Wait Until Element Is Visible  name:coronaru_artery_disease
    Select From List By Index    name:coronaru_artery_disease    ${CAD_CKD}
    Wait Until Element Is Visible  name:appetite
    Select From List By Index    name:appetite    ${APPE_CKD}
    Wait Until Element Is Visible  name:anemia
    Select From List By Index    name:anemia    ${ANE_CKD}

Click System and Input
    Wait Until Element Is Visible    xpath://a[@href="#"]
    Click Link    xpath://div[@id="navbar"]/ul/li/a
    Wait Until Element Is Visible    xpath://a[@href="/setup/"]
    Click Link    xpath://a[@href="/setup/"]
    Wait Until Element Is Visible    xpath://a[@href="/appearance/themes/1/edit/"]
    Click Link    xpath://a[@href="/appearance/themes/1/edit/"]
    Wait Until Element Is Visible    id_label 
    Input Text  id_label    ${ID_LABEL}
    Wait Until Element Is Visible    id_logo 
    Input Text  id_logo    ${ID_LOGO}
    Wait Until Element Is Visible    id_navbarcolor
    Execute Javascript    document.getElementById("id_navbarcolor").value = "#009FC7"
    Wait Until Element Is Visible    id_menucolor
    Execute Javascript    document.getElementById("id_menucolor").value = "#009FC7"
    Click Button    Save

Login as User
    Wait Until Element Is Visible  id:id_username
    Input Text  id_username     ${USER_ID}
    Input Text  id_password     ${USER_PASS}
    Click Button    class:btn-primary