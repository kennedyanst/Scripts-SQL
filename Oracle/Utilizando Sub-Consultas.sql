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
                   WHERE last_name = 'Suzuki');
                   
--Sub-Consultas Multiple-row


SELECT employee_id, first_name, last_name
FROM employees
WHERE salary IN 
                (SELECT AVG(NVL(salary,0)) 
                FROM employees 
                GROUP BY department_id);
                
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY 
                    (SELECT salary
                    FROM employees
                    WHERE job_id = 'IT_PROG');
                    
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL 
                    (SELECT salary
                    FROM employees
                    WHERE job_id = 'IT_PROG');

-- Cuidados com Valores nulos em uma sub-consulta com operador IN             
SELECT emp.employee_id, emp.last_name
FROM employees emp
WHERE emp.employee_id IN (SELECT mgr.manager_id
                          FROM employees mgr);
                          
SELECT emp.employee_id, emp.last_name
FROM employees emp
WHERE emp.employee_id NOT IN (SELECT mgr.manager_id
                          FROM employees mgr);
                          
-- Utilizando operador EXITS
SELECT d.department_id, d.department_name
FROM departments d
WHERE EXISTS(SELECT e.department_id
             FROM employees e
             WHERE d.department_id = e.department_id);

SELECT d.department_id, d.department_name
FROM departments d
WHERE EXISTS(SELECT e.department_id
             FROM employees e
             WHERE d.department_id = e.department_id);
             
-- Utilizando Sub-Consultas Correlacionadas

SELECT el.employee_id, el.first_name, el.last_name, el.department_id, el.salary
FROM employees el
WHERE el.salary >= (SELECT TRUNC(AVG(NVL(salary,0)),0)
                    FROM employees e2
                    WHERE el.department_id = e2.department_id);
                    
-- Utilizando Sub-consultas Multiple-Column

SELECT el.employee_id, el.first_name, el.job_id, el.salary
FROM employees el
WHERE (el.job_id, el.salary) IN (SELECT e2.job_id, MAX(e2.salary)
                                 FROM employees e2
                                 GROUP BY e2.job_id);
                                 
-- Utilizando Sub-consulta na cláusula FROM

SELECT empregados.employee_id, empregados.first_name, empregados.last_name, empregados.job_id,
        empregados.salary, ROUND(max_salary_job.max_salary,2) MAX_SALARY, empregados.salary - ROUND(max_salary_job.max_salary,2) DIFERENÇA
FROM employees empregados
    LEFT JOIN(SELECT e2.job_id, MAX(e2.salary) max_salary
              FROM employees e2
              GROUP BY e2.job_id) max_salary_job
         ON empregados.job_id = max_salary_job.job_id;