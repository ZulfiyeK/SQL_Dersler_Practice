-- $ ==> ozel karakterler oncesinde tirnak yerine kullanilir.
--**** Degisken Tanimlama************
do $$ -- isimsiz bloklarin basina yazilir ve anonim blok denir.
declare
	counter integer :=1;				-- counter adinda bir degisken olusturduk. default degeri 1 atadik.
	first_name varchar(50):='Bahadir';
	last_name varchar(50):='Gunuvar';
	payment numeric(4,2):= 20.5;		-- 20.50==> numeric(precision-20,scale-50)
begin									--degiskenleri tanimladiktan sonra begin kisminda yapmak istediklerimizi gerceklestiriyoruz(if gibi)
	
	--raise notice'isim: % Soyisim %', first_name, last_name;-- sout gibi output veriri.	
	--Mehmet Fatif 20.5usd odeme aldi.
	
	raise notice 'Isim: % Soyisim: % payment: %' , first_name, last_name, payment;
end $$;



/*
	Task 1 : değişkenler oluşturarak ekrana " Ahmet ve Mehmet beyler 120 tl ye bilet aldılar. "
	cümlesini ekrana yazdırınız.
*/


do $$
declare
	counter integer := 1;
	first_person varchar(20):= 'Ahmet';
	Second_person varchar(30):= 'Mehmet';
	payment numeric(3):= 120;-- 3 demek ==> 3 basamakli bir rakam girebilirsin demek.
begin
	raise notice '% ve % beyler % Tl ye bilet aldilar.', first_person, Second_person, payment;
end $$;

-- % ler yer tutucu oluyor, deklare icinde belirttigimiz degiskenlerin nereye gelmesini istiyorsak oraya % koyuyoruz.


--********************* Bekletme Komutu *****************************

do $$
declare
	created_at time := now(); -- time ==> data type, now() ==> olusturuldugu zaman.
begin
	raise notice '%', created_at;--NOTICE:  16:32:44.406098
	perform pg_sleep(5);--bu islemi icindeki saniye kadar mola verdir, 5 dk bekle, 10 sn bekle gibi.perform= hazir metodu uygula demek.
	raise notice '%', created_at;--NOTICE:  16:32:44.406098---ayni zamani verdi cunku yeni bir create yapmadik.
end $$;


--****************** Tablodan Data Tipi Kopyalama *********************

do $$
declare 
    f_title film.title%type; --text  --text yerine film.title%type data tipini dinamik olarak almak icin yazdik
    
    sure film.length%type;  --integer   --burdaki sure ismini biz yazdik onun yerine istedigimiz bir isim verebiliriz
begin
    -- 1 ID'li filmin ismini getirelim
    SELECT title 
    FROM film 
    INTO f_title  --Uncharted
    WHERE id =1;    -- id'si 1 olan title'i f_title variable'ina attik.
    
    raise notice '%', f_title;
    
    SELECT length 
    FROM film
    INTO sure
    WHERE id=1; --id si 1 olan filmin suresini bize verir
    
    raise notice 'Film Suresi: %', sure;
end $$;
    
    
--****************************************  14.05.2023  ************************************************************
--=========================================    PAZAR   ============================================================
    
-- ******** ROW TYPE ********
-- Rowtype: Seçili row'un tüm bilgilerini depolayabilmek için kullanılır.

do $$
declare
	selected_actor actor%rowtype;
begin
	SELECT * FROM actor
	INTO selected_actor
	WHERE id=1;
	
	raise notice '% %', selected_actor.first_name,selected_actor.last_name;
end $$;    
    
    
-- ************ RECORD TYPE **************** 
--tum datalari alabiliriz,ama asil amaci bu degildir.


-- Film tablosundan id'si 2 olan data'nın yalnızca id, title ve type bilgisini al
--rowtype ile bütün satırdaki bilgiler gelir ancak raise notice ile istediğimiz sütunları yazdırabiliriz.

do $$
declare
	rec record;
begin
	SELECT id,title,type
	FROM film
	INTO rec
	WHERE id=2;
	
	raise notice 'ID: %, Film İsmi: %, Tür: %', rec.id, rec.title, rec.type;
end $$;
    

--- ******** İÇ İÇE BLOK YAPILARI **************

do $$
<<tepeblok>> -- tepedeki bloga isim vermis oluyoruz. 
declare-- tepedeki blok, outer blok olarak geciyor.
	counter integer := 0;
begin
	counter := counter +1;
	raise notice 'Counter Degeri: %', counter;
	declare -- inner blok baslangic
		counter integer :=0;
	begin
		counter := counter +10;
		raise notice' Inner Block, Counter Degeri : %', counter;
		raise notice' Inner Block, Counter Degeri : %', tepeblok.counter; --tepe bloktan deger cagirmaya yarar.

	end;--inner blok sonu
	raise notice 'Tepe Blok, Counter Degeri: %', counter;


end $$;--outer blok sonu



--*************************  Constant Degrler  ********************************************************

--deklare ettigimiz degerleri icerde degistirebiliriz.(constant= sabit demektir.) bir degeri constant olarak belirledigimizde o artik degismez olur.
--degismez degerleri constant larda tutariz.java daki final degerler gibi; vergi oranlari sik sik degismez, pi sayisi degismez.



-- KDV değerini sabit değer yap.
do $$
declare
	-- selling_price := net_price * 0.1;
	kdv constant numeric := 0.1; -- constant değer, sabit değer. Begin içerisinde tekrar değiştirilemez.
begin
	
	raise notice 'KDV: %', kdv;
	
	--kdv := 10;
	
end $$;


-- CONSTANT'ların değişmediğinin kanıt örneği
do $$
declare
	olusturulma constant integer := 17;
begin
	raise notice 'Olusturulma zamanı: %', olusturulma;
	
	--olusturulma := 18;
	
	raise notice 'Yeni Olusturulma zamanı: %', olusturulma;
	
end $$;


--********************************** Control Yapilari ************************************

--syntax
/*

 IF FOUND THEN 
raise notice ' islemler'
 islemler
 END IF;
 
 
 -- EGER...... ise .. OZAMAN islemleri yap
*/
-- TASK  1 id'li filmi bulmaya calis, bulunursa bulundu yazisini print et.
--id'yi bir veriable ile alin.
--bulunursa : foun

--if found
do $$
declare
	selected_film film%rowtype; -- Film objesi kullanılacak
	input_film_id film.id%type := 1; -- Kullanıcının girdiği id numarası
begin
	
	SELECT * FROM film
	INTO selected_film
	WHERE id=input_film_id;
 	
	-- Bulduğumuz filmin title'ını getir
	--raise notice '%', selected_film.title;
	
	if found then
		raise notice 'Bulundu: %', selected_film.title ; 
	end if;
end $$;


-- if not found
do $$
declare
	selected_film film%rowtype;
	input_film_id film.id%type:=1;
begin
	select * from film
	into selected_film
	where id =input_film_id;

if not found then
	raise notice 'Bulunamadi: %', input_film_id;
	end if;
end $$;



--********************** IF- ELSE  ***************************
/*

IF condition THEN
		işlemler;
	ELSE
		alternatif işlemler;
	END IF;
*/


--1 id'li film bulunabilirse, title bilgisini yazdir.yoksa BULUNAMADI yazdir.


do $$
declare
	selected_film film%rowtype; -- Film objesi kullanılacak
	input_film_id film.id%type := 10; -- Kullanıcının girdiği id numarası
begin
	
	SELECT * FROM film
	INTO selected_film
	WHERE id=input_film_id;
 	
	-- Bulduğumuz filmin title'ını getir
	--raise notice '%', selected_film.title;
	
	if found then
		raise notice 'Bulundu: %', selected_film.title;
	else
		raise notice 'Bulunamadı: %', input_film_id;
	end if;
end $$;



-- ******** IF - ELSE IF - ELSE
-- syntax:
/*
	IF condition THEN
		işlemler;
	ELSEIF condition_2 THEN
		işlemler;
	ELSEIF condition_3 THEN
		işlemler;
	ELSE
		işlemler;
	END IF;
-------------------------------------



	Task: 1 ID'li film bulunursa:
	
	Süresi 50 dakikanın altında ise "Kısa",
	
	50 ile 120 arasında ise "Ortalama",
	
	120 dakikadan fazla ise "Uzun"
	
	print edelim.
*/


do $$
declare
	oFilm film%rowtype;--obje film, film objesinin tum bilgilerini icinde barindiriyor.
	lenDescription varchar(50);--aciklama diye bir obje olusurduk, 
	film_id film.id%type:=1;--integer typ'i 1 dedik.
begin
	SELECT * FROM film
	INTO oFilm--id si 1 olan filmi getir ve ofilm konteynirinin icine atar
	WHERE id=film_id;
	
	if not found then--bulunamadiysa
		raise notice 'Film bulunamadı!';--bulunamadi yazdir.
	else
		if oFilm.length>0 and oFilm.length<50 then--0 dan kucuk 50 den buyukse 
			lenDescription := 'Kısa';--kisa olarak atadigim aciklamayi yazdir.
		elseif oFilm.length>50 and oFilm.length<120 then
			lenDescription := 'Ortalama';
		elseif oFilm.length>120 then
			lenDescription := 'Uzun';
		else
			lenDescription := 'Tanımlanamıyor.';
		end if;
		
		raise notice '% filminin süresi: %', oFilm.title, lenDescription;
		
	end if;
	
end $$; 
--NOTICE:  Uncharted filminin süresi: Uzun olarak cikti verir.




































