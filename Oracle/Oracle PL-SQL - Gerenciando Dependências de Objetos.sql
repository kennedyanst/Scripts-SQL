-- Consultando objetos tipo Procedure e Function do seu Usuario

DESC USER_OBJECTS;

SELECT object_name, object_type, last_ddl_time, timestamp, status
FROM user_objects
WHERE object_type IN ('PROCEDURE', 'FUNCTION');

-- Consultando objetos Inv�vidos do schema do seu usu�rio

SELECT object_name, object_type, last_ddl_time, timestamp, status
FROM all_objects
WHERE object_type IN ('PROCEDURE', 'FUNCTION');

-- Consultando objetos Inv�lidos do schema do seu usu�rio

DESC USER_OBJECTS;

SELECT object_name, object_type, last_ddl_time, timestamp, status
FROM user_objects
WHERE status = 'INVALID';

-- Consultando o C�digo Fonte de Procedure e Fun��es do seu usu�rio

DESC user_source;

SELECT line, text
FROM user_source
WHERE name = 'PRC_INSERE_EMPREGADO' AND
      type = 'PROCEDURE'
ORDER BY line;


SELECT line, text
FROM user_source
WHERE name = 'FNC_CONSULTA_SALARIO_EMPREGADO' AND
      type = 'FUNCTION'
ORDER BY line;

-- Consultando a list de par�metros de Procedures e Fun��es

DESC PRC_INSERE_EMPREGADO;

DESC FNC_CONSULTA_SALARIO_EMPREGADO;


-- Consultando Erros de Compila��o - Vis�o USER_ERROS

COLUMN position FORMAT a4
COLUMN text FORMAT a60
SELECT line||'/'|| position position, text
FROM user_erros
WHERE name = 'FNC_CONSULTA_SALARIO_EMPREGADO'
ORDER BY line;