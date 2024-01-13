-- Operadores PL/SQL


SET SERVEROUTPUT ON
DECLARE
    vNota1          NUMBER(11,2) := 7.0;
    vNota2          NUMBER(11,2) := 6.0;
    vNota3          NUMBER(11,2) := 9.0;
    vNota4          NUMBER(11,2) := 9.0;
    vMedia          NUMBER(11,2);
BEGIN
    vMedia := (vNota1 + vNota2 + vNota3 +vNota4) / 4;
    DBMS_OUTPUT.PUT_LINE('Media = ' || vMedia);
END;


-- Utilizando o comando IF

SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o Id do departamento: '
DECLARE
    vPercentual         NUMBER(3);
    vDepartment_id employees.employee_id%type := &pdepartment_id;
BEGIN
    IF vDepartment_id = 80
    THEN
        vPercentual := 10;  --Sales
    ELSE
        IF vDepartment_id = 20
        THEN
            vPercentual := 15; --Marketing
        ELSE
            IF vDepartment_id = 60
            THEN
                vPercentual := 20; --TI
            ELSE
                vPercentual := 5;
            END IF;
        END IF;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('ID do departamento:  = ' || vDepartment_id);
    DBMS_OUTPUT.PUT_LINE('Percentual = ' || vPercentual);
    
    UPDATE employees
    SET salary = salary * (1 + vPercentual / 100)
    WHERE department_id = &pdepartment_id;
    COMMIT;
END;


-- Comando ELSIF

SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o Id do departamento: '
DECLARE
    vPercentual     number(3);
    vDepartment_id employees.employee_id%type := &pdepartment_id;
BEGIN
    IF vDepartment_id = 80
    THEN
        vPercentual := 10; -- Sales
    ELSIF vDepartment_id = 20
    THEN
        vPercentual := 15; -- Marketing
    ELSIF vDepartment_id = 60
    THEN
        vPercentual := 20; -- IT
    ELSE
        vPercentual := 5;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('ID do departamento:  = ' || vDepartment_id);
    DBMS_OUTPUT.PUT_LINE('Percentual = ' || vPercentual);
    
    UPDATE employees
    SET salary = salary * (1 + vPercentual / 100)
    WHERE department_id = vDepartment_id;
    COMMIT;
END;
    
    
-- Utilizando o CASE

SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o Id do departamento: '
DECLARE
    vPercentual     NUMBER(3);
    vDepartment_id employees.employee_id%type := &pdepartment_id;
BEGIN
    CASE vDepartment_id
    WHEN 80
    THEN
        vPercentual := 10; -- Sales
    WHEN 20
    THEN
        vPercentual := 15; -- Marketing
    WHEN 60
    THEN
        vPercentual := 20; --IT
    ELSE
        vPercentual := 5;
    END CASE;
    
    DBMS_OUTPUT.PUT_LINE('ID do departamento:  = ' || vDepartment_id);
    DBMS_OUTPUT.PUT_LINE('Percentual = ' || vPercentual);
    UPDATE employees
    SET salary = salary * (1 + vPercentual / 100)
    WHERE department_id = &pdepartment_id;
    COMMIT;
END;
    
-- Utilizando CASE de outra forma

SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o Id do departamento: '
DECLARE
    vPercentual     NUMBER(3);
    vDepartment_id employees.employee_id%type := &pdepartment_id;
BEGIN
    CASE 
    WHEN vDepartment_id = 80
    THEN
        vPercentual := 10; -- Sales
    WHEN vDepartment_id = 20
    THEN
        vPercentual := 15; -- Marketing
    WHEN vDepartment_id = 60
    THEN
        vPercentual := 20; --IT
    ELSE
        vPercentual := 5;
    END CASE;
    
    DBMS_OUTPUT.PUT_LINE('ID do departamento:  = ' || vDepartment_id);
    DBMS_OUTPUT.PUT_LINE('Percentual = ' || vPercentual);
    UPDATE employees
    SET salary = salary * (1 + vPercentual / 100)
    WHERE department_id = &pdepartment_id;
    --COMMIT;
END;


-- Utilizando Loop FOR

SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE
    vNumero     NUMBER(38) := 1;
    vLimite     NUMBER(38) := &pLimite;
BEGIN
--Imprimindo número de 1 até o limite
LOOP
    DBMS_OUTPUT.PUT_LINE('Número = ' || to_char(vNumero));
    EXIT WHEN vNumero = vLimite;
    vNumero := vNumero + 1;
END LOOP;
END;

-- FOR LOOP

SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE
    vInicio     INTEGER(3) := 1;
    vFim        NUMBER(38) := &pLimite;
BEGIN
FOR i IN vInicio..vFim LOOP
    DBMS_OUTPUT.PUT_LINE('Número = ' || to_char(i) );
END LOOP;
END;


-- WHILE LOOP


SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE
    vNumero        NUMBER(38) := 1;
    vLimite        NUMBER(38) := &pLimite;
BEGIN

-- Variaveis inicializadas na seção Declare

WHILE vNumero <= vLimite LOOP
    DBMS_OUTPUT.PUT_LINE('Número = ' || to_char(vNumero));
    vNumero := vNumero +1;
END LOOP;
END;
    
    
-- Controlando LOOPs aninhados

SET SERVEROUTPUT ON
DECLARE
    vTotal      NUMBER(38) := 1;
BEGIN

<<LOOP1>>
FOR i IN 1..8 LOOP
    DBMS_OUTPUT.PUT_LINE('I = ' || to_char(i));
    <<LOOP2>>
    FOR j IN 1..8 LOOP
    DBMS_OUTPUT.PUT_LINE('J = ' || to_char(j));
    DBMS_OUTPUT.PUT_LINE('Total = ' || to_char(vTotal));
    vTotal := vTotal * 2;
    DBMS_OUTPUT.PUT_LINE('Total = ' || to_char(vTotal));
    EXIT LOOP1 WHEN vTotal > 100000000000000;
    END LOOP;
END LOOP;
DBMS_OUTPUT.PUT_LINE('Total Final = ' || to_char(vTotal));
END;