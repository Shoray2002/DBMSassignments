-- CREATE DATABASE computerdepartment;
USE computerdepartment;
CREATE TABLE students (
    Roll_No INTEGER(4),
    S_Name VARCHAR(80),
    Dob DATE,
    S_Address VARCHAR(80),
    Marks numeric(3, 0),
    Phone_No INTEGER(10)
);
-- insert dummy data
INSERT INTO students
VALUES (
        '122',
        'ajay',
        '2003-12-01',
        'Lucknow',
        '56.8',
        '989898'
    );
INSERT INTO students
VALUES (
        '102',
        'amar',
        '2006-02-01',
        'Delhi',
        '96.6',
        '965898'
    );
INSERT INTO students
VALUES (
        '022',
        'akshay',
        '2010-05-01',
        'Delhi',
        '86.4',
        '9873898'
    );
INSERT INTO students
VALUES (
        '322',
        'deepika',
        '2005-03-15',
        'Delhi',
        '75.5',
        '659898'
    );
INSERT INTO students
VALUES (
        '145',
        'ramesh',
        '2007-12-05',
        'Surat',
        '82.2',
        '912198'
    );
CREATE TABLE paperdetails (
    Paper_code VARCHAR(10),
    Paper_name VARCHAR(80)
);
CREATE TABLE acaddetails (
    Roll_No INTEGER(4),
    Paper_code VARCHAR(10),
    Attendace INTEGER(5),
    Home_marks numeric(3, 0)
);
-- add PRIMARY KEY
ALTER TABLE students
ADD PRIMARY KEY (Roll_No);
ALTER TABLE paperdetails
ADD PRIMARY KEY (Paper_code);
-- add FOREIGN KEY
ALTER TABLE acaddetails
ADD FOREIGN KEY (Roll_No) REFERENCES students(Roll_No);
ALTER TABLE acaddetails
ADD FOREIGN KEY (Paper_code) REFERENCES paperdetails(Paper_code);
-- add dummy data to paperdetails
INSERT INTO paperdetails
VALUES('a101', 'paper 1');
INSERT INTO paperdetails
VALUES('a102', 'paper 2');
INSERT INTO paperdetails
VALUES('a103', 'paper 3');
INSERT INTO paperdetails
VALUES('a104', 'paper 4');
INSERT INTO paperdetails
VALUES('a105', 'paper 5');
-- add dummy data to acaddetails
INSERT INTO acaddetails
VALUES('102', 'a101', '45.8', '65.8');
INSERT INTO acaddetails
VALUES('122', 'a102', '87.1', '63.8');
INSERT INTO acaddetails
VALUES('102', 'a105', '78.5', '98.8');
INSERT INTO acaddetails
VALUES('322', 'a104', '56.8', '65.2');
INSERT INTO acaddetails
VALUES('145', 'a103', '69.8', '75.3');
-- @block
SELECT s.S_Name,
    sum(Attendace) AS Attendance,
    sum(Home_marks) AS Marks
FROM paperdetails p
    JOIN acaddetails a ON p.Paper_code = a.Paper_code
    JOIN Students s ON s.Roll_No = a.Roll_No
GROUP BY S_Name;
SELECT s.S_Name,
    max(Home_marks) AS Marks,
    p.Paper_code
FROM paperdetails p
    JOIN acaddetails a ON p.Paper_code = a.Paper_code
    JOIN Students s ON s.Roll_No = a.Roll_No
GROUP BY Paper_name;
-- @block
with x as (
    select Roll_No,
        sum(Home_marks) as Marks
    from acaddetails
    group by acaddetails.Roll_No
)
select S_Name
from Students
    join (
        select Roll_No,
            mt.max_marks max_marks,
            x.marks marks
        from (
                select max(Marks) max_marks
                from x
            ) as mt
            join x on x.marks = mt.max_marks
    ) rolls on rolls.Roll_No = Students.Roll_No;
-- @block
with t1 as (
    select Roll_No,
        sum(Home_marks) as marks
    from acaddetails
    group by acaddetails.Roll_No
)
select S_Name
from Students
    join (
        select Roll_No,
            mt.avg_marks avg_marks,
            t1.marks marks
        from (
                select avg(marks) avg_marks
                from t1
            ) as mt
            join t1 on t1.marks > mt.avg_marks
    ) rolls on rolls.Roll_No = Students.Roll_No;
-- @block
select sum(Home_marks) total_marks
from acaddetails
    join Students s on acaddetails.Roll_No = s.Roll_No
group by s.Roll_No
order by total_marks
limit 5;