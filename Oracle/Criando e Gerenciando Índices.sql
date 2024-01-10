-- Criação de Indices


DROP INDEX emp_name_ix;
DROP INDEX employees_last_name_idx;

SELECT * 
FROM employees
WHERE last_name = 'Himuro';

-- Criando um Indice simples

CREATE INDEX employees_last_name_idx
ON employees(last_name);

-- Criando um indice composto

CREATE INDEX employees_name_idx
ON employees(last_name, first_name);

-- Análise do Plano de Execução

SELECT * 
FROM employees
WHERE last_name = 'Himuro' AND 
      first_name = 'Guy';
      
ALTER INDEX employees_name_idx REBUILD;


-- Consultando Indices

SELECT ix.index_name,
       ic.column_position,
       ic.column_name,
       ix.index_type,
       ix.uniqueness,
       ix.status
FROM     user_indexes ix
    JOIN user_ind_columns ic ON (ix.index_name = ic.index_name) AND
                                (ix.table_name = ic.table_name)
WHERE ix.table_name = 'EMPLOYEES'
ORDER BY ix.index_name, ic.column_position;

DROP INDEX employees_last_name_idx;
        

