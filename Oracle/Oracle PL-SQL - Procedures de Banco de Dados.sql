-- Criando uma Precedure de Banco de Dados


CREATE OR REPLACE PROCEDURE PRC_INSERE_EMPREGADO
    (pfirst_name            IN VARCHAR2,
     plast_name             IN VARCHAR2,
     pemail                 IN VARCHAR2,
     pphone_number          IN VARCHAR2,
     phire_date             IN DATE DEFAULT SYSDATE,
     pjob_id                IN VARCHAR2,
     psalary                IN NUMBER,
     pcommission_pct        IN NUMBER,
     pmanager_id            IN NUMBER,
     pdepartment_id         IN NUMBER)
IS
--NENHUMA VÁRIAVEL DECLARADA
BEGIN
    INSERT INTO employees (
        employee_id,
        first_name,
        last_name,
        email,
        phone_number,
        hire_date,
        job_id,
        salary,
        commission_pct,
        manager_id,
        department_id )
    VALUES (
        employees_seq.nextval,
        pfirst_name,
        plast_name,
        pemail,
        pphone_number,
        phire_date,
        pjob_id,
        psalary,
        pcommission_pct,
        pmanager_id,
        pdepartment_id);    
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle ' || SQLCODE  || SQLERRM);
END;

-- Executando a Procedure pelo Bloco PL/SQL

BEGIN

    