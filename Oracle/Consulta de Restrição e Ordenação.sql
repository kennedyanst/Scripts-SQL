-- WHERE

SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 60;

SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE job_id = 'IT_PROG';

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE hire_date = '30/01/04';

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE last_name = 'King';

--Operadores de comparação

SELECT last_name, salary as salario
FROM employees
WHERE salary >= 10000;

SELECT last_name, salary
from employees
WHERE salary BETWEEN 10000 AND 15000;

SELECT last_name, employee_id, salary, manager_id, job_id
FROM employees
WHERE job_id IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP');

SELECT first_name, last_name, job_id
FROM employees
WHERE first_name LIKE 'Sa%';

SELECT first_name, last_name, job_id
FROM employees
WHERE first_name LIKE '_a%';

SELECT first_name, manager_id
FROM employees
WHERE manager_id IS NULL;

--AND
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 5000 AND job_id = 'IT_PROG';

--OR
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 5000 OR job_id = 'IT_PROG';

--NOT
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP');

--Priorizando os operadores de comparação
SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'SA_REP' OR 
                job_id = 'IT_PROG')
AND salary >= 10000;

--Order by
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date ASC;

--Order by
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC;

SELECT last_name, salary *12 salario_anual
FROM employees
ORDER BY salario_anual;

--quarta coluna
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 4;

SELECT last_name, job_id, salary
FROM employees
ORDER BY last_name, salary desc;

--Variaveis de substituição
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_id;

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &&employee_id;


SELECT department_id, last_name, salary*12, job_id
FROM employees
WHERE job_id = '&job_id' ;

--Definindo uma variavel
DEFINE employee_id = 101

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_id;

DEFINE employee_id

UNDEFINE employee_id;