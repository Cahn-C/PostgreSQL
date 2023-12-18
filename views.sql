/*
*  Create a view "90-95" that:
*  Shows me all the employees, hired between 1990 and 1995
*  Database: Employees
*/
CREATE VIEW "90-95" AS select * from employees where extract(year from hire_date) between 1990 and 1995;

select * from "90-95";



/*
*  Create a view "bigbucks" that:
*  Shows me all employees that have ever had a salary over 80000
*  Database: Employees
*/
CREATE VIEW bigbucks AS 
select e.emp_no,
	   e.first_name,
	   e.last_name,
	   e.birth_date,
	   e.hire_date,
	   s.salary
from employees as e inner join salaries as s
on s.emp_no = e.emp_no
where s.salary > 80000;

select * from bigbucks;