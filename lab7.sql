--1
CREATE INDEX idx_countries_name ON countries(name);

--2
CREATE INDEX idx_employees_name_surname ON employees(name, surname);

--3
CREATE UNIQUE INDEX idx_employees_salary ON employees(salary);

--4
CREATE INDEX idx_employees_name_prefix ON employees((substring(name from 1 for 4)));

--5
CREATE INDEX idx_department_budget ON departments(budget);
CREATE INDEX idx_employee_salary ON employees(salary);
