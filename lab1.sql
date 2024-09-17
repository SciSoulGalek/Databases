CREATE TABLE users (
    id SERIAL,
    firstname VARCHAR(50),
    secondname VARCHAR(50)
);

SELECT * FROM users;

ALTER TABLE users
ADD COLUMN isadmin INTEGER DEFAULT 0;

ALTER TABLE users
ALTER COLUMN isadmin DROP DEFAULT;

ALTER TABLE users
ALTER COLUMN isadmin TYPE boolean
USING CASE
  WHEN isadmin = 1 THEN true
  ELSE false
END;

ALTER TABLE users
ALTER COLUMN isadmin SET DEFAULT false;

ALTER TABLE users
ADD CONSTRAINT users_pkey PRIMARY KEY (id);

CREATE TABLE tasks (
    id SERIAL,
    name VARCHAR(50),
    user_id INTEGER
);

SELECT * FROM tasks;

DROP TABLE IF EXISTS users;

DROP DATABASE lab1;
