CREATE TABLE Warehouses(
    code integer,
    location varchar(255),
    capacity integer
);

CREATE TABLE Boxes(
    code char(4),
    contents varchar(255),
    value real,
    warehouse integer
);

INSERT INTO Warehouses(code, location, capacity)
VALUES
    (1, 'Chicago', 3),
    (2, 'Chicago', 4),
    (3, 'New York', 7),
    (4, 'Los Angeles', 2),
    (5, 'San Francisco', 8);

INSERT INTO Boxes(code, contents, value, warehouse)
VALUES
    ('0MN7', 'Rocks', 180, 3),
    ('4H8P', 'Rocks', 250, 1),
    ('4RT3', 'Scissors', 190, 4),
    ('7G3H', 'Rocks', 200, 1),
    ('8JN6', 'Papers', 75, 1),
    ('8Y6U', 'Papers', 50, 3),
    ('9J6F', 'Papers', 175, 2),
    ('LL08', 'Rocks', 140, 4),
    ('P0H6', 'Scissors', 125, 1),
    ('P2T6', 'Scissors', 150, 2),
    ('TU55', 'Papers', 90, 5);

--4
SELECT * FROM Warehouses;
SELECT * FROM Boxes;

--5
SELECT * FROM Boxes WHERE value > 150;

--6
SELECT DISTINCT contents FROM Boxes;

--7
SELECT code, COUNT(*) AS num_boxes
FROM Boxes
GROUP BY code;

--8
SELECT code, COUNT(*) AS num_boxes
FROM Boxes
GROUP BY code
HAVING COUNT(*) > 2;

--9
INSERT INTO Warehouses (location, capacity)
VALUES ('New York', 3);

--10
INSERT INTO Boxes (code, contents, value, warehouse)
VALUES ('H5RT', 'Papers', 200, 2);

--11
UPDATE Boxes
SET value = value * 0.85
WHERE value = (SELECT value
               FROM Boxes
               ORDER BY value DESC
               OFFSET 2 LIMIT 1);

--12
DELETE FROM Boxes
WHERE value < 150;

--13
DELETE FROM Boxes
USING Warehouses
WHERE Boxes.warehouse = Warehouses.code
AND Warehouses.location = 'New York'
RETURNING *;
