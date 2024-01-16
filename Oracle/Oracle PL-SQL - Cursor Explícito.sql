-- Controlando um Cursor Explicito


SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    CURSOR employees_cursor IS
    SELECT *
    FROM employees;  -- Declara��o do Cursor
    
    employees_record employees_cursor%rowtype;
BEGIN
    /* Inicializa */
    
    OPEN employees_cursor;
    
    /* Loop */
    
    LOOP -- Loop B�sico
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
    FROM employees;  -- Declara��o do Cursor
    
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
