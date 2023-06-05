# sql_-sakila-db-queries_part1

1a. Display the first and last names of all actors from the table actor.
Query:

select first_name, last_name 
from actor;


1b. Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.
Query:

select upper(concat(first_name, ' ', last_name))   'Actor Name'
from actor;


2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you use to obtain this information?
Query:

select actor_id, first_name, last_name 
from actor 
where lower(first_name) = lower("Joe");


2b. Find all actors whose last name contain the letters GEN:
Query:

select * 
from actor 
where upper(last_name) like '%GEN%';


2c. Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order:
Query:

select * 
from actor 
where upper(last_name) like '%LI%' 
order by last_name, first_name;


2d. Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China:
Query:

select country_id, country 
from country 
where country in ('Afghanistan', 'Bangladesh', 'China');


image

3a. You want to keep a description of each actor. You don't think you will be performing queries on a description, so create a column in the table actor named description and use the data type BLOB (Make sure to research the type BLOB, as the difference between it and VARCHAR are significant).
According to Ozair Kafray @ Stackexchange.com

I would suggest using TEXT over BLOB.

Primary Difference

- TEXT and BLOB is stored off the table with the table just having a pointer to the location of the actual storage.
- VARCHAR is stored inline with the table.

Primary Guideline

1. Text format messages should almost always be stored as TEXT (they end up being arbitrarily long)
2. String attributes should be stored as VARCHAR (the destination user name, the subject, etc...).
Query:

select * from actor;

ALTER TABLE actor
ADD COLUMN description BLOB;

select * from actor;




3b. Very quickly you realize that entering descriptions for each actor is too much effort. Delete the description column.
Query:

select * from actor;

alter table actor
drop column description;

select * from actor;




4a. List the last names of actors, as well as how many actors have that last name.
Query:

select last_name, count(*) actor_count 
from actor 
group by last_name
order by actor_count desc, last_name;




4b. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
Query:

select last_name, count(*) actor_count 
from actor 
group by last_name
having actor_count >1
order by actor_count desc, last_name;

