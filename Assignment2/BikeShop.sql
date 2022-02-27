CREATE DATABASE bicycleshop;
USE bicycleshop;
CREATE TABLE Customer (
    CustID VARCHAR(10),
    Email CHAR(30),
    NameValue VARCHAR(80),
    Phone INT(10),
    ReferrerID VARCHAR(10)
);
CREATE TABLE Bicycle(
    BicycleID VARCHAR(10),
    DatePurchased DATE,
    Color CHAR(10),
    CustID VARCHAR(10),
    ModelNo VARCHAR(10)
);
CREATE TABLE BicycleModel(
    ModelNo VARCHAR(10),
    Manufacturer CHAR(10),
    Style CHAR(10)
);
CREATE TABLE Service(
    StartDate DATE,
    BicycleID VARCHAR(10),
    EndDate DATE
);
ALTER TABLE Customer
ADD PRIMARY KEY (CustID);
ALTER TABLE Bicycle
ADD PRIMARY KEY (BicycleID);
ALTER TABLE BicycleModel
ADD PRIMARY KEY (ModelNo);
ALTER TABLE Bicycle
ADD FOREIGN KEY (CustID) REFERENCES Customer(CustID) ON DELETE CASCADE;
ALTER TABLE Bicycle
ADD FOREIGN KEY (ModelNo) REFERENCES BicycleModel(ModelNo) ON DELETE CASCADE;
ALTER TABLE Service
ADD FOREIGN KEY (BicycleID) REFERENCES Bicycle(BicycleID) ON DELETE CASCADE;
INSERT INTO Customer (CustID, Email, NameValue, Phone, ReferrerID)
VALUES ('C1', 'c1@gmail.com', 'abc', '9898', 'C1-11'),
    ('C2', 'c2@gmail.com', 'abcd', '1898', 'C2-11'),
    ('C3', 'c3@gmail.com', 'dbc', '77898', 'C3-11'),
    ('C4', 'c4@gmail.com', 'bbc', '5898', 'C4-11'),
    ('C5', 'c5@gmail.com', 'xbc', '4898', 'C5-11');
INSERT INTO bicyclemodel (ModelNo, Manufacturer, Style)
VALUES ('M1-11', 'Hero', 'Ladies'),
    ('M2-11', 'Honda', 'Boys'),
    ('M3-11', 'Hero', 'Ladies'),
    ('M4-11', 'Honda', 'Boys'),
    ('M2-13', 'Hero', 'Ladies'),
    ('M5-13', 'Hero', 'Ladies'),
    ('M5-11', 'Honda', 'Boys');
INSERT INTO Bicycle (BicycleID, DatePurchased, Color, CustID, ModelNo)
VALUES ('B1', '2019-04-07', 'red', 'C3', 'M1-11'),
    ('B2', '2007-09-12', 'blue', 'C1', 'M2-11'),
    ('B3', '2001-04-08', 'red', 'C2', 'M3-11'),
    ('B4', '2003-04-04', 'black', 'C4', 'M4-11'),
    ('B5', '1999-12-12', 'black', 'C1', 'M5-11');
INSERT INTO service (StartDate, BicycleID, EndDate)
VALUES ('2009-04-05', 'B1', '2009-09-05'),
    ('2019-07-05', 'B2', '2019-07-12'),
    ('2000-04-05', 'B4', '2000-09-05'),
    ('2019-02-05', 'B5', '2019-02-12'),
    ('2009-01-05', 'B3', '2009-01-12'),
    ('2019-01-05', 'B5', '2019-07-12');
USE bicycleshop;
SELECT c.NameValue,
    b.ModelNo,
    c.CustID,
    m.Manufacturer
FROM bicycle b
    JOIN BicycleModel m ON b.ModelNo = m.ModelNo
    JOIN customer c ON c.CustID = b.CustID
WHERE m.Manufacturer = 'Honda';

SELECT b.BicycleID,
    b.DatePurchased,
    b.Color,
    b.CustID,
    b.ModelNo,
    c.CustID,
    c.ReferrerID
FROM bicycle b
    JOIN customer c ON b.CustID = c.CustID
WHERE c.ReferrerID = 'C1-11';
SELECT b.ModelNo,
    b.Color,
    m.Manufacturer,
    m.Style
FROM bicycle b
    JOIN BicycleModel m ON b.ModelNo = m.ModelNo
WHERE b.Color = 'red';
SELECT b.ModelNo,
    s.StartDate,
    s.EndDate
FROM bicycle b
    JOIN BicycleModel m ON b.ModelNo = m.ModelNo
    JOIN Service s ON s.BicycleID = b.BicycleID;


    
-- USE bicycleshop;
-- DROP TABLES Customer,
-- Bicycle,
-- BicycleModel,
-- Service;