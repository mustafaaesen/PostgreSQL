-- ==========================================================
-- KONU: SELECT Temelleri
-- AÇIKLAMA: Tablodan veri çekme, sütun seçimi, alias kullanımı
-- ==========================================================

--1)Tüm Sütunları Listeleme
select * from musteri --tüm veritabanı bilgisi

--2) id ad soyad bilgilerine göre müsteri 
select id,ad,soyad from musteribilgileri

--3 Şehir bilgileri
select sehir from musteri 

--4 Ad Bilgileri
select ad from musteri 

--5 WHERE Kullanımı

select * from musteri where ad='Mehmet'

--6 WHERE and  kullanımı
select * from musteri where ad='Mustafa' and sehir='ANKARA'

--7 WHERE ve or kullanımı

select * from musteri where ad='Metehan' or sehir='KONYA'


--8 WHERE ile şartlı sorgular

select * from musteri where sehir='BURSA' or tutar>2000

select * from musteri where tutar>3000 or tutar<500

select * from musteri where sehir='KONYA' and tutar<2000

--9 Between

select * from musteri where tutar between 50 and 2000

--10 IN çoklu sorgu(or gibi kullanılabilir)

select * from musteri where sehir in('ANKARA','KONYA','BURSA')

--11 ORDER BY(asc artana göre desc azalan göre sıralar)

select * from musteri order by tutar desc

select * from musteri order by tutar asc

--12 LIMIT(verilen ilk kaydı getirir)

select * from musteri limit 4