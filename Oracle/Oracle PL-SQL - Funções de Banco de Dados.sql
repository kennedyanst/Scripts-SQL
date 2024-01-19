-- Criando Funções de Banco de Dados


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
    RETURN (vSalary);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Empregado inexistente');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle ' || SQLCODE || SQLERRM);
END;


-- Executando a Função pelo Bloco PL/SQL

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


CREATE OR REPLACE FUNCTION FNC_CONSULTA_TITULO_CARGO_EMPREGADO
    (pjob_id IN jobs.job_id%type)
    RETURN VARCHAR2
IS
    vjob_title jobs.job_title%type;
BEGIN
    SELECT job_title
    INTO vJob_title
    FROM jobs
    WHERE job_id = pjob_id;
    RETURN(vJob_title);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Job inexistente');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle ' || SQLCODE || '-' || SQLERRM);
END;


-- Utilizando Funções em comando SQL

SELECT employee_id, first_name, last_name, job_id, FNC_CONSULTA_TITULO_CARGO_EMPREGADO(job_id) "JOB TITLE"
FROM employees;

-- Executando a Função pelo comando SELECT

SELECT FNC_CONSULTA_TITULO_CARGO_EMPREGADO('IT_PROG')
FROM dual;

-- Executando a Função pelo comando SELECT

SELECT FNC_CONSULTA_SALARIO_EMPREGADO(130)
FROM dual;

-- Recompilando Funções de Banco de Dados

ALTER FUNCTION FNC_CONSULTA_SALARIO_EMPREGADO COMPILE;

-- Removendo funções de banco de dados

DROP FUNCTION FNC_CONSULTA_SALARIO_EMPREGADO;