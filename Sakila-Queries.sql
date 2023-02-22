
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

-- Q14: Which actor has appeared in the most films?


-- Q15: Is ‘Academy Dinosaur’ available for rent from Store 1?

-- Q16: What is that average running time of all the films in the sakila DB?
-- Q17: What is the average running time of films by category?
-- Q18: Display the first and last names of all actors from the table actor
-- Q19: Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.
-- Q20: You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, “Joe.” What is one query would you use to obtain this information?
-- Q21: Find all actors whose last name contain the letters GEN



