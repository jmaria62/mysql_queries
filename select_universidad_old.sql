use universidad;

/*
1.- Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
select apellido1,apellido2,nombre from persona where tipo="alumno" ;

2.-Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
select nombre,apellido1,apellido2,telefono from persona where tipo="alumno" and telefono is null;

3.- Retorna el llistat dels alumnes que van néixer en 1999.
select * from persona where tipo="alumno" and fecha_nacimiento >"1998-12-31" and fecha_nacimiento <"2000-1-1" ;
or
select * from persona where tipo="alumno" and year(fecha_nacimiento)=1999 ;

4.- Retorna el llistat de professors que no han donat d'alta el seu número de telèfon en la base de dades i a més la seva nif acaba en K
select * from persona where tipo="profesor" and telefono is null and nif like "%K";

5.- Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7
select * from asignatura where cuatrimestre=1 and curso=3 and id_grado=7;

6.- Retorna un llistat dels professors juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom
select persona.apellido1,persona.apellido2,persona.nombre,departamento.nombre from persona inner join profesor inner join departamento on persona.id = profesor.id_profesor and profesor.id_departamento = departamento.id order by apellido1,apellido2,persona.nombre;

7.- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M.
select asignatura.nombre,curso_escolar.anyo_inicio,curso_escolar.anyo_fin from persona inner join alumno_se_matricula_asignatura inner join asignatura inner join curso_escolar on persona.id = alumno_se_matricula_asignatura.id_alumno and alumno_se_matricula_asignatura.id_asignatura=asignatura.id where persona.nif="26902806M"


8.- Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).

select departamento.nombre from departamento inner join profesor inner join asignatura on departamento.id = profesor.id_departamento and asignatura.id_profesor=;
--------------------------------------

Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

1.-     Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.

select departamento.nombre,persona.nombre,persona.apellido1,persona.apellido2 from persona left join profesor  on persona.id=profesor.id_profesor inner join departamento on profesor.id_departamento=departamento.id where persona.tipo="profesor" order by departamento.nombre,persona.apellido1,persona.apellido2,persona.nombre;
where persona.tipo="profesor"

2.- Retorna un llistat amb els professors que no estan associats a un departament.

select persona.nombre,persona.apellido1,persona.apellido2,profesor.id_departamento from persona left join profesor on persona.id=profesor.id_profesor where persona.tipo="profesor" and id_departamento is null ;

3.- Retorna un llistat amb els departaments que no tenen professors associats.
select departamento.nombre,profesor.id_profesor from departamento left join profesor on departamento.id=profesor.id_departamento where id_profesor is null;

4.- Retorna un llistat amb els professors que no imparteixen cap assignatura.
select persona.nombre,persona.apellido1,persona.apellido2,asignatura.id from persona left join profesor on persona.id=profesor.id_profesor left join asignatura on profesor.id_profesor=asignatura.id_profesor where persona.tipo="profesor" and asignatura.id is null  ;

5.- Retorna un llistat amb les assignatures que no tenen un professor assignat
select id,nombre from asignatura where id_profesor is null;

6.- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
select distinct departamento.nombre from departamento left join profesor on departamento.id=profesor.id_departamento left join asignatura on profesor.id_profesor=asignatura.id_profesor where asignatura.nombre is null;

Consultes resum:

1.-    Retorna el nombre total d'alumnes que hi ha.
select count(id) from persona where tipo="alumno";

2.- Calcula quants alumnes van néixer en 1999.
select count(id) from persona where tipo="alumno" and year(fecha_nacimiento)=1999;
3.- Calcula quants professors hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors associats i haurà d'estar ordenat de major a menor pel nombre de professors.
select count(id_profesor) as num_profesores,departamento.nombre from profesor join departamento on profesor.id_departamento=departamento.id group by profesor.id_departamento order by num_profesores desc,nombre;

4.- Retorna un llistat amb tots els departaments i el nombre de professors que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors associats. Aquests departaments també han d'aparèixer en el llistat.
select departamento.nombre,count(id_profesor) as num_profesores from departamento left join profesor on profesor.id_departamento=departamento.id group by profesor.id_departamento order by num_profesores desc,nombre;

5.- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingui en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
select grado.nombre,count(asignatura.id) as num_asignaturas from grado left join asignatura on grado.id=asignatura.id_grado group by id_grado order by num_asignaturas desc;

6.- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
select grado.nombre,count(asignatura.id) as num_asignaturas from grado left join asignatura on grado.id=asignatura.id_grado  group by id_grado having num_asignaturas>40;

7.- Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus
select grado.nombre,asignatura.tipo,sum(asignatura.creditos) as creditos from asignatura inner join grado on asignatura.id_grado=grado.id group by asignatura.id_grado,asignatura.tipo

8.- Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
select curso_escolar.anyo_inicio,count(id_alumno) as num_alumnes from alumno_se_matricula_asignatura join curso_escolar on id_curso_escolar=curso_escolar.id group by id_curso_escolar;

9.- Retorna un llistat amb el nombre d'assignatures que imparteix cada professor. El llistat ha de tenir en compte aquells professors que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
SELECT persona.id,persona.nombre,persona.apellido1,persona.apellido2,count(asignatura.id) as num_asignaturas from persona left join asignatura on persona.id=asignatura.id_profesor where persona.tipo="profesor" group by persona.id order by num_asignaturas desc;

10.- Retorna totes les dades de l'alumne més jove.
select * from persona where tipo="alumno" order by fecha_nacimiento limit 1;

11.- Retorna un llistat amb els professors que tenen un departament associat i que no imparteixen cap assignatura.
select profesor.id_profesor,profesor.id_departamento,persona.nombre,persona.apellido1,persona.apellido2,asignatura.id from profesor left join asignatura on profesor.id_profesor = asignatura.id_profesor join persona on profesor.id_profesor=persona.id where asignatura.id is null;

*/

