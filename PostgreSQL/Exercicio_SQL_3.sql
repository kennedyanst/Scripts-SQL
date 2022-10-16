/* ----------- EXERCICIO 3 -----------

Retorne a média de salário hora por estado */

select avg(salario_hora), endereco.estado
from cap16."TB_FUNC" as func
join cap16."TB_ENDERECO" as endereco
on endereco.id_func = func."id "
group by endereco.estado