--LIKE NOT LIKE

--1 LIKE OPERATÖRÜ

--içerisinde aranan öbeğin olduğu kayıtları getiren sorgudu

select * from musteri where ad like '%a%' --adında a geçen kayıtlar
--a yerine ne yazılırsa onu arar

select * from musteri where soyad like '%E%'

--sağındaki % kalkasrsa onunla biten solundaki kalkarsa onunla başlayanları arar

select * from musteri where sehir like '%A'

select * from musteri where ad like 'M%'

--2 NOT LIKE OPERATÖRÜ

-- Like operatörünün olumsuzudur verilen paremte olmayanları arar

select * from musteri where ad not like'%a%'



--3 ILIKE OPERATÖRÜ

-- like opratörü gibi içinde geçeni arar fakat büyük küçk harf 
-- hassasiyeti gözetmeden arar

select * from musteri where sehir ilike '%ko%'

select * from musteri where ad ilike '%m%'

--4 NOT ILIKE OPERATÖRÜ

--not like operaötür gibi olumsuzu geçmeyeni arar fakat büyük küçük 
--harf hassasiyeti gözetmeden arar

select * from musteri where sehir not ilike '%an%'

select * from musteri where soyad not ilike '%a%'

