-- Utilizando as Funções AVG e SUM

SELECT AVG(salary), SUM(salary)
FROM employees;

SELECT MIN(hire_date), MAX(hire_date)
FROM employees;

SELECT MIN(salary), MAX(salary)
FROM employees;

-- Função COUNT
SELECT COUNT(*)
FROM employees;

SELECT COUNT(commission_pct)
FROM employees;

SELECT COUNT(commission_pct), COUNT(*)
FROM employees;

SELECT COUNT(NVL(commission_pct, 0))
FROM employees;


--COUNT com DISTINCT
SELECT COUNT(DISTINCT department_id)
FROM employees;

SELECT COUNT(department_id)
FROM employees;


--Função AVG - Média
SELECT AVG(commission_pct)
FROM employees;

--TRATAMENTO DE NULOS em função de grupo
SELECT AVG(NVL(commission_pct, 0))
FROM employees;