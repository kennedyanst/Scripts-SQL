-- Utilizando as Fun��es AVG e SUM

SELECT AVG(salary), SUM(salary)
FROM employees;

SELECT MIN(hire_date), MAX(hire_date)
FROM employees;

SELECT MIN(salary), MAX(salary)
FROM employees;

-- Fun��o COUNT
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


--Fun��o AVG - M�dia
SELECT AVG(commission_pct)
FROM employees;

--TRATAMENTO DE NULOS em fun��o de grupo
SELECT AVG(NVL(commission_pct, 0))
FROM employees;