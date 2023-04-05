-- Select all the actors with the first name ‘Scarlett’.

select * from actor
where first_name = 'scarlett';


-- How many physical copies of movies are available for rent in the store's inventory? How many unique movie titles are available?

select count(film_id) as total_inventory from inventory;

select count(distinct title) as unique_title from film;



-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.

select min(length) as max_duration from film ; -- we have 46 mins as the min length

select max(length) as min_duration from film ;  -- we have 3 hours and 6 mins as the maximum length


-- What's the average movie duration expressed in format (hours, minutes)?

select time_format(sec_to_time(avg(length * 60 )) , '%Hh %im') as avg_duration
from film ;

select avg(length)/60 from film;

-- How many distinct (different) actors' last names are there?

select count(distinct last_name) as  num_of_last_name
from actor;
-- How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)

select datediff(max(rental_date), min(rental_date)) as num_days_operating
from rental;

-- Show rental info with additional columns month and weekday. Get 20 results.
select rental_id, rental_date, Monthname(rental_date) as month,
 dayname(rental_date) as weekday
from rental 
limit 20 ;
-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select rental_id, rental_date, monthname(rental_date) as month,
 dayname(rental_date) as weekday,
 case when dayofweek(rental_date) in (1,7) then 'weekend' else 'workday' 
 end as day_type
 from rental ;


-- Get release years.

select distinct(release_year) as release_year
from film;

-- Get all films with ARMAGEDDON in the title.

select * from film
where title like '%ARMAGEDDON' ;

-- Get all films which title ends with APOLLO.
select * from film
where title regexp 'APOLLO$' ;


-- Get 10 the longest films.
select *
from film
order by length desc
limit 10 ;

-- How many films include Behind the Scenes content?

select special_features from film;

select count(*) as count
from film
where special_features like '%behind the scene%' ;


