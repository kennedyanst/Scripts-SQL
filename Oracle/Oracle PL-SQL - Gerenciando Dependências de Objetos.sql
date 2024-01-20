-- Consultando Depedencias Diretas dos objetos do seu schema utilizando a visão USER_DEPENDENCIES

DESC user_dependecies

SELECT *
FROM user_dependencies
WHERE referenced_name = 'EMPLOYEES' AND
      referenced_type  = 'TABLE';
      
-- Consultando Depedencias Diretas e Indiretas dos objetos do seu schema utilizando a visão USER_DEPENDENCIES

SELECT      *
FROM        user_dependencies
START WITH  referenced_name = 'EMPLOYEES' AND
            referenced_type = 'TABLE'
CONNECT BY PRIOR name = referenced_name AND
                 type = referenced_type;
                 
                 
-- Consultando Depedencias Diretas e Indiretas dos objetos de todos schemas utilizando a visão USER_DEPENDENCIES

-- Conecte-se como SYS - (DBA)

DESC DBA_DEPENDENCIES;

SELECT      *
FROM        dba_dependencies
START WITH  referenced_owner = 'HR' AND
            referenced_name = 'EMPLOYEES' AND
            referenced_type = 'TABLE'
CONNECT BY PRIOR owner = referenced_owner AND
                 name = referenced_name   AND
                 type = referenced_type;
                 
-- Consultando objetos Inválidos do schema do seu usuário

DESC USER_OBJECTS

SELECT object_name, object_type, last_ddl_time, timestamp, status
FROM   user_objects
WHERE  status = 'INVALID';


-- Executando o script  UTLDTREE

@C:\OracleDatabase21cXE\dbhomeXE\rdbms\admin\utldtree.sql


exec DEPTREE_FILL('TABLE', 'HR', 'EMPLOYEES');

DESC deptree;

-- Utilizando as Visões DEPTREE

SELECT *
FROM deptree
ORDER BY seq#;

-- Utilizando as Visões IDEPTREE

desc ideptree

SELECT *
FROM ideptree;