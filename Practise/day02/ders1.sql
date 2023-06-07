CREATE TABLE calisanlar
(
id int PRIMARY KEY, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
sirket VARCHAR(20)
);


INSERT INTO calisanlar VALUES(123456789, 'Ali Yildiz', 'Istanbul', 5500, 'Tefal');
INSERT INTO calisanlar VALUES(234567890, 'Ayse Sahin', 'Istanbul', 4500, 'Karaca');
INSERT INTO calisanlar VALUES(345678901, 'Hayriye Tekin', 'Ankara', 3500, 'Samsung'); 
INSERT INTO calisanlar VALUES(456789012, 'Feyza Sanli', 'Izmir', 6000, 'Arcelik');
INSERT INTO calisanlar VALUES(567890123, 'Deniz Yildirim', 'Ankara', 7000, 'Beko');
INSERT INTO calisanlar VALUES(456715012, 'Melek Metin', 'Ankara', 4500, 'Profilo');

--SORU1: calisanlar tablosundaki sirket sutununun adini firma olarak degistiriniz.
alter table calisanlar rename column sirket to firma;


--SORU2: calisanlar tablosunun adini isciler olarak degistiriniz.
alter table calisanlar rename to isciler;


-- SORU3: isciler tablosundaki sehir 
--sutununun veri tipini VARCHAR(30) olarak değiştiriniz.
alter table isciler alter column sehir type varchar(30);



-- SORU4: isciler tablosuna maas 3000 den kucuk olan degerler veri olarak girilemesin.
--kısıtlama ekleyelim ve kısıtlamaya check_maas ismini verelim
alter table isciler add constraint chech_maas check(maas>=3000) 
insert into  isciler values(45618062,' Veliye Sahin', 'Ankara', 2500, 'Dyson');
--maas>=3000 oldugu icin kaydetmiyor.


--SORU5: isciler tablosundaki check_maas kısıtlamasını ???????????????????????????
--2000den az maas girilemeyecek seklinde degistiriniz.
alter table isciler drop constraint check_maas,
add constraint check_maas check(maas>=2000);
insert into isciler values(45718060,'Vahide Yilmaz', 'Antalya', 2500, 'Siemens');--????????????


-- kısıtlamada bir guncelleme yapmak istiyorsak önce eski kısıtamayı drop yapıp
--daha sonra aynı isimli kısıtlamayı guncel halıyle tekrar eklememiz gerekir
alter table isciler add unique(isim);--isciler_isim_key


--SORU6: isciler tablosunun isim sutununa unique constrainti ekleyin, 
--constraint eklemek için 2  yol var:syntax
--alter table + tabloadı + add constraint + cons.adi(ozel) + cons turu(sutun/kısıtlama tanımı)
--alter table + tabloadı + add + cons turu(sutun/kısıtlama tanımı)
INSERT INTO isciler VALUES(450715092, 'Ayse Sahin', 'Ankara', 6500, 'Bosch');


--SORU7: isciler tablosundaki unique kısıtlamasını kaldırın(drop)
alter table isciler drop constraint isciler_isim_key;


--SORU8: isciler tablosundaki tum verileri silin not: ddl komutlarını kullanın
truncate table isciler;
--truncate komutu where ile kullanılmaz, delete komutu where ile kullanılabiliyordu
--delete dml komutudur- veri ile ilgilenir - where ile kullanılabilir
--truncate ddl komutudur - tablo ile ilgilenir - where ile kullanılamaz

--SORU9: isciler tablosunu silin
drop table isciler;

















