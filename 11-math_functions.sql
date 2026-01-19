--MATH FUNCTIONS(Matematiksel Fonksiyonlar)

--1) ABS
--2)CEIL
--3)FLOOR
--4)PI
--5)POWER
--6)RANDOM
--7)ROUND
--8)SIGN
--9)SQRT
--10)LOG
--11)MOD
--12)TRUNC


--1)ABS
--Mutlak değer veren fonksiyondur

select abs(-20)

--2)CEIL
--Parametre olarak aldığı ondalıklı sayıyı bir üst tam sayıya çevirir.

select ceil(4.06)

--3)FLOOR
--Ceilin tersi işlem yapar ve aldığı ondalıklı sayıyı bir alt tam sayıya yuvarlar

select floor(4.99)

--4)PI
--Pi sayısının değerini verir

select pi()

--5)POWER
--Aldığı iki parametreden ilk sayının ikinci parametredeki dereceden kuvvetini alır

select power(3,4)

--6)RANDOM
--Random sayı üretecidir.(0 ile 1 arasında)

select random()

--7)ROUND
--Ondalıklı sayının aldığı ikinci paramtredeki basamağından itibaren yuvarlama işlemi yapar

select round(20.1923456,3)

--SIGN
--İşaret döndürgecidir. Aldığı parametredeki sayı negatifse -1 pozitifse 1
--0 ise 0 değeri döner

select sign(-20.21)

--SQRT
--Karakük alma fonksiyonudur

select sqrt(729)

--10)LOG
--Logaritma alma fonksiyonudur.

select log(75)

--11)MOD
--Aldığı iki paramtreden ilkinin ikinciye göre modunu alır

select mod(20,7)

--12)TRUNC
--Aldığı ondalıklı sayının virgülden sonraki basamağını ikinci parametreden itibaren keser
--(yuvarlama yapmaz)

select trunc(25.896596,4)