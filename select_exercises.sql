USE codeup_test_db;
# Write SELECT statements to output each of the following with a caption:
# Add SELECT statements after each UPDATE so you can see the results of your handiwork.
#     All albums in your table.
# Make all the albums 10 times more popular (sales * 10)
SELECT * FROM albums;
UPDATE albums SET sales = sales * 10;
SELECT * FROM albums;
#     All albums released before 1980
# Move all the albums before 1980 back to the 1800s.
SELECT * FROM albums WHERE Release_Year <= 1989;
UPDATE albums SET Release_Year = Release_Year - 100 WHERE Release_Year <= 1989;
SELECT * FROM albums WHERE Release_Year < 1900;
#     All albums by Michael Jackson
# Change 'Michael Jackson' to 'Peter Jackson'
SELECT * FROM albums WHERE artist = 'Michael Jackson';
UPDATE albums SET artist = 'Peter Jackson' WHERE artist = 'Michael Jackson';
SELECT * FROM albums WHERE artist = 'Peter Jackson';
