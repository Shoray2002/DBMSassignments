CREATE DATABASE factory;
USE DATABASE factory;
CREATE TABLE suppliers (
    sno VARCHAR(5) PRIMARY KEY,
    sname VARCHAR(30),
    status INT(5),
    scity VARCHAR(10)
);
INSERT INTO suppliers
VALUES ('a201', 's1', 18, 'delhi');
INSERT INTO suppliers
VALUES ('a202', 's2', 20, 'chandigarh');
INSERT INTO suppliers
VALUES ('a203', 's3', 25, 'mumbai');
INSERT INTO suppliers
VALUES ('a204', 's4', 28, 'chennai');
INSERT INTO suppliers
VALUES ('a205', 's5', 30, 'kolkata');
CREATE TABLE parts (
    pno VARCHAR(5) PRIMARY KEY,
    pname VARCHAR(30),
    pcolor VARCHAR(10),
    pweight FLOAT(5),
    pcity VARCHAR(30)
);
INSERT INTO parts
VALUES('p101', 'p1', 'orange', 20, 'delhi');
INSERT INTO parts
VALUES('p102', 'p2', 'white', 18, 'chandigarh');
INSERT INTO parts
VALUES('p103', 'p3', 'pink', 16, 'mumbai');
INSERT INTO parts
VALUES('p104', 'p4', 'red', 15, 'chandigarh');
INSERT INTO parts
VALUES('p105', 'p5', 'yellow', 11, 'delhi');
CREATE TABLE project (
    jno VARCHAR(5) PRIMARY KEY,
    jname VARCHAR(30),
    jcity VARCHAR(30)
);
INSERT INTO project
VALUES('j101', 'main', 'delhi');
INSERT INTO project
VALUES('j102', 'action', 'chadigarh');
INSERT INTO project
VALUES('j103', 'nothing', 'mumbai');
INSERT INTO project
VALUES('j104', 'zoom', 'chadigarh');
INSERT INTO project
VALUES('j105', 'game', 'kolkata');
CREATE TABLE shipment (
    s_sno VARCHAR(5),
    s_pno VARCHAR(5),
    s_jno VARCHAR(5),
    quantity FLOAT(5),
    PRIMARY KEY (s_sno, s_pno, s_jno),
    FOREIGN KEY(s_sno) REFERENCES suppliers(sno),
    FOREIGN KEY(s_pno) REFERENCES parts(pno),
    FOREIGN KEY(s_jno) REFERENCES project(jno)
);
INSERT INTO shipment
VALUES ('a201', 'p101', 'j101', 200);
INSERT INTO shipment
VALUES ('a202', 'p102', 'j102', 325);
INSERT INTO shipment
VALUES ('a203', 'p103', 'j103', 800);
INSERT INTO shipment
VALUES ('a204', 'p104', 'j104', 400);
INSERT INTO shipment
VALUES ('a205', 'p105', 'j105', 300);


-- b)
SELECT sno, status FROM suppliers WHERE scity='kolkata' AND status>20;


-- c)
SELECT sno, sname FROM suppliers, parts, shipment WHERE parts.pname='P2' AND suppliers.sno=shipment.s_sno AND parts.pno=shipment.s_pno;


-- d)
SELECT sno, sname FROM suppliers, parts, shipment WHERE suppliers.sno=shipment.s_sno AND parts.pno=shipment.s_pno AND NOT parts.pname='p2';


-- e)
SELECT s_sno, s_pno, s_jno, parts.pweight*shipment.quantity AS " shipment" FROM shipment, parts WHERE parts.pno=shipment.s_pno;

-- f)
SELECT * FROM shipment WHERE quantity BETWEEN 300 AND 700;

-- g)
SELECT DISTINCT pno FROM parts, suppliers WHERE parts.pweight>16 OR suppliers.sname='s2';

-- h)
 SELECT pcity FROM parts, shipment WHERE parts.pno=shipment.s_pno AND parts.pcolor='red' AND shipment.quantity>5;

-- i)
SELECT pno, pname, pcolor, pcity, pweight FROM parts, shipment, suppliers WHERE suppliers.sno=shipment.s_sno AND shipment.s_pno=parts.pno AND suppliers.scity='chandigarh';


-- j)
SELECT pno FROM parts, suppliers, shipment, project WHERE project.jcity='kolkata' AND suppliers.scity='kolkata' AND suppliers.sno=shipment.s_sno AND shipment.s_pno= parts.pno AND project.jno=shipment.s_jno;


-- k)
SELECT count(jno) FROM suppliers, shipment, project WHERE suppliers.sno = shipment.s_sno AND project.jno=shipment.s_jno AND suppliers.sname='s1' GROUP BY jno;


-- l)
SELECT sum(quantity) FROM suppliers, parts, shipment WHERE suppliers.sname = 's1' AND parts.pname='p1' AND suppliers.sno=shipment.s_sno AND parts.pno = shipment.s_pno GROUP BY sno;