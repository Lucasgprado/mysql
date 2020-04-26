create database lojinha;
use lojinha;

create table tbclientes(
    idcli int primary key auto_increment,
    nome varchar(50) not null,
    fone varchar(15) not null,
    cpf varchar(15) not null    
);

describe tbclientes;

insert into tbclientes(nome,fone,cpf)
values('Lucas Gomes','99999-9999','14725836909');

insert into tbclientes(nome,fone,cpf)
values('Bill Gates','88888-8888','74185296300');

insert into tbclientes(nome,fone,cpf)
values('Leandro Ramos','24247-2424','24013567980');

select * from tbclientes;

create table tbprodutos(
	idpro int primary key auto_increment,
    produto varchar(50) not null,
    valor decimal(10,2),
    quantidade int not null
);

describe tbprodutos;

insert into tbprodutos(produto,valor,quantidade)
values('Placa Mãe',300.00,400);

insert into tbprodutos(produto,valor,quantidade)
values('Processador',600.00,1000);

insert into tbprodutos(produto,valor,quantidade)
values('Memória RAM',200.00,300);

insert into tbprodutos(produto,valor,quantidade)
values('Fonte',450.00,700);

insert into tbprodutos(produto,valor,quantidade)
values('Placa de Video',800.00,800);

insert into tbprodutos(produto,valor,quantidade)
values('Gabinete',500.00,900);

select * from tbprodutos;

create table tbpedidos(
	idpedido int primary key auto_increment,
    dataped timestamp default current_timestamp,
    idcli int not null,
    idpro int not null,
    foreign key(idcli) references tbclientes(idcli),
    foreign key(idpro) references tbprodutos(idpro)
);

describe tbpedidos;

insert into tbpedidos(idcli,idpro) values (1,1);
insert into tbpedidos(idcli,idpro) values (1,2);
insert into tbpedidos(idcli,idpro) values (2,3);
insert into tbpedidos(idcli,idpro) values (2,4);
insert into tbpedidos(idcli,idpro) values (3,1);
insert into tbpedidos(idcli,idpro) values (3,2);
insert into tbpedidos(idcli,idpro) values (3,3);
insert into tbpedidos(idcli,idpro) values (3,4);

select * from tbpedidos
inner join tbclientes
on tbpedidos.idcli = tbclientes.idcli
inner join tbprodutos
on tbpedidos.idpro = tbprodutos.idpro;

select
P.idpedido as Pedido,
A.nome as cliente,
C.produto,valor
from tbpedidos as P
inner join tbclientes as A
on (P.idcli = A.idcli)
inner join tbprodutos as C
on (P.idpro = C.idpro);

select sum(valor) as Total from tbprodutos;