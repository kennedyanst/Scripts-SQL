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

SELECT first_name as nome, last_name sobrenome, salary as salário
from employees;

SELECT first_name "Nome", last_name "Sobrenome", salary "Salário ($)", commission_pct "Percentual de Comissão"
FROM employees;

--Utilizando Operador de Concatenação

SELECT first_name || ' ' || last_name || ', data de admissão: ' || hire_date "Funcionario"
FROM employees;

SELECT first_name || ' ' || last_name || ', salário: ' || salary "Funcionario"
FROM employees;

--Operador alternativo as aspas
SELECT department_name || q'[ Departmente's Manage ID: ]' || manager_id "Departamento e Gerente"
FROM departments;

--Linhas duplicadas

SELECT DISTINCT department_id
FROM employees;

SELECT DISTINCT last_name, first_name
FROM employees;