USE codeup_test_db;

# INSERT INTO albums (Artist, Record_Name, Release_Year, Sales, Genre) VALUES ('The Beatles', 'The White Album', 1968, 19, 'Rock');

# SHOW TABLES;
#
# SELECT * FROM albums;
#
# DELETE FROM albums WHERE ID = 5;

#In select_exercises.sql write queries to find the following information. Before each item, output a caption explaining the results:
# The name of all albums by Pink Floyd.
SELECT * FROM albums WHERE Artist = 'Pink Floyd';
# The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT Artist FROM albums WHERE Record_Name = 'Bad';
SELECT Release_Year FROM albums WHERE Record_Name = 'Bad';
# The genre for Nevermind
SELECT Genre FROM albums WHERE Record_Name = 'Nevermind';
# Which albums were released in the 1990s
SELECT * FROM albums WHERE Release_Year BETWEEN 1990 AND 1999;
# Which albums had less than 20 million certified sales
SELECT Record_Name FROM albums WHERE Sales < 20;
# All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT * FROM albums WHERE Genre = 'Rock';