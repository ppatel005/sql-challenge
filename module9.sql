create table departments(
	dept_no varchar Primary Key, 
	dept_name varchar UNIQUE NOT null
);
select * from departments; 

drop table if exists titles 
create table titles( 
	titles_id varchar PRIMARY KEY, 
	title varchar UNIQUE NOT null
);
select * from titles; 

drop table if exists employees; 
create table employees(
	emp_no INT PRIMARY KEY NOT null,
	emp_title_id varchar(8) NOT null,
	birth_date date NOT null,
	first_name varchar(32) NOT null,
	last_name varchar(32) NOT null,
	sex varchar(1) NOT null,
	hire_date date NOT null,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);
select * from employees;

drop table if exists salaries;
create table salaries(
	emp_no INT PRIMARY KEY,
	salary INT NOT null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
select * from salaries;


drop table if exists dept_emp;
create table dept_emp(
	emp_no INT, 
	dept_no varchar NOT null, 
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
select * from dept_emp;

drop table if exists dept_manager;
Create table dept_manager(
	dept_no varchar NOT null, 
	emp_no INT NOT null, 
	PRIMARY KEY (dept_no, emp_no), 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
select * from dept_manager;

