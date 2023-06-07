--once function(fonksiyon) olusturmam lazim.
--txt kendisi uzerine eklendikce alan aciyor.text olarak girersek text olarak return eder.
 --> ( x = Merhaba ) =======( || x || )--> concat yapar. iki kelimeyi birlestirir.
create or replace function selamlama(x text)  
returns text
as
$$
begin

return 'Merhaba ' || x || ', nasilsin ?';

end
$$
language plpgsql; 

select selamlama('Ali');


--end--baslangic bitis belirtiyoruz.
--$$--parantez gibi
--language plpgsql; --hangi dilde yazildiginiz belirtiyoruz(plSQL)

-- bu method degisikligi uzerine tekrar tekrar yazabiliyoruz.
create or replace function selamlama(x text)





create or replace function toplama(x  int, y int)
returns numeric
as 
$$
begin
return x+y;
end
$$
language plpgsql; -- bu kodu calistirarak execute yapiyoruz.

select toplama (6,4);-- her seferinde burdaki rakamlari degistirip calistirdigimizda yeni sonuc verecek.
--iki sayi arasinda concatination olmaz.concat Strignler icindir.








