create schema concessionaria;

set search_path = concessionaria;

create table marca (
	codigo integer primary key,
	nome varchar(30) not null
);

create table modelo(
	codigo integer primary key,
	nome varchar(256) not null,
	marca integer not null,
	foreign key(marca) references marca(codigo)
);

create table veiculo(
	id_veiculo serial primary key,
	placa varchar(10) not null,
	chassi varchar(16) not null,
	ano integer not null,
	cor varchar(30) not null,
	modelo integer not null,
	foreign key (modelo) references modelo(codigo),
	unique(placa)
);

create table pessoa(
	cpf varchar(11) primary key,
	nome varchar(256) not null
);

create table comprador(
	estado_civil varchar(20) not null,
	conjugeNome varchar(256),
	conjugeCpf varchar(11),
	cpf_comprador varchar(11) primary key,
	foreign key(cpf_comprador) references pessoa(cpf)
);

create table corretor(
	matricula varchar(20) not null,
	dt_admissao date not null,
	cpf_corretor varchar(11)primary key,
	unique(matricula),
	foreign key(cpf_corretor) references pessoa(cpf)
);

create table venda(
	comissao float,
	valor float not null,
	data_venda date not null,
	cpf_comprador varchar(11),
	cpf_corretor varchar(11),
	id_veiculo serial,
	foreign key (cpf_corretor) references corretor(cpf_corretor),
	foreign key (id_veiculo) references veiculo(id_veiculo),
	foreign key (cpf_comprador) references comprador(cpf_comprador)
	
);