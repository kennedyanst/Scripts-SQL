-- Fun��es de Convers�o Maius e minusc

SELECT last_name, department_id
FROM employees
WHERE UPPER(last_name) = 'KING';

SELECT last_name, department_id
FROM employees
WHERE LOWER(last_name) = 'king';

SELECT last_name, department_id
FROM employees
WHERE INITCAP(last_name) = 'King';

-- Manipula��o de caracteres

SELECT CONCAT('Curso: ', 'Introdu��o ORACLE 19c'), SUBSTR('Introdu��o Oracle 19c', 1,11),
                LENGTH('Introdu��o ORACLE 19c'), INSTR('Introdu��o ORACLE 19c', 'ORACLE')
FROM dual;

SELECT first_name "Nome", LPAD(first_name, 20, ' ') "Nome Alinhado a direita", RPAD(first_name, 20, ' ') "Nome Alinhado a Esquerda"
FROM employees;

SELECT job_title, REPLACE(job_title, 'President', 'Presidente')CARGO
FROM jobs
WHERE job_title = 'President';

SELECT TRIM(';'FROM'name@gmail.com;')
FROM dual;

SELECT RTRIM('nome@gmail.com;', ';')
FROM dual;

SELECT LTRIM('   nome@gmail.com', ' ')
FROM dual;

--FUN��ES TIPO NUMBER

SELECT ROUND (45.923,2), ROUND(45.923,0)
FROM dual;

SELECT TRUNC (45.923,2), TRUNC(45.923,0)
FROM dual;
--Resto da divis�o
SELECT MOD (1300,600) RESTO
FROM dual;

SELECT ABS(-9), SQRT(9)
FROM dual;

--FRUN��ES TIPO DATE

SELECT SYSDATE
FROM dual;

SELECT SYSDATE - 30, SYSDATE + 60, SYSDATE - 90
FROM DUAL;

SELECT last_name, ROUND((SYSDATE - hire_date)/7,0) "SEMANA DE TRABALHO"
FROM employees;

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3), NEXT_DAY(SYSDATE, 'SEXTA FEIRA'), LAST_DAY(SYSDATE)
FROM dual;

-- ROUND E TRUNC SYSDATE

SELECT sysdate, ROUND(SYSDATE, 'MONTH'), ROUND(SYSDATE, 'YEAR'), TRUNC(SYSDATE, 'MONTH'), TRUNC(SYSDATE, 'YEAR')
FROM dual;

SELECT sysdate, TO_CHAR(TRUNC(SYSDATE), 'DD/MM/YYYY HH24:MI:SS')
FROM dual;