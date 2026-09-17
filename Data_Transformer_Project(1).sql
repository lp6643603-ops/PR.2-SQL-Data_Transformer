Create database data_transformer;
Use data_transformer;

Create table Customers (
    CustomerID int primary key,
    FirstName varchar(50),
    LastName varchar(50),
    Email varchar(100),
    RegistrationDate date
);

Insert into Customers values
(1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02');

Create table Orders (
    OrderID int primary key,
    CustomerID int,
    OrderDate date,
    TotalAmount decimal(10,2),
    foreign key (CustomerID) references Customers(CustomerID)
);

Insert into Orders values
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75);

Create table Employees (
    EmployeeID int primary key,
    FirstName varchar(50),
    LastName varchar(50),
    Department varchar(50),
    HireDate date,
    Salary decimal(10,2)
);

Insert into Employees values
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00);

Select
    o.OrderID,
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email,
    o.OrderDate,
    o.TotalAmount
from Orders o
inner join Customers c
on o.CustomerID = c.CustomerID;

Select
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
from Customers c
left join Orders o
on c.CustomerID = o.CustomerID;

Select
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerID,
    c.FirstName,
    c.LastName
from Customers c
right join Orders o
on c.CustomerID = o.CustomerID;

Select
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
from Customers c
left join Orders o
on c.CustomerID = o.CustomerID
union
Select
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
from Customers c
right join Orders o
on c.CustomerID = o.CustomerID;

Select CustomerID, FirstName, LastName
from Customers
where CustomerID in (
    Select CustomerID
    from Orders
    where TotalAmount > (Select avg(TotalAmount) from Orders)
);

Select EmployeeID, FirstName, LastName, Department, HireDate, Salary
from Employees
where Salary > (Select avg(Salary) from Employees);

Select OrderID, OrderDate,
       year(OrderDate) as OrderYear,
       month(OrderDate) as OrderMonth
from Orders;

Select OrderID, OrderDate,
       datediff(curdate(), OrderDate) as DateDifference
from Orders;

Select OrderID, OrderDate,
       date_format(OrderDate, '%d-%b-%Y') as FormattedOrderDate
from Orders;

Select EmployeeID,
       concat(FirstName, ' ', LastName) as FullName
from Employees;

Select CustomerID, FirstName,
       replace(FirstName, 'John', 'Jonathan') as UpdatedFirstName
from Customers;

Select EmployeeID,
       upper(FirstName) as FirstNameUpper,
       lower(LastName) as LastNameLower
from Employees;

Select CustomerID, Email,
       trim(Email) as TrimmedEmail
from Customers;

Select OrderID, OrderDate, TotalAmount,
       sum(TotalAmount) over (
           order by OrderDate, OrderID
       ) as RunningTotal
from Orders;

Select OrderID, TotalAmount,
       rank() over (order by TotalAmount desc) as OrderRank
from Orders;

Select OrderID, TotalAmount,
       case
           when TotalAmount > 700 then '10% Off'
           when TotalAmount > 500 then '5% Off'
           else 'No Discount'
       end as Discount
from Orders;

Select EmployeeID, FirstName, LastName, Salary,
       case
           when Salary >= 70000 then 'High'
           when Salary >= 50000 then 'Medium'
           else 'Low'
       end as SalaryCategory
from Employees;
