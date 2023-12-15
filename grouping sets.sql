/*
*  Calculate the total amount of employees per department and the total using grouping sets
*  Database: Employees
*  Table: Employees
*/
select d.dept_name, count(e.emp_no) as number_of_employees
from employees as e 
inner join dept_emp as de   on de.emp_no = e.emp_no
inner join departments as d on de.dept_no = d.dept_no
group by grouping sets (
	d.dept_name,
	()
)
order by 1 desc;



/*
*  Calculate the total average salary per department and the total using grouping sets
*  Database: Employees
*  Table: Employees
*/
select d.dept_name, avg(s.salary) as average_salaries
from employees as e
inner join salaries as s  	on s.emp_no = e.emp_no
inner join dept_emp as de 	on s.emp_no = de.emp_no
inner join departments as d on de.dept_no = d.dept_no
group by grouping sets (
	d.dept_name,
	()
)
order by d.dept_name;

