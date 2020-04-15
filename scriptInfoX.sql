show databases;

create database dbinfox;

use dbinfox;

create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);

describe tbusuarios;

insert into tbusuarios(iduser,usuario,fone,login,senha)
values(1,'José de Assis','99999-9999','joseassis','123456');

select * from tbusuarios;

insert into tbusuarios(iduser,usuario,fone,login,senha)
values(2,'Administrador','99999-9999','admin','admin');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(3,'Bill Gates','99999-9999','bill','123456');

select * from tbusuarios;

update tbusuarios set fone='88888-8888' where iduser=2;

select * from tbusuarios;

delete from tbusuarios where iduser=3;

select * from tbusuarios;

create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
);

describe tbclientes;

insert into tbclientes(nomecli,endcli,fonecli,emailcli)
values('Linus Torvalds','Rua Tux, 2015','99999-9999','linus@linux.com');

insert into tbclientes(nomecli,endcli,fonecli,emailcli)
values('Lucas Gomes','Rua Senac, 2020','99999-9999','lucas@gmail.com');

select * from tbclientes;

use dbinfox;

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
serviço varchar(150),
tecnico varchar(30),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
);

describe tbos;

insert into tbos(equipamento,defeito,serviço,tecnico,valor,idcli)
values('notebook','não liga','troca da fonte','zé','87.50','1');

select * from tbos;

select
O.os,equipamento,defeito,serviço,valor
Cnomecli,fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);
