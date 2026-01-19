--VIEWS

--Belirli tabloları tek tabloymuş gibi sanal tablolarda bir araya getirerek
--uzun ve karmaşık sorguları kolaylaştırır
--1)VIEW OLUŞTURMA
--2)GENİŞ KAPSAMLI VIEW
--3)VIEW GÜNCELLEME
--4)DROP VIEW
--5)VIEW ÜZERİNDEN DB MANİPÜLASYONU




--1)VIEW OLUŞTURMA
select bolumid,bolumad,ad from bolum inner join fakulte on bolum.bolumfak=fakulte.id

--bu şekilde ilişkili tablolarda sorgulama yapabiliriz. Ama daha kalabalık tabloların olduğu 
--e-ticaret siteleri gibi alanlarda bu durum sorgunun daha uzun ve karmaşık olmasına sebebiyet verir
--bunu şu şekilde view haline getirip tabloymuş gibi hareket edebiliriz

create view  View1 as select bolumid,bolumad,ad from bolum inner join fakulte on bolum.bolumfak=fakulte.id
--view oluşturma

select * from view1--görüntüleme

select * from dersler


--2)GENİŞ KAPSAMLI VIEW
--ilişkili tabloalrda işin içine dersleri de dahil edince sonuç şöyle olur

select bolum.bolumid,bolumad,ad,dersad from bolum inner join fakulte on bolum.bolumfak=fakulte.id
inner join dersler on bolum.bolumid=dersler.bolumid
--bölümlerdeki dersler ve fakülteleri gösteren sorgu

--bunu view ile sanal şekilde tek tablo haline getirebiliriz

create view Viewdersler as select bolum.bolumid,bolumad,ad,dersad from bolum inner join fakulte on bolum.bolumfak=fakulte.id
inner join dersler on bolum.bolumid=dersler.bolumid
--sorguyu view olarak oluşturma

select * from Viewdersler


--3)VIEW GÜNCELLEME

--yukarıda oluşturduğumuz viewı güncelleyerek başka özellikler eklemek istersek 

--derslerin kontenjanlarını ekleme 

drop view if exists Viewdersler;
create view  Viewdersler as  select bolum.bolumid,bolumad,ad,dersad,dersler.kontenjan from bolum inner join fakulte on bolum.bolumfak=fakulte.id
inner join dersler on bolum.bolumid=dersler.bolumid
--viewa ders kontenjenlarını ekleme

select * from Viewdersler


--4)DROP VIEW
--silinecek view
create view viewders as select * from dersler

drop view viewders--silme


--5)VIEW ÜZERİNDEN DB MANİPÜLASYONU

--viewlar üzerinden veri ekleme işlemleri gerçekleştirilebilir

--ders listesi viewı

create view view3 as select * from dersler

select * from view3

insert into view3(id,dersad,kontenjan,bolumid) values (19,'Pediatri',300,12)
--yeni ders ekleme

select * from dersler

