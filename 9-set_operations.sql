--SET OPERATIONS

--1)INTERSECT
--2)EXCEPT
--3)UNION
--4)UNION ALL
--5)BONUS

--1)INTERSECT
--Kesişim işlemi gerçekleştirir.İki tabloda ortak olan verileri döner.
--karşılaştırmayı bütün özelliklerde yapar

select * from ders intersect select * from ders1

--2)EXCEPT 
--İki tablo arasındaki  farklılıkları bulan komuttur
--İlk tabloda olup ikincide olmayan değerleri geitir
select * from ders except select * from ders1


--3)UNION

--İki tabloyu tek tabloda birleştirmek için kullanılır
--Tablolar içinde gçeen her veriyi bir kez alır distinct bir işlem uygular

select *from ders union select * from ders1

--4)UNION ALL
--İki tabloyu tek tabloda birleştirmek için kullanılır
--Uniondan farklı olarak tüm verileri birlşetirir tekrar etme durumuna bakmaz.

select * from ders union all select * from ders1

--5)BONUS
--İleri sorgular ve bonus

--5.1)Union ve Union All Farkı

--------------------------------------------------------------------------------
select * from ders union select * from ders

select * from ders union all select * from ders

--union ve union all farkını aynı tablo üzerinde daha net görebiliriz
--aynı tabloda union tekrer ettiği için ikinciyi yazmaz ama union all bu tekrarı 
--kontrol etmediği için üzerine aynı tabloyu ekleyebilir
--------------------------------------------------------------------------------

--5.2)Kombinasyon
--except&union
--------------------------------------------------------------------------------

(select * from ders except select * from ders1) union (select * from ders1 except select * from ders)
--except komutu ilk tabloda olup ikincide olmayan verileri getiri ama
--tabloların yer değiştiriği iki except komutunu union ile birlikte kullandığımızda
--her iki tabloda da ortak olmayan tüm kayıtları getirir.
---------------------------------------------------------------------------------
