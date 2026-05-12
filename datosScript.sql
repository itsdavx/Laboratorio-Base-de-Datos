INSERT INTO EQUIPO (CODIGOEQUIPO, NOMBREEQUIPO, NOMBREESTADIO, AFORO, ANIOFUNDACION, CIUDAD)
VALUES
(1, 'Barcelona SC', 'Monumental', 60000, 1925, 'Guayaquil'),
(2, 'Emelec', 'Capwell', 40000, 1929, 'Guayaquil'),
(3, 'Liga de Quito', 'Casa Blanca', 42000, 1930, 'Quito'),
(4, 'Deportivo Cuenca', 'Alejandro Serrano', 20000, 1971, 'Cuenca'),
(5, 'El Nacional', 'Atahualpa', 35000, 1964, 'Quito');

INSERT INTO PRESIDENTE (DNI, CODIGOEQUIPO, NOMBREPRESIDENTE, APELLIDOSPRESIDENTE, FECHANACIMIENTOPRESIDENTE, EQUIPOPRESIDENTE, ANIOELECCION)
VALUES
('1111111111', 1, 'Carlos', 'Alfaro', '1960-05-12', 'Barcelona SC', 2020),
('2222222222', 2, 'José', 'Spencer', '1970-07-20', 'Emelec', 2021),
('3333333333', 3, 'Esteban', 'Paz', '1965-03-15', 'Liga de Quito', 2019),
('4444444444', 4, 'Juan', 'Martínez', '1972-11-02', 'Deportivo Cuenca', 2022),
('5555555555', 5, 'Luis', 'Gómez', '1968-01-25', 'El Nacional', 2023);

INSERT INTO JUGADOR (CODIGOJUGADOR, CODIGOEQUIPO, NOMBREJUGADOR, FECHANACIMIENTOJUGADOR, POSICION)
VALUES
(10, 1, 'Pedro Quiñónez', '1986-03-05', 'Mediocampista'),
(11, 2, 'Miller Bolaños', '1990-06-01', 'Delantero'),
(12, 3, 'Adrián Gabbarini', '1985-08-18', 'Arquero'),
(13, 4, 'Carlos Feraud', '1990-10-23', 'Mediocampista'),
(14, 5, 'Franklin Guerra', '1992-04-12', 'Defensa');

INSERT INTO PARTIDO (CODIGOPARTIDO, FECHAPARTIDO, GOLESVISITA, GOLESCASA)
VALUES
(100, '2026-05-01', 2, 1),
(101, '2026-05-02', 0, 0),
(102, '2026-05-03', 3, 2),
(103, '2026-05-04', 1, 4),
(104, '2026-05-05', 2, 2);

INSERT INTO JUEGA (CODIGOPARTIDO, CODIGOEQUIPO)
VALUES
(100, 1),
(100, 2),
(101, 3),
(101, 4),
(102, 5);

INSERT INTO GOLES (CODIGOGOL, CODIGOPARTIDO, MINUTOGOL, DESCRIPCIONGOL)
VALUES
(1000, 100, 15, 'Gol de cabeza'),
(1001, 100, 45, 'Gol de tiro libre'),
(1002, 102, 10, 'Gol de penal'),
(1003, 103, 70, 'Gol de contragolpe'),
(1004, 104, 85, 'Gol de chilena');

SELECT * FROM EQUIPO;

SELECT * FROM PRESIDENTE;

SELECT * FROM JUGADOR;

SELECT * FROM PARTIDO;

SELECT * FROM JUEGA;

SELECT * FROM GOLES;