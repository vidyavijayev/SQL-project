use mavenmovies;

/*Write a SQL query to 
1.Count the number of characters except for the spaces for each actor. Return the first 10 actors' name lengths along with their names.
2.List all Oscar awardees(Actors who received the Oscar award) with their full names and the length of their names.
3.Find the actors who have acted in the film ‘Frost Head.’
4.Pull all the films acted by the actor ‘Will Wilson.’
5.Pull all the films which were rented and return them in the month of May.
6.Pull all the films with ‘Comedy’ category*/

-- Question 1 count the number of characters except for the spaces for each actor. Return the first 10 actors' name lengths along with their names.

select concat(first_name,' ',last_name) as Name ,length(concat(first_name,last_name))as Length from actor limit 10;

-- Question 2 List all Oscar awardees(Actors who received the Oscar award) with their full names and the length of their names.

select concat(first_name,' ',last_name)as Full_name,length(concat(first_name,' ',last_name))as Length from actor_award where awards='oscar';

-- Question 3 Find the actors who have acted in the film ‘Frost Head.’

select First_name,Last_name 
from film f join film_actor fa 
on f.film_id=fa.film_id
join actor a on a.actor_id=fa.actor_id where title='frost head';

-- Question 4 Pull all the films acted by the actor Will Wilson.

select Title
from film f join film_actor fa 
on f.film_id=fa.film_id
join actor a on a.actor_id=fa.actor_id
where first_name='will' and last_name='wilson';

-- Question 5 Pull all the films which were rented and return them in the month of May.

select Title from film f 
join film_actor fa on f.film_id=fa.film_id 
join actor a on a.actor_id=fa.actor_id
join customer c on c.first_name=a.first_name
join rental r on r.customer_id=c.customer_id
where (extract(month from rental_date)=5) and (extract(month from return_date))=5;

-- Question 6  Pull all the films with ‘Comedy’ category

select Title from category c 
join film_category fc on c.category_id=fc.category_id
join film f on f.film_id=fc.film_id where name='comedy';


