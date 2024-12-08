CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL
);

CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    book_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books (book_id),
    FOREIGN KEY (customer_id) REFERENCES Customers (customer_id)
);

CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

INSERT INTO Books (book_id, title, author, price, quantity)
VALUES
    (1, 'Database 101', 'A. Smith', 40.00, 10),
    (2, 'Learn SQL', 'B. Johnson', 35.00, 15),
    (3, 'Advanced DB', 'C. Lee', 50.00, 5);

INSERT INTO Customers (customer_id, name, email)
VALUES
    (101, 'John Doe', 'johndoe@example.com'),
    (102, 'Jane Doe', 'janedoe@example.com');

--1
BEGIN;
INSERT INTO Orders (order_id, book_id, customer_id, order_date, quantity)
VALUES (1, 1, 101, CURRENT_DATE, 2);

UPDATE Books
SET quantity = quantity - 2
WHERE book_id = 1;
COMMIT;

--2
BEGIN;
DO $$
BEGIN
    IF (SELECT quantity FROM Books WHERE book_id = 3) >= 10 THEN
        INSERT INTO Orders (order_id, book_id, customer_id, order_date, quantity)
        VALUES (2, 3, 102, CURRENT_DATE, 10);

        UPDATE Books
        SET quantity = quantity - 10
        WHERE book_id = 3;
    ELSE
        RAISE EXCEPTION 'Not enough stock for book_id 3';
    END IF;
END $$;
ROLLBACK;

--3
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN;
UPDATE Books
SET price = 45.00
WHERE book_id = 1;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN;
SELECT price FROM Books WHERE book_id = 1;
COMMIT;

COMMIT;

SELECT price FROM Books WHERE book_id = 1;

--4
BEGIN;
UPDATE Customers
SET email = 'john.doe_updated@example.com'
WHERE customer_id = 101;
COMMIT;

SELECT * FROM Customers WHERE customer_id = 101;