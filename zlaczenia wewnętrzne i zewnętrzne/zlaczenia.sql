CREATE TABLE wydawnictwo (wydID SERIAL PRIMARY KEY, 
							nazwa VARCHAR(50) NOT NULL, 
							adres VARCHAR(50) NOT NULL, 
							telefon CHAR(9) NOT NULL
					   		);
							
CREATE TABLE tytul (tytID SERIAL PRIMARY KEY, 
					tytul VARCHAR(50) NOT NULL, 
					wydID INT REFERENCES wydawnictwo(wydID), 
					cena DECIMAL(10,2) NOT NULL,
					ilosc INT NOT NULL
					);
					
CREATE TABLE autor (auID INT PRIMARY KEY, 
					nazwisko VARCHAR(50) NOT NULL, 
					imie VARCHAR(50) NOT NULL, 
					adres VARCHAR(50) NOT NULL 
					);
					
CREATE TABLE tytul_autor (tytID INT REFERENCES tytul(tytID),
					auID INT REFERENCES autor(auID),
					zaliczka DECIMAL(10,2) NOT NULL, 
					stawka DECIMAL(10,2) NOT NULL
					);							

INSERT INTO wydawnictwo(nazwa, adres, telefon)
VALUES 
('PWN', 'Warszawa', '223456789'),
('Skarbnica', 'Kraków', '123456789');

INSERT INTO tytul(tytul, wydID, cena, ilosc)
VALUES 
('Wszystko o gotowaniu', 2, 29.99, 15020),
('Słownik wyrazów cudacznych', 1, 59.99, 5020),
('Main Street', 2, 35.00, 720),
('Main Street - reaktywacja', 2, 65.00, 720),
('Słownik wyrazów cudnych', 1, 64.99, 3520);

INSERT INTO autor
VALUES 
(1, 'Caloggi', 'Edgar', 'Kair'),
(3, 'Bała','Justyna', 'Kraków'),
(4, 'Kowalski', 'Jan', 'Opole'),
(7, 'Porzycka' ,'Stanisława', 'Kraków'),
(8, 'Makowski' ,'Ireneusz', 'Poznań');

INSERT INTO tytul_autor
VALUES 
(1, 4, 20000.00, 25000.00),
(2, 1, 0.00, 80000.00),
(2, 3, 20000.00, 40000.00),
(3, 4, 0.00, 25000.00),
(4, 7, 10000.00, 55000.00),
(5, 7, 20000.00, 80000.00),
(5, 4, 80000.00, 100000.00);

SELECT * FROM wydawnictwo;

SELECT * FROM tytul_autor;

SELECT imie,nazwisko,autor.adres FROM autor
INNER JOIN wydawnictwo
ON autor.adres=wydawnictwo.adres



SELECT tytID,tytul,nazwa,wydawnictwo.wydID FROM tytul
INNER JOIN wydawnictwo
ON tytul.wydID=wydawnictwo.wydID

SELECT imie,nazwisko,COUNT(tytul.tytID) FROM autor
LEFT OUTER JOIN tytul_autor
ON autor.auID=tytul_autor.auID
LEFT OUTER JOIN tytul
ON tytul_autor.tytID=tytul.tytID
GROUP BY nazwisko,imie

SELECT tytul,zaliczka,cena*ilosc AS dochod FROM tytul
INNER JOIN tytul_autor
ON tytul_autor.tytID=tytul.tytID
WHERE cena*ilosc>10*zaliczka


SELECT tytul,COUNT(*) FROM tytul
INNER JOIN tytul_autor
ON tytul_autor.tytID=tytul.tytID
INNER JOIN autor
ON tytul_autor.auID=autor.auID
GROUP BY tytul
HAVING COUNT(*)>1


SELECT imie,nazwisko FROM autor
LEFT OUTER JOIN tytul_autor
ON autor.auID=tytul_autor.auID
LEFT OUTER JOIN tytul
ON tytul_autor.tytID=tytul.tytID
GROUP BY nazwisko,imie
HAVING COUNT(tytul.tytID)=0

SELECT imie,nazwisko,tytul FROM autor
FULL OUTER JOIN tytul_autor
ON autor.auID=tytul_autor.auID
FULL OUTER JOIN tytul
ON tytul_autor.tytID=tytul.tytID

SELECT imie,nazwisko,tytul,nazwa FROM autor
FULL OUTER JOIN tytul_autor
ON autor.auID=tytul_autor.auID
FULL OUTER JOIN tytul
ON tytul_autor.tytID=tytul.tytID
FULL OUTER JOIN wydawnictwo
ON tytul.wydID=wydawnictwo.wydID







