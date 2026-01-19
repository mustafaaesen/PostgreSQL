--DEĞİŞKENLER&KARAR YAPILARI

--1)DEĞİŞKEN TANIMI
--2)DEĞİŞKENLER İLE ARİTMETİK İŞLEMLER
--3)TABLODAN DEĞİŞKENE ATAMA
--4)IF-ELSE
--5)CASE
--6)WHILE&LOOP
--7) PF_SLEEP

--1)DEĞİŞKEN TANIMI
--Postgresql de do begin end aralarında değişken tanımları yapılır
--do ile begin arasında değer atamaları yapılır
--begin ile end arasında ise aritmetik işlemler veya ekrana yazdırma işlemleri gerçekleştirilir


do $$

declare -- declare komutu ile dğeişkenler atanır
sayi integer:=25;
sayi1 integer :=15;

begin

raise notice '1. Sayi % dir, 2. Sayi % dir.',sayi,sayi1;
--ekrana yazdırma için raise notice komutundan yararlanılır

end $$

--Değişken atama adımları

-------------------------------------------------------------------------------------

--2)DEĞİŞKENLER İLE ARİTMETİK İŞLEMLER

--Atanan değişkenlerle begin ile end arasında aritmetik işlemler yapılabilir


do $$

declare 

sayi1 int:=40;   -- sayıların ve işlemlerin değişkenlerinin tanımı
sayi2 int:=8;
toplam int;
fark int;
carpim int;
bolum int;

begin

--aritmetik işlemleri yapılması ve ekrana yazdırma

toplam:=sayi1+sayi2;
fark:=sayi1-sayi2;
carpim:= sayi1*sayi2;
bolum:=sayi1/sayi2;

raise notice'1. Sayı %''dir. 2. Sayı %''dir.', sayi1, sayi2;
raise notice'--------------------------------';
raise notice'Sayıların Toplamı ---> %', toplam;
raise notice'--------------------------------';
raise notice 'Sayıların Farkı ---> %', fark;
raise notice'--------------------------------';
raise notice'Sayıların Çarpımı ---> %', carpim;
raise notice '--------------------------------';
raise notice'Sayıların Bölümü ---> %', bolum;
raise notice '--------------------------------';

end $$

--Değişkenlerle aritmetik işlemler ve ekrana yazdırma

---------------------------------------------------------------------------------------

--3)TABLODAN DEĞİŞKENE ATAMA

--Tablodaki değerleri değişkene atama işlemlerini kapsar.

do $$
declare 

toplam int; --değişken tanımı

begin 

toplam:=(select count(*) from dersler );--sorgu ile ders sayısnın değişkene atanması
raise notice 'Toplam Ders Sayısı %',toplam;--ekrana yazdırılması
end $$
---------------------------------------------------------------------------------


--4)IF-ELSE
--verilen değerlerde şartları sağlayıp sağlayamama durumuna göre hareket etdebilmeyi sağlar


do $$

declare
sinav1 int:=75;
sinav2 int:=80;
son_not numeric;--double karşılığı

begin

son_not=(70*0.4)+(80*0.6);

raise notice 'Öğrencinin geçme notu %',son_not;

if son_not>=60 then
raise notice 'Öğrenci Başarılı';
else
raise notice 'Öğrenci Başarısız';

end if;

end $$

--öğrenci notunu hesaplayıp geçme kalma durumu hakkında bilgi veren yapı


do $$

declare 

sayi int:=30;

begin

if sayi%2=0 then

raise notice 'Girlen Sayi Çifttir';

else

raise notice 'Girlen Sayi Tektir';

end if ;

end $$

--Sayının tek çiftliği hakkında bilgi veren yapı


do $$

declare 

sayac int;


begin

sayac:= (select count(*) from dersler where kontenjan>150);

if sayac>=1 then

raise notice '150 den fazla kontenkanı olan dersler mevcut % adet ders var',sayac;

else

raise notice '150 den fazla kontenjanı olan ders mevcut değil';

end if ;

end $$

----------------------------------------------------------------------------------------

--5)CASE

--birden fazla ve blirli seçeneklerin olduğu durumlarda kullanılır switch case mantığında


select dersad,bolumid,

case

when bolumid=1
	then 'Bilgisiyar Mühendisliği'
when bolumid=2
	then 'İnşaat Mühendisliği'
when bolumid=3
	then 'Mekatronik Mühendisliği'
when bolumid=4
	then 'Türkçe Öğretmenliği'

end as bolum_adi

order by dersad
--bolum adlarında yazan freign keylere göre bölüm atayan case sorgusu

----------------------------------------------------------------------------------

--6)WHILE&LOOP

--normal while döngüsü kullanımıdır

do $$

declare sayac int:=0;

begin 
	while sayac<=10
	loop
	
	raise notice 'Sayac Değeri %',sayac;
	sayac:=sayac+1;
	
	end loop;

end $$

-- while döngüsü kullanımı


do $$

declare sayac int:=0;

begin 

	loop 
		exit when sayac=5;
		raise notice 'Sayaç Daha 5 Olmadı sayac->%',sayac;
		sayac:=sayac+1;
	end loop;
raise notice 'Saayac şimdi 5 oldu sayac-->%',sayac;
end $$
----loop ile döngü kullanımı

-----------------------------------------------------------------------------

--7)PG_SLEEP

--İstenilen sorguyu verilen süre saniye çalıştırır
--Yedekleme işlemlerinde oldukça sık kullanılır

select pg_sleep(3);
select * from bolum  --çeşitli zamanlama balzarında bekletilerek çalıştırılabilir defaultu saniyedir

