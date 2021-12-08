-- 1
select actor_id as 'ID del actor', first_name as 'Nombre', last_name as 'Apellido' from actor;
-- 2
select actor_id as 'ID del actor' from actor;
-- 3
select  distinct store_id  as 'ID de Tiendas' from sakila.store;
-- 4
select distinct store_name as 'Nombre de las tiendas' from sakila.store;
-- 5
select * from sakila.country order by country asc ;
-- 6
select store_id as 'ID de la tienda', first_name as 'Nombre del cliente', last_name as 'Apellido del cliente' from sakila.customer order by last_name asc;

-- 9 (por que pintó usar procedure)
use sakila;
delimiter $$
create procedure getMaxMin()
begin
	select max(amount) as 'Valor máximo' from sakila.payment ;
	select min(amount) as 'Valor mínimo' from sakila.payment;
end $$
call getMaxMin();

-- 11 y 12
use sakila;
delimiter $$
create procedure mostrarWhere()
begin
select * from sakila.actor where first_name='ED';
select * from sakila.city where city='london';
end $$

call mostrarWhere();

-- 13
select * from language where language_id=1 or name='german';
-- 16
select distinct rating from film where rating not like '%PG%';

-- 23 (pintó crear view)
create view renta as 
	select rental.rental_id, customer.customer_id, rental.staff_id
	from rental
	inner join customer 
	on rental.customer_id=customer.customer_id
	where customer.customer_id between 300 and 500 and rental.staff_id=1 order by customer.customer_id asc;
select rental_id as 'id renta',customer_id as 'id cliente', staff_id as 'id del staff' from renta;

-- 24
SELECT amount AS 'monto', payment_id AS 'id del monto' FROM payment WHERE amount BETWEEN 3 AND 5 ORDER BY amount DESC;

-- 29

SELECT * FROM actor WHERE first_name LIKE 'a%' AND last_name LIKE 'b%';

-- 30

SELECT * FROM actor WHERE first_name like '%a' AND last_name like '%n';
