-- Get all employees who are older than 60
select first_name, last_name, birth_date from employees where extract(year from age(birth_date)) > 60;


-- Get the number of employees who were born in Febuary
select count(emp_no) as number_of_employees from employees where extract(month from hire_date) = 2;


-- Get the number of employees who were hired in November
select count(emp_no) as number_of_employees from employees where extract(month from birth_date) = 11;


-- Get the oldest employee
select * 
from employees 
where extract(year from age(birth_date)) = (
	select max(extract(year from age(birth_date))) as age from employees
)
order by birth_date asc; 

-- Check records
select extract(year from age(birth_date)), * from employees order by birth_date asc;


-- Get the number of orders that were purchased in the January 2004 
select count(orderid) as number_of_orders 
from orders 
where extract(year from orderdate) = 2004 
and extract(month from orderdate) = 1;



