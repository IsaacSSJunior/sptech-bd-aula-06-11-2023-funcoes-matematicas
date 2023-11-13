create database avaliacaoSprint;

use avaliacaoSprint;

create table Grupo(
idGrupo int primary key auto_increment,
nome varchar(45),
descricao varchar(70)
)auto_increment = 1;

insert into Grupo values 
	(null, 'Rozz Tech', 'Controle de umidade em estoque de arroz'),
    (null, 'FruitTech', 'Controle de temperatura e umidade em baús de caminhões de mamão');

create table Aluno(
idAluno int primary key auto_increment,
ra char(8),
nome varchar(45),
emai varchar(45),
fkGrupo int,
constraint fkGrupo foreign key (fkGrupo) references grupo(idGrupo)
);

insert into Aluno values 
    (null, '01232431', 'Fernanda Souza', 'fernando.souza@sptech.school', 2),
    (null, '01232627', 'Diego Camargo', 'diego.camargo@sptech.school', 2),
    (null, '01232831', 'Roberta Santos', 'roberta.santos@sptech.school', 1),
    (null, '01232744', 'Julio Cristino', 'julio.cristino@sptech.school', 1);	

create table Professor(
idProfessor int primary key auto_increment,
nome varchar(45),
disciplina varchar(45)
)auto_increment = 10000;

insert into Professor values 
	(null, 'Raysa Aguiar', 'Desenvolvimento SocioEmocional'),
	(null, 'Fernanda Caramico', 'Pesquisa e Inovação');

create table AvaliacaoSprint(
fkGrupo int,
foreign key (fkGrupo) references grupo(idGrupo),
fkProfessor int,
foreign key (fkProfessor) references professor(idProfessor),
fkProfessor2 int,
foreign key (fkProfessor2) references professor(idProfessor),
dataHora datetime,
nota decimal(4,2)
);
    
insert into AvaliacaoSprint values 
	(1, 10000, 10001 , '2023-10-11 11:31:22', 8.24),
    (2, 10000, 10001 , '2023-10-14 12:27:09', 7.99);
    
select * from Grupo;

select * from Aluno;

select * from Professor;

select * from AvaliacaoSprint;

select * from Grupo join Aluno on idGrupo = fkGrupo;

select * from Grupo join aluno on idGrupo = fkGrupo where idGrupo = 1;

select round(avg(nota),2) as 'Média total' from avaliacaoSprint;

select min(nota) as 'Menor (-) nota', max(nota) as 'Maior (+) nota' from avaliacaoSprint;

select sum(nota) as 'Total' from AvaliacaoSprint;

select * from Professor left join AvaliacaoSprint on idProfessor = fkProfessor left join Grupo on idGrupo = fkGrupo;

select * from Professor left join AvaliacaoSprint on idProfessor = fkProfessor left join Grupo on idGrupo = fkGrupo where idGrupo = 2;

select * from Grupo left join AvaliacaoSprint on idGrupo = fkGrupo left join professor on idProfessor = fkProfessor where idProfessor = 10000;

select * from Grupo left join aluno as a on idGrupo = a.fkGrupo left join avaliacaoSprint as s on idGrupo = s.fkGrupo left join professor on idProfessor = fkProfessor where idProfessor = 10000;

select count(nota) as 'Notas diferentes' from avaliacaoSprint;

select p.nome, round(avg(nota),2) as 'Média', sum(nota) as 'Total' from Professor as p left join AvaliacaoSprint on idProfessor = fkProfessor;

select g.nome, round(avg(nota),2) as 'Média', sum(nota) as 'Total' from Grupo as g left join AvaliacaoSprint on idGrupo = fkGrupo;


