--table creation
create table customers4(cust_id int not null primary key, cust_name varchar(35) not null, city varchar(25) not null, amount int not null, discount int not null, salesman_id varchar(25) not null);	
insert into customers4 values(100, 'Deepa', 'Trivandrum', 1050, 2, 'K0010');
insert into customers4 values(101, 'Don', 'Trivandrum', 8040, 4, 'K0010');
insert into customers4 values(102, 'Monacy', 'Kollam', 20030, 6, 'A200tmp');
insert into customers4 values(103, 'Karthika', 'Ernakulam', 8400, 20, 'EkmX1050');
insert into customers4 values(104, 'Tulasi', 'Ernakulam', 2500, 2, 'EkmY2342');
insert into customers4 values(105, 'Roy', 'Trivandrum', 2900, 14, 'L1045');
insert into customers4 values(106, 'Vivek', 'Trivandrum', 3200, 8, 'L1045');
insert into customers4 values(108, 'Bhasi', 'Kottayam', 12860, 10, 'KtmP1028');
insert into customers4 values(109, 'Anurag','Kottayam', 3860, 12, 'KtmB158tmp');
insert into customers4 values(110, 'Antony', 'Kottayam', 9800, 8, 'KtmP1028');
insert into customers4 values(111, 'Meeran', 'Trichur', 6700, 6, 'R3085');

--queries

1. select * from customers4 where cust_name like 'a%';

no rows selected

2. select * from customers4 where cust_name like 'a%' or cust_name like 'A%';

 CUST_ID 	CUST_NAME	CITY   AMOUNT   DISCOUNT SALESMAN_ID
---------- ----------------------------------- -------------------
       109 	Anurag	Kottayam 		3860	    12 		KtmB158tmp
       110	 Antony	Kottayam 		9800	     8 		KtmP1028


3. update customers4 set cust_name = concat(upper(substr(cust_name,1,1)), substr(cust_name, 2));

CUST_NAME
-----------------------------------
Deepa
Don
Monacy
Karthika
Tulasi
Roy
Vivek
Bhasi
Anurag
Antony
Meeran

4. select city from customers4 where city like '%a';

no rows selected

5.select distinct substr(salesman_id,1,3) as salesman_id from customers4;

SALESMAN_ID
------------
K00
A20
Ekm
L10
Ktm
R30

6. select salesman_id from customers4 where salesman_id like '%tmp%';

SALESMAN_ID
------------------
A200tmp
KtmB158tmp

7. select count(city) from customers4 where city like 'T%';

COUNT(CITY)
-----------
	  5

8. select cust_name from customers4 where cust_name like 'D%' and length(cust_name) >= 4;

CUST_NAME
--------------------
Deepa

9. select distinct city from customers4 where city like 'K%' and length(city) >= 2;

CITY
-------------------------
Kollam
Kottayam

10. select distinct city from customers4 where city like 'K%' and length(city) >= 7;

CITY
-------------------------
Kottayam

11. select distinct city from customers4 where city like 'K%m';

CITY
-------------------------
Kollam
Kottayam

12. select salesman_id, sum(discount) || '%' as discountpercentage from customers4 group by salesman_id;

SALESMAN_ID		  DISCOUNTPERCENTAGE
------------------------- -----------------------------------------
A200tmp 		  		6%
EkmX1050		  		20%
KtmB158tmp		  	12%
R3085			  	    6%
KtmP1028		  		18%
K0010			  	    6%
L1045			  	    22%
EkmY2342		 		   2%

13. select distinct upper(city) as city from customers4;

CITY
-------------------------
TRIVANDRUM
KOLLAM
ERNAKULAM
KOTTAYAM
TRICHUR

14. update customers4 set salesman_id = substr(salesman_id, 4) where city = 'Ernakulam';

2 rows updated.

15. select salesman_id, sum(amount), '05-10-2023' from customers4 group by salesman_id;

SALESMAN_ID	SUM(AMOUNT) 	'05-10-2023,
------------------------- ----------- ----------
X1050			8400 		05-10-2023
A200tmp 	20030 	05-10-2023
Y2342			2500 		05-10-2023
KtmB158tmp 3860 	05-10-2023
R3085			6700 		05-10-2023
KtmP1028	22660 	05-10-2023
K0010			9090 		05-10-2023
L1045			6100 		05-10-2023
