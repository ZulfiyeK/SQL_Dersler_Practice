/*
anneler, babalar ve cocuklar adında 3 tane tablo olusturun
anneler tablosunda id(primary key), isim(unique) ve meslek sutunları olsun
babalar tablosunda id(primary key), isim ve meslek sutunları olsun
cocuklar tablosunda isim, anne_id,  baba_id,yas sutunları olsun
her cocugun anneler tablosundan bir annesi ve
babalar tablosundan bir babası olsun
--cocuklar tablosunda anne_id ve baba_id sutunlarını 
referans alan foreign key kısıtlaması olsun
*/

create table anneler(
id int primary key,
isim varchar(20) unique,
meslek varchar(20)
);


create table babalar(
id int primary key,
isim varchar(20),
meslek varchar(20)
);


create table cocuklar(
isim varchar(20),
anne_id int,
baba_id int,
yas int,
constraint fk_anne foreign key(anne_id) references anneler(id),	
constraint fk_baba foreign key(baba_id) references babalar(id)	
);



































































