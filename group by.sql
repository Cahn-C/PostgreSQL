/*
*  How many people were hired on did we hire on any given hire date?
*  Database: Employees
*  Table: Employees
*/
select hire_date, count(emp_no) as number_of_employees from employees group by hire_date order by 2 desc;


/*
*  Show me all the employees, hired after 1991 and count the amount of positions they've had
*  Database: Employees
*/
select e.hire_date, count(t.title) as number_of_titles
from employees as e inner join titles as t
on t.emp_no = e.emp_no
where extract(year from hire_date) > 1991
group by e.hire_date
order by 2 desc;


/*
*  Show me the number of employees that work in the development department and the from and to date.
*  Database: Employees
*/
select de.from_date, de.to_date, count(e.emp_no) as number_of_employees
from employees as e
inner join dept_emp as de on de.emp_no = e.emp_no
inner join departments as d on d.dept_no = de.dept_no
where d.dept_name = 'Development'
group by de.from_date, de.to_date
order by 3 desc;

