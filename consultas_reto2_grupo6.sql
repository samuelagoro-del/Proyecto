SELECT * FROM dam1_reto2_grupo6;
-- --------------------------------
--  -----------Consultas---------
-- --------------------------------

-- a)El dinero recaudado por cada película con recaudación superior a una cifra dada.
SELECT 
    p.titulo,
    SUM(e.precio) AS recaudacion
FROM Pelicula p
JOIN Sesion s ON p.idPeli = s.idPeli
JOIN Entrada e ON s.idSesion = e.idSesion
GROUP BY p.idPeli, p.titulo
HAVING SUM(e.precio) > 10;
-- b)La duración media de las películas por género.
SELECT 
p.genero,
AVG(duracion) AS duracion_media
FROM Pelicula p
GROUP BY genero;

-- c)El número de sesiones ofrecidas por película. Filtrar por género o por precio.
SELECT 
p.titulo,
p.genero,
COUNT(s.idSesion) AS num_sesiones
FROM pelicula p
JOIN sesion s ON p.idpeli = s.idpeli
WHERE p.precio >8
GROUP BY p.idPeli,p.titulo,p.genero;
-- d)El precio medio de las películas por género.
SELECT 
p.genero,
AVG(precio) AS num_media
FROM pelicula p
GROUP BY p.genero;
-- e) Datos de las películas con mayor recaudación.
SELECT 
p.titulo,
SUM(e.precio) AS num_recaudacion
FROM pelicula p
JOIN sesion s ON p.idpeli= s.idpeli
JOIN entrada e ON  s.idsesion = e.idsesion
GROUP BY p.titulo,p.idpeli
ORDER BY  um_recaudacion DESC;


-- f)Datos de los clientes a los que se les ha aplicado mayores descuentos en sus compras.
SELECT
c.DNI,
c.nombre,
SUM(co.descuento) AS descuento_Total
FROM cliente c
JOIN compra co ON c.DNI = co.DNI
GROUP BY c.DNI,c.nombre
ORDER BY  descuento_Total DESC;
-- g) Datos de los clientes que han adquirido mayor número de entradas.
SELECT
c.DNI,
c.nombre,
SUM(e.num_pers) AS mayor_entrada
FROM cliente c
JOIN  compra co ON c.DNI = co.DNI
JOIN entrada e ON e.idcompra = co.idcompra
GROUP BY c.DNI,c.nombre
ORDER BY  mayor_entradar DESC;
-- h) Datos de los clientes que han gastado más dinero.
SELECT
c.DNI,
c.nombre,
sum(co.precio) AS gasto_mayor
FROM cliente c
JOIN compra co ON  c.DNI = co.DNI
GROUP BY  c.DNI,c.nombre
ORDER BY gasto_mayor DESC;

-- i)Datos de las películas con un número de espectadores inferior a una cantidad dada.
SELECT 
p.idpeli,
p.titulo,
SUM(num_pers) AS espectdores_inferior 
FROM pelicula p
JOIN  sesion s ON p.idpeli = s.idpeli
JOIN entrada e ON e.idSesion = s.idSesion
GROUP BY p.idpeli,p.titulo
HAVING espectdores_inferior  <10;
-- j) Datos de los clientes que aún no han comprado ninguna entrada.
SELECT 
c.DNI,
c.nombre,
e.identrada is null AS ninguna_entrada
FROM cliente c
LEFT JOIN  compra co ON c.DNI = co.DNI
LEFT JOIN entrada e ON e.idcompra = co.idcompra
WHERE e.idEntrada IS NULL