--PROSEDÜRLER&FONKSİYONLAR

--1)PROSEDÜRLER(procedores)
--2)FONKSİYONLAR(functions)


--1)PROSEDÜRLER(prodecures)
--Veritabanında belirli bir işi (ekleme,silme,güncelleme vb.) otomatikleştiren,
--parametre alan ancak sonuç döndürmeyen saklı komutlardır.

--1.1)Prosedür Tanımlama

create procedure deneme()
language plpgsql
as $$
begin
raise notice 'PostgreSQL Prosedürler';
end $$

--1.2)Prosedür Kullanımı
call deneme() 

--1.3)Prosedür Güncelleme
--create ifadesinden sonra or replace tanımlanıp güncellemeler yapıldıktan sonra
--komut çalışıtırlınca prosedür güncellenir

create or replace procedure deneme()
language plpgsql
as $$
begin
raise notice 'PostgreSQL Prosedürler';
raise notice 'Prosedür Güncellendi';--güncellemede eklenen kısım
end $$

call deneme() --kontrol

--1.4)Parametreli Prosedürler
--Prosedürleri parametreli kullanarak belirli işleri  seri hale getirebiliriz.

--fakulte tablosuna veri ekleyen prosedür
create procedure fakulte_ekle(x integer, y text )
language plpgsql
as $$
begin
insert into fakulte(id,ad) values(x,y);--parametrelerle sorgu yazımı
end $$

--kullanımı
call fakulte_ekle(8,'SOSYAL ve BEŞERİ BİLİMLER FAKÜLTESİ')

select * from fakulte--kontrol

---------------------------------------------------------------------------------

--2)FONKSİYONLAR

--Çsşitli işlemleri otomatikleştiren prosedürler gibi çalışan farklı olarak geriye değer döndüren
--görevine ve yapısına göre özel tasarlanan komutlardır.


--2.1 Fonksiyon Tanımlama

create function toplam(a int ,b int)--fonksiyon oluşturma ve parametreleri
returns int--geriye döndürdüğü veri tipi
language plpgsql-- kullancağı db dil
as $$
declare
	sonuc integer;--sonuç atancak değişken tanımı
begin --gövde ve işlemlerin yapıldığı yer
	sonuc:=a+b;
	
	return sonuc;
end $$

--2.2)Fonkisyon Kullanımı
select toplam(30,23)

--2.3)Derslerdeki kontenjanları %10 arttıran fonksiyon
create function kontenjanartir(kon int)
returns float
language plpgsql
as $$
begin
kon:=kon+kon*0.1;
return kon;
end $$

--kullanımı
select * from dersler

select id,dersad,kontenjan,bolumid, kontenjanartir(kontenjan) from dersler

--2.4)Tablolarda Fonksiyon Kullanımı



create function bolumgetir(ara_bolum varchar)
returns table(    --geriye tablo döndüreceği için değerleri tablo  ile belirtilmeli
	idsutun int,
	bolumad varchar
)
language plpgsql
as $$
begin

	return query select bolum.bolumid,bolum.bolumad from bolum where bolum.bolumad like '%'|| ara_bolum || '%';
end $$
--bolum adını parametre olarak alıp sonuç döndüren fonksiyon

--kullanım



select * from bolumgetir('%Müh%')--kulalnım
