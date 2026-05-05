create database floricultura;
use floricultura;

create table funcionario(

id_funcionario int primary key auto_increment,
nome_funcionario varchar(50) not null,
idade_funcionario int(3) not null,
email_funcionario varchar(100) not null,
telefone_funcionario int(100) not null,
CPF_funcionario varchar(100) not null,
endereco_funcionario varchar(100) not null,
cargo_funcionario char(100) not null,
salario_funcionario varchar(100) not null
);

create table cliente(

id_cliente int primary key auto_increment,
nome_cliente varchar(50) not null,
email_cliente varchar(100) not null,
telefone_cliente int(100) not null,
CPF_cliente varchar(100) not null,
endereco_cliente varchar(100) not null
);

create table produto(

id_produto int primary key auto_increment,
preco varchar(50) not null,
N°_serie int(255) not null,
tipo_produto varchar(100) not null,
nome char(100) not null,
cor char(20) not null,
descricao varchar(255) not null

);

