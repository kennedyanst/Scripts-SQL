-- Criando o Package Specification

CREATE OR REPLACE PACKAGE PCK_EMPREGADOS
IS
gMinSalary employees.salary%TYPE

    PROCEDURE PRC_INSERE_EMPREGADO
    (pfirst_name        IN VARCHAR2,
     plast_name         IN VARCHAR2,
     pemail             IN VARCHAR2,
     pphone_number      IN VARCHAR2,
     phire_date         IN DATE DEFAULT SYSDATE,
     pjob_id            IN VARCHAR2,
     psalary            IN NUMBER,
     pcommission_pct    IN NUMBER,
     pmanager_id        IN NUMBER,
     pdepartment_id     IN NUMBER);
     
     PROCEDURE PRC_AUMENTA_SALARIO_EMPREGADO
     (pemployee_id  IN NUMBER,
     ppercentual    IN NUMBER);
     
    FUNCTION FNC_CONSULTA_SALARIO_EMPREGADO
    (pemployee_id IN NUMBER)
    RETURN NUMBER;
    
END PCK_EMPREGADOS;


-- Criando o Package Body

CREATE OR REPLACE PACKAGE BODY PCK_EMPREGADOS
IS
gMinSalary employees.salary%TYPE

    PROCEDURE PRC_INSERE_EMPREGADO
    (pfirst_name        IN VARCHAR2,
     plast_name         IN VARCHAR2,
     pemail             IN VARCHAR2,
     pphone_number      IN VARCHAR2,
     phire_date         IN DATE DEFAULT SYSDATE,
     pjob_id            IN VARCHAR2,
     psalary            IN NUMBER,
     pcommission_pct    IN NUMBER,
     pmanager_id        IN NUMBER,
     pdepartment_id     IN NUMBER);
     
     IS
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

        create or replace PROCEDURE PRC_AUMENTA_SALARIO_EMPREGADO
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
        
        
        CREATE OR REPLACE FUNCTION FNC_CONSLTA_SALARIO_EMPREGADO
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
        
END PCK_EMPREGADOS;


-- Referenciando Componentes de uma Packege

BEGIN
    PCK_EMPREGADOS.PRC_INSERE_EMPREGADO('Bob', 'Dylan', 'BDYLAN', '515.258.4861', SYSDATE, 'IT_PROG', 20000, NULL, 103, 60)
END;

