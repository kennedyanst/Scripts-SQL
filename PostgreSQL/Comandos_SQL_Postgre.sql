/*Comando LIMIT E FETCH para limitar a quantidade de registros retornados*/
select * from cap16."TB_FUNC" limit 3;
select * from cap16."TB_FUNC" FETCH first 5 rows only;

/*Comando DISTINCT*/
SELECT DISTINCT * FROM cap16."TB_FUNC";
SELECT DISTINCT numeros_filhos as Filhos from cap16."TB_FUNC";

/*Comando WHERE*/
SELECT * from cap16."TB_FUNC" WHERE idade = 30;

/*Operadores de comparação SQL*/
SELECT COUNT(*) as numero_registros FROM cap16."TB_FUNC";
SELECT COUNT(*) as Idade_40 FROM cap16."TB_FUNC" WHERE idade = 40;
SELECT COUNT(*) as Idade_dif_40 FROM cap16."TB_FUNC" WHERE idade != 40;
SELECT COUNT(*) as Idade_maior_40 FROM cap16."TB_FUNC" WHERE idade > 40;
SELECT COUNT(*) as Idade_maiorIgual_40 FROM cap16."TB_FUNC" WHERE idade >= 40;

/*Operadores Logicos*/
select * from cap16."TB_FUNC" WHERE idade > 30 and estado_civil = 'casado';
select * from cap16."TB_FUNC" WHERE idade < 30 or estado_civil = 'solteiro';

/*Comando BETWEEN*/
SELECT * from cap16."TB_FUNC" WHERE idade between 30 and 35;

/*Comando LIKE*/
SELECT * FROM cap16."TB_FUNC" where grau_instrucao like '%medio';
SELECT * FROM cap16."TB_FUNC" where grau_instrucao like '%medio%';

/*Comando IN*/
SELECT * from cap16."TB_FUNC" where idade in (20,30,40,50);

/*Comando IS NULL encontrar valores nulos*/
SELECT * from cap16."TB_FUNC" where numeros_filhos is null;

/*Comando UPDATE*/
update cap16."TB_FUNC"
set numeros_filhos = null
where numeros_filhos = 'NA';
commit; /*Gravar a alteração*/

select * from cap16."TB_FUNC";

SELECT * from cap16."TB_FUNC" where numeros_filhos is null;

/*Comando Truncate Cascate = Apagar todos os dados dessa e de tabelas relacionadas.*/

/*Comando DELETE*/
delete from cap16."TB_FUNC"
where numeros_filhos is null;
commit;
select * from cap16."TB_FUNC";

/*Comando INSERT
INSERT INTO cap16."TB_FUNC"(
	"id ", estado_civil, grau_instrucao, numeros_filhos, salario_hora, idade, reg_procedencia)
	VALUES (38, 'solteiro', 'ensino_medio', 2, 10.5, 28, 'capital');
select * from cap16."TB_FUNC";*/

/*Comando ORDER BY*/
select * from cap16."TB_FUNC" order by salario_hora, grau_instrucao desc;

/*Comando MAX(), MIN(), AVG(), COUNT(), SUM()*/
select max(salario_hora), min(salario_hora), avg(salario_hora), count(*), sum(salario_hora) 
from cap16."TB_FUNC";

/*Comando GROUP BY*/
SELECT DISTINCT reg_procedencia
from cap16."TB_FUNC";

SELECT round(AVG(salario_hora)), reg_procedencia
from cap16."TB_FUNC"
GROUP BY reg_procedencia;