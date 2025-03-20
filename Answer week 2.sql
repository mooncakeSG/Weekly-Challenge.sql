

-- 1. Query to retrieve payment details
SELECT checkNumber, paymentDate, amount
FROM payments;

-- 2. Query to retrieve in-process orders
SELECT orderDate, requiredDate, status
FROM orders
WHERE status = 'In Process'
ORDER BY orderDate DESC;

-- 3. Query to display Sales Rep information
SELECT firstName, lastName, email
FROM employees
WHERE jobTitle = 'Sales Rep'
ORDER BY employeeNumber DESC;

-- 4. Query to retrieve office details
SELECT *
FROM offices;

-- 5. Query to fetch product stock information
SELECT productName, quantityInStock
FROM products
ORDER BY buyPrice ASC
LIMIT 5;
