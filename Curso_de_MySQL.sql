#CRIANDO A TABELA PESSOAS!
create table pessoas (
id int NOT NULL auto_increment,
nome varchar(30) NOT NULL, 
nascimento date, 
sexo enum("M", "F"), 
peso decimal (5,2), altura decimal(3,2), 
nacionalidade varchar(20) DEFAULT "Brasil",
PRIMARY KEY (id)
)default charset = utf8;
describe pessoas;


#INSERINDO DADOS
INSERT INTO pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade) #Como o id ta com auto_increment não precisa colocar os dados
VALUES
( 'Maria', '1999-12-02', 'F','55', '1.62', 'Brasil');

#Se a ordem estiver da mesma forma que está na tabela, pode colocar os valores somentes
INSERT INTO pessoas VALUES
(DEFAULT, 'Paulo', '1929-12-12', 'M','76.2', '1.68', 'Mexico');

#Inserindo varios dados 
INSERT INTO pessoas VALUES
(DEFAULT, 'Pedro', '1929-12-12', 'M','76.2', '1.68', 'Canada'),
(DEFAULT, 'Cris', '1929-12-12', 'F','76.2', '1.68', default),
(DEFAULT, 'Paul', '1929-12-12', 'M','76.2', '1.68', 'Portugal'),
(DEFAULT, 'Marina', '1929-12-12', 'F','76.2', '1.68', 'Irlanda'),
(DEFAULT, 'José', '1929-12-12', 'M','76.2', '1.68', 'Argentina'),
(DEFAULT, 'Fabio', '1929-12-12', 'M','76.2', '1.68', 'EUA');
select * from pessoas;


#ALTERANDO A ESTRUTURA DA TABELA (ALTER TABLE E DROP TABLE)
#Adicionando uma coluna
ALTER TABLE pessoas
ADD COLUMN profissao varchar(10);

#Deletando uma coluna
ALTER TABLE pessoas
DROP COLUMN profissao;

#Adicionando uma coluna após o nome
ALTER TABLE pessoas
ADD COLUMN profissao varchar(10) AFTER nome;

#Colocando no primeiro campo. 
ALTER TABLE pessoas
ADD COLUMN codigo int FIRST;
describe pessoas;

#Modificando uma coluna
ALTER TABLE pessoas
MODIFY COLUMN profissao varchar (21) not null default "";
describe pessoas;

#Mudando o nome da coluna
ALTER TABLE pessoas
CHANGE COLUMN profissao prof varchar (21) not null default "";
describe pessoas;

#Mudando o nome da tabela
ALTER TABLE pessoas
RENAME TO gafanhotos1;

#Criando uma tabela "SE ELA NÃO EXISTIR"
CREATE TABLE IF NOT EXISTS cursos1(
nome varchar(30) not null unique,
descricao text,
carga int UNSIGNED,
totaulas int,
ano year DEFAULT "2016"
) DEFAULT CHARSET = utf8;

#Criando a chave primaria 
ALTER TABLE cursos
ADD COLUMN idcursos int FIRST;
ALTER TABLE cursos
ADD PRIMARY KEY (idcursos);
describe cursos;

#Apagado a tabela 
DROP TABLE cursos;


#MANIPULANDO LINHAS (UPDATE, DELETE, TRUNCATE)
INSERT INTO cursos VALUES
('1', 'HTML4', 'Curso de HTML5', '40', '37', '2014'), 
('2', 'Algoritmos', 'Logica de programação', '40', '37', '2013'), 
('3', 'Photoshop', 'Dicas de photoshop CC', '40', '37', '2014'), 
('4', 'PGP', 'Curso de PHP', '40', '37', '2011'), 
('5', 'JARVA', 'Introdução a linguagem JAVA', '40', '37', '2015'), 
('6', 'MySQL', 'Banco de dados MySQL', '40', '37', '2016'), 
('7', 'Word', 'Curso completo de Word', '40', '37', '2019'), 
('8', 'Sapateado', 'Dança Ritmicas', '40', '37', '2012'), 
('9', 'Cozinha Árabe', 'Aprenda a fazer Kibe', '40', '37', '2014'), 
('10', 'Youtuber', 'Gerar Polemica e ganhar escritos', '40', '37', '2011');
select * from cursos;

#Modificando uma linha
UPDATE cursos
SET nome = "HTML5"
WHERE idcursos = "1";

UPDATE cursos
SET nome = "PHP", ano = "2015"
WHERE idcursos = "4";

UPDATE cursos
SET nome = "JAVA", ano = "2016", carga = "45"
WHERE idcursos = "5"
LIMIT 1; #Limitando a mudança para ocorrer somente me uma linha, se errar o comando. 

#DELETANDO REGISTROS
DELETE FROM cursos
WHERE idcursos = "10";
select * from cursos;

#Apagar todos os registros de uma tabela
TRUNCATE TABLE cursos; 


#PHPMYADMIN
#Mostrando como uma tabela foi criada
show create table customer_data;

#Mostrando como uma base de dados foi criada
show create database aula;


# Aula SELECT (Parte 1)
select * from gafanhotos;

select nome, carga, ano 
from cursos
order by nome; #desc ou asc

#Filtrando por colunas
select ano, nome, carga
from cursos
order by nome, ano;

#Filtrando por linhas
select * from cursos
where ano = "2016"
order by nome;

select nome, carga from cursos
where ano = "2016"
order by nome;

select nome, descricao, ano from cursos
where ano <= "2015"
order by ano, nome;

#Entre 2014 e 2016 
select nome, ano from cursos
where ano between "2014" and 2016
order by nome desc, ano asc;

#Selecionando valores especificos
select nome, descricao, ano from cursos
where ano in (2014, 2016)
order by nome; 

#Busca com condição AND
select nome, carga, totaulas from cursos
where carga > 35 and totaulas < 30
order by nome;

#Busca com condição OR
select nome, carga, totaulas from cursos
where carga > 30 or totaulas < 40
order by nome;


# Aula SELECT (PARTE 2)
#Operador LIKE e %(Caractere coringa) = Semelhantes
select * from cursos
where nome like "P%"; #COMEÇA COM P

select * from cursos
where nome like "%A"; #TERMINA COM A

select * from cursos
where nome like "%A%"; #TODOS QUE TENHAM A EM QUALQUER LUGAR

select * from cursos
where nome not like "%A%"; #TODOS QUE NÃO TENHAM A EM LUGAR NENHUM 

select * from cursos
where nome like "ph%p%"; #Pega todos que começa com Ph e tenham p 

select * from cursos
where nome like "PH%P_"; #_ Exige q tenha alguma coisa no final 

select * from cursos
where nome like "p__t%"; #Começa com p tem mais duas letras e termina com t

select * from gafanhotos
where nome like "%silva%";

select * from gafanhotos
where nome like "%_silva%"; #sobrenome silva

#Distinguindo coisas
select distinct carga from cursos;

select distinct nacionalidade from gafanhotos order by nacionalidade;

select distinct carga from cursos
order by carga;

#Funções de Agregações
select count(nome) from cursos; #30 CURSOS CADASTRADOS

select count(*) from cursos 
where carga > 30; #Contando os registros com a carga maior que 30

select max(carga) from cursos; #Maior carga de um curso

select max(totaulas) from cursos where ano = "2016"; #Maximo de total de aulas que teve em 2016

select nome, min(totaulas) from cursos where ano = "2016"; #Minimo de total de aulas que teve em 2016

select sum(totaulas) from cursos where ano = 2016; #Somando o total de aulas de 2016

select avg(totaulas) from cursos where ano = 2016; #Média do total de aulas do curso em 2016


#AULA SELECT (PARTE 3)
#Agrupando registros
select carga, count(nome) from cursos
group by carga;

select totaulas, count(*) from cursos
group by totaulas
order by totaulas; #Contando cada agrupamento

select carga, count(nome) from cursos where totaulas = 30
group by carga;

select carga, count(nome) from cursos
group by carga
having count(nome) > 3; #Mostrar quem tem o contador maior que 3

select ano, count(*) from cursos
group by ano
having count(ano) >= 5
order by count(*); #Agrupou quem tem o contador de ano maior igual a 5
#O Having só mostra qm vc agrupou no group by 

select ano, count(*) from cursos
where totaulas > 30
group by ano
having ano > 2013
order by count(*); #Selecionar, filtrar, agrupar e escolher qm desse agrupamento quer exibir 

select carga, count(*) from cursos
where ano > 2015
group by carga
having carga > (select avg(carga) from cursos); #MOstrando quem está acima da média da carga total do curso (36.6)


#Aula CHAVES ESTRANGEIRAS E JOIN
#Usar a ENGINNER: InnoDB - Suporta chave estrangeira 
#Transações: ACID - Atomicidade, Consistência, Isolamento, Durabilidade. 

alter table gafanhotos 
add cursopreferido int;

#Dizer que cursopeferido é uma chave estrangeira
alter table gafanhotos 
add foreign key (cursopreferido)
references cursos(idcursos);

#Adicionando o curso preferido
update gafanhotos set cursopreferido = "6" where id = "1";

#Erro de integridade referencial = Já existe relação entre as tabelas
#Pode apagar o curso que não tenha relacionamento com a outra tabela

select nome, cursopreferido from gafanhotos;
select nome, ano from cursos;

#Está juntando todos os 30 cursos com cada aluno
select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano
from gafanhotos join cursos;

#Ligando a chave primaria com a chave estrangeira com o ON para dá sentido
select gafanhotos.nome, cursos.nome, cursos.ano
from gafanhotos join cursos #inner join
on cursos.idcurso = gafanhotos.cursopreferido
order by gafanhotos.nome;

#Apelidos de colunas e INNER JOIN
select g.nome, c.nome, c.ano
from gafanhotos as g join cursos as c #inner join
on c.idcurso = g.cursopreferido
order by g.nome;

#Mostrando todos os alunos, dando preferencia na tabela da esquerda
select g.nome, c.nome, c.ano
from gafanhotos as g left outer join cursos as c #left join
on c.idcurso = g.cursopreferido;

#Mostrando todos os alunos, dando preferencia na tabela da direita
select g.nome, c.nome, c.ano
from gafanhotos as g right outer join cursos as c #rigth join
on c.idcurso = g.cursopreferido;


#Aula INNER JOIN COM VÁRIAS TABELAS
create table gafanhoto_assiste_curso(
	id int auto_increment not null,
    data date,
    idgafanhoto int,
    idcurso int,
    primary key (id),
    foreign key (idgafanhoto) references gafanhotos(id),
    foreign key (idcurso) references cursos(idcurso)
)default charset = utf8;

#Inserindo os registros
insert into gafanhotos_assiste_cursos values
(default, "2014-02-22", "1", "2");
select * from gafanhotos_assiste_cursos;

#Junções
select * from gafanhotos g
join gafanhotos_assiste_cursos a
on g.id = a.idgafanhoto;

#Mostrando o nome do curso. Puxando dados de 3 tabelas
select g.nome, c.nome from gafanhotos g
join gafanhotos_assiste_cursos a
on g.id = a.idgafanhoto
join cursos c
on  c.idcurso = a.idcurso
order by g.nome;