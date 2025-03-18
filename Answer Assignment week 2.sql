Question 1: Retrieving payment information
SELECT checkNumber, paymentDate, amount
FROM payments;

Question 2: Finding orders that are "In Process"
SELECT orderDate, requiredDate, status
FROM orders
WHERE status = 'In Process'
ORDER BY orderDate DESC;

Question 3: Finding Sales Reps
SELECT firstName, lastName, email
FROM employees
WHERE jobTitle = 'Sales Rep'
ORDER BY employeeNumber DESC;

Question 4: Retrieving all office information
SELECT *
FROM offices;

Question 5: Finding product inventory information
SELECT productName, quantityInStock
FROM products
ORDER BY buyPrice ASC
LIMIT 5;