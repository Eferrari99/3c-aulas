create database projectxp;
use projectxp;

create table aluno(
id int (5) not null auto_increment,
nome varchar (100) not null,
data_nasc date not null,
primary key (id)
);

create table turma(
id int not null auto_increment,
nome_turma varchar (100) not null,
inicio datetime,
observacoes longtext,
primary key (id)
);

create table alunoturma(
id_aluno int not null,
id_turma int not null,
primary key (id_aluno, id_turma),
foreign key (id_aluno) references aluno(id),
foreign key (id_turma) references turma(id)
);

create table disciplina(
id int (5) auto_increment,
descricao varchar(100) not null,
primary key (id),
foreign key (id) references aluno(id)
);

select* from aluno