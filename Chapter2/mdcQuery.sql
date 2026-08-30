-- Solution --
use mdc_db;

-- Show all data in each of the tables.

SELECT *
FROM customer, invoice, invoice_item;

-- B List the LastName, FirstName, and Phone of all customers. 

SELECT LastName, FirstName, Phone
FROM customer;

-- C List the LastName, FirstName, and Phone for all customers with a FirstName of ‘Nikki’.

SELECT LastName, FirstName, Phone
FROM customer
WHERE FirstName = "Nikki";

-- D List the LastName, FirstName, Phone, DateIn, and DateOut of all orders in excess of $100.00.

SELECT LastName, FirstName, Phone, DateIn, DateOut
FROM customer, invoice
WHERE TotalAmount > 100; 

-- E . List the LastName, FirstName, and Phone of all customers whose first name starts with ‘B’.
SELECT LastName, FirstName, Phone
FROM customer
WHERE FirstName like 'B%';

-- F List the LastName, FirstName, and Phone of all customers whose last name includes the characters ‘cat’.
SELECT LastName, FirstName, Phone 
FROM customer
WHERE LastName like '%cat%';

-- G List the LastName, FirstName, and Phone for all customers whose second and third digits (from the left) of their phone number are 23. For example, any phone number with an area code of “723” would meet the criteria.
SELECT  LastName, FirstName, Phone 
FROM customer
WHERE Phone like '_23%';

-- H Determine the maximum and minimum TotalAmount.
SELECT Max(TotalAmount), Min(TotalAmount)
FROM invoice;

-- I Determine the average TotalAmount.
SELECT Avg(TotalAmount)
FROM invoice;

-- J Count the number of customers.
SELECT count(*)
FROM customer;

-- K Group customers by LastName and then by FirstName.
SELECT LastName ,FirstName
FROM customer
group by LastName ,FirstName;

-- L Count the number of customers having each combination of LastName and FirstName.
SELECT concat(LastName , FirstName)
FROM customer;

-- M Show the LastName, FirstName, and Phone of all customers who have had an order  with TotalAmount greater than $100.00. Use a subquery. Present the results sorted by LastName in ascending order and then FirstName in descending order.
SELECT LastName, FirstName, Phone
FROM customer
WHERE CustomerId IN (
    SELECT CustomerId
    FROM invoice
    WHERE TotalAmount > 100
)
ORDER BY LastName ASC, FirstName DESC;

-- Show the LastName, FirstName, and Phone of all customers who have had an order with TotalAmount greater than $100.00. Use a join, but do not use JOIN ON syntax. Present results sorted by LastName in ascending order and then FirstName in descending order.
SELECT LastName, FirstName, Phone
FROM customer, invoice
WHERE customer.CustomerId = invoice.CustomerId
  AND TotalAmount > 100
ORDER BY LastName ASC, FirstName DESC;

-- O. Show the LastName, FirstName, and Phone of all customers who have had an order with TotalAmount greater than $100.00. Use a join using JOIN ON syntax. Present results sorted by LastName in ascending order and then FirstName in descending order.
SELECT  LastName, FirstName, Phone
FROM customer JOIN invoice ON customer.CustomerId = invoice.CustomerId
WHERE TotalAmount > 100
order by LastName ASC , FirstName DESC;

-- P. Show the LastName, FirstName, and Phone of all customers who have had an order with an Item named ‘Dress Shirt’. Use a subquery. Present results sorted by LastName in ascending order and then FirstName in descending order.
SELECT  LastName, FirstName,  Phone
FROM customer 
WHERE  CustomerID IN ( SELECT CustomerID FROM invoice WHERE InvoiceNumber IN (
        SELECT InvoiceNumber
        FROM invoice_item
        WHERE Item = 'Dress Shirt'
    ))
order by LastName ASC , FirstName DESC;

-- Q. Show the LastName, FirstName, and Phone of all customers who have had an order with an Item named ‘Dress Shirt’. Use a join, but do not use JOIN ON
SELECT LastName, FirstName, Phone
