-- Criando uma Visão


CREATE OR REPLACE VIEW vemployeesdept60
AS SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE department_id = 60;


-- Criando Visão Complexa

CREATE OR REPLACE VIEW vdepartments_total
(department_id, department_name, mansal, maxsal, avgsal)
AS SELECT e.department_id, d.department_name, MIN(e.salary),
            MAX(e.salary), AVG(e.salary)
FROM employees e
    JOIN departments d
ON (e.department_id = d.department_id)
GROUP BY e.department_id, department_name;


-- Utilizando a Cláusula CHECK OPTIONS


CREATE OR REPLACE VIEW vemployeesdept100
AS SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE department_id = 100
WITH CHECK OPTION CONSTRAINT vemployeesdept100_ck;

-- Utilizando a Cláusula READ ONLY

CREATE OR REPLACE VIEW vemployeesdept20
AS SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE department_id = 20
WITH READ ONLY;

DROP VIEW vemployeesdept20;
            