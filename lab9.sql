CREATE FUNCTION increase_value(input_value INT)
RETURNS INT AS $$
BEGIN
    RETURN input_value + 10;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION compare_numbers(num1 INT, num2 INT)
RETURNS VARCHAR(10) AS $$
BEGIN
    IF num1 > num2 THEN
        RETURN 'Greater';
    ELSIF num1 = num2 THEN
        RETURN 'Equal';
    ELSE
        RETURN 'Lesser';
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION number_series(n INT)
RETURNS TABLE(number INT) AS $$
BEGIN
    RETURN QUERY
    SELECT generate_series(1, n);
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION find_employee(employee_name VARCHAR)
RETURNS TABLE(id INT, name VARCHAR, position VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT id, name, position FROM employees WHERE name = employee_name;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION list_products(category_name VARCHAR)
RETURNS TABLE(id INT, product_name VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT id, product_name FROM products WHERE category = category_name;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION calculate_bonus(salary INT)
RETURNS INT AS $$
BEGIN
    RETURN salary * 0.10;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION update_salary(employee_id INT, bonus INT)
RETURNS VOID AS $$
DECLARE
    current_salary INT;
BEGIN
    SELECT salary INTO current_salary FROM employees WHERE id = employee_id;
    UPDATE employees SET salary = current_salary + bonus WHERE id = employee_id;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION complex_calculation(
    number1 INT, text1 VARCHAR
)
RETURNS VARCHAR(200) AS $$
DECLARE
    numeric_result INT;
    string_result VARCHAR(100);
BEGIN
    numeric_result := number1 * 2;

    string_result := CONCAT(text1, '_processed');

    RETURN 'Number: ' || numeric_result || ', String: ' || string_result;
END;
$$ LANGUAGE plpgsql;

SELECT increase_value(10);