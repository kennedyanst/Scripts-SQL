-- Criando Sinonimos Privados

CREATE SYNONYM departamentos
FOR departments;

CREATE SYNONYM dept
FOR departments;

-- Utilizando sin�nimos

SELECT * 
FROM departamentos;

SELECT *
FROM dept;


DROP SYNONYM dept;

CREATE PUBLIC SYNONYM empregados
FOR employees;

SELECT * FROM empregados1;