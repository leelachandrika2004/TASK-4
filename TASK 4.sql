USE MOCK_INTERVIEW;
SELECT CUSTOMERNAME ,Region 
 FROM customers 
 WHERE Region="NORTH"
 group by CUSTOMERNAME ,Region 
 ORDER BY CUSTOMERNAME ;
 USE L2;
 create table customers (
id int primary key auto_increment,
first_name varchar(30),
country varchar(30),
score int 
);

create table orders (
Order_id int primary key auto_increment,
customer_id int,
Order_date date,
sales int,
foreign key (customer_id) references customers(id) );

select * from customers;
select * from orders;

insert into customers values 
(1, "Maria", "Germany", 350),
(2,"John","USA",900),
(3,"Georg","USA",750),
(4,"Martin","Germany",500),
(5,"Peter","USA",0);

insert into orders values 
(1001, 1,"2025-01-01",35);

insert into orders values
(1002, 2,"2025-04-05",15);
 insert into orders values
 (1003,3,"2025-06-18",20);
 
 insert into orders values 
 (1004,4,"2025-08-31",10);
 
 /* BY USING JOINS
 INNER JOIN*/
 SELECT O.ORDER_ID,O.CUSTOMER_ID,O.ORDER_DATE,O.SALES,
 C.ID,C.FIRST_NAME,C.COUNTRY,C.SCORE
 FROM ORDERS O 
 INNER JOIN CUSTOMERS C 
 ON O.CUSTOMER_ID=C.ID;
 /* BY USING JOINS
 LEFT JOIN*/
 SELECT O.ORDER_ID,O.CUSTOMER_ID,O.ORDER_DATE,O.SALES,
 C.ID,C.FIRST_NAME,C.COUNTRY,C.SCORE
 FROM CUSTOMERS C 
 LEFT JOIN ORDERS O
 ON C.ID=O.CUSTOMER_ID;
/* BY USING JOINS
RIGHT JOIN*/
 SELECT C.ID,C.FIRST_NAME,C.COUNTRY,C.SCORE,
 O.ORDER_ID,O.CUSTOMER_ID,O.ORDER_DATE,O.SALES
 FROM CUSTOMERS C 
 RIGHT JOIN ORDERS O
 ON C.ID=O.CUSTOMER_ID;
/*Subquery AND
AGGRATION FUNCTION COUNT()*/
 SELECT first_NAME,COUNTRY,COUNT(SCORE)
 FROM customers 
 group by first_NAME,COUNTRY
 ORDER BY COUNT(SCORE);
 
 -- Create a view for monthly sales
CREATE VIEW MonthlySales AS
SELECT DATE_FORMAT(Order_Date, '%Y-%m') AS Month, 
       SUM(SALES) AS TotalSales
FROM Orders
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m');

-- Index on OrderDate for faster queries
CREATE INDEX idx_orderdate ON Orders(Order_Date);

 
 
 