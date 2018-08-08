.read lab12.sql

-- Q5
CREATE TABLE greatstudents AS
  SELECT a.date, a.color, a.pet, a.number, b.number from students as a, fa17students as b where a.date = b.date and a.color = b.color and a.pet = b.pet;

-- Q6
CREATE TABLE sevens AS
  SELECT seven from students, checkboxes where number = 7 and "7" = "True" and students.time = checkboxes.time;

-- Q7
CREATE TABLE fa17favnum AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE fa17favpets AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE sp18favpets AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE sp18dog AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE sp18alldogs AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE obedienceimages AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

-- Q8
CREATE TABLE smallest_int_count AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
