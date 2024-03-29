-- Definindo Constraint NOT NULL

DROP TABLE projects;

CREATE TABLE projects
(project_id         NUMBER(6)            NOT NULL
 CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code        VARCHAR2(10)         NOT NULL,
 project_name        VARCHAR2(100)        NOT NULL,
 department_id       NUMBER(4)            NOT NULL,
 CREATION_DATE       DATE DEFAULT sysdate NOT NULL,
 START_DATE          DATE,
 END_DATE            DATE,
 STATUS              VARCHAR2(20)         NOT NULL,
 PRIORITY            VARCHAR2(10)         NOT NULL,
 BUDGET              NUMBER(11,2)         NOT NULL,
 DESCRIPTION         VARCHAR2(400)        NOT NULL);
 
 -- Definindo Constraint PRIMARY KEY a nivel de Tabela
 
 DROP TABLE projects;
 
 CREATE TABLE projects
(project_id         NUMBER(6)            NOT NULL,
 project_code        VARCHAR2(10)         NOT NULL,
 project_name        VARCHAR2(100)        NOT NULL,
 department_id       NUMBER(4)            NOT NULL,
 CREATION_DATE       DATE DEFAULT sysdate NOT NULL,
 START_DATE          DATE,
 END_DATE            DATE,
 STATUS              VARCHAR2(20)         NOT NULL,
 PRIORITY            VARCHAR2(10)         NOT NULL,
 BUDGET              NUMBER(11,2)         NOT NULL,
 DESCRIPTION         VARCHAR2(400)        NOT NULL,
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id));


-- Constraint UNIQUE Idenficador da Tabela

DROP TABLE projects;
 
 CREATE TABLE projects
(project_id         NUMBER(6)             NOT NULL
 CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code        VARCHAR2(10)         NOT NULL
 CONSTRAINT projects_project_code_uk UNIQUE,
 project_name        VARCHAR2(100)        NOT NULL,
 department_id       NUMBER(4)            NOT NULL,
 CREATION_DATE       DATE DEFAULT sysdate NOT NULL,
 START_DATE          DATE,
 END_DATE            DATE,
 STATUS              VARCHAR2(20)         NOT NULL,
 PRIORITY            VARCHAR2(10)         NOT NULL,
 BUDGET              NUMBER(11,2)         NOT NULL,
 DESCRIPTION         VARCHAR2(400)        NOT NULL);
 
 -- Definindo Constraint UNIQUE a nivel de Tabela
 
 DROP TABLE projects;
 
 CREATE TABLE projects
(project_id         NUMBER(6)            NOT NULL,
 project_code        VARCHAR2(10)         NOT NULL,
 project_name        VARCHAR2(100)        NOT NULL,
 department_id       NUMBER(4)            NOT NULL,
 CREATION_DATE       DATE DEFAULT sysdate NOT NULL,
 START_DATE          DATE,
 END_DATE            DATE,
 STATUS              VARCHAR2(20)         NOT NULL,
 PRIORITY            VARCHAR2(10)         NOT NULL,
 BUDGET              NUMBER(11,2)         NOT NULL,
 DESCRIPTION         VARCHAR2(400)        NOT NULL,
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
 CONSTRAINT projects_project_code_uk UNIQUE (project_code));

-- Constrants REFERENCE

DROP TABLE projects;
CREATE TABLE projects
(project_id         NUMBER(6)            NOT NULL
 CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code        VARCHAR2(10)         NOT NULL
 CONSTRAINT projects_project_code_uk UNIQUE,
 project_name        VARCHAR2(100)        NOT NULL,
 department_id       NUMBER(4)            NOT NULL
 CONSTRAINT projects_department_id_fk REFERENCES departments (department_id),
 CREATION_DATE       DATE DEFAULT sysdate NOT NULL,
 START_DATE          DATE,
 END_DATE            DATE,
 STATUS              VARCHAR2(20)         NOT NULL,
 PRIORITY            VARCHAR2(10)         NOT NULL,
 BUDGET              NUMBER(11,2)         NOT NULL,
 DESCRIPTION         VARCHAR2(400)        NOT NULL);
 
 
 -- Constraints REFERENCE A nivel de tabela
 
 DROP TABLE projects;
 
 CREATE TABLE projects
(project_id         NUMBER(6)             NOT NULL,
 project_code        VARCHAR2(10)         NOT NULL,
 project_name        VARCHAR2(100)        NOT NULL,
 department_id       NUMBER(4)            NOT NULL,
 CREATION_DATE       DATE DEFAULT sysdate NOT NULL,
 START_DATE          DATE,
 END_DATE            DATE,
 STATUS              VARCHAR2(20)         NOT NULL,
 PRIORITY            VARCHAR2(10)         NOT NULL,
 BUDGET              NUMBER(11,2)         NOT NULL,
 DESCRIPTION         VARCHAR2(400)        NOT NULL,
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
 CONSTRAINT projects_project_code_uk UNIQUE (project_code),
 CONSTRAINT project_department_id_fk FOREIGN KEY (department_id)
 REFERENCES departments (department_id));
 
 -- FOREIGN KEY - Regras de dele��o -- Default no Action
 
DROP TABLE TEAMS;
CREATE TABLE TEAMS
 (project_id        NUMBER(6)      NOT NULL,
  employee_id        NUMBER(6)     NOT NULL,
  CONSTRAINT teams_project_id_fk   FOREIGN KEY (project_id)
  REFERENCES projects(project_id),
  CONSTRAINT teams_employee_id_fk  FOREIGN KEY (employee_id)
  REFERENCES employees (employee_id));
  
  
-- FOREIGN KEY - Regras de dele��o -- ON DELETE CASCADE

DROP TABLE TEAMS;
CREATE TABLE TEAMS
 (project_id    NUMBER(6)   NOT NULL,
 employee_id    NUMBER(6)   NOT NULL,
 CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id)
 REFERENCES projects(project_id) ON DELETE CASCADE,
 CONSTRAINT teams_employee_id_fk FOREIGN KEY (employee_id)
 REFERENCES employees(employee_id));


-- ON DELETE SET NULL

DROP TABLE TEAMS;
CREATE TABLE TEAMS
 (project_id    NUMBER(6)   NOT NULL,
 employee_id    NUMBER(6)   NOT NULL,
 CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id)
 REFERENCES projects(project_id) ON DELETE SET NULL,
 CONSTRAINT teams_employee_id_fk FOREIGN KEY (employee_id)
 REFERENCES employees(employee_id));

-- Definindo Constrant CHECK a niv�l de Coluna

DROP TABLE projects cascade constraints;
 CREATE TABLE projects
 (project_id         NUMBER(6)            NOT NULL
 CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code        VARCHAR2(10)         NOT NULL
 CONSTRAINT projects_prject_code_uk UNIQUE,
 project_name        VARCHAR2(10)         NOT NULL,
 department_id       NUMBER(4)            NOT NULL
 CONSTRAINT projects_department_id_fk   REFERENCES departments,
 CREATION_DATE       DATE DEFAULT sysdate NOT NULL,
 START_DATE          DATE,
 END_DATE            DATE,
 STATUS              VARCHAR2(20)         NOT NULL,
 PRIORITY            VARCHAR2(10)         NOT NULL,
 BUDGET              NUMBER(11,2)         NOT NULL
 CONSTRAINT project_budget_ck CHECK (budget > 0),
 DESCRIPTION         VARCHAR2(400)        NOT NULL);
 
 
 
 DROP TABLE projects cascade constraint;
 CREATE TABLE projects
(project_id         NUMBER(6)             NOT NULL,
 project_code        VARCHAR2(10)         NOT NULL,
 project_name        VARCHAR2(100)        NOT NULL,
 department_id       NUMBER(4)            NOT NULL,
 CREATION_DATE       DATE DEFAULT sysdate NOT NULL,
 START_DATE          DATE,
 END_DATE            DATE,
 STATUS              VARCHAR2(20)         NOT NULL,
 PRIORITY            VARCHAR2(10)         NOT NULL,
 BUDGET              NUMBER(11,2)         NOT NULL,
 DESCRIPTION         VARCHAR2(400)        NOT NULL,
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
 CONSTRAINT projects_project_code_uk UNIQUE (project_code),
 CONSTRAINT project_department_id_fk FOREIGN KEY (department_id)
 REFERENCES departments (department_id),
 CONSTRAINT project_budget_ck CHECK (budget > 0));
 
-- Violando Constraints - ERRO
 
INSERT INTO projects (
    project_id, project_code, project_name, department_id,
    creation_date, start_date, end_date, status, priority,
    budget, description)
    VALUES (
    1 ,'ERPIMP', 'ERP Implementation', 77,
    sysdate, null, null, 'Aproved', 'HIGH',
    10000000.00, 'Oracle ERP Implementation');
    
-- Violando Constraint - Corrigindo 

INSERT INTO projects (
    project_id, project_code, project_name, department_id,
    creation_date, start_date, end_date, status, priority,
    budget, description)
    VALUES (
    1 ,'ERPIMP', 'ERP Implementation', 60,
    sysdate, null, null, 'Aproved', 'HIGH',
    10000000.00, 'Oracle ERP Implementation');
    
COMMIT;


-- Consultando Constraint pelo Dicion�rio de Dados

DESC user_constraints

DESC user_cons_columns;

SELECT co.constraint_name,
       co.constraint_type,
       co.search_condition,
       co.r_constraint_name,
       co.delete_rule,
       cc.column_name,
       cc.position,
       co.status
    FROM user_constraints co
      JOIN user_cons_columns cc ON (co.constraint_name = cc.constraint_name) AND
                                   (co.table_name = cc.table_name)
    WHERE co.table_name = 'PROJECTS'
    ORDER BY co.constraint_name,
             cc.position;
             
-- Removendo uma constraint a uma tabela

ALTER TABLE projects
DROP CONSTRAINT project_department_id_fk;

ALTER TABLE projects
DROP CONSTRAINT projects_project_id_pk CASCADE;

-- Adicioando uma Constraint a uma Tabela

ALTER TABLE projects
ADD CONSTRAINT projects_department_id_fk FOREIGN KEY (department_id)
REFERENCES departments(department_id);

ALTER TABLE projects
ADD CONSTRAINT projects_project_id_pk PRIMARY KEY (project_id);

-- Desabilitando uma Constraint

ALTER TABLE projects
DISABLE CONSTRAINT projects_department_id_fk;

ALTER TABLE projects
DISABLE CONSTRAINT projects_project_id_pk CASCADE;

-- Habilitando uma Constraint

ALTER TABLE projects
ENABLE CONSTRAINT projects_department_id_fk;

ALTER TABLE projects
ENABLE CONSTRAINT projects_project_id_pk;