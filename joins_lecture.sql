USE codeup_test_db;

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(35) NOT NULL UNIQUE,
    email VARCHAR(65) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    album_id INT unsigned,
    PRIMARY KEY (id),
    CONSTRAINT user_albums_id_fk FOREIGN KEY (album_id) REFERENCES albums(id)
);

INSERT INTO users (username, email, password)
VALUES
    ('john_doe', 'john_doe@example.com', 'password123'),
    ('jane_smith', 'jane_smith@example.com', 'password456'),
    ('sam_jones', 'sam_jones@example.com', 'password789'),
    ('joe_brown', 'joe_brown@example.com', 'password1234'),
    ('mary_white', 'mary_white@example.com', 'password5678'),
    ('david_kim', 'david_kim@example.com', 'password9012'),
    ('lisa_green', 'lisa_green@example.com', 'password3456'),
    ('steve_taylor', 'steve_taylor@example.com', 'password7890'),
    ('amy_harris', 'amy_harris@example.com', 'password12345'),
    ('jack_smith', 'jack_smith@example.com', 'password67890'),
    ('katie_lee', 'katie_lee@example.com', 'password123456'),
    ('mike_johnson', 'mike_johnson@example.com', 'password789012'),
    ('sara_davis', 'sara_davis@example.com', 'password345678'),
    ('chris_wilson', 'chris_wilson@example.com', 'password901234'),
    ('jessica_lee', 'jessica_lee@example.com', 'password567890');

SELECT * FROM users;

# USE your codeup_test_db database.
# Add an index to make sure all album names combined with the artist are unique. Try to add duplicates to test the constraint.

# DESCRIBE albums;
#
# ALTER TABLE albums ADD UNIQUE INDEX album_artist_unique (Artist,Record_Name);
#
# SHOW INDEXES FROM albums;
#
# DESCRIBE albums;
#
# SELECT * FROM albums;

# INSERT INTO albums (Artist, Record_Name, Release_Year, Sales, Genre) VALUES ('Pink Floyd', 'The Dark Side of the Moon', 1973, 45, 'Progressive rock');

USE employees;

# basic Join, aka Inner Join

SELECT CONCAT(employees.first_name,' ', employees.last_name) AS name, salaries.salary AS salary FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no;

# Left Join

CREATE TABLE roles (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO roles (title) VALUES
                              ('Admin'),
                              ('Author'),
                              ('Reviewer'),
                              ('User');

ALTER TABLE users ADD COLUMN role_id INT unsigned;
ALTER TABLE users ADD CONSTRAINT users_roles_id_fk FOREIGN KEY (role_id) REFERENCES roles(id);

UPDATE users SET role_id = 1 WHERE id = 1;
UPDATE users SET role_id = 2 WHERE id = 2;
UPDATE users SET role_id = 3 WHERE id = 3;
UPDATE users SET role_id = 4 WHERE id = 4;
UPDATE users SET role_id = 1 WHERE id = 5;
UPDATE users SET role_id = 2 WHERE id = 6;
UPDATE users SET role_id = 3 WHERE id = 7;
UPDATE users SET role_id = 4 WHERE id = 8;

INSERT INTO roles (title) VALUE ('bot');

SELECT users.username, roles.title FROM users JOIN roles ON users.role_id = roles.id;

SELECT users.username, roles.title FROM users LEFT JOIN roles ON users.role_id = roles.id;