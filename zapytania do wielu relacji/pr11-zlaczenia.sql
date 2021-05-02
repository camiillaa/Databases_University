CREATE TABLE zajecia(przedmiot VARCHAR(50) NOT NULL,
					typ VARCHAR(5) NOT NULL,
					sala INT NOT NULL);

CREATE TABLE przedmiot(nazwisko VARCHAR(50) NOT NULL,
					przedmiot VARCHAR(50) NOT NULL,
					typ VARCHAR(5) NOT NULL);
CREATE TABLE dane( nrInd INT NOT NULL,
				  imie VARCHAR(50) NOT NULL,
					nazwisko VARCHAR(50) NOT NULL);
				
CREATE TABLE zamieszkanie( nrInd INT  NOT NULL,
						   nrDS INT  NOT NULL );
						   
CREATE TABLE ocena( nrInd INT  NOT NULL,
					przedmiot VARCHAR(50) NOT NULL,
					 lab DECIMAL(2,1) NOT NULL,
					egz DECIMAL(2,1) NOT NULL);
INSERT INTO zajecia
VALUES 
('Hiszpanski', 'WYK', 100),
('Hiszpanski', 'LAB', 22),
('Geologia', 'WYK', 100),
('Geologia', 'LAB', 12);

INSERT INTO przedmiot
VALUES 
('Nowacka', 'Hiszpanski', 'WYK'),
('Majka', 'Hiszpanski', 'LAB'),
('Baka', 'Geologia', 'WYK'),
('Majka', 'Geologia', 'LAB');

INSERT INTO dane
VALUES 
(123456, 'Ala', 'Nowak'),
(123123, 'Krzysztof', 'Kowalski'),
(456456, 'Jerzy', 'Pszoniak'),
(456123, 'Jolanta', 'Ostrowska'),
(111111, 'Maja', 'Pach'),
(666666, 'Olaf', 'Bach');
INSERT INTO zamieszkanie
VALUES 
(123456, 12),
(123123, 12),
(456456, 6),
(456123, 12);
INSERT INTO ocena
VALUES 
(111111,'Hiszpanski',3.0,4.0),
(666666,'Geologia',3.0,3.0),
(123456,'Geologia',4.0,5.0),
(123123,'Geologia',5.0,4.5),
(456123,'Hiszpanski',5.0,6.0);


SELECT nrInd FROM ocena
UNION
SELECT nrInd FROM zamieszkanie;

SELECT nrInd FROM ocena
INTERSECT
SELECT nrInd FROM zamieszkanie;

SELECT nrInd FROM ocena
EXCEPT
SELECT nrInd FROM zamieszkanie

SELECT * FROM przedmiot
CROSS JOIN zajecia;

SELECT * FROM przedmiot
NATURAL JOIN zajecia;


SELECT imie, nazwisko FROM dane
WHERE nrInd IN
(SELECT nrInd FROM dane
EXCEPT
SELECT nrInd FROM zamieszkanie) 
AND
nrInd IN
(SELECT nrInd FROM dane
INTERSECT
SELECT nrInd FROM ocena
WHERE (lab+egz)/2<4.0)

SELECT * FROM przedmiot
CROSS JOIN zajecia
WHERE przedmiot.przedmiot=zajecia.przedmiot
AND przedmiot.typ=zajecia.typ



  