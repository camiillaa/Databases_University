CREATE TABLE autor (auID int NOT NULL PRIMARY KEY, nazwisko varchar(50) NOT NULL, telefon varchar(50));
CREATE TABLE wydawnictwo (wydID int PRIMARY KEY NOT NULL, nazwa varchar(50) NOT NULL, telefon varchar(50));
CREATE TABLE ksiazka (isbn char(13) NOT NULL PRIMARY KEY, tytul VARCHAR(50) NOT NULL, wydID int references wydawnictwo(wydID) NOT NULL, cena double precision NOT NULL);
CREATE TABLE ksiazka_autor (isbn char(13) references ksiazka(isbn) NOT NULL, auID int references autor(auID) NOT NULL, CONSTRAINT isbn_audID PRIMARY KEY(isbn,auID));


INSERT INTO autor VALUES(4, 'Roman', '444-44-44');
INSERT INTO autor VALUES(2, 'Jones', '555-55-55');
INSERT INTO autor VALUES(8, 'Snoopy');
SELECT * FROM autor;
INSERT INTO wydawnictwo VALUES(1, 'Big House', '414-41-41');
INSERT INTO wydawnictwo VALUES(2, 'Alpha Press', '999-99-99');

SELECT * FROM wydawnictwo;

INSERT INTO ksiazka VALUES('1-111-1111-11', 'C++', 1, 29.95);
INSERT INTO ksiazka VALUES('6-999-9999-99', 'Main Street', 2, 51.00);
SELECT * FROM ksiazka;

INSERT INTO ksiazka_autor VALUES('1-111-1111-11', 4);
INSERT INTO ksiazka_autor VALUES('6-999-9999-99', 2);
INSERT INTO ksiazka_autor VALUES('6-999-9999-99', 8);
SELECT * FROM ksiazka_autor;
UPDATE wydawnictwo
SET nazwa = 'House Press'
WHERE wydID = 1;


ALTER TABLE wydawnictwo
ADD data DATE;


UPDATE wydawnictwo
SET data = '2000-01-01'
WHERE wydID = 1;
UPDATE wydawnictwo
SET data = '1990-05-29'
WHERE wydID = 2;
SELECT * FROM wydawnictwo 

--wrocic
ALTER TABLE ksiazka DROP COLUMN wydID;
ALTER TABLE wydawnictwo DROP COLUMN wydID;
ALTER TABLE wydawnictwo ADD CONSTRAINT nazwa_telefon PRIMARY KEY (nazwa,telefon);
ALTER TABLE ksiazka ADD nazwa VARCHAR(50),ADD telefon VARCHAR(50),
ADD CONSTRAINT nazwa_telefon FOREIGN KEY (nazwa, telefon) REFERENCES wydawnictwo(nazwa,
telefon);

SELECT * FROM ksiazka;
UPDATE ksiazka SET nazwa='House Press', telefon='414-41-41' WHERE isbn='1-111-1111-11';
UPDATE ksiazka SET nazwa='Alpha Press', telefon='999-99-99' WHERE isbn='6-999-9999-99';


ALTER TABLE ksiazka
ALTER COLUMN cena TYPE INT;

SELECT * FROM ksiazka;


