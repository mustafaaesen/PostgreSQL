--SUBQUERIES Altsorgular

--1)Alt Sorgu Mantığı
--2)IN&NOT IN
--3)EXISTS&NOT ESXISTS
--4)ANY&ALL
--5)Bonus

--1)Sorgulanan değerin başka özelliklerine erişebilmek için kullanılırlar


select * from musteri where tutar=(select max(tutar) from musteri)
--en yüksek tutar bilgisnin olduğu kişileri getirir

select * from musteri where tutar=(select max(tutar) from musteri where sehir='ANKARA')and sehir='ANKARA'
--belirli bir şehre özel en yüksek tutar sahibnin bilgilerini veren sorgu
--Eğer sadece içerideki şehir şartı yazılırsa o şehirdeki en yüksek tutar bilgisini alır
--ve veritabanında aynı değere sahip tüm kişilerin bilgilerini verir
--Sadece dışarıdaki şehir yazılırsa içeride bulduğu değer sadece o şehre ait olmayabileceği için boş dönebilir


--İLİŞKİLİ
--Müşterilerin meslekleri meslek adında bir veritabanında olabilir ve müşteri tablosunda idlerine
--göre doldurulmuş olabilir

select * from musteri where meslek=(select id from meslek where ad='Mühendis')
--müşteri tablosundan mesleğe göre sorgu yapabilmek için
--önce o mesleğin idsine göre adını meselek tablsoundan öğrenip o şekilde
--müsteri tablosunda sorgulamak gerekir




select * from musteri where sehir='ANKARA' and meslek=(select id from meslek where ad='Polis')
--Ankaradaki mesleği polis olan msuteri kaydı



--2)IN/NOT IN

--2.1)IN alt sorgudan dönen birden fazla değeri dış sorguda arayabilmek için kullanılır
select * from musteri where sehir in('ANKARA','ÇANAKKALE')
--Ankara ve çanakkaledeki müşterilerin bilgileri

select * from musteri where meslek in (select id from meslek where ad in('Mühendis','Sağlık'))
--mesleği mühendis ve sağlık olan kişilerin bilgileri


--2.2)NOT IN in tersi mantıkla çalışır ve verilen parametre olmayan sonuçları döndürür

select * from musteri where meslek not in(select id from meslek where ad in('Akademisyen','Müdür'))
--mesleği akademisyen veye müdür olmayan kişilerin bilgileri

--3)EXISTS/NOT EXISTS

--3.1)EXISTS
--Verilen özelliğe sahip en az bir kayıt var mı? sorsunun cevabını döner

select * from musteri m where exists(select 1 from musteri x where x.sehir=m.sehir and x.id<>m.id)
--birden fazla kullanıcı bulunan şehirlerdeki diğer kullancııların bilgilerini getiren sorgu

--3.2)NOT EXISTS
--mantık olan tersinir çalışır olan kaydın tek olup olmadığını sorgulama gibi

select * from musteri m where not exists(select 1 from musteri x where x.sehir=m.sehir and x.id<>m.id)
--tek kişinin bulunduğu şehirler

--4)ANY/ALL
--genel olarak bir değere karşı büyüklük küçüklük kıyaslaması yapılırken kullanılırlar bunlardan;

--4.1)ANY
--herhangi bir değere karşı kıstas ararken;

select * from musteri where tutar<any(select max(tutar) from musteri group by sehir)
--herhangi bir şehirdeki en yüksek tutardan düşük tutarlı olan kişilerin bilgileri

--4.2)ALL
--al ise bu kıstası tamamına karşı arar.

select * from musteri where tutar < all(select max(tutar) from musteri group by sehir)
-- tüm şehirlerdeki en yüksek tutardan düşük tutara sahip kişilerin bilgileri

--5)Bonus
--Farklılık katabilen bonus sorgular

select sehir,ortalama from(select sehir, avg(tutar) as ortalama from musteri group by sehir) as sehir_ortalama where ortalama>4500
--her şehrin ortalamsını bulup 4500 yüksek olan şehileri yazdırma

update musteri set tutar=tutar+tutar*0.1 where meslek=(select id from meslek where ad='Akademisyen')
--mesleği akademisyen olanların tutarını %10 arttıran sorgu