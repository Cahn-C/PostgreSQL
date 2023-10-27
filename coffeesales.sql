=================================================================================================================================
								DDL
=================================================================================================================================
-- Create and Alter the tables along with giving them the proper data types
CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(90),
	hire_date DATE,
	gender VARCHAR(5),
	salary NUMERIC(10,2),
	coffeeshop_id INT
);

CREATE TABLE shops (
	coffeeshop_id INT PRIMARY KEY,
	coffeeshop_name VARCHAR(50),
	city_id INT
);


CREATE TABLE locations (
	city_id INT PRIMARY KEY,
	city VARCHAR(50),
	country VARCHAR(90)
);


CREATE TABLE suppliers (
	coffeeshop_id INT,
	supplier_name VARCHAR(50),
	coffee_type VARCHAR(70),
	PRIMARY KEY (coffeeshop_id, supplier_name),
	FOREIGN KEY (coffeeshop_id) REFERENCES shops (coffeeshop_id)
);

ALTER TABLE employees ADD FOREIGN KEY (coffeeshop_id) REFERENCES shops (coffeeshop_id) ON DELETE SET NULL;
ALTER TABLE shops ADD FOREIGN KEY (city_id) REFERENCES locations (city_id) ON DELETE SET NULL;

=================================================================================================================================
								DML
=================================================================================================================================

-- Add records into the tables
-- Employees Table
INSERT INTO employees VALUES (501559, 'Carson', 'Mosconi', 'cmosconi0@census.gov', '08/29/2015', 'M', 32973.90, NULL);
INSERT INTO employees VALUES (144108, 'Khalil', 'Corr', 'kcorr1@github.io', '04/23/2014', 'M', 52802.53, NULL);
INSERT INTO employees VALUES (782284, 'Vilhelmina', 'Rayman', 'vrayman2@jigsy.com', '08/17/2015', 'F', 57855.12, NULL);
INSERT INTO employees VALUES (225709, 'Eleen', 'Tarpey', 'etarpey3@devhun.com', '09/14/2016', 'F', 48048.65, NULL);
INSERT INTO employees VALUES (614903, 'Hamel', 'Grocock', 'hgrocock4@nasa.gov', '03/27/2016', 'M', 66566.34, NULL);
INSERT INTO employees VALUES (590093, 'Frazier', 'Balls', 'fballs5@nydailynews.com', '12/22/2021', 'M', 15235.22, NULL);
INSERT INTO employees VALUES (243999, 'Jeremy', 'Whitlam', 'jwihitlam6@nudailynews.com', '01/21/2014', 'M', 41159.76, NULL);
INSERT INTO employees VALUES (599230, 'Webb', 'Hevey', 'whevey7@wkia.com', '04/27/2010', 'M', 48477.44, NULL);
INSERT INTO employees VALUES (758331, 'Katharine', 'Sexcey', 'ksexcey8@harvard.edu', '03/07/2014', 'F', 23772.12, NULL);
INSERT INTO employees VALUES (561012, 'Barton', 'Lilow', 'bliliw9@cam.ac.uk', '08/17/2015', 'M', 15083.87, NULL);


-- Shops Table
INSERT INTO shops VALUES (1, 'Common Grounds', NULL);
INSERT INTO shops VALUES (2, 'Early Rise', NULL);
INSERT INTO shops VALUES (3, 'Ancient Bean', NULL);
INSERT INTO shops VALUES (4, 'Urban Grind', NULL);
INSERT INTO shops VALUES (5, 'Trembling Cup', NULL);


-- Locations Table
INSERT INTO locations VALUES (1, 'Los Angeles', 'United States');
INSERT INTO locations VALUES (2, 'New York', 'United States');
INSERT INTO locations VALUES (3, 'London', 'United Kingdom');


-- Suppliers Table
INSERT INTO suppliers VALUES (1, 'Beans and Barley', 'Arabica');
INSERT INTO suppliers VALUES (1, 'Cool Beans', 'Robusta');
INSERT INTO suppliers VALUES (1, 'Vanilla Bean', 'Liberica');
INSERT INTO suppliers VALUES (2, 'Beans and Barley', 'Arabica');
INSERT INTO suppliers VALUES (2, 'Cool Beans', 'Robusta');
INSERT INTO suppliers VALUES (2, 'Bean Me Up', 'Excelsa');
INSERT INTO suppliers VALUES (2, 'Vanilla Bean', 'Liberica');
INSERT INTO suppliers VALUES (3, 'Cool Beans', 'Robusta');
INSERT INTO suppliers VALUES (3, 'Beans and Barley', 'Arabica');
INSERT INTO suppliers VALUES (3, 'Vanilla Bean', 'Liberica');
INSERT INTO suppliers VALUES (4, 'Bean Me Up', 'Excelsa');
INSERT INTO suppliers VALUES (4, 'Beans and Barley', 'Arabica');
INSERT INTO suppliers VALUES (5, 'Vanilla Bean', 'Liberica');
INSERT INTO suppliers VALUES (5, 'Bean Me Up', 'Excelsa');


-- Update records with NULL data
-- Emplyees Table
UPDATE employees SET coffeeshop_id = 1 WHERE employee_id in (501559, 144108);
UPDATE employees SET coffeeshop_id = 2 WHERE employee_id in (782284);
UPDATE employees SET coffeeshop_id = 3 WHERE employee_id in (225709, 614903, 590293);
UPDATE employees SET coffeeshop_id = 4 WHERE employee_id in (243999, 599230);
UPDATE employees SET coffeeshop_id = 5 WHERE employee_id in (758331, 561012);


-- Shops Table
UPDATE shops SET city_id = 1 WHERE coffeeshop_id in (1, 4);
UPDATE shops SET city_id = 2 WHERE coffeeshop_id in (2, 5);
UPDATE shops SET city_id = 3 WHERE coffeeshop_id in (3);

=================================================================================================================================
								DQL/DRL
=================================================================================================================================

select * from employees;
select * from shops;
select * from locations;
select * from suppliers;


-- Get all records of emplyees that make more than 50k
select * from employees where salary > 50000;


-- Get all emplyees that work for Common Grunds coffee shop
select * from employees where coffeeshop_id = 1;


-- Get all emplyees that work for Common Grunds coffee shop and make more than 50k
select * from employees where coffeeshop_id = 1 and salary > 50000;


-- Get all emplyees that work for Common Grunds coffee shop or make more than 50k
select * from employees where coffeeshop_id = 1 or salary > 50000;


-- Get all emplyees that work for Common Grunds, make more than 50k and are Males
select * from employees where coffeeshop_id = 1 and salary > 50000 and gender = 'M';


-- Get all suppliers that are from Beans and Barley
select * from suppliers where supplier_name = 'Beans and Barley';


-- Get all records of emplyees that make more than 50k
select * from employees where salary > 50000;


-- Get all emplyees that work for Common Grunds coffee shop
select * from employees where coffeeshop_id = 1;


-- Get all emplyees that work for Common Grunds coffee shop and make more than 50k
select * from employees where coffeeshop_id = 1 and salary > 50000;


-- Get all emplyees that work for Common Grunds coffee shop or make more than 50k
select * from employees where coffeeshop_id = 1 or salary > 50000;


-- Get all emplyees that work for Common Grunds, make more than 50k and are Males
select * from employees where coffeeshop_id = 1 and salary > 50000 and gender = 'M';


-- Get all suppliers that are with Beans and Barley
select * from suppliers where supplier_name = 'Beans and Barley';


-- Get all records of suppliers that are not with Beans and Barley
select * from suppliers where supplier_name <> 'Beans and Barley';


-- Get all suppliers with Robusta and Arabica coffee types
select * from suppliers where coffee_type in ('Robusta', 'Arabica');


-- Get all suppliers that do not have Robusta and Arabica coffee types
select * from suppliers where coffee_type not in ('Robusta', 'Arabica');


-- Get all employees that do not have a email address
select * from employees where email is null;


-- Get all employees that have a email address
select * from employees where email is not null;


-- Get all employees that have a salary between 35k and 50k
select * from employees where salary between 35000 and 50000;


-- Order by salary ascending
select * from employees order by salary asc;


-- Order by salary descending
select * from employees order by salary desc;


-- Get the top 10 highest paid employees
select * from employees order by salary desc limit 10;


-- Return all unique coffee shop ids
select distinct coffeeshop_id from employees;


-- Return all unique countries
select distinct country from locations;


-- Extract 
select extract(year from hire_date) as year,
	   extract(month from hire_date) as month,
	   extract(day from hire_date) as day
from employees;


-- Uppercase the first and last names of the emplyees
select upper(first_name) as employee_first_name,
	   first_name,
	   upper(last_name) as employee_last_name,
	   last_name
from employees;


-- Lowercase first and last name
select lower(first_name) as employee_first_name,
	   first_name,
	   lower(last_name) as employee_last_name,
	   last_name
from employees;


-- Return the lengths of the email
select length(email) as email_length,
	   email
from employees;


-- Trim 
select length('           Hello         ') as hello_with_spaces,
	   length('Hello') as hello_without_spaces,
	   length(trim('           Hello         ')) as hello_with_trim;



-- Combine the first name and last name to create a full name
select first_name || ' ' || last_name as full_name 
from employees;


-- Create a sentence that invovles the first and last name along with how much they make a year 
select first_name || ' ' || last_name || ' makes ' || salary || ' per year.' 
from employees;


-- Boolean Expressions
-- If an employee makes less than 50k, then true, else false
select first_name || ' ' || last_name as full_name,
	   (salary > 50000) as less_than_50k
from employees;


-- If the employee is a female and makes less than 50k, then true, else false
select first_name || ' ' || last_name as full_name,
	   (salary > 50000 and gender = 'F') as less_than_50k_female
from employees;


-- If email has '.com', return true, else false
select first_name || ' ' || last_name as full_name,
	   (email like '%.com') as valid_email
from employees;


-- If email has '.gov', return true, else false
select first_name || ' ' || last_name as full_name,
	   (email like '%.gov') as government_email,
	   email
from employees;


-- Get the email from the 5th character
select substring(email, 5) as fifth_char,
	   email
from employees;


-- Find the posistion of the '@' symbol in the email
select position('@' in email) as email_position,
	  email
from employees;


-- Extract the email name only from the email, so everything after the '@' symbol
select substring(email, position('@' in email) + 1) as email_name,
	   email
from employees;


-- Fill in missing emails with a text of your choosing
select coalesce(email, 'No email') as missing_email,
	   email
from employees;


-- Get the least salary per year
select min(salary) as minimum_salary
from employees;


-- Get the max salary per year
select max(salary) as maximum_salary
from employees;


-- Find the difference between the maximum salary and the minimum salary
select max(salary) - min(salary) as salary_difference 
from employees;


-- Find the average salary
select avg(salary) as average_salary 
from employees;


-- Round the average salary to the nearest integer
select round(avg(salary), 0) as average_salary
from employees;


-- Get the total amount of salaries
select sum(salary) as total_salary 
from employees;


-- Get the number of entries
select count(*) as number_of_entries 
from employees;

select count(salary) as number_of_salaries 
from employees;

select count(email) as number_of_emails 
from employees;


-- Get the number of employees for each coffeeshop
select count(*) as number_of_employees,
	   coffeeshop_id
from employees
group by coffeeshop_id;


-- Get the total salaries for each coffeeshop
select sum(salary) as total_salary,
	   coffeeshop_id
from employees
group by coffeeshop_id;


-- Get the number of employees, the average, minimum and total salaries for each coffeeshop
select coffeeshop_id,
	   count(*) as number_of_employees
	   sum(salary) as total_salary,
	   round(avg(salary), 2) as average_salary,
	   min(salary) as minimum_salary,
	   max(salary) as maximum_salary
from employees
group by coffeeshop_id
order by number_of_employees desc;


-- Return only the coffeeshops that have more than 200 employees
select count(*) as number_of_employees,
	   coffeeshop_id
from employees
group by coffeeshop_id
having number_of_employees > 200;


-- Return only coffeeshops with a minimum salary of less than 10k
select min(salary) as minimum_salary,
	   coffeeshop_id
from employees
group by coffeeshop_id
having min(salary) > 10000
order by minimum_salary desc;


-- If pay is less than 50k, then low pay, otherwise high pay
select employee_id,
	   first_name,
	   last_name,
	   email,
	   salary,
	   case when salary < 50000 then 'Low Pay' else 'High Pay' end as pay_status
from employees
order by salary desc;


/* 
   If pay is less than 20k, then low pay, if between 20k-50k inclusive, then medium pay, if over 50k, 
   then high pay
*/
select employee_id,
	   first_name,
	   last_name,
	   coalesce(email, 'No Email Provided'),
	   salary,
	   case when salary < 20000 then 'Low Pay'
	   		when salary between 20000 and 50000 then 'Medium Pay'
	   		else 'High Pay' 
	   end as pay_status
from employees
order by salary desc;


-- Return the number of employees from each pay category
select a.pay_status,
	   count(*) as number_of_employees
from (
	select employee_id,
	   	   first_name,
	       last_name,
	   	   coalesce(email, 'No Email Provided'),
	   	   salary,
	   	   case when salary < 20000 then 'Low Pay'
		   		when salary between 20000 and 50000 then 'Medium Pay'
	   			else 'High Pay' 
	   	   end as pay_status
	from employees
) a
group by a.pay_status;
