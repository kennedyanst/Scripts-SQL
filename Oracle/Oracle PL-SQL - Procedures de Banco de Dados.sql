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
    prc_insere_empregado('David', 'Bowie', 'DBOWIE', '515.127.4861', SYSDATE, 'IT_PROG', 1500, NULL, 103, 60);
    COMMIT;
END;

-- Executando a Procedure com o comando EXECUTE do SQL PLUS

EXEC PRC_INSERE_EMPREGADO ('Greg', 'Lake', 'GLAKE', '515.127.4961', SYSDATE, 'IT_PROG', 1500, NULL, 103, 60);

COMMIT;


-- Utilizando Parametros tipo IN

CREATE OR REPLACE PROCEDURE PRC_AUMENTA_SALARIO_EMPREGADO
    (pemployee_id       IN NUMBER,
     ppercentual        IN NUMBER)
IS
-- Nenhuma váriavel declarada
BEGIN
    UPDATE employees
    SET salary = salary * (1 + ppercentual / 100)
    WHERE employee_id = pemployee_id;
    
EXCEPTION
    WHEN OTHERS 
    THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle' || SQLCODE  || SQLERRM);
END;

-- Executando a Procedure pelo bloco PL/SQL

BEGIN
    PRC_AUMENTA_SALARIO_EMPREGADO(109,10);
    --COMMIT;
    