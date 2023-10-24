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
