--DATE TIME FUNCTIONS (Tarihsel Fonksiyonlar)

--1)CURRENT_DATE
--2)CURENT_TIME
--3)AGE
--4)EXTRACT
--5)DATE_PART
--6)TO_CHAR
--7)INTERVAL

--1)CURRENT_DATE
--Mevcut tarih değerini getiri

select current_date

--2)CURRENT_TIME
--Mevcut zaman değerini getirir

select current_time

select now()--yerel saatle tarihi birlikte veirir

--3)AGE
--Parametre olarak aldığı tarihten itibaren geçen süre bilgisini verir

select age(timestamp '20.09.2018')

--Tablo İle Kullanım

select ad,tarih, age(now(),tarih) from musteri
--müşteri siparişleri ve verildiğinden itibaren geçen zaman bilgisi

--4)EXTRACT
--Tarihin belirli bir parçasını döner

select extract(year from current_date)--mevcut yıl
select extract(month from current_date)--mevcut ay
select extract(day from current_date)--mevcut gün

--5)DATE_PART
--Extract ile aynı mantıkta çalışır fakat farklı bir sözdizimi vardır

select date_part('year',current_date)--mevcut yıl
select date_part('month',current_date)--mevcut ay
select date_part('day',current_date)--mevcut gün

--6)TO_CHAR
--Tarihi veya sayısal ifadeyi verilen formata göre dönüştürür

select to_char(current_timestamp, 'DD-MM-YYYY HH24:MI:SS')

--7)INTERVAL
--Zaman farkı oluşturmak ekleme/çıkarma işlemleri için kullanılır

select now() + interval '3 days'--bügünden 3 gün sonrası
select now() - interval '2 days'--bugünden 3 gün öncesi