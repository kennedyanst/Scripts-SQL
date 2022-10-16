#1 UMA LISTA COM AS PROFISSÕES DOS GAFANHOTOS E  SEUS RESPECTIVOS QUANTITATIVOS
#2 QUANTOS GAFANHOTOS HOMENS E MULHERES NASCERAM APÓS 01-01-2005?
#3 UMA LISTA COM OS GAFANHOTOS QUE NASCERAM FORA DO BRASIL, MOSTRANDO O PAÍS DE ORIGEM E O TOTAL DE PESSOAS NASCIDAS LÁ. Menos o Brasil, Só interessa o país q tenha 3 ou mais pessoas morando lá
#4 UMA LISTA AGRUPADO PELA ALTURA, MOSTRANDO QUANTAS PESSOAS PESAM MAIS DE 100KG E QUE ESTÃO ACIMA DA MÉDIA DE ALTURA DE TODOS OS CADASTRADOS. 

select * from gafanhotos;

#RESPOSTAS
#1 - select prof, count(*) from gafanhotos group by prof order by count(*);
#2 - select nascimento, count(nascimento) from gafanhotos where nascimento >= "2005-01-01";
#3 - select nacionalidade, count(*) from gafanhotos group by nacionalidade having nacionalidade != "Brasil";
#4 - select altura, count(*) from gafanhotos where peso > '50' group by altura having altura > (select avg(altura) from gafanhotos);