-- Utilizando o operador UNION

-- Retira as duplicatas
SELECT employee_id, job_id, hire_date, salary
FROM employees
WHERE department_id IN (60, 90, 100)
UNION
SELECT employee_id, job_id, hire_date, salary
FROM employees
WHERE job_id = 'IT_PROG'
ORDER BY employee_id;

-- Preserva as duplicatas
SELECT employee_id, job_id, hire_date, salary
FROM employees
WHERE department_id IN (60, 90, 100)
UNION ALL
SELECT employee_id, job_id, hire_date, salary
FROM employees
WHERE job_id = 'IT_PROG'
ORDER BY employee_id;

-- Só a intersecção
SELECT employee_id, job_id
FROM employees
WHERE job_id = 'IT_PROG'
INTERSECT
SELECT employee_id, job_id
FROM employees
WHERE department_id IN (60,90,100)
ORDER BY employee_id;

-- Primeiro SELECT menos o Segundo SELECT
SELECT employee_id, job_id
FROM employees
WHERE department_id IN (60,90,100)
MINUS
SELECT employee_id, job_id
FROM employees
WHERE job_id = 'IT_PROG';