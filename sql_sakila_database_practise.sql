use sakila;

select * from actor;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1a. Display the first and last names of all actors from the table actor.-- 
select first_name,last_name 
from actor;




--------------------------------------------------------------------------------------------------------------------------------------------------
-- 1b. Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.
select upper(concat(first_name,' ',last_name))as actorname
from actor;

----------------------------------------------------------------------------------------------------------------------------------------------------
-- 2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe."
--  What is one query would you use to obtain this information?
select actor_id,first_name,last_name 
from actor
where lower(first_name)=lower('Joe');

---------------------------------------------------------------------------------------------------------------------------------------------------------
-- Find all actors whose last name contain the letters GEN:
select * from actor
where upper(last_name) like '%GEN%';

----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2c. Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order: 

select * from actor
where upper(last_name) like '%LI%'
order by last_name,first_name;

-----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2d. Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China:
select * from country;

select country_id,country 
from country
where country in ('Afghanistan','Bangladesh','China');

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3a. You want to keep a description of each actor. You don't think you will be performing queries on a description, so create a column in the table actor named description and use the data type BLOB 
-- (Make sure to research the type BLOB, as the difference between it and VARCHAR are significant).

alter table actor
add column description blob;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3b. Very quickly you realize that entering descriptions for each actor is too much effort. Delete the description column.

alter table actor
drop column description;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 4a. List the last names of actors, as well as how many actors have that last name. 

select last_name,count(*) as actor_count
from actor
group by last_name
order by actor_count desc, last_name;

----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 4b. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors-- 
select last_name,count(*) as actor_count
from actor
group by last_name
order by actor_count desc, last_name;


-- 6a. Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address:
select * from staff;
select * from address;

select s.first_name,s.last_name,a.address,a.district,a.postal_code,a.location,a.city_id
from staff s
join address a
on s.address_id=a.address_id;

------------------------------------------------------------------------------------------------------------------------------------------


