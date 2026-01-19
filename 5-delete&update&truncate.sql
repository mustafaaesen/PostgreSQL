-- DELETE-UPDATE-TRUNCATE


--1 Delete Komutu

--veritabanından kayıt silme amaçlı kullanılan fonksiyondur

--DİKKAT: WHERE yazmazsan TÜM tabloyu siler!
DELETE FROM musteri;  -- tüm kayıtlar silinir


delete from musteri where id=10--idsi 10 olan kayıt silindi

select * from musteri

--3 Truncate Komutu
truncate table musteri -- tabloyu silmede kullanılır delete e göre daha hızlıdır


--3 Update Komutu

--Veritabnında güncelleme işlemlerini gerçekleştiren komuttur

update musteri set tutar=4500 where id=4--idsi 4 olan kaydın tutarını güncelleme
select * from musteri

update musteri set tutar = tutar * 1.1;   -- tüm müşterilerin tutarını %10 artır
