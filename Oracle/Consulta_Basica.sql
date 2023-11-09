describe employees;

desc jobs;

select * from employees;

SELECT employee_id, first_name, last_name from employees;

SELECT
    job_id,
    job_title,
    min_salary,
    max_salary
FROM
    jobs;
    
    
--Utilizando operadores aritmeticos SELECT

SELECT last_name, salary, salary *1.15
from employees;


SELECT first_name, last_name, salary, salary + 100 *1.15
FROM employees;


SELECT first_name, last_name, salary, (salary + 100) *1.15
FROM employees;

SELECT first_name, last_name, job_id, commission_pct, salary
FROM employees;

--Utilizando o ALIAS nas colunas

SELECT first_name as nome, last_name sobrenome, salary as sal�rio
from employees;

SELECT first_name "Nome", last_name "Sobrenome", salary "Sal�rio ($)", commission_pct "Percentual de Comiss�o"
FROM employees;

--Utilizando Operador de Concatena��o

SELECT first_name || ' ' || last_name || ', data de admiss�o: ' || hire_date "Funcionario"
FROM employees;

SELECT first_name || ' ' || last_name || ', sal�rio: ' || salary "Funcionario"
FROM employees;

--Operador alternativo as aspas
SELECT department_name || q'[ Departmente's Manage ID: ]' || manager_id "Departamento e Gerente"
FROM departments;

--Linhas duplicadas

SELECT DISTINCT department_id
FROM employees;

SELECT DISTINCT last_name, first_name
FROM employees;