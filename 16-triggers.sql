---TRIGGERS

--1)TRIGGERS




--1)TRIGGERS
--Bir tablodan CRUD işlemlerinden sonra meydana gelen değişikliklerde diğer tabloları da etkileyecek 
--değişikliklerin başlatıcılarıdır.

--toplam fakülte sayısını toplamfakulte tablosuna atayalım
select count(*) from fakulte
insert into toplamfakulte(sayi) values(8)
select * from toplamfakulte


--fakulte tablosuna yeni fakülte eklendiğinde  toplamfakulte  tablsounda bulunan sayıyı otomatik arttırma 
--işlemi için trigger tanımlanmaladır.

--Trigger için önce fonksiyonu tanımlanır

create or replace function fakulteartir()
returns trigger --trigger değeri dönecek
as $$
begin 
update toplamfakulte set sayi=sayi+1;
return new;
end $$
language plpgsql;

--Trigger oluşturulur

create trigger fakulteartirtrig--tanımı
after insert --çalışacağı işlem (tabloya değer eklenince)
on fakulte -- işlemin gerçekleşeceği tablo
for each row -- satır bilgisi
execute procedure fakulteartir();--hangi işlemi yapacağı


--kullanımı
--fakulte tablosunda değer eklenince fakultetoplam tablosundaki sayi otomatik artacak

insert into fakulte(id,ad) values(9,'İKTİSADİ İDARİ BİLİMLER FAKÜLTESİ')
select * from fakulte
select * from toplamfakulte--kontrol
