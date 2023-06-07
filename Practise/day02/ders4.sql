CREATE TABLE memurlar
(
memur_id int primary key,
memur_isim VARCHAR(50),
memur_maas int  
);

INSERT INTO memurlar VALUES(101, 'Ali Can', 12000);
INSERT INTO memurlar VALUES(102, 'Veli Han', 2000);
INSERT INTO memurlar VALUES(103, 'Ayse Kan', 7000);
INSERT INTO memurlar VALUES(104, 'Melek Tan', 8500);

--Veli Han'ın maas değerini en yüksek maas değerine esitleyin
update memurlar set memur_maas =(select max(memur_maas) from memurlar)where memur_isim = 'Veli Han';
select * from memurlar;


--Ali Can'ın maas değerini en düşük maas değerinin 1.5 katına esitleyin
update memurlar set memur_maas =(select min(memur_maas)*1.5 from memurlar) where memur_isim='Ali Can';
--select min(memur_maas)*1.5 from memurlar;


--Melek Tanın maasını Ayse Kan ve Veli Hanın maasları toplamına esıtleyın
update memurlar set memur_maas = (select sum(memur_maas) from memurlar where memur_isim in('Ayse Kan','Veli Han'))where memur_isim ='Melek Tan';
--ayse ve velinin maaslerı top veren sorgu
select sum(memur_maas) from memurlar where memur_isim in('Ayse Kan','Veli Han');
select sum(memur_maas) from memurlar 
where memur_isim='Ayse Kan' or memur_isim='Veli Han'


--Ortalama maas değerinden düşük olan maas değerlerini 1000 artırın.
update memurlar set memur_maas = memur_maas+1000 where memur_maas<(select avg(memur_maas) from memurlar);
select * from memurlar;
--ortalama maası veren sorgu
--select avg(memur_maas) from memurlar --12125


--Ortalama maas değerinden düşük maas değerlerine ortalama maas değeri atayın.
update memurlar set memur_maas =(select avg(memur_maas) from memurlar) where memur_maas<(select avg(memur_maas) from memurlar);

--ortalama maası veren sorgu
select avg(memur_maas) from memurlar;--12875














