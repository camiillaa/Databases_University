CREATE TABLE konto(nrkonta VARCHAR PRIMARY KEY NOT NULL, stan DECIMAL(10,2));


CREATE TABLE operacja(nrkarty VARCHAR PRIMARY KEY NOT NULL, kwota DECIMAL(10,2));


BEGIN;

INSERT INTO operacja(nrkarty, kwota) VALUES
('0123', '-10.00'),
('4567', '-210.00'),
('8910', '3100.00');

SAVEPOINT savePoint1;

INSERT INTO konto(nrkonta, stan) VALUES
('11110123', '10000.00'),
('11114567', '10000.00'),
('11118910', '20000.00'),
('11111112', '30000.00'),
('11111314', '40000.00');


SAVEPOINT savePoint2;



SELECT * FROM konto;


ROLLBACK TO savePoint1;
 

SELECT * FROM konto; 

ROLLBACK TO savePoint2;
 

SELECT * FROM konto; 
COMMIT;
 

SELECT * FROM konto;


SELECT * FROM operacja;

 
INSERT INTO operacja VALUES 
('0123', -10.00),
('4567',210.00),
('8910',3100.00);

SELECT * FROM operacja;


INSERT INTO konto VALUES 
('11110123',10000.00),
('11114567',10000.00),
('11118910',20000.00),
('11111112',30000.00),
('11111314',40000.00);

SELECT * FROM konto;


UPDATE konto 
SET stan = stan + operacja.kwota 
FROM operacja
WHERE RIGHT(nrKonta,4) = operacja.nrkarty);
 
DELETE FROM operacja;
 
COMMIT;
 

SELECT * FROM operacja;
 
SELECT * FROM konto;
 

CREATE USER user1 WITH PASSWORD 'aa'; 
GRANT SELECT ON konto TO user1;
 
-- psql -d postgres -U user1
 
SELECT * FROM konto;
 

BEGIN;
INSERT INTO konto VALUES (‘11116666’, 20000);
SELECT pg_sleep(10);
COMMIT;

select * from KONTO;


--- DLA USER1
SELECT * FROM konto;

e)
