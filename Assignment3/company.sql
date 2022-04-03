CREATE DATABASE company;
-- creating the first table
CREATE TABLE employee (
    e_pid VARCHAR(5) PRIMARY KEY,
    person_name VARCHAR(30),
    street VARCHAR(30),
    city VARCHAR(10)
);
INSERT INTO employee
VALUES('C101', 'Pranav Gade', 'Ahmaumau', 'Lucknow');
INSERT INTO employee
VALUES('C102', 'Nischal Goyal', 'Fatehpur', 'Delhi');
INSERT INTO employee
VALUES('C103', 'Himanshu Arora', 'Veshali', 'Ghaziabad');
INSERT INTO employee
VALUES('C104', 'Mridul Gangle', 'Alpha II', 'Noida');
INSERT INTO employee
VALUES(
        'C105',
        'Shoray Singhal',
        'Gamma I',
        'Greater Noida'
    );
INSERT INTO employee
VALUES(
        'C106',
        'Abhinay Pandey',
        'Vasundhra',
        'Ghaziabad'
    );



CREATE TABLE company (
    c_id VARCHAR(5) PRIMARY KEY,
    company_name VARCHAR(30),
    city VARCHAR(10)
);
INSERT INTO company
VALUES('b1', 'HDFC bank', 'delhi');
INSERT INTO company
VALUES('b3', 'HDFC bank', 'noida');
INSERT INTO company
VALUES('b4', 'SBI bank', 'delhi');
INSERT INTO company
VALUES('b5', 'SBI bank', 'noida');
INSERT INTO company
VALUES('b6', 'ICICI bank', 'delhi');
INSERT INTO company
VALUES('b7', 'AXIS bank', 'madras');


CREATE TABLE works (
    w_pid VARCHAR(5),
    w_id VARCHAR(5),
    wp_name VARCHAR(30),
    wcompany_name VARCHAR(30),
    salary VARCHAR(10),
    PRIMARY KEY (w_pid, w_id),
    FOREIGN KEY (w_pid) REFERENCES employee (e_pid),
    FOREIGN KEY (w_id) REFERENCES company(c_id)
);
INSERT INTO works
VALUES('C101', 'b1', 'Pranav Gade', 'HDFC bank', 15000);
INSERT INTO works
VALUES('C102', 'b3', 'Nischal Goyal', 'SBI bank', 22000);
INSERT INTO works
VALUES(
        'C103',
        'b5',
        'Himanshu Arora',
        'ICICI bank',
        10000
    );
INSERT INTO works
VALUES('C104', 'b2', 'Mridul Gangle', 'HDFC bank', 8000);
INSERT INTO works
VALUES('C105', 'b4', 'Shoray Singhal', 'SBI bank', 11000);
INSERT INTO works
VALUES('C106', 'b6', 'Abhinay Pandey', 'AXIS bank', 7000);



CREATE TABLE manager (
    m_id VARCHAR(5) PRIMARY KEY,
    mp_name VARCHAR(30),
    m_name VARCHAR(30),
    FOREIGN KEY (m_id) REFERENCES employee(e_pid)
);
INSERT INTO manager
VALUES ('C101', 'Mridul Gangle', 'Pranav Gade');
INSERT INTO manager
VALUES ('C102', 'Shoray Singhal', 'Nischal Goyal');
INSERT INTO manager
VALUES ('C103', 'Himanshu Arora', 'Abhinay Pandey');





-- b)
ALTER TABLE employee ADD(email VARCHAR(20));

-- c)
SELECT m_name FROM manager, works WHERE MANAGER.m_id=works.w_pid AND (works.wcompany_name = 'HDFC bank' OR works.wcompany_name='SBI bank');

-- d)
SELECT person_name, street, city, salary FROM employee, works WHERE employee.e_pid =works.w_pid
 AND (works.salary >'100000' AND works.wcompany_name='HDFC bank');


-- e)
SELECT DISTINCT person_name FROM employee, company WHERE employee.city=company.city;

-- f)
SELECT wcompany_name, MAX(salary), MIN(salary) FROM works GROUP BY wcompany_name;

-- g)
SELECT SUM(salary), COUNT(w_pid) FROM works GROUP BY wcompany_name;

-- h)
SELECT wcompany_name FROM works WHERE salary = (SELECT MAX(salary) FROM works);




SELECT * FROM employee;
