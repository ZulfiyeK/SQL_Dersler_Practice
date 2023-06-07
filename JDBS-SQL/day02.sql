select * from countries;
select country_id, country_name from countries where region_id>2;





CREATE TABLE companies(
company_id SMALLINT,
company VARCHAR(20),
number_of_employees SMALLINT
);

INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);
INSERT INTO companies VALUES(104, 'CASPER', 18000);
SELECT * FROM companies;


--//3.Örnek: "number_of_employees" değeri en düşük olan satırın tüm değerlerini çağırın.
--select * from companies where number_of_employees = 10000;--hard cod olacagi icin 10000' de kodlarla ifade ederek dinamik kod elde etmem gerek.
select * from companies where number_of_employees =(select min(number_of_employees)from companies);



--//1. Örnek: companies tablosundan en yüksek ikinci number_of_employees değeri olan company ve number_of_employees değerlerini çağırın.
select company,number_of_employees from companies order by number_of_employees desc offset 1 limit 2;
--2. yol
select company,number_of_employees from companies where number_of_employees=(select max(number_of_employees) from companies where number_of_employees < (select max(number_of_employees) from companies));
-- en yuksek iki degeri getirmek istiyorum, o zaman biri max, digeri max dan kucuk max olmali. o zaman ic ice subQuery yapmak gerekir.


-- Aciklama kodu, bu kodu calistirma!!!
(select max(number_of_employees) from companies where number_of_employees < (select max(number_of_employees) from companies)
--             en yuksek ilk sayisyi verir.  	   						  <	        en yuksek sayidan kucuk en yuksek sayi



--//1. Örnek: number_of_employees değeri ortalama çalışan sayısından az olan number_of_employees değerlerini 16000 olarak UPDATE edin.
update companies set number_of_employees = 16000 where number_of_employees <(select avg(number_of_employees) as ortalama_calisan from companies);

--ortalama bulma kodu. Calistirma!!!
 select avg(number_of_employees) as ortalama_calisan from companies;

SELECT * FROM companies;-- bununla resultSet almis oluyorum.



-- //1. Örnek: Prepared statement kullanarak company adı IBM olan number_of_employees değerini 9999 olarak güncelleyin.

update companies set number_of_employees =9999 where company = 'IBM';
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

