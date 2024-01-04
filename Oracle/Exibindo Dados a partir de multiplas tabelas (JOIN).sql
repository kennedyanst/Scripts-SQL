-- Utilizando Prefixos Coluna com Nomes de Tabelas

SELECT employees.employee_id, employees.last_name,
        employees.department_id, departments.department_name
FROM employees JOIN departments ON (employees.department_id = departments.department_id);

-- Utilizando Alias de Tabela

SELECT e.employee_id, e.last_name, e.department_id, d.department_name
FROM employees e JOIN departments d
ON (e.department_id = d.department_id);


-- NATURAL JOIN
SELECT department_id, department_name, location_id, city
FROM departments
NATURAL JOIN locations;

-- USING
SELECT e.employee_id, e.last_name, d.location_id, department_id, d.department_name
FROM employees e JOIN departments d USING(department_id);

--ON
SELECT e.employee_id, e.last_name, d.location_id, d.department_id
FROM employees e JOIN departments d
ON (e.department_id = d.department_id);

-- JOIN com várias tabelas

SELECT e.employee_id, j.job_title, d.department_name, l.city, l.state_province, l.country_id
FROM employees e
    JOIN jobs        j ON e.job_id = j.job_id
    JOIN departments d ON d.department_id = e.department_id
    JOIN locations   l ON d.location_id = l.location_id
ORDER BY e.employee_id;

-- JOIN com WHERE
SELECT e.employee_id, e.last_name, e.salary, e.department_id, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE e.salary BETWEEN 10000 AND 15000;