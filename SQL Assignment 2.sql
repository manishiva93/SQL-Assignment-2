use employee;
DROP TABLE Employees;
DROP TABLE departments;
DROP TABLE location;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 18),
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    designation VARCHAR(150),
    hire_date DATE DEFAULT (CURRENT_DATE),
    department_id INT,
    location_id INT,
    email VARCHAR(100),
    salary DECIMAL(10,2),

    CONSTRAINT fk_department
    FOREIGN KEY (department_id)
    REFERENCES Departments(department_id),

    CONSTRAINT fk_location
    FOREIGN KEY (location_id)
    REFERENCES Location(location_id)
);

INSERT INTO Departments (department_id, department_name)
VALUES
(1, 'Software Development'),
(2, 'Marketing'),
(3, 'Data Science'),
(4, 'Human Resources'),
(5, 'Product Management'),
(6, 'Content Creation'),
(7, 'Finance'),
(8, 'Design'),
(9, 'Research and Development'),
(10, 'Customer Support'),
(11, 'Business Development'),
(12, 'IT'),
(13, 'Operations');

INSERT INTO Location (location_name)
VALUES
('Chennai'),
('Bangalore'),
('Hyderabad'),
('Pune');

INSERT INTO Employees
(employee_id, employee_name, age, gender, hire_date,
 designation, department_id, location_id, salary)
VALUES
(5001, 'Vihaan Singh', 27, 'M', '2015-01-20', 'Data Analyst', 3, 4, 60000),
(5002, 'Reyansh Singh', 31, 'M', '2015-03-10', 'Network Engineer', 12, 1, 80000),
(5003, 'Aaradhya Iyer', 26, 'F', '2015-05-20', 'Customer Support Executive', 10, 2, 45000),
(5004, 'Kiara Malhotra', 29, 'F', '2015-07-05', NULL, 8, 3, 70000),
(5005, 'Anvi Chaudhary', 25, 'F', '2015-09-11', 'Business Development Executive', 11, 1, 55000),
(5006, 'Dhruv Shetty', 28, 'M', '2015-11-20', 'UI Developer', 8, 2, 65000),
(5007, 'Anushka Singh', 32, 'F', '2016-01-15', 'Marketing Manager', 2, 3, 90000),
(5008, 'Diya Jha', 27, 'F', '2016-03-05', 'Graphic Designer', 8, 4, 70000),
(5009, 'Kiaan Desai', 30, 'M', '2016-05-20', 'Sales Executive', 11, 3, 55000),
(5010, 'Atharv Yadav', 29, 'M', '2016-07-10', 'Systems Administrator', 12, 4, 80000),
(5011, 'Saanvi Patel', 28, 'F', '2016-09-20', 'Marketing Analyst', 2, 1, 60000),
(5012, 'Myra Verma', 26, 'F', '2016-11-05', 'Operations Manager', 13, 2, 95000),
(5013, 'Arnav Rao', 33, 'M', '2017-01-20', 'Customer Success Manager', 10, 3, 75000),
(5014, 'Vihaan Mohan', 30, 'M', '2017-03-10', 'Supply Chain Analyst', 10, 2, 60000),
(5015, 'Ishaan Kumar', 27, 'M', '2017-05-20', 'Financial Analyst', 7, 1, 85000),
(5016, 'Zoya Khan', 31, 'F', '2017-07-05', 'Legal Counsel', 4, 4, 100000),
(5017, 'Kabir Nair', 28, 'M', '2017-09-11', 'IT Support Specialist', 12, 2, 80000),
(5018, 'Ishan Mishra', 25, 'M', '2017-11-20', 'Research Scientist', 9, 3, 75000),
(5019, 'Ishika Patel', 29, 'F', '2018-01-15', 'Talent Acquisition Specialist', 4, 4, 55000),
(5020, 'Aarav Nair', 32, 'M', '2018-03-05', 'Software Engineer', 1, 1, 90000),
(5021, 'Advik Kapoor', 26, 'M', '2018-05-20', 'Finance Analyst', 7, 3, 85000),
(5022, 'Aadhya Iyengar', 28, 'F', '2018-07-10', 'HR Specialist', 4, 4, 60000),
(5023, 'Anika Paul', 30, 'F', '2018-09-20', 'Public Relations Specialist', 2, 2, 70000),
(5024, 'Aryan Shetty', 27, 'M', '2018-11-05', 'Product Manager', 5, 1, 95000),
(5025, 'Avni Iyengar', 31, 'F', '2019-01-20', 'Data Scientist', 3, 4, 100000),
(5026, 'Vivaan Singh', 29, 'M', '2019-03-10', 'Business Analyst', 3, 2, 75000),
(5027, 'Ananya Paul', 32, 'F', '2019-05-20', 'Content Writer', 6, 3, 60000),
(5028, 'Anaya Kapoor', 26, 'F', '2019-07-05', 'Event Coordinator', 6, 1, 60000),
(5029, 'Arjun Kumar', 33, 'M', '2019-09-11', 'Quality Assurance Analyst', 12, 2, 80000),
(5030, 'Sara Iyer', 28, 'F', '2019-11-20', 'Project Manager', 5, 1, 90000);

SELECT * FROM Departments;

SELECT * FROM Location;

SELECT * FROM Employees;

ALTER TABLE Employees
DROP COLUMN email;

-- Using Distinct
SELECT DISTINCT salary FROM Employees;

-- Alias (AS)
SELECT age as Employee_Age, salary as Employee_Salary FROM Employees;

-- WHERE Clause & Operators
SELECT * FROM Employees 
WHERE salary > 50000 AND hire_date < '2016-01-01';

-- designation is missing and fill it with "Data Scientist".
SELECT * FROM Employees
WHERE designation IS NULL;

UPDATE Employees
SET designation = 'Data Scientist'
WHERE employee_id = 5004;

-- Sorting and Grouping Data
-- ORDER BY
SELECT * FROM Employees ORDER BY department_id ASC, salary DESC;

-- Using LIMIT
SELECT * FROM Employees
WHERE hire_date >= '2018-01-01' AND hire_date < '2019-01-01'
ORDER BY hire_date ASC LIMIT 5;

-- Aggregate Functions
-- Calculate the sum of all salaries in the Finance department.
SELECT SUM(e.salary) as Total_Finance_Salary
FROM Employees as e
INNER JOIN Departments as d
ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

-- Find the minimum age among all employees.
SELECT MIN(age) as Minimum_Age
FROM Employees;

-- List the maximum salary for each location.
SELECT l.location_name, MAX(e.salary) as Maximum_Salary
FROM Employees e
INNER JOIN Location l
ON e.location_id = l.location_id
GROUP BY l.location_id, l.location_name;

-- Calculate the average salary for each designation containing the word 'Analyst'.
SELECT designation, AVG(salary) as Average_Salary
FROM Employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;

-- Find departments with less than 3 employees.
SELECT d.department_name,
COUNT(e.employee_id) AS Total_Employees
FROM Departments d
LEFT JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) < 3;

-- Find locations with female employees whose average age is below 30.
SELECT l.location_name, AVG(e.age) AS Average_Age
FROM Location l
INNER JOIN Employees e
ON l.location_id = e.location_id
WHERE e.gender = 'F'
GROUP BY l.location_id, l.location_name
HAVING AVG(e.age) < 30;

-- JOINS
-- INNER JOIN
SELECT e.employee_name, e.designation, d.department_name
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id;

-- Left Join
SELECT d.department_name,
COUNT(e.employee_id) as Total_Employees
FROM Departments d
LEFT JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- RIGHT JOIN
SELECT l.location_name,
e.employee_name
FROM Employees e
RIGHT JOIN Location l
ON e.location_id = l.location_id
ORDER BY l.location_id;

