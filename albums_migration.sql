USE codeup_test_db;

DROP table if exists albums;

CREATE Table albums (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Artist VARCHAR(35) NOT NULL,
    Record_Name VARCHAR(35) NOT NULL,
    Release_Year INT NOT NULL,
    Sales FLOAT NOT NULL,
    Genre VARCHAR(35) NOT NULL,
    primary key (ID)
);