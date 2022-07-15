CREATE DATABASE opm;
USE opm;

--creating the table 
CREATE TABLE customer(
	custid INT PRIMARY KEY IDENTITY,
	customername VARCHAR(45)
);
--creating the table 
CREATE TABLE manufrdetails
(
	manufrid INT PRIMARY KEY IDENTITY,
	manufrname VARCHAR(45)
);

CREATE TABLE orderdetails
(
	orderID INT PRIMARY KEY IDENTITY,
	orderdate DATE,
	orderprice INT,
	orderquantity INT,
	custID INT,
	CONSTRAINT fk_cust_id
		FOREIGN KEY(custID)
		REFERENCES customer(custid)
);

--creating the table 

CREATE TABLE productdetails
(
	productid INT PRIMARY KEY,
	orderid INT,
	manudate DATE,
	productname VARCHAR(45),
	manufrid INT,
	CONSTRAINT fk_ord_id
		FOREIGN KEY(orderid)
		REFERENCES orderdetails(orderid),
	CONSTRAINT fk_manufr_id
		FOREIGN KEY(maNufrid)
		REFERENCES manufrdetails(manufrid)
);

--creating the table 


--insert into orderdetails

INSERT INTO customer VALUES
('Jayesh'),('Abhilash'),('lily'),('aswathy') 

SELECT * FROM customer;

INSERT INTO orderdetails VALUES
('2020/12/22',270,2,1),
('2019/08/10',280,4,2),
('2019/07/13',600,5,3),
('2020/07/15',520,1,1), 
('2020/12/22',1200,4,4),
('2019/10/02',720,3,1),
('2020/11/03',3000,2,3), 
('2020/12/22',1100,4,4),
('2019/12/29',5500,2,1)

select * from orderdetails
INSERT INTO manufrdetails VALUES
('samsung'),('sony'),('mi'),('boat')
SELECT * FROM productdetails
SELECT * FROM orderdetails

INSERT INTO productdetails VALUES
(145,2,'2019/12/23','MobilePhone',1),
(147,6,'2019/08/15','MobilePhone',3),

(435,5,'2018/11/04','MobilePhone',1),

(783,1,'2017/11/03','LED TV',2),

(784,4,'2019/11/28','LED TV',2),

(123,2,'2019/10/03','Laptop',2),

(267,5,'2019/12/03','Headphone',4),

(333,9,'2017/12/12','Laptop',1),
(344,3,'2018/11/03','Laptop',1),
(233,3,'2019/11/30','PowerBank',2),
(567,6,'2019/09/03','PowerBank',2) 



--q1) Total number of orders placed in each year

SELECT year(orderdate) AS 'year' ,COUNT(orderquantity) AS 'TOTAL'
from orderdetails 
GROUP BY year(orderdate)

--q2) Total number of orders placed in each year by Jayesh.
SELECT year(orderdate) AS 'year' ,SUM(orderquantity) AS 'TOTAL'
from orderdetails 
where custid=1
GROUP BY year(orderdate)
from orderdetails 
GROUP BY year(orderdate)


--Q6) Display the total number of products ordered every year made by sony.