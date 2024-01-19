-- Criando Fun��es de Banco de Dados


CREATE OR REPLACE FUNCTION FNC_CONSULTA_SALARIO_EMPREGADO
    (pemployee_id   IN NUMBER)
    RETURN NUMBER
IS
    vSalary employees.salary%type;
BEGIN
    SELECT salary
    INTO   vSalary
    FROM    employees
    WHERE   employee_id = pemployee_id;
    RETURN (vsalary);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Empregado inexistente');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle ' || SQLCODE || SQLERRM);
END;


-- Executando a Fun��o pelo Bloco PL/SQL

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pemployee_id PROMPT 'Digite o Id do empregado: '
DECLARE
    vEmployee_id    employees.employee_id%type := &pemployee_id;
    vSalary         employees.salary%type;
BEGIN
    vsalary := FNC_CONSULTA_SALARIO_EMPREGADO(vEmployee_id);
    DBMS_OUTPUT.PUT_LINE('Salario: ' || vsalary);
END;