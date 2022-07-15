CREATE DATABASE hmm;

USE hmm;

--Create table Department
CREATE TABLE Department(
    deptno INT NOT NULL PRIMARY KEY,
    dname VARCHAR(20),
    loc VARCHAR(20)
);

CREATE TABLE Employee(
    empno INT NOT NULL PRIMARY KEY,
    ename VARCHAR(20),
    jobid VARCHAR(20),
    mgr INT,
    hiredate DATE,
    sal MONEY,
    commission MONEY,
    deptno INT NOT NULL,
    CONSTRAINT dept_fk
        FOREIGN KEY (deptno)
        REFERENCES Department(deptno)
);


--Insert data into tables
INSERT INTO Department VALUES
    (10, 'ACCOUNTING', 'NEW YORK'),
    (20, 'RESEARCH', 'DALLAS'),
    (30, 'SALES', 'CHICAGO'),
    (40, 'OPERATIONS', 'BOSTON');

INSERT INTO Employee VALUES
    (7839, 'KING', 'PRESIDENT', NULL, '11/17/1981', 5000, NULL, 10),
    (7698, 'BLAKE', 'MANAGER', 7839, '05/01/1981', 2850, NULL, 30),
    (7782, 'CLARK', 'MANAGER', 7839, '06/09/1981', 2450, NULL, 10),
    (7566, 'JONES', 'MANAGER', 7839, '04/02/1981', 2975, NULL, 20),
    (7788, 'SCOTT', 'ANALYST', 7566, '12/09/1982', 3000, NULL, 20),
    (7902, 'FORD', 'ANALYST', 7566, '12/03/1981', 3000, NULL, 20),
    (7369, 'SMITH', 'CLERK', 7902, '12/17/1980', 800,  NULL,20),
    (7499, 'ALLEN', 'SALESMAN', 7698, '02/20/1981', 1600 ,300, 30),
    (7521, 'WARD', 'SALESMAN', 7698, '02/22/1981', 1250 ,500, 30),
    (7654, 'MARTIN', 'SALESMAN', 7698, '09/28/1981', 1250 ,1400, 30),
    (7844, 'TURNER', 'SALESMAN', 7698, '09/08/1981', 1500, NULL, 30),
    (7876, 'ADAMS', 'CLERK', 7788, '01/12/1983', 1100, NULL, 20),
    (7900, 'JAMES', 'CLERK', 7698, '12/03/1981', 950, NULL, 30),
    (7934, 'MILLER', 'CLERK', 7782, '01/23/1982', 1300, NULL, 10);

	SELECT * FROM employee;
	SELECT * FROM Department;
--q1.Names of employees who are manager.

SELECT ename 
FROM employee
WHERE jobid='MANAGER';

--q2.List the name of all employees along with their department name and Annual Income.

SELECT employee.ename,department.dname,(employee.sal * 12) AS 'AnnualSal'
FROM employee
JOIN Department ON Department.deptno=Employee.deptno;

--q3.Names of departments and names of employees. Names of departments in ascending order. Within the same department, employee name should be in the
--descending orderSELECT Department.dname,employee.enameFROM DepartmentJOIN Employee  ON employee.deptno=department.deptnoORDER BY Department.dname ASC,Employee.ename DESC--q4.employee name and departmentname of employees who either works in a Toy or Shoe department--q5.Name concatenated with department, separated by comma and space and name column Employee and departmentSELECT CONCAT(employee.ename,'  , ',department.dname) AS 'Employee and department'FROM DepartmentJOIN Employee  ON employee.deptno=department.deptno--q6. display name, job, department number and department name for all employees who work in DALLAS.SELECT Employee.ename,Employee.jobid,Employee.deptno,Department.dnameFROM DepartmentJOIN Employee  ON employee.deptno=department.deptno AND Department.loc='DALLAS'--q7.List the names of all employees along with name of managersSELECT e1.ename AS 'Employee' ,e2.ename AS 'Manager'FROM employee e1,Employee e2WHERE e2.empno = e1.mgr--q8.all employee name, manager number and manager name of all employees including King who have no managerSELECT e1.ename as 'employee',e2.mgr,e2.ename as 'manager'FROM employee e1,Employee e2WHERE e2.empno = e1.mgr--q9.Display employee name, department number and all employees that work in same
--department as a given employee (‘Mathew’)

SELECT employee.ename,Department.deptno
FROM DepartmentJOIN Employee  ON employee.deptno=Department.deptno AND employee.deptno=(SELECT deptno FROM Employee WHERE ename='mathew');--q10.Create a unique listing of all jobs that are in department 30. Include location
--of department 30 in the output.
SELECT DISTINCT(employee.jobid),Department.loc
FROM DepartmentJOIN Employee  ON employee.deptno=Department.deptno AND Department.deptno=30;