-- Collections Associative Array

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    TYPE Numero_Table_Type IS TABLE OF NUMBER(2)
    INDEX BY BINARY_INTEGER;
    Numero_table Numero_Table_Type;
BEGIN
    -- Armazina número de 1 a 10 em um Associative Array
    FOR i IN 1..10
    LOOP
        Numero_Table(i) := i;
    END LOOP;
    -- Lê o Associative Array e imprime os números armazenados
    FOR i IN 1..10
    LOOP
        DBMS_OUTPUT.PUT_LINE('Associative Array: Indice = ' || TO_CHAR(i) || ', Valor = ' || TO_CHAR(Numero_Table(i)));
    END LOOP;
END;


-- Associative Array of Records - Bulk Collect

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    TYPE employees_table_type IS TABLE OF employees%rowtype
    INDEX BY BINARY_INTEGER;
    employees_table     employees_table_type;
BEGIN
    SELECT *
        BULK COLLECT INTO employees_table -- Bulk Collect de todos (order_id) para Collections (voider_id)
    FROM employees;
    FOR i IN employees_table.first..employees_table.last
    LOOP
        DBMS_OUTPUT.PUT_LINE(employees_table(i).employee_id || ' - ' ||
                             employees_table(i).first_name || ' - ' ||
                             employees_table(i).last_name || ' - ' ||
                             employees_table(i).phone_number || ' - ' ||
                             employees_table(i).job_id || ' - ' ||
                             TO_CHAR(employees_table(i).salary, '99G999G999D99'));
    END LOOP;
END;


--  Collections Nested Table

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    TYPE Numero_Table_Type IS TABLE OF INTEGER(2);
    Numero_table numero_table_type:= numero_table_type();
BEGIN
 -- Armazena número de 1 a 10 em um Associative Array
    FOR i IN 1..10
    LOOP
        Numero_Table.extend;
        Numero_Table(i) :=i;
    END LOOP;
    -- Lê o Nested Table e imprime os números armazenados
    FOR I IN 1..10
    LOOP
        DBMS_OUTPUT.PUT_LINE('Nested Table: Indice = ' || TO_CHAR(i) || ', Valor = ' || TO_CHAR(Numero_Table(i)));
    END LOOP;
END;


-- Nested Table of Records - Bulk Collect

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    TYPE employees_table_type IS TABLE OF employees%rowtype;
    employees_table employees_table_type := employees_table_type();
BEGIN
    SELECT *
        BULK COLLECT INTO employees_table -- Bulk Collect de todos (order_id) para Collections (voider_id)
    FROM employees;
    FOR i IN employees_table.first..employees_table.last
    LOOP
        DBMS_OUTPUT.PUT_LINE(employees_table(i).employee_id || ' - ' ||
                             employees_table(i).first_name || ' - ' ||
                             employees_table(i).last_name || ' - ' ||
                             employees_table(i).phone_number || ' - ' ||
                             employees_table(i).job_id || ' - ' ||
                             TO_CHAR(employees_table(i).salary, '99G999G999D99'));
    END LOOP;
END;


-- Collections - Varray

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    TYPE Numero_Table_Type IS VARRAY (10) OF INTEGER(2);
    Numero_table numero_table_type := numero_table_type();
BEGIN
 -- Armazena número de 1 a 10 em um Associative Array
    FOR i IN 1..10
    LOOP
        Numero_Table.extend;
        Numero_Table(i) :=i;
    END LOOP;
    -- Lê o Nested Table e imprime os números armazenados
    FOR I IN 1..10
    LOOP
        DBMS_OUTPUT.PUT_LINE('Nested Table: Indice = ' || TO_CHAR(i) || ', Valor = ' || TO_CHAR(Numero_Table(i)));
    END LOOP;
END;

-- Varray of Records - Bulk Collect

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    TYPE employees_table_type IS VARRAY (200) OF employees%rowtype;
    employees_table employees_table_type := employees_table_type();
BEGIN
    SELECT *
        BULK COLLECT INTO employees_table -- Bulk Collect de todos (order_id) para Collections (voider_id)
    FROM employees;
    FOR i IN employees_table.first..employees_table.last
    LOOP
        DBMS_OUTPUT.PUT_LINE(employees_table(i).employee_id || ' - ' ||
                             employees_table(i).first_name || ' - ' ||
                             employees_table(i).last_name || ' - ' ||
                             employees_table(i).phone_number || ' - ' ||
                             employees_table(i).job_id || ' - ' ||
                             TO_CHAR(employees_table(i).salary, '99G999G999D99'));
    END LOOP;
END;


-- Utilizando Métodos para controlar Collections

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    TYPE employees_table_type IS TABLE OF employees%rowtype;
    employees_table employees_table_type := employees_table_type();
BEGIN
    SELECT *
        BULK COLLECT INTO employees_table 
    FROM employees;
    FOR i IN employees_table.first..employees_table.last
    LOOP
        DBMS_OUTPUT.PUT_LINE(employees_table(i).employee_id || ' - ' ||
                             employees_table(i).first_name || ' - ' ||
                             employees_table(i).last_name || ' - ' ||
                             employees_table(i).phone_number || ' - ' ||
                             employees_table(i).job_id || ' - ' ||
                             TO_CHAR(employees_table(i).salary, '99G999G999D99'));
    END LOOP;
END;
