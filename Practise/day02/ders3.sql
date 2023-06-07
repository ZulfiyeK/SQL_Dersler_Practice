CREATE TABLE manav(
isim varchar(50), 
yas int,
cinsiyet char,
sehir varchar(20),
gelir int,
urun_adi varchar(50), 
urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 32, 'E', 'Istanbul',10000, 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 30, 'K', 'Ankara', 15000, 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 35, 'E', 'Izmır', 13000, 'Elma', 2);  
INSERT INTO manav VALUES( 'Hasan', 40, 'E', 'Bolu', 14000, 'Uzum', 4);  
INSERT INTO manav VALUES( 'Ali', 35, 'E', 'Ankara', 15000, 'Armut', 1);  
INSERT INTO manav VALUES( 'Ayse', 32, 'K', 'Izmır', 14000, 'Elma', 3);  
INSERT INTO manav VALUES( 'Veli', 40, 'E', 'Istanbul', 10000, 'Uzum', 5);  
INSERT INTO manav VALUES( 'Ali', 28, 'E', 'Bolu', 11000, 'Armut', 2);  
INSERT INTO manav VALUES( 'Veli', 30, 'E', 'Istanbul', 15000, 'Elma', 3);  
INSERT INTO manav VALUES( 'Ayse', 30, 'K', 'Izmır', 12000, 'Uzum', 2);

--SORU1: manav tablosundaki max yas degerini listele
select max(yas) from manav;
--2.yol
select yas from manav order by yas desc limit 1;


--SORU2: manav tablosundaki en dusuk geliri listele
select min(gelir) from manav;

select gelir from manav order by gelir limit 1;


--SORU3: manav tablosundaki urun cesitlerinin sayısını listele -> 3 gelsin
select count(distinct urun_adi) from manav; --kac cesit dedigim icin cesit sayisini vermesi icin distinct


--SORU4: manav tablosundaki urun cesıtlerini listele
select distinct( urun_adi) from manav;
select count (distinct urun_adi) as urun_cesit from manav;

--2.yol olarak group by kullanın
select urun_adi from manav group by urun_adi;


-- SORU5: sehir'lere göre ortalama yas'ı listeleyiniz
select sehir, round(avg(yas)) as yas_ortalamasi from manav group by sehir;


--SORU6: manav tablosundaki urunleri ve o urune ait urun mıktarlarının
--toplamını listele
select urun_adi, sum(urun_miktar) from manav group by urun_adi;


-- SORU7: sehir'lere göre kaç çalışan olduğunu listeleyiniz.
select sehir, count(*) from manav group by sehir;--*==> yerine isim,cinsiyet de yazilabilir.


-- SORU8: cinsiyet'e göre yas ortalamasını listeleyiniz
select cinsiyet, round(avg(yas)) as yas_ortalama from manav group by cinsiyet;


--SORU9: satılan meyve türüne (urun_adi) göre satılan (urun_miktari )MIN ve 
--MAX urun miktarlarini, MAX urun miktarina göre sıralayarak (buyukten kucuge)
--listeyen sorguyu yazınız.
select urun_adi, min(urun_miktar) as max_urun,max(urun_miktar)as min_urun 
from manav group by urun_adi order by;



-- SORU10: Kişi ismine ve ürün adına göre (gruplayarak) satılan ürünlerin toplamını bulan
-- ve bu toplam değeri 3 ve fazlası olan kayıtları, toplam ürün miktarına göre büyükten küçüğe 
--listeleyiniz.
select urun_adi, sum(urun_miktar) as toplam_satis from manav group by isim,urun_adi
having sum(urun_miktar)>=3 order by urun_adi;

--having where gibi sartin oldugu durumlarda kullanilir
--having group by sozcugunden sonra yazilir, where once yazilir.
--having aggregate fonsiyonlari ile kullanilir, where kullanilmaz.



-- SORU11: Satılan urunleri urun_adi'na göre gruplayarak MAX ürün sayılarını sıralayarak listeleyen sorgu yazınız.
-- NOT: Sorgu sadece MAX urun_miktari MIN urun_miktari na eşit olmayan kayıtları listelemelidir.

select urun_adi, max(urun_miktar) from manav group by urun_adi 
having max(urun_miktar)!= min(urun_miktar) order by urun_adi;











