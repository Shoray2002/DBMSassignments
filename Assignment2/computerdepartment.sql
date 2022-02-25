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
SELECT p.Paper_code,
    Paper_name,
    S_Name
FROM paperdetails p
    JOIN acaddetails a ON a.Paper_code = p.Paper_code
    JOIN students s ON s.Roll_No = a.Roll_No
WHERE Attendace >= 75
    AND Home_marks >= 60
    AND p.Paper_name = 'paper 2';
-- @block
SELECT s.S_Name,
    a.Roll_No,
    s.Marks
FROM students s
    JOIN acaddetails a ON a.Roll_No = s.Roll_No
    JOIN paperdetails p ON p.Paper_code = a.Paper_code
WHERE s.S_Address = 'Delhi'
    AND a.Home_marks >= 60
    AND p.Paper_name = 'paper 1';
-- @block
DROP TABLE paperdetails,
students,
acaddetails;