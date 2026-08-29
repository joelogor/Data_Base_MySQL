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
FROM customer


