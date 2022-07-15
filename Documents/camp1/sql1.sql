--creating the database
CREATE DATABASE EMPDEP
--using that db
USE empdep


--creating a table
CREATE TABLE employee(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(45),
pay INT,
dpt_id INT,
CONSTRAINT emp_fk_key
	FOREIGN KEY (dpt_id)
	REFERENCES dept(dept_id)
);

--creating another table named department
CREATE TABLE dept(
dept_id INT IDENTITY PRIMARY KEY,
dept_name VARCHAR(45)
);

--inserting values into table employee
INSERT INTO employee VALUES
(001,'Dilip',3000,1),
(002,'Fahad',4000,2),
(003,'Lal',6000,3),
(004,'Nivin',2000,1),
(005,'Vijay',9000,2),
(006,'Anu',5000,4),
(007,'Nimisha',5000,2),
(008,'Praveena',8000,3)

--to display the inserted value
SELECT * FROM employee;

--insert values into department
INSERT INTO dept VALUES
('IT'),
('Sales'),
('Marketing'),
('Hr')

SELECT * FROM dept;


--SELECT *
--FROM employee
--INNER JOIN dept on dept.dept_id=employee.dept_id;

--DIPLAY

--Q1.total employess

SELECT COUNT(emp_id) AS 'TotalNoOfEmployees'
FROM employee;

--Q2.Total amount required to pay all employees

SELECT SUM(pay) AS 'TotalPayment'
FROM employee;

--q3.avg min and max payment of the organisation

SELECT AVG(pay) AS 'Avg payment',MIN(pay) AS 'MinimumPayment',Max(pay) AS 'MaximumPayment'
FROM employee;

--Q4. Each Department wise total paySELECT dept.dept_name,SUM(employee.pay) AS 'TotalPay'FROM employeeINNER JOIN dept ON employee.dpt_id=dept.dept_idGROUP BY dept.dept_name--q5.Average, minimum and maximum pay department-wise.SELECT dept.dept_name,AVG(employee.pay) AS 'AVGPay',MIN(employee.pay) AS 'MinimumPay',Max(employee.pay)AS 'MaxPay'FROM employeeINNER JOIN dept ON employee.dpt_id=dept.dept_idGROUP BY dept.dept_name--q6.Employee details who earns the maximum pay.SELECT *FROM employeeWHERE PAY=(SELECT MAX(PAY)			FROM employee)--q7.Employee details who is having a maximum pay in the department.SELECT emp_id, emp_name, pay, Dept.dept_name FROM Employee
RIGHT JOIN(
    SELECT dpt_id, MAX(pay) AS max_pay
    FROM Employee
    GROUP BY dpt_id
) AS sub ON Employee.pay = sub.max_pay AND Employee.dpt_id = sub.dpt_id
JOIN Dept ON Employee.dpt_id = Dept.dept_id--9.) Employee who has more pay than the average pay of his department--10)Unique departments in the companySELECT DISTINCT dept_nameFROM DEPT;--11)Employees In increasing order of paySELECT *FROM employeeORDER BY pay --12)Department In increasing order of paySELECT dept.dept_name,SUM(employee.pay) AS 'TotalPay'FROM employeeINNER JOIN dept ON employee.dpt_id=dept.dept_idGROUP BY dept.dept_nameORDER by SUM(employee.pay) 