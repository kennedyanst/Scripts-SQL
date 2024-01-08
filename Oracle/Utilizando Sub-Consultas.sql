-- Sub-Consultas SINGLE-ROW

SELECT first_name, last_name, job_id, salary
FROM employees
WHERE salary > 
                (SELECT AVG(NVL(salary, 0))
                FROM employees);
                
SELECT el.department_id, MAX(el.salary)
FROM employees el
GROUP BY el.department_id
HAVING MAX(salary) < (SELECT AVG(e2.salary)
                      FROM employees e2);
                      
-- ERROS: Sub-Consultas Sigle-Row que retornam nulo ou mais de uma linha.

SELECT employee_id, first_name, last_name
FROM employees
WHERE salary = 
               (SELECT     AVG(NVL(salary,0))
                FROM employees
                GROUP BY department_id);
                
SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name = (SELECT last_name
                   FROM employees
                   WHERE last_name = 'Suzuki')