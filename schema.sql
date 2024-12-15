-- a. Create a view that shows the name, street, and city of all employees who work for “First Bank Corporation.”
CREATE OR REPLACE VIEW FirstBankEmployees AS
SELECT E.Employee_name, E.street, E.city
FROM Employee E
JOIN Works W ON E.Employee_name = W.Employee_name
WHERE W.company_name = 'First Bank Corporation';

SELECT * FROM FirstBankEmployees;

-- b. Create a view that shows the name of each company, the city it is located in, and the average salary of its employees.
CREATE OR REPLACE VIEW CompanyAverageSalaries AS
SELECT C.company_name, C.city, AVG(W.salary) AS avg_salary
FROM Company C
JOIN Works W ON C.company_name = W.company_name
GROUP BY C.company_name, C.city;

SELECT * FROM CompanyAverageSalaries;

-- c. Using the views created in parts (a) and (b), find the names of all employees who live in the same city as the company for which they work.
SELECT E.Employee_name
FROM FirstBankEmployees E
JOIN CompanyAverageSalaries C ON E.city = C.city AND C.company_name = 'First Bank Corporation';