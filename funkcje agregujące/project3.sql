CREATE TABLE pracownik (id SERIAL PRIMARY KEY,
						imie VARCHAR(50) NOT NULL,
						nazwisko VARCHAR(50) NOT NULL,
						miasto VARCHAR(100) NOT NULL,
						zawod VARCHAR(50) NOT NULL,
						placa DOUBLE PRECISION NOT NULL
					   );
INSERT INTO pracownik(imie, nazwisko, miasto, zawod, placa) VALUES
('Ala', 'Nowak', 'Krakow', 'rezyser', 3200.00),
('Ola', 'Kowlski', 'Krakow', 'rezyser', 5000.00),
('Jola', 'Nowicki', 'Krakow', 'scenarzysta', 6000.00),
('Mariola', 'Mis', 'Krakow','scenarzysta', 3000.00),
('Alojzy', 'Bak', 'Lublin', 'rezyser', 5000.00),
('Adam', 'Czop', 'Warszawa', 'rezyser', 6000.00),
('Alfons', 'Wilusz', 'Warszawa', 'scenarzysta', 4000.00),
('Ela', 'Malisz', 'Warszawa', 'rezyser', 7500.00),
('Piotr', 'Sorota', 'Warszawa', 'scenarzysta', 3500.00),
('Jaromir', 'Osa', 'Warszawa', 'scenarzysta', 3000.00),
('Mirek', 'Nosik', 'Katowice', 'rezyser', 2200.00),
('Zenon', 'Broda', 'Katowice', 'rezyser', 8000.00),
('Zenobia', 'Barszcz', 'Katowice', 'scenarzysta', 2000.00);
SELECT * FROM pracownik;
SELECT DISTINCT miasto FROM pracownik;
SELECT miasto FROM pracownik GROUP BY miasto;
SELECT COUNT(DISTINCT(miasto)) AS iloscmiast FROM pracownik;
SELECT DISTINCT miasto, zawod FROM pracownik;
SELECT miasto, COUNT(*) as iloscpracownikow FROM pracownik GROUP BY miasto;
SELECT miasto, zawod, COUNT(zawod) as iloscpracownikow FROM pracownik GROUP BY miasto, zawod ORDER BY miasto;
SELECT AVG(placa) as placasrednia FROM pracownik;
SELECT miasto, AVG(placa) as placasrednia FROM pracownik GROUP BY miasto;
SELECT miasto, zawod,  AVG(placa) as placasrednia FROM pracownik GROUP BY miasto, zawod;
SELECT miasto, AVG(placa) as placasrednia FROM pracownik GROUP BY miasto HAVING COUNT(*)>3
SELECT AVG(placa) as placasrednia,
(SELECT AVG(placa) FROM pracownik GROUP BY zawod HAVING zawod = 'rezyser') AS placasredniarezysera,
(SELECT AVG(placa) FROM pracownik GROUP BY zawod HAVING zawod = 'scenarzysta') as placasredniascenarzysty FROM pracownik; 
SELECT imie, nazwisko FROM pracownik GROUP BY zawod,imie, nazwisko, placa HAVING zawod = 'rezyser' 
AND (SELECT AVG(placa) FROM pracownik) < placa
SELECT COUNT(*) AS iloscscenarzystow FROM pracownik WHERE zawod ='scenarzysta' 
AND placa > (SELECT AVG(placa) FROM pracownik GROUP BY zawod, miasto HAVING zawod = 'scenarzysta' AND miasto = 'Warszawa')


SELECT imie, nazwisko, CAST(placa-(SELECT AVG(placa) FROM pracownik) AS NUMERIC(10,2)) as roznicaplac FROM pracownik WHERE placa-(SELECT AVG(placa) FROM pracownik) IS NOT NULL ORDER BY nazwisko, imie;