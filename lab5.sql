CREATE TABLE customers(
    customer_id integer,
    customer_name varchar(255),
    city varchar(255),
    grade integer,
    salesman_id integer
);

CREATE TABLE orders(
    ord_no integer,
    purchase_amt numeric,
    order_date date,
    customer_id integer,
    salesman_id integer
);

INSERT INTO customers(customer_id, customer_name, city, grade, salesman_id)
VALUES (3002, 'Nick Rimando', 'New York', 100, 5001),
       (3005, 'Graham Zusi', 'California', 200, 5002),
       (3001, 'Brad Guzan', 'London', NULL, 5005),
       (3004, 'Fabian Johns', 'Paris', 300, 5006),
       (3007, 'Brad Davis', 'New York', 200, 5001),
       (3009, 'Geoff Camero', 'Berlin', 100, 5003),
       (3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders(ord_no, purchase_amt, order_date, customer_id, salesman_id)
VALUES (70001, 150.5, '2012-10-05', 3005, 5002),
       (70009, 270.65, '2012-09-10', 3001, 5005),
       (70002, 65.26, '2012-10-05', 3002, 5001),
       (70004, 110.5, '2012-08-17', 3009, 5003),
       (70007, 948.5, '2012-09-10', 3005, 5002),
       (70005, 2400.6, '2012-07-27', 3007, 5001),
       (70008, 5760, '2012-09-10', 3002, 5001);

SELECT * FROM customers;
SELECT * FROM orders;

--3
SELECT SUM(purchase_amt) AS total_purchase
FROM orders;

--4
SELECT AVG(purchase_amt) AS avg_purchase
FROM orders;

--5
SELECT COUNT(customer_name) AS with_names
FROM customers
WHERE customer_name IS NOT NULL;

--6
SELECT MIN(purchase_amt) FROM orders;

--7
SELECT * FROM customers
WHERE customer_name LIKE '%b';

--8
SELECT * FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
WHERE c.city = 'New York';

--9
SELECT * FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE purchase_amt > 10;

--10
SELECT SUM(grade) AS total_grade
FROM customers;

--11
SELECT * FROM customers
WHERE customer_name IS NOT NULL;

--12
SELECT MAX(grade) FROM customers;