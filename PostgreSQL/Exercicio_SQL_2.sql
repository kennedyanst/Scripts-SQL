/* ----------- EXERCICIO 2 -----------

Retorne todos os registros dos funcionários com 2 filhos*/

SELECT * FROM cap16."TB_FUNC"
WHERE numeros_filhos = '2'

SELECT * FROM cap16."TB_FUNC"
WHERE CAST(numeros_filhos AS integer) = 2