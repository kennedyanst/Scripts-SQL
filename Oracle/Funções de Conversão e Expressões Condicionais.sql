-- Fun��o TO_CHAR com DATAS

SELECT last_name, TO_CHAR(hire_date, 'DD/MM/YYYY HH24:MI:SS') DATA_ADMISS�O
FROM employees;

SELECT sysdate, TO_CHAR(sysdate, 'DD/MM/YYYY HH24:MI:SS') DATA
FROM dual;

SELECT last_name, TO_CHAR(hire_date, 'DD, "de" Month "de" YYYY') DT_ADMISS�O
FROM employees;

SELECT last_name, TO_CHAR(hire_date, 'FMDD, "de"  Month "de" YYYY') DATA_ADMISS�O
FROM employees;

-- TO_CHAR para N�meros

SELECT first_name, last_name, TO_CHAR(salary, 'L99G999G999D99') SAL�RIO
FROM employees
ORDER BY SAL�RIO desc;

--TO_NUMBER

SELECT TO_NUMBER('12000,50')
FROM DUAL;

-- TO_DATE

SELECT TO_DATE('06/02/2020','DD/MM/YYYY') DATA
FROM DUAL;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date = TO_DATE('17/06/2003', 'DD/MM/YYYY');

--Fun��es Aninhadas

SELECT first_name, last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date), 0) numero_meses
FROM employees
WHERE hire_date = TO_DATE('17/06/2003', 'dd/mm/yyyy');

--Fun��o NVL

SELECT last_name, salary, NVL(commission_pct,0), salary*12 SALARIO_ANUAL,
        (salary*12) + (salary*12*NVL(commission_pct, 0)) REMUNERA��O_ANUAL
FROM employees;

-- Fun��o COALESCE

SELECT COALESCE(NULL, NULL, 'Express�o 3'), COALESCE(NULL, 'Express�o 2', 'Express�o 3'), COALESCE('Express�o 1', 'Express�o 2', 'Express�o 3')
FROM dual;

SELECT last_name, employee_id, commission_pct, manager_id, COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id), 'Sem Percentual de Comiss�o')
FROM employees;

-- Fun��o NLV2

SELECT last_name, salary, commission_pct, NVL2(commission_pct, 10, 0) PERCENTUAL_ALTERA
FROM employees;

--NULLIF

SELECT NULLIF(1000, 1000), NULLIF(1000, 2000)
FROM dual;

SELECT first_name, last_name, LENGTH(first_name) "Express�o 1", LENGTH(last_name) "Express�o 2", NULLIF(LENGTH(first_name), LENGTH(last_name)) RESULTADO
FROM employees;

--Express�o CASE (IF ELSE)

SELECT last_name, job_id, salary, 
                            CASE job_id
                                WHEN 'IT_PROG'
                                    THEN 1.10* salary
                                WHEN 'ST_CLERK'
                                    THEN 1.15* salary
                                WHEN 'SA_REP'
                                    THEN 1.20*salary
                                ELSE salary
                            END "NOVO SALARIO"
FROM employees;

-- FUN��O DECODE

SELECT last_name, job_id, salary, DECODE(job_id, 'IT_PROG', 1.10*salary,'ST_CLERK', 1.15*salary,'SA_REP', 1.20*salary, salary) "NOVO SALARIO"
FROM employees;