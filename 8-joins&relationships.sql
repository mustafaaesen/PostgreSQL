--1)Birleştirmeler ve relations
--2)INNER JOIN
--3)LEFT JOIN
--4)RIGHT JOIN
--5)FULL JOIN
--6)CROSS JOIN
--7)BONUS


--1)İlişki kurma ve ilişkili tablolar
--Üniversite veritabanında bölüm ve fakülte tablolarında foreign key atamaları yapıldıktan sonra
--(bölümün fakültesi id ile ilişkisel atanması için) veri girişleri kontrol aşasından itibaren başlayabilir

select *from bolum where bolumfak=(select id from fakulte where ad='MÜHENDİSLİK FAKÜLTESİ')
--mühendislik fakültesindeki bölümleri getiren sorgu


--2)INNER JOIN
--İki tablodaki değerlerin kesişimini bulur (ortak değerler)

select ad, count(*) from bolum inner join fakulte on bolum.bolumfak=fakulte.id group by ad
--Her fakültedeki bölüm sayısını dönen sorgu
--bölümlerin fakülteleri foreign key değerli olduğu için fakultedki id ile o değeri bolumde inner join ile
--ortak olanları alıp fakülte adına göre gruplar


select fakulte.ad as fakulte_sayisi , count(bolum.bolumid) as bolum_sayisi from fakulte join bolum on
fakulte.id=bolum.bolumfak group by fakulte.ad order by bolum_sayisi desc limit 1
-- en fazla bölüme sahip fakültenin bilgileri getiren sorgu

--fakulte adını bolum sayısını alıp join ile id ve bolum sayılarını atayıp bolum sayısı bilgisine sıralyıp
--en yüksek değeri gösterme mantığına dayalıdır

--3)LEFT JOİN

--Sol taraftaki tüm değerleri getiriken sağ taraftan ise sadece sol ile ilişkili değerleri getirir
--solda olup sağda olmayanlara ise null ataması yapar

select bolumid,bolumad,ad from bolum left join fakulte on bolum.bolumfak=fakulte.id
--bolum id bölümad ve fakülte değerlerini left join ile getiren sorgu
--iç içe sorguda id yi bulup sonra onu bolum tablosunda aramanın alternatifi denilebilir
--ad bilgisini left join ile fakulte arayıp bolumfak değerini fakulteid den alıp doldurur

--Örneğin:
select bolumid,bolumad,ad from fakulte left join  bolum on fakulte.id=bolum.bolumfak
-- sorguda bolum fakulte değerlerinin yerleri değişince yani fakülteye göre arama yapınca
--Herhangi bir bölümü olmayan fakülteleri de getirir ama bölüm olmadığı için null ataması yapar

--4)RIGHT JOIN
--sağ taraftaki tüm değelreri getiri solda ise sadece sağ ile ilişkili olan değerleri getirir
--sağda olup solda olmayan durumda olan değerlere null ataması yapar.

select id,ad,bolumad from fakulte right join bolum on fakulte.id=bolum.bolumfak
--aynı sorguyu sağdaki değere dayalı arar ve geri döner

select id,ad,bolumad from bolum right join fakulte on bolum.bolumfak=fakulte.id
-- sorguda sağ tarafta fakulte olursa ve bolume göre araması yapılırsa tamamını getirir
--ilişkisi olmayanlara yani bölümü olmayan fakültelere null atar

--5)FULL JOIN

--Herhangi bir kısıtlama olmaksızın iki tablodaki tüm değerleri getirir
--hangi noktada ilişkiis olmayan değer varsa oraya null ataması yapar.

select id,ad,bolumad from bolum full join fakulte on bolum.bolumfak=fakulte.id
--fakulete tablosuna göre bolum tablosuyla birlikte full join sorgusu

--6)CROSS JOIN

--Çapraz birleştirme işlevini görür. İki tablodaki değerleri birleştirme işlemini yapar
--Birleştirme sonucunda iki tablonun satırlarının çarpımı kadar değer oluşur

select bolumad,ad from bolum cross join fakulte
--her kaydı her kayda eşleştirme yapar

select*from bolum--kontrol için sayı->13
select*from fakulte--kontrol için sayı->7  13x7=91 kayıt


--7)BONUS
--Bonus ve ileri sorgular

select id,ad from fakulte left join bolum on fakulte.id=bolum.bolumfak where bolum.bolumid is null
--left join bölüm kaydı olmayan fakülteleri listeleme

select ad , count(bolum.bolumid) as bolum_sayisi from fakulte join bolum on fakulte.id=bolum.bolumfak
group by fakulte.ad having count(bolumid)>2
--bolum sayısı 2 den fazla olan fakülteleri dönen sorgu join,count vehaving ortak kuallnım





