--STRING FUNCTIONS(Metinsel Fonksiyonlar)
--1)ASCII
--2)CONCAT
--3)CONCAT_WS
--4)LEFT
--5)RIGHT
--6)LENGTH
--7)REPLACE
--8)REVERSE
--9)SUBBSTRING
--10)UPPER
--11)LOWER

--1)ASCII
--Girilen karakterin ASCII kodunu verir

select ASCII('A')

--2)CONCAT
--Aldığı Parametreleri birlşetiri

select CONCAT('PostgreSQL ','çalışma ','örnekleri')

--3)CONCAT_WS
--Girilen parametrelerin arasına parantez içerisinde ilk parametreyi ekler

select CONCAT_WS('*','PostgreSQL','çalışma','örnekleri')

--4)LEFT

--Aldığı iki parametreden ilki içerisinde ikinci parametre kadar soldan karakter alır

select left('Merhaba PostgreSQL',4)

--5)RIGHT
--Left'in tersi mantıkta çalışır.Aldığı iki parametreden ilk paramtre içerisinde ikinci parametre
--kadar karakteri sağdan alır

select right('Merhaba PostgreSQL',4)

--6)LENGTH
--Gelen parametrenin karkater sayısını verir

select length('Ne Mutlu Türküm Diyene')


--7)REPLACE
--Verilen tabloda sütun, değişecek karakter ve yerine konacak karakter parametrelerini alarak 
--ilgili ifadeleri değiştirir

select id , replace(ad,'i','ı') from ders1
--ders1 tablosundaki i'leri ı yapan sorgu

--8)REVERSE
--Verilen parametredki ifadeleri tersine çevirerek yazar

select reverse(ad) from ders
--ders tablosundaki ders adlarını tersine yazan sorgu

--9)SUBSTRING

--Aldığı üç parametreden ilk parametre içerisinde ikinci paramtredeki karakterden üçünçü paramtredeki
--karaktere kadar olan ifadeyi getiri

select substring('Necmettin Erbakan Üniversitesi',10,8)

--10)UPPER

--Verilen ifadeyi tamamen büyük harflerle yazar

select upper('PostgreSql Örnekleri')

--11)LOWER

--Verilen ifadeyi tamamen küçük harflarle yazar

select lower('PostgreSql Örnekleri')