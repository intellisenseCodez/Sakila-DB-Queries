
-- Q1:Querying all data in the actor table
select *
from actor;

-- Q2:Querying all data in the film table
select *
from film;

-- Q3:Querying payment_id, payment_date, amount from payment table
select payment_id, payment_date, amount
from payment;

-- Q4:count the number of rows in payment table.
select count(*)
from payment;

-- Q5:Querying all data in the payment table where rental_id is null
select *
from payment
where rental_id is null;

-- Q6:How many movies are there in each rating category? 
select count(title) count, rating
from film
group by rating
order by count desc;

-- Q7:what the minimum, maximum lengths and average for all movie grouped by rating
select min(length) as min_length, max(length) as max_length, round(avg(length),2) as avg_length, rating
from film
group by rating;

-- Q8:what the minimum and maximum lengths for all movie with 'PG' rating category 
select min(length) as min_length, max(length) as max_length, rating
from film
where rating = 'PG';

-- Q9: Which actors have the first name ‘Scarlett’
select *
from actor
where first_name = "Scarlett";

-- Q10: Which actors have the last name ‘Johansson’
select *
from actor
where last_name = "Johansson";

-- Q11: How many distinct actors last names are there?
select count(distinct last_name) as count
from actor;

-- Q12: Which last names are not repeated?
select last_name, count(last_name) as count
from actor
group by last_name
having count = 1;

-- Q13: Which last names appear more than once?
select last_name, count(last_name) as count
from actor
group by last_name
having count > 1
order by count desc;


-- 14. Display the first and last names of all actors from the table actor
select first_name, last_name
from actor;

-- 15. Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.
select upper(concat_ws(" ", first_name, last_name)) as ActorName
from actor;

-- 16. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe."
select actor_id, first_name, last_name
from actor
where first_name = "Joe";

-- 17. Find all actors whose last name contain the letters GEN:
select *
from actor
where last_name like "%GEN%";

-- 18. Find all actors whose last names contain the letters LI. Order the rows by last name and first name
select *
from actor
where last_name like "%LI%"
order by last_name, first_name;

-- 19. Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China:
select country_id, country
from country
where country in ("Afghanistan", "Bangladesh", "China");

-- 20. List the last names of actors, as well as how many actors have that last name.
select last_name, count(last_name) as count
from actor
group by last_name
order by count desc, last_name;

-- 21.  List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
select last_name, count(last_name) as count
from actor
group by last_name
having count > 1
order by count desc;


/*
JOINING TABLES

*/

-- 22. Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address:
select first_name, last_name, address, district, postal_code, city_id
from staff s
inner join address a on a.address_id = s.address_id;

-- 23. Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment.
select last_name, first_name, sum(p.amount)
from staff s
inner join payment p on p.staff_id = s.staff_id
where month(p.payment_date) = 8 and year(p.payment_date) = 2005
group by s.last_name, s.first_name;

-- 24. List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.
select f.title, count(*) as count
from film_actor fa
join film f on f.film_id = fa.film_id
group by f.title
order by count desc;

-- 25. How many copies of the film Hunchback Impossible exist in the inventory system?

-- 26. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name:

/*

SUB QUERIES
*/

-- 27. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.

-- 28. Use subqueries to display all actors who appear in the film Alone Trip.

-- 29. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. Use joins to retrieve this information.

-- 30. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.

-- 31. Display the most frequently rented movies in descending order.

-- 32. Write a query to display how much business, in dollars, each store brought in.

-- 33. Write a query to display for each store its store ID, city, and country.

-- 34. List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)
