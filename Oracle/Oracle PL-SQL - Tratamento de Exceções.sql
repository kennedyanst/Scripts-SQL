-- Tratamento de Exceções Pré-definidas Oracle


SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pEmployee_id PROMPT 'Digite o Id do Empregado: '
DECLARE
    vFirst_name     employees.first_name%TYPE;
    vLast_name      employees.last_name%TYPE;
    vEmployee_id    employees.employee_id%TYPE := &pEmployee_id;
BEGIN
    SELECT first_name, last_name
    INTO vfirst_name, vlast_name
    FROM employees
    WHERE employee_id = vEmployee_id;
    
    DBMS_OUTPUT.PUT_LINE('Empregado: ' || vfirst_name || ' ' || vlast_name);
    
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
        RAISE_APPLICATION_ERROR(-20001, 'Empregado não encontrado, id = ' ||
        TO_CHAR(vEmployee_id));
    WHEN OTHERS
    THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle - ' || SQLCODE || SQLERRM);
END;


-- Exceções Definidas pelo Desenvolvedor

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pEmployee_id PROMPT 'Digite o Id do Empregado: '
DECLARE
    vFirst_name     employees.first_name%type;
    vLast_name      employees.last_name%type;
    vJob_id         employees.job_id%type;
    vEmployee_id    employees.employee_id%type := &pEmployee_id;
    ePresident      EXCEPTION;
BEGIN
    SELECT  first_name, last_name, job_id
    INTO    vFirst_name, vLast_name, vJob_id
    FROM employees
    WHERE employee_id = vEmployee_id;
    
    IF vJob_id = 'AD_PRES'
    THEN
        RAISE ePresident;
    END IF;
    
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
        RAISE_APPLICATION_ERROR(-20001, 'Empregado não encontrado, id = ' ||
        TO_CHAR(vEmployee_id));
    WHEN ePresident
    THEN
        UPDATE employees
        SET     salary = salary * 1.5
        WHERE employee_id = vEmployee_id;
        --COMMIT;
    WHEN OTHERS
    THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle ' || SQLCODE || SQLERRM);
END;


-- PRAGMA EXCEPTION INIT

DECLARE
    vFirst_name         employees.first_name%TYPE := 'Robert';
    vLast_name          employees.last_name%TYPE := 'Ford';
    vJob_id             employees.job_id%TYPE := 'XX_YYYY';
    vPhone_number       employees.phone_number%TYPE := '650.511.9844';
    vEmail              employees.email%TYPE := 'REFORD';
    eFk_inexistente     EXCEPTION;
    PRAGMA EXCEPTION_INIT(eFk_inexistente, -2291);
    
BEGIN
    INSERT INTO employees (employee_id, first_name, last_name, phone_number, email, hire_date, job_id)
    VALUES (employees_seq.nextval, vfirst_name, vlast_name, vphone_number, vemail, sysdate, vjob_id);
    COMMIT;
EXCEPTION
    WHEN eFk_inexistente
    THEN
        RAISE_APPLICATION_ERROR(-20003, 'Job inexistente!');
    WHEN OTHERS
    THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle ' || SQLCODE || SQLERRM);
END;
