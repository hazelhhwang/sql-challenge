-- Table: departments
CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(40) NOT NULL
);

COPY departments FROM 'C:/Users/jeong/Desktop/DA/sql-challenge/EmpolyeeSQL/departments.csv' DELIMITER ',' CSV HEADER;


-- Table: employees
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(10) REFERENCES titles(title_id),
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

SET datestyle = 'ISO, MDY';

COPY employees FROM 'C:/Users/jeong/Desktop/DA/sql-challenge/EmpolyeeSQL/employees.csv' DELIMITER ',' CSV HEADER;


-- Table: salaries
CREATE TABLE salaries (
    emp_no INT REFERENCES employees(emp_no),
    salary INT NOT NULL
);

COPY salaries FROM 'C:/Users/jeong/Desktop/DA/sql-challenge/EmpolyeeSQL/salaries.csv' DELIMITER ',' CSV HEADER;


-- Table: titles
CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

COPY titles FROM 'C:/Users/jeong/Desktop/DA/sql-challenge/EmpolyeeSQL/titles.csv' DELIMITER ',' CSV HEADER;


-- Table: dept_emp
CREATE TABLE dept_emp (
    emp_no INT REFERENCES employees(emp_no),
    dept_no VARCHAR(4) REFERENCES departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

COPY dept_emp FROM 'C:/Users/jeong/Desktop/DA/sql-challenge/EmpolyeeSQL/dept_emp.csv' DELIMITER ',' CSV HEADER;


-- Table: dept_manager
CREATE TABLE dept_manager (
    emp_no INT REFERENCES employees(emp_no),
    dept_no VARCHAR(4) REFERENCES departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

COPY dept_manager FROM 'C:/Users/jeong/Desktop/DA/sql-challenge/EmpolyeeSQL/dept_manager.csv' DELIMITER ',' CSV HEADER;

