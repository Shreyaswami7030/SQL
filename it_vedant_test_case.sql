create database test_case;
use test_case;

CREATE TABLE EmployeeInfo (
    EmpID INT PRIMARY KEY,
    EmpFname VARCHAR(50),
    EmpLname VARCHAR(50),
    Department VARCHAR(50),
    Project VARCHAR(50),
    Address VARCHAR(50),
    DOB DATE,
    Gender CHAR(1)
);

INSERT INTO EmployeeInfo (EmpID, EmpFname, EmpLname, Department, Project, Address, DOB, Gender) VALUES
(1, 'Sanjay', 'Mehra', 'HR', 'P1', 'Hyderabad(HYD)', '1976-12-01', 'M'),
(2, 'Ananya', 'Mishra', 'Admin', 'P2', 'Delhi(DEL)', '1968-05-02', 'F'),
(3, 'Rohan', 'Diwan', 'Account', 'P3', 'Mumbai(BOM)', '1980-01-01', 'M'),
(4, 'Sonia', 'Kulkarni', 'HR', 'P1', 'Hyderabad(HYD)', '1992-05-02', 'F'),
(5, 'Ankit', 'Kapoor', 'Admin', 'P2', 'Delhi(DEL)', '1994-07-03', 'M');


CREATE TABLE EmployeePosition (
    EmpID INT,
    EmpPosition VARCHAR(50),
    DateOfJoining DATE,
    Salary DECIMAL(10, 2)
);

INSERT INTO EmployeePosition (EmpID, EmpPosition, DateOfJoining, Salary) VALUES
(1, 'Manager', '2022-05-01', 500000),
(2, 'Executive', '2022-05-02', 75000),
(3, 'Manager', '2022-05-01', 90000),
(2, 'Lead', '2022-05-02', 85000),
(1, 'Executive', '2022-05-01', 300000);

-- 1 Fetch the EmpFname from the EmployeeInfo table in uppercase and use the ALIAS name as EmpName:

SELECT UPPER(EmpFname) AS EmpName FROM EmployeeInfo;
-- 2 Fetch the number of employees working in the department ‘HR’:

sql
Copy code
SELECT COUNT(*) FROM EmployeeInfo WHERE Department = 'HR';
Get the current date:

sql
Copy code
SELECT CURDATE();
Retrieve the first four characters of EmpLname from the EmployeeInfo table:

sql
Copy code
SELECT LEFT(EmpLname, 4) FROM EmployeeInfo;
Create a new table which consists of data and structure copied from the other table:

sql
Copy code
CREATE TABLE NewEmployeeInfo AS SELECT * FROM EmployeeInfo;
Find all the employees whose salary is between 50000 to 100000:

sql
Copy code
SELECT * FROM EmployeePosition WHERE Salary BETWEEN 50000 AND 100000;
Find the names of employees that begin with ‘S’:

sql
Copy code
SELECT EmpFname FROM EmployeeInfo WHERE EmpFname LIKE 'S%';
Fetch top 4 records from the EmployeeInfo table:

sql
Copy code
SELECT * FROM EmployeeInfo LIMIT 4;
Retrieve the EmpFname and EmpLname in a single column as “FullName”:

sql
Copy code
SELECT CONCAT(EmpFname, ' ', EmpLname) AS FullName FROM EmployeeInfo;
Find the number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender:

sql
Copy code
SELECT Gender, COUNT(*) AS EmployeeCount 
FROM EmployeeInfo 
WHERE DOB BETWEEN '1970-05-02' AND '1975-12-31' 
GROUP BY Gender;
Fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order:

sql
Copy code
SELECT * FROM EmployeeInfo ORDER BY EmpLname DESC, Department ASC;
Fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets:

sql
Copy code
SELECT * FROM EmployeeInfo WHERE EmpLname LIKE '____A';
Fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia”:

sql
Copy code
SELECT * FROM EmployeeInfo WHERE EmpFname NOT IN ('Sanjay', 'Sonia');
Fetch details of employees with the address as “DELHI(DEL)”:

sql
Copy code
SELECT * FROM EmployeeInfo WHERE Address = 'Delhi(DEL)';
Fetch all employees who also hold the managerial position:

sql
Copy code
SELECT EI.* 
FROM EmployeeInfo EI 
JOIN EmployeePosition EP ON EI.EmpID = EP.EmpID 
WHERE EP.EmpPosition = 'Manager';
Fetch the department-wise count of employees sorted by department’s count in ascending order:

sql
Copy code
SELECT Department, COUNT(*) AS EmployeeCount 
FROM EmployeeInfo 
GROUP BY Department 
ORDER BY EmployeeCount ASC;
Retrieve two minimum and maximum salaries from the EmployeePosition table:

sql
Copy code
(SELECT Salary FROM EmployeePosition ORDER BY Salary ASC LIMIT 2)
UNION
(SELECT Salary FROM EmployeePosition ORDER BY Salary DESC LIMIT 2);
Find the 5th highest salary from the table:

sql
Copy code
SELECT Salary FROM EmployeePosition ORDER BY Salary DESC LIMIT 1 OFFSET 4;
Retrieve duplicate records from a table:

sql
Copy code
SELECT EmpID, COUNT(*) 
FROM EmployeeInfo 
GROUP BY EmpID 
HAVING COUNT(*) > 1;
Retrieve the list of employees working in the same department:

sql
Copy code
SELECT * 
FROM EmployeeInfo 
WHERE Department IN (SELECT Department FROM EmployeeInfo GROUP BY Department HAVING COUNT(*) > 1);
Find the third-highest salary from the EmpPosition table:

sql
Copy code
SELECT Salary FROM EmployeePosition ORDER BY Salary DESC LIMIT 1 OFFSET 2;
Display the first and the last record from the EmployeeInfo table:

sql
Copy code
(SELECT * FROM EmployeeInfo ORDER BY EmpID ASC LIMIT 1)
UNION ALL
(SELECT * FROM EmployeeInfo ORDER BY EmpID DESC LIMIT 1);
Retrieve Departments who have less than 2 employees working in it:

sql
Copy code
SELECT Department 
FROM EmployeeInfo 
GROUP BY Department 
HAVING COUNT(*) < 2;
Retrieve EmpPosition along with total salaries paid for each of them:

sql
Copy code
SELECT EmpPosition, SUM(Salary) AS TotalSalary 
FROM EmployeePosition 
GROUP BY EmpPosition;
Fetch 50% records from the EmployeeInfo table:

sql
Copy code
SELECT * FROM EmployeeInfo LIMIT (SELECT COUNT(*) / 2 FROM EmployeeInfo);

