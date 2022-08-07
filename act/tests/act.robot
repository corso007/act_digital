*** Settings ***
Resource            base.robot

Test Setup          Nova sessão
Test Teardown       Encerra sessão

*** Variables ***
${email}                xpto@hotmail.com
${check_Mr}             id_gender
${First_name}           Teste
${Last_name}            ACT
${Password}             1234aa
${Password2}            1234as
${Dia_nasc}             4
${Mes_nasc}             June
${Ano_nasc}             1966
${Check_News}           id:newsletter
${Check_Partn}          id:optin
${Company}              ACT
${Address_comp}         Av. Andromeda, 885
${State1}               California
${Code_post}            90001
${Other1}               Conj. 1505 - Green Valley
${Phone_home}           21 22222222
${Phone_mob}            21 999999999
${Alias1}               Rua Um, número 2

*** Test Cases ***
Cadastro de usuario

    Title Should Be                 Login - My Store
    Input Text                      css:input[name=email_create]        ${email}
    Click Element                   //*[@id='SubmitCreate']
    Page Should Contain     	    Authentication
    Wait Until Element Is Visible   //*[@id="submitAccount"]            10
    Click Element                   //*[@id="submitAccount"]

    Page Should Contain             There are 8 errors
    
    Wait Until Element Is Visible   //*[@id='uniform-id_gender1']       10
    Select Radio Button             id_gender          id_gender1

    Input Text                      css:input[name=customer_firstname]          ${First_name}
    Input Text                      css:input[name=customer_lastname]           ${Last_name}
    Input Text                      css:input[name=passwd]                      ${Password}
    Click Element                   //*[@id='uniform-days']
    Press Keys                      //*[@id='uniform-days']                     ${Dia_nasc}
    Click Element                   //*[@id="months"]
    Press Keys                      //*[@id="months"]                           ${Mes_nasc}
    Click Element                   //*[@id="years"]
    Press Keys                      //*[@id="years"]                            ${Ano_nasc}            
    Select checkbox                 ${Check_News}
    Checkbox Should Be Selected     ${Check_News}  
    Select checkbox                 ${Check_Partn} 
    Checkbox Should Be Selected     ${Check_Partn} 
    Input Text                      css:input[name=company]                     ${Company}
    Input Text                      css:input[name=address1]                    ${Address_comp}    
    Input Text                      css:input[name=city]                        ${State1}
    Click Element                   //*[@id="id_state"]
    Press Keys                      //*[@id="id_state"]                         ${State1}
    Input Text                      css:input[name=postcode]                    ${Code_post}
    Input Text                      //*[@id="other"]                            ${Other1}
    Input Text                      //*[@id="phone"]                            ${Phone_home}
    Input Text                      //*[@id="phone_mobile"]                     ${Phone_mob}
    Input Text                      //*[@id="alias"]                            ${Alias1}
    Click Element                   //*[@id="submitAccount"]

    Go TO                           http://automationpractice.com/index.php?controller=identity

    Input Text                      css:input[name=old_passwd]                  ${Password}
    Input Text                      css:input[name=passwd]                      ${Password2}
    Input Text                      css:input[name=confirmation]                ${Password2}
    Click Element                   //*[@name="submitIdentity"]
    
    Page Should Contain             Your personal information has been successfully updated.

