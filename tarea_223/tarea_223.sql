--Ejercicio 1
CREATE VIEW actores_peliculas_genero AS
select 
a.first_name as nombre,
a.last_name as apellido,
f.title as titulo,
c.name as genero
from film f
inner join film_actor using(film_id)
inner join actor a using(actor_id)
inner join film_category using(film_id)
inner join category c using(category_id); 

--Ejercicio 2
select genero from public.actores_peliculas_genero
where nombre='Penelope' and apellido='Guiness';

--Ejercicio 3
select * from public.actores_peliculas_genero
where nombre='Jennifer' and apellido='Davis' and titulo like ('B%');

--Ejercicio 4
alter view actores_peliculas_genero rename to actor_film_genre;

--Ejercicio 5
CREATE OR REPLACE VIEW actor_film_genre AS
select 
a.first_name as nombre,
a.last_name as apellido,
f.title as titulo,
c.name as genero,
f.length as duracion
from film f
inner join film_actor using(film_id)
inner join actor a using(actor_id)
inner join film_category using(film_id)
inner join category c using(category_id); 
