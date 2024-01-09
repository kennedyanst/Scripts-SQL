-- COMANDOS DML

-- INSERT

INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (280, 'Project Managerment', 103, 1400);

desc departments;

INSERT INTO departments
VALUES(301, 'Inovation', NULL, NULL);

INSERT INTO departments(department_id, department_name)
VALUES (300, 'Business Intelligence');

COMMIT;

INSERT INTO employees
            (employee_id, first_name, last_name, email,
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
        VALUES(207, 'Rock', 'Balboa', 'DROCK',
              '525.342.237', SYSDATE, 'IT_PROG', 70000,
              NULL, 103,60);
              
-- Insert utilizando data e hora específicas

INSERT INTO employees
            (employee_id, first_name, last_name, email,
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
        VALUES(208, 'Vito', 'Corlone', 'VCORL',
              '525.342.237', TO_DATE('08/01/2024', 'DD/MM/YYYY'), 'IT_PROG', 20000,
              NULL, 103,60);
              
COMMIT;


--Variáveis de Substituição

INSERT INTO departments
 (department_id, department_name, location_id)
VALUES (&department_id, '&department_name', &location);

COMMIT;

-- Inserindo linhas a partir de uma sub-consulta

CREATE TABLE sales_reps
(id NUMBER(6,0),
 name VARCHAR2(20),
 salary NUMBER(8,2),
 commission_pct NUMBER(2,2));
 
INSERT INTO sales_reps(id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id = 'SA_REP';


-- UPDATE NA TABELA 

UPDATE employees
SET salary = salary * 1.2;

ROLLBACK;

UPDATE employees
SET salary = salary * 1.2
WHERE last_name = 'King';

COMMIT;

-- Utilizando o UPDATE com sub-consultas

UPDATE employees
SET job_id = (SELECT job_id
              FROM employees
              WHERE employee_id = 141),
      salary = (SELECT salary
                FROM employees
                WHERE employee_id = 141)
WHERE employee_id = 139;

COMMIT;


-- DELETE

DELETE FROM countries
WHERE country_name = 'Nigeria';

ROLLBACK;

-- Utilizando Savepoint

DELETE FROM employees
WHERE employee_id IN (207,208);

COMMIT;

INSERT INTO employees
            (employee_id, first_name, last_name, email,
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
       VALUES(207, 'Rock', 'Balboa', 'DROCK','525.342.273', SYSDATE,
       'IT_PROG', 7000, NULL, 103, 60);
       
SAVEPOINT A;

INSERT INTO employees
            (employee_id, first_name, last_name, email,
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
       VALUES(208, 'Vito', 'Corleone', 'VCORL','525.342.273', TO_DATE('09/01/2023', 'DD/MM/YYYY'),
       'IT_PROG', 20000, NULL, 103, 60);
       
ROLLBACK TO SAVEPOINT A;

COMMIT;

SELECT * FROM employees;

-- Cláusula FOR UPDATE no comando SELECT

SELECT employee_id, salary, commission_pct, job_id
FROM employees
WHERE job_id = 'SA_REP'
FOR UPDATE
ORDER BY employee_id;

COMMIT;

SELECT e.employee_id, e.salary, e.commission_pct
FROM employees e JOIN departments d
USING (department_id)
WHERE job_id = 'ST_CLERK'
AND location_id = 1500
FOR UPDATE of e.salary
ORDER BY e.employee_id;

COMMIT;