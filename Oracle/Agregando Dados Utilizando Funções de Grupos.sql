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


-- UTILIZANDO GROUP BY (So pode exibir colunas ou expressões se tiver no GROUP BY)

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;


-- Consultas incorretas utilizando Funções de Grupo

SELECT department_id, MAX(salary)
FROM employees
WHERE MAX(salary) > 10000
GROUP BY department_id;

-- Corrigindo consultas incorretas utilizando Funções de Grupo
-- Restringindo Grupos utilizandos a cláusula HAVING

SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 10000;

SELECT job_id, SUM(salary) TOTAL
FROM employees
WHERE job_id <> 'SA_REP'
GROUP BY job_id
HAVING SUM(salary) > 10000
ORDER BY SUM(salary);

-- Aninhando Funções de Grupo

SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;

SELECT AVG(salary)
FROM employees
GROUP BY department_id;