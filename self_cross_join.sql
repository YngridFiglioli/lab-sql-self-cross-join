#Get all pairs of actors that worked together.
#Get all pairs of customers that have rented the same film more than 3 times. - couldnt do it
#Get all possible pairs of actors and films.

use sakila;
select a1.film_id,concat(a1.first_name, ' ', a1.last_name) as actor1,
    concat(a2.first_name, ' ', a2.last_name) as actor2
from (select a.actor_id, a.first_name, a.last_name, fa.film_id
from sakila.actor a join sakila.film_actor fa on a.actor_id = fa.actor_id) a1
        join (select a.actor_id, a.first_name, a.last_name, fa.film_id
    from sakila.actor a join sakila.film_actor fa on a.actor_id = fa.actor_id) a2
on a1.film_id = a2.film_id and a1.actor_id <> a2.actor_id;

select concat(actor.first_name, ' ', actor.last_name) as actor_name, fa1.title from actor
cross join (select f.film_id, f.title, fa.actor_id from film f join film_actor fa on f.film_id = fa.film_id) fa1
where actor.actor_id = fa1.actor_id;



