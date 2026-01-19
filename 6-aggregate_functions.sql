--AGGRETE FUNCTIONS
--1)Count
--2)Sum
--3)AVG
--4)Min&Max
--5)Group By
--6)Having
--7)Bonus

--1) Count Fonksiyonu

--Veri sayma amaçlı kullanılır

select count(*) from musteri-- tablodaki kayıt sayısını ve veri tipini gtirir

select count(*) from musteri where sehir='KONYA'-- şehri koya olan kayıt sayısı

select count(*) from musteri where sehir='KONYA' and tutar>1000
--şehri konya olan ve tutarı 1000 den fazla olan kayıt sayısı

--2) Sum Fonksiyonu

--sütunlardaki int değerleri toplamını veren fonksiyon

select sum(tutar) from musteri-- tutarların toplamını verir

select sum(tutar) from musteri where sehir='KONYA'
--bir şehre göre müşterilerin tutar toplamı

select sum(tutar) from musteri where sehir!='BURSA'
--bir şehrin dışındaki şehirde bulunan müşterilerin tutar toplamı

--3) AVG Fonksiyonu

--Belilrli sütundaki int değerlerin ortalamsını veren fonksiyondur

select avg(tutar) from musteri
-- tablodaki ortalama

select avg(tutar) from musteri where sehir='KONYA'
--belirli şehirdeki ortalamayı hesaplar

--4)Min&Max Fonksiyonları
--minimum ve maximum değerleri getiren fonksiyonlardır

select min(tutar) from musteri--minimum değer
select max(tutar) from musteri --maximum değer

select max(tutar) - min(tutar) from musteri --farkları

select max(tutar) from musteri where sehir='KONYA'
--belirli şarta göre max kullanımı


--5) Group By Fonksiyonu

--Diğer yardımcı fonksiyonlarla birlikte belirli bir özelliğe göre 
--gruplandırma yapabilmeyi sağlar

select sehir, count(*) as kisi from musteri group by sehir
--şehirlerdeki kişi sayısısna göre gruplama

select sehir, sum(tutar) from musteri group by sehir
--şehirlere göre toplam tutarlar

select sehir, avg(tutar) from musteri group by sehir
--şehirlere göre ortalama tutarlar

--6) Having Fonksiyonu
--belirli bir özelliği sağlayan şartlardaki sorguları yazmada yardımcı olur

select sehir, count(*) from musteri group by sehir having count(*)>2
--2 den fazla kaydı olan şehilreri listeler

select sehir, avg(tutar) from musteri group by sehir having avg(tutar)>4000
--ortalaması 1000 den fazla olan şehirler


--7)Bonus

select count(distinct sehir) from musteri
--kaç farklı şehir olduğunu döner

select sehir , sum(tutar) as toplam_tutar from musteri group by sehir order by toplam_tutar desc
--toplam tutarları büyükten küçüğe doğru sıralayan sorgu

select sehir, count(*) as kisi_sayisi, avg(tutar) as ortalama_tutar from musteri group by sehir
having count(*)>2 and avg(tutar)>3000
-- şehirlere göre kişi sayısı en az 2 ve ortalaması 3000 den büyük olan şehiler