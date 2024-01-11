-- Bloco Anonimo - Exemplo

SET SERVEROUTPUT ON
DECLARE
    vNumero1 NUMBER(11,2) := 500;
    vNumero2 NUMBER(11,2) := 400;
    vMedia   NUMBER(11,2);
BEGIN
    vMedia := (vNumero1 + vNumero2) / 2;
    DBMS_OUTPUT.PUT_LINE('Media = ' || vMedia);
END;
    