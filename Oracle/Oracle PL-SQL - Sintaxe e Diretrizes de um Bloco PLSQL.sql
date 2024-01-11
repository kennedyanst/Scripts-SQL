-- Comentando o Código

SET SERVEROUTPUT ON
DECLARE
    vNumero1 NUMBER(13,2); --Declaração de variável para primeiro número
    vNumero2 NUMBER(13,2); --Declaração de variável para segundo número
    vMedia NUMBER(13,2); --Declaração de variável para terceiro número
BEGIN
    /*
    Cálculo do valor da média entre dois números
    Autor: Kennedy Anderson
    Data: 11/01/2023
    */
    
    vNumero1 := 5000;
    vNumero2 := 5E3;
    vMedia   := (vNumero1 + vNumero2) / 2;     -- Calculando a média entre os dois números
    DBMS_OUTPUT.PUT_LINE('vnumero1 = ' || vNumero1); 
    DBMS_OUTPUT.PUT_LINE('vnumero2 = ' || vNumero2);
    DBMS_OUTPUT.PUT_LINE('vMedia = ' || vMedia);
END;


-- Utilizando Funções SQL no bloco PL/SQL

SET SERVEROUTPUT ON
DECLARE
    vNumero1 NUMBER(13,2); --Declaração de variável para primeiro número
    vNumero2 NUMBER(13,2); --Declaração de variável para segundo número
    vMedia NUMBER(13,2); --Declaração de variável para terceiro número
BEGIN
    /*
    Cálculo do valor da média entre dois números
    Autor: Kennedy Anderson
    Data: 11/01/2023
    */
    
    vNumero1 := 5000.8888;
    vNumero2 := 3000.4444;
    vMedia   := ROUND((vNumero1 + vNumero2) / 2,2);     -- Calculando a média entre os dois números
    DBMS_OUTPUT.PUT_LINE('vnumero1 = ' || vNumero1); 
    DBMS_OUTPUT.PUT_LINE('vnumero2 = ' || vNumero2);
    DBMS_OUTPUT.PUT_LINE('vMedia = ' || TO_CHAR(vMedia, '99G99G99D99'));
END;


-- Escopo de Identificadores e Blocos Aninhados

SET SERVEROUTPUT ON
DECLARE
    vbloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando variavel de Bloco 1: ' || vbloco1);

    DECLARE
        vbloco2 VARCHAR2(20) := 'Bloco 2';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Referenciando variavel de Bloco 1: ' || vbloco1);
        DBMS_OUTPUT.PUT_LINE('Referenciando variavel de Bloco 2: ' || vbloco2);
    END;
    DBMS_OUTPUT.PUT_LINE('Referenciando variavel de Bloco 1: ' || vbloco1);
END;


-- Identificando Blocos através de Labels

SET SERVEROUTPUT ON
<<BLOCO1>>
DECLARE
    vbloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando variavel de Bloco 1: ' || vbloco1.VBLOCO1);
    -- Se referenciar vbloco2 aqui ocorrerá Erro
    <<BLOCO2>>
    DECLARE
        vbloco2 VARCHAR2(20) := 'Bloco 2';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Referenciando variavel de Bloco 1: ' || bloco1.vbloco1);
        DBMS_OUTPUT.PUT_LINE('Referenciando variavel de Bloco 2: ' || bloco2.vbloco2);
    END;
    DBMS_OUTPUT.PUT_LINE('Referenciando variavel de Bloco 1: ' || bloco1.vbloco1);
END;

