--Ejercicio 1
select name as genero from category;
--Ejercicio 2
select count(distinct(first_name)) as numero_filas from actor;
--Ejercicio 3
select title,rental_duration,rental_rate from film where film_id = 5;
--Ejercicio 4
select * from film order by length asc;
--Ejercicio 5
select * from film
where length < 50 and rental_rate = 4.99;
--Ejercicio 6
select * from payment
where payment_date between '2007-04-10' and '2007-04-18' order by amount desc;
--Ejercicio 7
select * from payment
where payment_date between '2007-04-10' and '2007-04-18'
and amount>7 and staff_id=2;
--Ejercicio 8
select count(*) from payment
where payment_date between '2007-04-10' and '2007-04-18'
and amount>7 and staff_id=2;