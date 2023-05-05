USE employees;

SHOW TABLES;

SELECT DISTINCT first_name FROM employees WHERE first_name LIKE '%sus%';

SELECT emp_no, first_name, last_name FROM employees WHERE emp_no BETWEEN 10026 AND 1008;

SELECT DISTINCT emp_no, first_name, last_name FROM employees WHERE last_name IN ('Herber','Dredge','Lipner','Baek');

SELECT emp_no, first_name, last_name FROM employees WHERE emp_no < 20000
    AND last_name IN ('Herber','Baek')
                                                       OR first_name = 'Shridhar';

SELECT * FROM salaries WHERE salary NOT BETWEEN 50000 AND 100000;

# Functions

SELECT CONCAT(first_name,' ',last_name) FROM employees WHERE first_name = 'Maya';

SELECT DAYOFMONTH(hire_date) FROM employees WHERE first_name = 'Maya';

SELECT DATEDIFF(NOW(),hire_date)/365 FROM employees LIMIT 10;

SELECT last_name FROM employees GROUP BY last_name;

SELECT COUNT(first_name) FROM employees;