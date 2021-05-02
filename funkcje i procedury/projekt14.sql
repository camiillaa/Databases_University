CREATE TABLE klient(pesel VARCHAR(25) PRIMARY KEY, imie VARCHAR(25), nazwisko VARCHAR(25), wiek INT);
 

CREATE TABLE konta(nrkonta BIGINT PRIMARY KEY, kwota FLOAT(5));
 
CREATE TABLE dane(nrkonta BIGINT REFERENCES konta(nrkonta), pesel VARCHAR(25) REFERENCES klient(pesel));


INSERT INTO klient(pesel, imie, nazwisko, wiek) VALUES
('77090300001', 'Antoni', 'Nowak', '30'),
('80030400002', 'Jerzy', 'MIS', '27'),
('49020912345', 'Aleksandra', 'Nowak', '58'),
('60120490003', 'Piotr', 'Szczepanik', '47');


INSERT INTO konta(nrkonta, kwota) VALUES
('11110123', '10000'),
('11114567', '20000'),
('11118910', '100000'),
('11111112', '200000');


INSERT INTO dane(nrkonta, pesel) VALUES
('11110123', '77090300001'),
('11110123', '49020912345'),
('11114567', '77090300001'),
('11118910', '60120490003'),
('11111112', '77090300001'),
('11111112', '80030400002'),
('11111112', '49020912345');


 
CREATE OR REPLACE FUNCTION ilosc_rachunkow(pesel VARCHAR)
RETURNS BIGINT
AS 'SELECT COUNT(nrkonta) FROM dane WHERE pesel = $1 GROUP BY pesel;'
LANGUAGE SQL;

SELECT DISTINCT dane.pesel, ilosc_rachunkow(pesel) FROM dane;
 

CREATE OR REPLACE FUNCTION dane_klienta(pesel VARCHAR(25))
RETURNS VARCHAR AS $$ SELECT CONCAT(imie,' ',nazwisko) AS imie_nazwisko FROM klient WHERE pesel = $1 GROUP BY pesel;
$$ LANGUAGE SQL;


SELECT DISTINCT dane_klienta(dane.pesel), ilosc_rachunkow(dane.pesel) from dane;


  
CREATE OR REPLACE FUNCTION format()
RETURNS TABLE(upper_naz VARCHAR)
AS 'SELECT UPPER(nazwisko)FROM klient;'
LANGUAGE SQL;

SELECT* FROM format();


CREATE OR REPLACE FUNCTION srodki_pieniezne(pesel2 VARCHAR(25))
RETURNS TABLE(srodki FLOAT(5)) 
AS $$ SELECT SUM(kwota) AS sordki FROM konta 
WHERE nrkonta IN (SELECT nrkonta FROM dane WHERE pesel2 = pesel);
$$ LANGUAGE SQL;

SELECT DISTINCT pesel, srodki_pieniezne(pesel) FROM dane;
 



