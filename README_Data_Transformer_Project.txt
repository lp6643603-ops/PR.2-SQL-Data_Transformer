DATA TRANSFORMER PROJECT
========================

PROJECT OVERVIEW
----------------
This project is a MySQL database project named `data_transformer`.
It demonstrates database creation, table creation, data insertion, joins,
subqueries, date functions, string functions, window functions, and CASE
statements.

DATABASE
--------
Database Name: data_transformer

TABLES
------
1. Customers
   - CustomerID
   - FirstName
   - LastName
   - Email
   - RegistrationDate

2. Orders
   - OrderID
   - CustomerID
   - OrderDate
   - TotalAmount
   - CustomerID is connected to Customers through a foreign key.

3. Employees
   - EmployeeID
   - FirstName
   - LastName
   - Department
   - HireDate
   - Salary

PROJECT OPERATIONS
------------------
1. Database Creation
   Creates the `data_transformer` database and selects it for use.

2. Customers Table
   Creates the Customers table and inserts two customer records.

3. Orders Table
   Creates the Orders table and inserts two order records.
   The CustomerID foreign key connects Orders with Customers.

4. Employees Table
   Creates the Employees table and inserts two employee records.

5. Inner Join
   Combines Orders and Customers and displays matching customer and order
   information.

6. Left Join
   Displays all customers and their matching orders when available.

7. Right Join
   Displays all orders and their matching customer information.

8. Union of Left and Right Joins
   Combines the results of the left join and right join.

9. Subquery with Average Order Amount
   Finds customers whose orders have an amount greater than the average
   order amount.

10. Employee Salary Subquery
    Finds employees whose salary is greater than the average employee salary.

11. Date Functions
    Uses YEAR() and MONTH() to extract the year and month from OrderDate.

12. Date Difference
    Uses DATEDIFF() to calculate the difference between the current date
    and each order date.

13. Date Formatting
    Uses DATE_FORMAT() to display OrderDate in the format day-month-year.

14. CONCAT Function
    Combines an employee's first name and last name into FullName.

15. REPLACE Function
    Replaces the name 'John' with 'Jonathan' in the FirstName result.

16. UPPER and LOWER Functions
    Converts FirstName to uppercase and LastName to lowercase.

17. TRIM Function
    Removes extra spaces from the Email value.

18. Running Total
    Uses SUM() with a window function to calculate a running total of
    order amounts according to OrderDate and OrderID.

19. Order Ranking
    Uses RANK() to rank orders according to TotalAmount in descending order.

20. Order Discount using CASE
    Assigns a discount category:
    - Above 700: 10% Off
    - Above 500: 5% Off
    - Otherwise: No Discount

21. Employee Salary Category using CASE
    Categorizes salaries as:
    - 70000 or more: High
    - 50000 or more: Medium
    - Otherwise: Low

HOW TO RUN
----------
1. Open MySQL Workbench.
2. Open a new SQL tab.
3. Copy and paste the project SQL code.
4. Run the complete script.
5. Check the output of each SELECT query one by one.

PURPOSE
-------
The purpose of this project is to demonstrate practical MySQL operations
and data transformation techniques using customers, orders, and employee
data.
