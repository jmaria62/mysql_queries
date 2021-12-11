use tienda;
/*
select distinct nombre from producto; 
select nombre,precio from producto order by nombre,precio; 
desc producto;
select nombre,precio as euros,format(precio *1.1,2.4) as dolares from producto;

select nombre as 'nom del producto',precio as euros,format(precio *1.1,2.4) as dolars from producto;

Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula.
select upper(nombre),precio from producto;

Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula.
select lower(nombre),precio from producto;

8.- Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant

select nombre,upper(left(nombre,2)) from fabricante;

9.- Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu
select nombre,round(precio) from producto;


10.- Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal
select nombre,truncate(precio,0),precio from producto;

11.- Llista el codi dels fabricants que tenen productos en la taula producto.
select codigo_fabricante,count(codigo) as num_referencias from producto group by codigo_fabricante  ;

12.- Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits
select distinct codigo_fabricante from producto;

13-Llista els noms dels fabricants ordenats de manera ascendent.
select nombre from fabricante order by nombre asc;


14.- Llista els noms dels fabricants ordenats de manera descendent.
select nombre from fabricante order by nombre desc;


15.- Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent
select nombre,precio from producto order by nombre asc,precio desc;

16.-Retorna una llista amb les 5 primeres files de la taula fabricante.
select * from fabricante limit 5;

17.- Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
select * from fabricante limit 3,2;
18.- Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY
select nombre,precio from producto order by precio limit 1;

19.-Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
select nombre,precio from producto order by precio desc limit 1;

20.-Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.
select nombre from producto where codigo_fabricante=2;
 
21.- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades
select producto.nombre,producto.precio,fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo;

22.- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat pel nom del fabricador, per ordre alfabètic
select producto.nombre,producto.precio,fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo order by fabricante.nombre;

23.- Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades
select producto.codigo,producto.nombre,fabricante.codigo,fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo;

24.- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat
select producto.nombre,producto.precio,fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo order by precio limit 1;

25.- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
select producto.nombre,producto.precio,fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo order by precio desc limit 1;

26.- Retorna una llista de tots els productes del fabricador Lenovo.
select  producto.codigo,producto.nombre,producto.precio from producto inner join  fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre='Lenovo';


27.-Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€
select  producto.codigo,producto.nombre,producto.precio from producto inner join  fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre='Crucial' and producto.precio>200;


28.-Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Sense utilitzar l'operador IN
select  producto.codigo,producto.nombre,producto.precio,fabricante.nombre from producto inner join  fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre = "Asus" or  fabricante.nombre ="Hewlett-Packard" or fabricante.nombre ="Seagate";

29.- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Utilitzant l'operador IN
select  producto.codigo,producto.nombre,producto.precio,fabricante.nombre from producto inner join  fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre in ("Asus","Hewlett-Packard","Seagate");

30.- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e
select  producto.codigo,producto.nombre,producto.precio,fabricante.nombre from producto inner join  fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre like "%e";

*/
