-- CRIANDO uma Sequence

DROP SEQUENCE employees_seq;

SELECT MAX (employee_id)
FROM employees;

CREATE SEQUENCE employees_seq
START WITH 208
INCREMENT BY 1 
NOMAXVALUE
NOCACHE
NOCYCLE;

-- Consultando Sequence pelo dicionario de dados

SELECT *
FROM user_sequences;

-- Recuparando o proximo valor da sequência

DROP SEQUENCE employees_seq;

SELECT employees_seq.NEXTVAL
FROM dual;

-- Recuperando o valor correto da Sequencia

SELECT employees_seq.CURRVAL
FROM dual;


-- Utilizando uma Sequencia

INSERT INTO employees
            (employee_id, first_name, last_name, email,
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
        VALUES (employees_seq.nextval, 'Paul', 'Simon', 'PSIMO',
                '525.342.237', TO_DATE('12/02/2020', 'DD/MM/YYYY'), 'IT_PROG', 15000,
                NULL, 103,60);
                

SELECT *
FROM employees
ORDER BY employee_id DESC;

COMMIT;


-- Alterando o valor maximo da sequence
ALTER SEQUENCE employees_seq
MAXVALUE 999999
CACHE 20;

