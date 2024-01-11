
-- Declarando Vari�veis utilizando os principais Tipos de Dados

SET SERVEROUTPUT ON
DECLARE
  vNumero                         NUMBER(11,2)             := 1200.50;
  vCaracterTamFixo                CHAR(100)                := 'Texto de Tamanho Fixo de at� 32767 bytes';
  vCaracterTamVariavel            VARCHAR2(100)            := 'Texto Tamanho vari�vel de at� 32767 bytes';
  vBooleano                       BOOLEAN                  := TRUE;
  vData                           DATE                     := sysdate;
  vLong                           LONG                     := 'Texto Tamanho vari�vel de at� 32760 bytes';
  vRowid                          ROWID;
  vTimestamp                      TIMESTAMP                := systimestamp;
  vTimestamptz                    TIMESTAMP WITH TIME ZONE := systimestamp;
  vCaracterTamFixoUniversal       NCHAR(100)               := 'Texto de Tamanho Fixo Universal de at� 32767 bytes';
  vCaracterTamVariavelUniversal   NVARCHAR2(100)           := 'Texto Tamanho vari�vel Universal de at� 32767 bytes';
  vNumeroInteiro                  BINARY_INTEGER           := 1200;
  vNumeroFloat                    BINARY_FLOAT             := 15000000;
  vNumeroDouble                   BINARY_DOUBLE            := 15000000;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Numero = ' ||   vNumero);
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo = ' || vCaracterTamFixo );
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Vari�vel = ' || vCaracterTamVariavel );
  IF  vBooleano = TRUE
  THEN 
    DBMS_OUTPUT.PUT_LINE('Booleano = ' || 'TRUE');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Booleano = ' || 'FALSE OR NULL');
  END IF;
  DBMS_OUTPUT.PUT_LINE('Data = ' || vData);
  DBMS_OUTPUT.PUT_LINE('Long = ' || vLong );
  SELECT rowid
  INTO   vRowid
  FROM   employees
  WHERE  first_name = 'Steven' AND last_name = 'King';
  DBMS_OUTPUT.PUT_LINE('Rowid = ' || vRowid );
  DBMS_OUTPUT.PUT_LINE('Timestamp = ' || vTimestamp);
  DBMS_OUTPUT.PUT_LINE('Timestamp with time zone= ' || vTimestamptz);
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo = ' || vCaracterTamFixoUniversal );
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Vari�vel = ' || vCaracterTamVariavelUniversal );
  DBMS_OUTPUT.PUT_LINE('Numero Inteiro = ' || vNumeroInteiro);
  DBMS_OUTPUT.PUT_LINE('Numero Float = ' || vNumeroFloat);
  DBMS_OUTPUT.PUT_LINE('Numero Double = ' || vNumeroDouble);
END;


-- Vari�veis BIND (Programas Cobol ou C)

SET SERVEROUTPUT ON
VARIABLE gmedia NUMBER
DECLARE
    vnumero1 NUMBER(11,2) := 2000;
    vnumero2 NUMBER(11,2) := 5000;
BEGIN
    :gmedia := (vnumero1 + vnumero2) / 2;
    DBMS_OUTPUT.PUT_LINE('Media = ' || TO_CHAR(:gmedia));
EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE('Media = ' || SQLCODE || SQLERRM);
END;