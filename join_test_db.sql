# USE join_test_db;
#
# CREATE TABLE roles (
#                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
#                        name VARCHAR(100) NOT NULL,
#                        PRIMARY KEY (id)
# );
#
# CREATE TABLE users (
#                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
#                        name VARCHAR(100) NOT NULL,
#                        email VARCHAR(100) NOT NULL,
#                        role_id INT UNSIGNED DEFAULT NULL,
#                        PRIMARY KEY (id),
#                        FOREIGN KEY (role_id) REFERENCES roles (id)
# );
#
# INSERT INTO roles (name) VALUES ('admin');
# INSERT INTO roles (name) VALUES ('author');
# INSERT INTO roles (name) VALUES ('reviewer');
# INSERT INTO roles (name) VALUES ('commenter');
#
# INSERT INTO users (name, email, role_id) VALUES
#                                              ('bob', 'bob@example.com', 1),
#                                              ('joe', 'joe@example.com', 2),
#                                              ('sally', 'sally@example.com', 3),
#                                              ('adam', 'adam@example.com', 3),
#                                              ('jane', 'jane@example.com', null),
#                                              ('mike', 'mike@example.com', null);
#
# SELECT * FROM users;
#
# SELECT * FROM roles;
#
# # Use JOIN, LEFT JOIN, and RIGHT JOIN to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
# SELECT users.id, users.name, roles.name FROM users JOIN roles ON users.role_id = roles.id;
#
# SELECT users.id, users.name, roles.name FROM users LEFT JOIN roles ON users.role_id = roles.id;
#
# SELECT users.id, users.name, roles.name FROM users RIGHT JOIN roles ON users.role_id = roles.id;


USE employees;

SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Department Manager'
FROM departments d JOIN dept_manager dm on d.dept_no = dm.dept_no
                   JOIN employees e on e.emp_no = dm.emp_no
WHERE to_date LIKE '9%'
ORDER BY dept_name;


# Find the name of all departments currently managed by women.
#
# +------------------+--------------------+
# | Department Name  | Department Manager |
# +------------------+--------------------+
# | Development      | Leon DasSarma      |
# | Finance          | Isamu Legleitner   |
# | Human Resources  | Karsten Sigstam    |
# | Research         | Hilary Kambil      |
# +------------------+--------------------+

SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Department Manager'
FROM departments d JOIN dept_manager dm on d.dept_no = dm.dept_no
                   JOIN employees e on e.emp_no = dm.emp_no
WHERE to_date LIKE '9%'
  AND gender ='F'
ORDER BY dept_name;

# Find the current titles of employees currently working in the Customer Service department.
#
# +--------------------+-------+
# | title              | Total |
# +--------------------+-------+
# | Senior Staff       | 11268 |
# | Staff              |  3574 |
# | Senior Engineer    |  1790 |
# | Engineer           |   627 |
# | Technique Leader   |   241 |
# | Assistant Engineer |    68 |
# | Manager            |     1 |
# +--------------------+-------+

SELECT title, COUNT(title) AS Total FROM titles t
                                             JOIN dept_emp de on t.emp_no = de.emp_no
                                             JOIN departments d on d.dept_no = de.dept_no
WHERE dept_name = 'Customer Service'
  AND t.to_date LIKE '9%'
  AND de.to_date LIKE '9%'
GROUP BY title;


# Find the current salary of all current managers.
#
# +--------------------+--------------------+--------+
# | Department Name    | Department Manager | Salary |
# +--------------------+--------------------+--------+
# | Customer Service   | Yuchang Weedman    |  58745 |
# | Development        | Leon DasSarma      |  74510 |
# | Finance            | Isamu Legleitner   |  83457 |
# | Human Resources    | Karsten Sigstam    |  65400 |
# | Marketing          | Vishwani Minakawa  | 106491 |
# | Production         | Oscar Ghazalie     |  56654 |
# | Quality Management | Dung Pesch         |  72876 |
# | Research           | Hilary Kambil      |  79393 |
# | Sales              | Hauke Zhang        | 101987 |
# +--------------------+--------------------+--------+

SELECT dept_name AS 'Department Name',
       CONCAT(first_name, ' ', last_name) AS 'Department Manager',
       salary AS Salary
FROM departments d
         JOIN dept_manager dm on d.dept_no = dm.dept_no
         JOIN employees e on e.emp_no = dm.emp_no
         JOIN salaries s on e.emp_no = s.emp_no
WHERE s.to_date LIKE '9%'
  AND dm.to_date LIKE '9%'
ORDER BY dept_name;
