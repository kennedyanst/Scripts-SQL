-- Consultando objetos tipo Procedure e Function do seu Usuario

DESC USER_OBJECTS;

SELECT object_name, object_type, last_ddl_time, timestamp, status
FROM user_objects
WHERE object_type IN ('PROCEDURE', 'FUNCTION');

-- Consultando objetos Invávidos do schema do seu usuário

SELECT object_name, object_type, last_ddl_time, timestamp, status
FROM all_objects
WHERE object_type IN ('PROCEDURE', 'FUNCTION');

-- Consultando objetos Inválidos do schema do seu usuário

DESC USER_OBJECTS;

SELECT object_name, object_type, last_ddl_time, timestamp, status
FROM user_objects
WHERE status = 'INVALID';

-- Consultando o Código Fonte de Procedure e Funções do seu usuário

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

-- Consultando a list de parâmetros de Procedures e Funções

DESC PRC_INSERE_EMPREGADO;

DESC FNC_CONSULTA_SALARIO_EMPREGADO;


-- Consultando Erros de Compilação - Visão USER_ERROS

COLUMN position FORMAT a4
COLUMN text FORMAT a60
SELECT line||'/'|| position position, text
FROM user_erros
WHERE name = 'FNC_CONSULTA_SALARIO_EMPREGADO'
ORDER BY line;