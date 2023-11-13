create database avaliacaoSprint;
use avaliacaoSprint;

create table grupo(
idGrupo int primary key auto_increment,
nome varchar(45),
descricao varchar(70)
)auto_increment = 1;

create table aluno(
idAluno int primary key auto_increment,
ra char(8),
nome varchar(45),
emai varchar(45),
fkGrupo int,
constraint fkGrupo foreign key (fkGrupo) references grupo(idGrupo)
);	

create table professor(
idProfessor int primary key auto_increment,
nome varchar(45),
disciplina varchar(45)
)auto_increment = 10000;

create table avaliacaoSprint(
fkGrupo int,
foreign key (fkGrupo) references grupo(idGrupo),
fkProfessor int,
foreign key (fkProfessor) references professor(idProfessor),
fkProfessor2 int,
foreign key (fkProfessor2) references professor(idProfessor),
dataHora datetime,
nota decimal(4,2)
);

insert into grupo values 
	(null, 'Apulus Tech', 'Controle de temperatura e umidade em armazens de café'),
    (null, 'FruitTech', 'Controle de temperatura e umidade em baús de caminhões de frutas');
    
insert into aluno values 
    (null, '01232234', 'Robson Luis', 'robson.luis@sptech.school', 1),
    (null, '01232123', 'Juliana Camargo', 'juliana.camargo@sptech.school', 2),
    (null, '01232634', 'Rodrigo Goes', 'rodrigo.goes@sptech.school', 2),
    (null, '01232734', 'Renata Antunes', 'renata.antunes@sptech.school', 1);
    
insert into professor values 
	(null, 'Raissa Arruda', 'Desenvolvimento SocioEmocional'),
	(null, 'Fernanda Caramico', 'Pesquisa e Inovação');
    
insert into avaliacaoSprint values 
	(1, 10000, 10001 , '2023-10-31 10:31:22', 9.64),
    (2, 10000, 10001 , '2023-10-24 15:27:09', 8.79);
    
select * from grupo;
select * from aluno;
select * from professor;
select * from avaliacaoSprint;

select * from grupo join aluno on idGrupo = fkGrupo;
select * from grupo join aluno on idGrupo = fkGrupo where idGrupo = 1;
select round(avg(nota),2) as 'Média total' from avaliacaoSprint;
select min(nota) as 'Menor nota', max(nota) as 'Maior nota' from avaliacaoSprint;
select sum(nota) as 'Soma total' from avaliacaoSprint;

select * from professor left join avaliacaoSprint on idProfessor = fkProfessor left join grupo on idGrupo = fkGrupo;

select * from professor left join avaliacaoSprint on idProfessor = fkProfessor left join grupo on idGrupo = fkGrupo where idGrupo = 2;

select * from grupo left join avaliacaoSprint on idGrupo = fkGrupo left join professor on idProfessor = fkProfessor where idProfessor = 10000;

select * from grupo left join aluno as a on idGrupo = a.fkGrupo left join avaliacaoSprint as s on idGrupo = s.fkGrupo left join professor on idProfessor = fkProfessor where idProfessor = 10000;

select count(nota) as 'Notas distintas' from avaliacaoSprint;

select p.nome, round(avg(nota),2) as 'Média notas', sum(nota) as 'Soma total' from professor as p left join avaliacaoSprint on idProfessor = fkProfessor;

select g.nome, round(avg(nota),2) as 'Média notas', sum(nota) as 'Soma total' from grupo as g left join avaliacaoSprint on idGrupo = fkGrupo;


