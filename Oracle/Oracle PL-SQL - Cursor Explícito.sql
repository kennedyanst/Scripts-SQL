-- Controlando um Cursor Explicito


SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    CURSOR employees_cursor IS
    SELECT *
    FROM employees;  -- Declaração do Cursor
    
    employees_record employees_cursor%rowtype;
BEGIN
    /* Inicializa */
    
    OPEN employees_cursor;
    
    /* Loop */
    
    LOOP -- Loop Básico
        FETCH employees_cursor
        INTO employees_record;
        
        EXIT WHEN employees_cursor%notfound;
        
        DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                             employees_record.first_name || ' - ' ||
                             employees_record.last_name || ' - ' ||
                             employees_record.department_id || ' - ' ||
                             employees_record.job_id || ' - ' ||
                             employees_record.phone_number || ' - ' ||
                             LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
    END LOOP;
    
    CLOSE employees_cursor; -- Close do Cursor
END;


-- COM WHILE LOOP


SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    CURSOR employees_cursor IS
    SELECT *
    FROM employees;  -- Declaração do Cursor
    
    employees_record employees_cursor%rowtype;
BEGIN
    /* Inicializa */
    
    OPEN employees_cursor;
       
    FETCH employees_cursor
        INTO employees_record;
        
        
    WHILE employees_cursor%found LOOP    
        DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                             employees_record.first_name || ' - ' ||
                             employees_record.last_name || ' - ' ||
                             employees_record.department_id || ' - ' ||
                             employees_record.job_id || ' - ' ||
                             employees_record.phone_number || ' - ' ||
                             LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
    FETCH employees_cursor
        INTO employees_record;   
    END LOOP;
    
    CLOSE employees_cursor; -- Close do Cursor
END;


-- Controlando um Cursor Explícito utilizando CURSOR FOR LOOP

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    CURSOR employees_cursor IS
    SELECT * 
    FROM employees;
BEGIN
    FOR employees_record IN employees_cursor
    LOOP
        DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                             employees_record.first_name || ' - ' ||
                             employees_record.last_name || ' - ' ||
                             employees_record.department_id || ' - ' ||
                             employees_record.job_id || ' - ' ||
                             employees_record.phone_number || ' - ' ||
                             LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
    END LOOP;
END;


-- CURSOR FOR LOOP com parâmetros

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    CURSOR employees_cursor 
           (pdepartment_id NUMBER,
           pjob_id VARCHAR2)
    IS
    SELECT * 
    FROM employees
    WHERE department_id = pdepartment_id AND
          job_id = pjob_id;
BEGIN
    FOR employees_record IN employees_cursor (60, 'IT_PROG')
    LOOP
        DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                             employees_record.first_name || ' - ' ||
                             employees_record.last_name || ' - ' ||
                             employees_record.department_id || ' - ' ||
                             employees_record.job_id || ' - ' ||
                             employees_record.phone_number || ' - ' ||
                             LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
    END LOOP;
END;


-- Cursor Explicito com SELECT FOR UPDATE

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    CURSOR employees_cursor (pjob_id VARCHAR2)
    IS
    SELECT * 
    FROM employees
    WHERE job_id = pjob_id
    FOR UPDATE;
BEGIN
    FOR employees_record IN employees_cursor ('AD_VP')
    LOOP
        UPDATE employees
        SET salary = salary * (1 + 10 / 100)
        WHERE CURRENT OF employees_cursor;
    END LOOP;
    COMMIT;
END;