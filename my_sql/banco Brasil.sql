create database bancoBrasil;
use bancoBrasil;

create table clientes (
cpf_cliente varchar(11),
nome_cliente varchar(20),
rua_cliente varchar(30),
cidade_cliente varchar(40),
estado_civil varchar(20),
rg_cliente varchar(7),
idade_cliente int,
data_cadastro date,
primary key (cpf_cliente)
);

create table agencia (
codigo_agencia int,
nome_agencia char(15) not null,
cidade_agencia varchar(40),
fundos numeric(10,2) default 0,
primary key (codigo_agencia),
check (fundos >=20)
);

create table emprestimo (
numero_emprestimo int not null,
codigo_agencia int not null,
total numeric(10,2),
primary key(numero_emprestimo),
foreign key(codigo_agencia) references agencia(codigo_agencia),
check (total >0)
);

create table devedor (
cpf_cliente varchar(11) not null,
numero_emprestimo int not null,
primary key (cpf_cliente, numero_emprestimo),
foreign key (cpf_cliente) references clientes(cpf_cliente),
foreign key (numero_emprestimo) references emprestimo(numero_emprestimo)
);

select* from devedor