/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/
-- Join
select * from orders as o inner join customers as c 
on c.customerid = o.customerid
where c.state in ('NY', 'OR', 'OH');

-- Subquery
select * from orders 
where customerid in (select customerid from customers where state in ('NY', 'OR', 'OH'));

-- or

select c.firstname, 
	   c.lastname, 
	   c.city, 
	   c.state, 
	   o.totalamount,
	   o.orderdate
from orders as o 
inner join (
	select customerid, firstname, lastname, city, state from customers
	where state in ('NY', 'OR', 'OH')
) as c
on o.customerid = c.customerid;



/*
* DB: Employees
* Table: employees
* Question: Filter employees who have emp_no 110183 as a manager
*/
-- Join
select e.emp_no, 
	   e.first_name, 
	   e.last_name,
	   dm.emp_no as manager_no,
	   (select first_name from employees where emp_no = 110183) as manager_first_name,
	   (select last_name from employees where emp_no = 110183) as manager_lasst_name
from employees as e
inner join dept_emp as de on e.emp_no = de.emp_no
inner join dept_manager as dm on dm.dept_no = de.dept_no
where dm.emp_no = 110183;


-- Subquery
select (select first_name from employees where emp_no = 110183) as manager_first_name,
	   (select last_name from employees where emp_no = 110183) as manager_lasst_name,
	  	* 
from employees
where emp_no in (select emp_no from dept_emp
				 where dept_no in (select dept_no from dept_manager
								   where emp_no = 110183));
								   
								   

