SELECT *
FROM user_objects
ORDER BY Object_type;

CREATE TABLE projects
    (project_id     NUMBER(6)            NOT NULL,
    project_code    VARCHAR2(10)         NOT NULL,
    project_name    VARCHAR2(100)        NOT NULL,
    CREATION_DATE   DATE DEFAULT sysdate NOT NULL,
    START_DATE      DATE,
    END_DATE        DATE,
    STATUS          VARCHAR2(20)         NOT NULL,
    PRIORITY        VARCHAR2(10)         NOT NULL,
    BUDGET          NUMBER(11, 2)        NOT NULL,
    DESCRIPTION     VARCHAR2(400)        NOT NULL);
    
DESC projects;


CREATE TABLE TEAMS
(project_id    NUMBER(6)   NOT NULL,
 employee_id   NUMBER(6)   NOT NULL);
 
SELECT employee_id, first_name, rowid, LENGTH(rowid)
from employees;

DESC user_tables;

SELECT table_name
FROM user_tables;

SELECT object_name, object_type
FROM user_objects
WHERE object_type = 'TABLE';

DROP TABLE employees_department60;

CREATE TABLE employees_department60
AS
SELECT employee_id, last_name,
salary*12 ANNSAL,
hire_date
FROM employees
WHERE department_id = 60;

SELECT *
FROM employees_department60;

DROP TABLE employees_department60;

SELECT * 
FROM user_recyclebin;


-- ALTER TABLE - Adicionando e removendo uma coluna

ALTER TABLE projects
ADD (department_id NUMBER(3));

ALTER TABLE projects
DROP COLUMN department_id;

DESC projects;


ALTER TABLE projects
ADD (department_id NUMBER(4) NOT NULL);

--Alterando o tipo e tamanho de dados
ALTER TABLE projects
MODIFY (project_code VARCHAR2(6));

-- Renomeando uma coluna
ALTER TABLE projects
RENAME COLUMN project_name TO name;

-- Apenas para leitura
ALTER TABLE employees READ ONLY;

-- Liberando para comandos DML
ALTER TABLE employees READ WRITE;