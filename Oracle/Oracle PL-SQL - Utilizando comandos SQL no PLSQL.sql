-- Utilizando o comando SELECT no PL/SQL


SET SERVEROUTPUT ON
DECLARE

    vFirst_name employees.first_name%type;
    vLast_name employees.last_name%type;
    vSalary employees.salary%type;
    vEmployee_id employees.employee_id%type := 121;
BEGIN
    SELECT first_name, last_name, salary
    INTO vFirst_name, vLast_name, vSalary
    FROM employees
    WHERE employee_id = vEmployee_id;
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || vEmployee_id);
    DBMS_OUTPUT.PUT_LINE('First Nmae: ' || vFirst_name);
    DBMS_OUTPUT.PUT_LINE('Last Name: ' || vLast_name);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || vSalary);
END;
    
    
-- Erro ORA-01402 - No Data Found

SET SERVEROUTPUT ON
DECLARE

    vFirst_name employees.first_name%type;
    vLast_name employees.last_name%type;
    vSalary employees.salary%type;
    vEmployee_id employees.employee_id%type := 50;
BEGIN
    SELECT first_name, last_name, salary
    INTO vFirst_name, vLast_name, vSalary
    FROM employees
    WHERE employee_id = vEmployee_id;
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || vEmployee_id);
    DBMS_OUTPUT.PUT_LINE('First Nmae: ' || vFirst_name);
    DBMS_OUTPUT.PUT_LINE('Last Name: ' || vLast_name);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || vSalary);
END;


-- Usando funções SQL no bloco

SET SERVEROUTPUT ON
DECLARE
    vJob_id             employees.job_id%type  := 'IT_PROG';
    vAvg_Salary         employees.salary%type;
    vSum_Salary         employees.salary%type;
BEGIN
    SELECT ROUND(AVG(salary),2), ROUND(SUM(salary),2)
    INTO vAvg_Salary, vSum_Salary
    FROM employees
    WHERE job_id = vJob_id;
    DBMS_OUTPUT.PUT_LINE('Cargo: ' || vJob_id);
    DBMS_OUTPUT.PUT_LINE('Média de salário: ' || vAvg_Salary);
    DBMS_OUTPUT.PUT_LINE('Somatório de Salarios: ' || vSum_Salary);
END;


-- Erro ORA-01422 - Too Many Rows

SET SERVEROUTPUT ON
DECLARE
    vJob_id             employees.job_id%type  := 'IT_PROG';
    vAvg_Salary         employees.salary%type;
    vSum_Salary         employees.salary%type;
BEGIN
    SELECT ROUND(AVG(salary),2), ROUND(SUM(salary),2)
    INTO vAvg_Salary, vSum_Salary
    FROM employees
    GROUP BY job_id;
    DBMS_OUTPUT.PUT_LINE('Cargo: ' || vJob_id);
    DBMS_OUTPUT.PUT_LINE('Média de salário: ' || vAvg_Salary);
    DBMS_OUTPUT.PUT_LINE('Somatório de Salarios: ' || vSum_Salary);
END;


-- Comando INSERT no PL/SQL


SET SERVEROUTPUT ON
DECLARE
    vFirst_name employees.first_name%type;
    vLast_name employees.last_name%type;
    vSalary employees.salary%type;
    vEmployee_id employees.employee_id%type := 50;
BEGIN
    INSERT INTO employees
    (employee_id, first_name, last_name, email, phone_number, hire_date,
    job_id, salary, commission_pct, manager_id, department_id)
    VALUES
    (employees_seq.nextval, 'Kobe', 'Bryant', 'KBRYANT', '515.123.45568', SYSDATE,
    'IT_PROG', 15000, 0.4, 103, 60);
    COMMIT;
END;


-- Comando UPDATE no PL/SQL


SET SERVEROUTPUT ON
DECLARE
    vEmployee_id    employees.employee_id%type := 207;
    vPercentual     NUMBER(3) := 10;
BEGIN
    UPDATE employees
    SET salary = salary * (1 + vPercentual / 100)
    WHERE employee_id = vEmployee_id;
    COMMIT;
END;


-- Comando DELETE no PL/SQL

SET SERVEROUTPUT ON
DECLARE
    vEmployee_id    employees.employee_id%type := 207;
BEGIN
    DELETE FROM employees
    WHERE employee_id = vEmployee_id;
    COMMIT;
END;


-- Controlando Transações no Banco de Dados

SET SERVEROUTPUT ON
DECLARE
    vEmployee_id    employees.employee_id%type := 150;
BEGIN
    UPDATE employees
    SET salary = 15000
    WHERE employee_id = vEmployee_id;
    COMMIT;
END;


SET SERVEROUTPUT ON
DECLARE
    vEmployee_id    employees.employee_id%type := 150;
BEGIN
    UPDATE employees
    SET salary = 20000
    WHERE employee_id = vEmployee_id;
    ROLLBACK;
END;

BEGIN
    INSERT INTO employees
     (employee_id, first_name, last_name, email, phone_number, hire_date,
     job_id, salary, commission_pct, manager_id, department_id)
    VALUES
     (employees_seq.nextval, 'James', 'Harden', 'JHARDEN', '524.193.00568', SYSDATE,
     'IT_PROG', 12000, 0.6, 111, 63);
     
    SAVEPOINT UPDATEOK;
    
    UPDATE employees
    SET salary = 30000
    WHERE job_id = 'IT_PROG';
    
    ROLLBACK TO UPDATEOK;
    COMMIT;

END;


-- Cursor Implicito

SET SERVEROUTPUT ON
DECLARE
    vDepartment_id employees.department_id%type := 60;
    vPercentual NUMBER(3) := 10;
BEGIN
    UPDATE employees
    SET salary = salary * (1 + vPercentual / 100)
    WHERE department_id = vDepartment_id;
    DBMS_OUTPUT.PUT_LINE('Número de empregados atualizados: ' || SQL%ROWCOUNT);
    --COMMIT
END;

ROLLBACK;