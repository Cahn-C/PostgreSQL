/*
*  Show me all the employees, hired after 1991, that have had more than 2 titles
*  Database: Employees
*/
select e.hire_date, count(t.title) as number_of_titles
from employees as e inner join titles as t
on e.emp_no = t.emp_no
where extract(year from hire_date) = 1991
group by e.hire_date
having count(t.title) > 2
order by e.hire_date;


/*
*  Show me all the employees that have had more than 15 salary changes that work in the department development
*  Database: Employees
*/
select e.emp_no, count(salary) as number_of_salary_changes
from employees as e
inner join salaries as s  	on e.emp_no = s.emp_no
inner join dept_emp as de 	on s.emp_no = de.emp_no
inner join departments as d on de.dept_no = d.dept_no
where d.dept_name = 'Development'
group by e.emp_no
having count(salary) > 15
order by 2 desc;



/*
*  Show me all the employees that have worked for multiple departments
*  Database: Employees
*/
select e.emp_no, count(d.dept_name) as number_of_departments
from employees as e 
inner join dept_emp as de 	on e.emp_no = de.emp_no
inner join departments as d on de.dept_no = d.dept_no
group by e.emp_no
having count(d.dept_name) > 1
order by 2 desc;

