CREATE TABLE ksiazki (id SERIAL PRIMARY KEY, 
				   imie VARCHAR(50) NOT NULL, 
				   nazwisko VARCHAR(50) NOT NULL, 
				   tytul VARCHAR(100) NOT NULL,
				   cena DOUBLE PRECISION NOT NULL,
				   ilosc INT NOT NULL,
				   adres VARCHAR(50) NOT NULL
				  );
INSERT INTO ksiazki (imie, nazwisko, tytul, cena, ilosc, adres)
VALUES 
('Jan', 'Mrozek', 'Opetanie', 20.50, 3, 'Krakow'),
('Maria', 'Niec', 'Lot nad wronim gniazdem', 50.50, 0, 'Warszawa'),
('Ala', 'Nomab', 'Week', 20.50, 1, 'Krakow'),
('Pawel', 'Knab', 'Wakacje', 20.50, 13, 'Krakow'),
('Janusz', 'Koza', 'Obcy', 25.50, 3, 'Krakow'),
('Janina', 'Andrycz', 'Marzenie', 100.50, 4, 'Krakow'),
('Jerzy', 'Michnik', 'Tomahawk', 20.00, 2, 'Krakow'),
('Jadwiga', 'Talin', 'Auta', 20.00, 1, 'Krakow'),
('Kaja', 'Marab', 'Wiersze', 40.50, 0, 'Krakow'),
('Maria', 'Mrozinski', 'Analiza matematyczna', 20.50, 2, 'Krakow');
 

 SELECT * FROM ksiazki ORDER BY cena;


SELECT * FROM ksiazki ORDER BY cena DESC, ilosc ASC;

SELECT DISTINCT cena FROM ksiazki
SELECT CONCAT(imie,' sprzedal(a) ', ilosc, ' egz.:wartosc--> ', cena) AS ranking, ilosc*cena AS wartosc,0.19*ilosc*cena AS podatek, ilosc*cena-0.19*ilosc*cena as zysk FROM ksiazki WHERE ilosc*cena-0.19*ilosc*cena !=0 ORDER BY ilosc*cena DESC

SELECT tytul, cena FROM ksiazki WHERE cena>30


SELECT imie,nazwisko,tytul FROM ksiazki
WHERE adres='Warszawa'


SELECT tytul,imie,nazwisko from ksiazki
WHERE adres='Krakow' AND cena>50


SELECT tytul,cena,imie,nazwisko from ksiazki
WHERE adres != 'Krakow' OR cena<40

SELECT tytul from ksiazki
WHERE cena >= 20.5 AND cena <= 40.5
SELECT tytul FROM ksiazki
WHERE cena BETWEEN 20.5 AND 40.5


SELECT imie,nazwisko FROM ksiazki
WHERE nazwisko LIKE 'K%'


SELECT imie,nazwisko from ksiazki
WHERE nazwisko NOT LIKE 'M%' AND nazwisko LIKE '%b'

SELECT tytul,ilosc*cena AS wartosc,0.19*ilosc*cena AS podatek, ilosc*cena-0.19*ilosc*cena as zysk FROM ksiazki

SELECT CONCAT(imie,' sprzedal(a) ', ilosc, ' egz.:wartosc--> ', cena) AS ranking FROM ksiazki WHERE ilosc*cena-0.19*ilosc*cena !=0 ORDER BY ilosc*cena DESC


SELECT CONCAT(imie,' sprzedal(a) ', ilosc, ' egz.:wartosc--> ', cena) AS ranking, ilosc*cena AS wartosc FROM ksiazki
WHERE ilosc*cena != 0
ORDER BY ilosc*cena DESC





