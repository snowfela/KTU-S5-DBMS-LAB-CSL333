--table creation
create table SUPPLIER5(s_no varchar(10) not null, sname varchar(15) not null, age int not null, city varchar(15) not null, primary key(s_no));
insert into supplier5 values ('S001', 'Ivan Bayross', 35, 'Bombay');
insert into supplier5 values ('S002', 'Nirmala Agarwal', 25, 'Madras');
insert into supplier5 values ('S003', 'Susmitha ', 55, 'Bombay');
insert into supplier5 values ('S004', 'Basu Navivelgi', 45, 'Bombay');
insert into supplier5 values ('S005', 'Ravi Sreedharan', 25, 'Delhi');
insert into supplier5 values ('S006', 'Nanda Gopal', 25, 'Madras');

create table CUSTOMER5(cust_no varchar(10) not null,name varchar(15) not null,age int not null,city varchar(15) not null,pincode int not null,state varchar(15) not null,primary key(cust_no));
insert into customer5 values('C00001','Ivan Bayross',35,'Bombay',400054, 'Maharashtra');
insert into customer5 values('C00002','Vandana Saitwal',35,'Madras',780001,'Tamil Nadu');
insert into customer5 values('C00003', 'Pramada Jaguste', 55, 'Bombay', 400057, 'Maharshtra');
insert into customer5 values('C00004', 'Basu Navindgi', 45, 'Bombay', 400056, 'Maharashtra');
insert into customer5 values('C00005', 'Ravi Sreedharan', 25, 'Delhi', 100001, 'Delhi');
insert into customer5 values('C00006','Rukmini', 25, 'Madras', 780001, 'Tamil Nadu');

create table PRODUCT5(prod_no varchar(10) not null, description varchar(20) not null, company varchar(15) not null, price int not null, primary key(prod_no));
insert into product5 values('P00001', '12 W Flood Light', 'Wipro', 5000);
insert into product5 values('P00002', 'Laptop Adapter', 'Dell', 1560);
insert into product5 values('P00003', 'Tablet', 'HCL', 11000);
insert into product5 values('P00004', 'Garnet 50 W Led', 'Wipro', 999);
insert into product5 values('P00005', 'Laptop Charger', 'HCL', 1690);

create table PURCHASE5 (order_no varchar(10) not null, cust_no varchar(10) not null, prod_no varchar(10) not null, quantity int not null, orderdate date, primary key(order_no), foreign key(cust_no) references customer5(cust_no) on delete cascade, foreign key(prod_no) references product5(prod_no) on delete cascade);
insert into purchase5 values ('O00001', 'C00002', 'P00003', 2, '20/01/16');
insert into purchase5 values ('O00002', 'C00003', 'P00002', 1, '27/01/16');
insert into purchase5 values ('O00003', 'C00004', 'P00002', 3, '28/01/16');
insert into purchase5 values ('O00004', 'C00006', 'P00001', 3, '20/02/16');
insert into purchase5 values ('O00005', 'C00003', 'P00005', 4, '07/04/16');
insert into purchase5 values ('O00006', 'C00004', 'P00002', 2, '22/05/16');
insert into purchase5 values ('O00007', 'C00005', 'P00004', 1, '26/05/16');

--NESTED QUERIES

1. select cust_no from purchase5 where orderdate like '%01%' and prod_no in (select prod_no from product5 where description = 'Laptop Adapter');

CUST_NO
----------
C00003
C00004

2. select name from customer5 where cust_no in (select cust_no from purchase5 where prod_no = 'P00002');

NAME
---------------
Pramada Jaguste
Basu Navindgi

3. select cust_no from purchase5 where prod_no in (select prod_no from product5 where price > 1600);

CUST_NO
----------
C00002
C00006
C00003

4. select name from customer5 where cust_no in (select cust_no from purchase5 where orderdate like '%01%' and prod_no in (select prod_no from product5 where price > 1500));

NAME
---------------
Vandana Saitwal
Pramada Jaguste
Basu Navindgi
  
5. select distinct cust_no from purchase5 where prod_no in (select prod_no from product5 where price < 1600);

CUST_NO
----------
C00003
C00004
C00005

6. select cust_no from purchase5 group by cust_no having sum(quantity) > all(select max(quantity) from purchase5 group by cust_no having cust_no = 'C00002');

CUST_NO
----------
C00003
C00006
C00004

7. select name from customer5 where cust_no not in (select cust_no from purchase5);

NAME
---------------
Ivan Bayross

8. select name from customer5 where cust_no in (select cust_no from purchase5 where prod_no in (select prod_no from product5 where company = 'Wipro'));

NAME
---------------
Ravi Sreedharan
Rukmini
 
--CORRELATED QUERIES

1. select distinct c1.cust_no, c1.price, c2.cust_no, c2.price from (select * from purchase5 join product5 on purchase5.prod_no = product5.prod_no) c1,(select * from purchase5 join product5 on purchase5.prod_no = product5.prod_no) c2 where c1.price < c2.price;

CUST_NO 	PRICE 	CUST_NO	PRICE
---------- ---------- ---------- ----------
C00003	1690 		C00002	11000
C00004	1560 		C00006	5000
C00003	1560 		C00006	5000
C00005	999 		C00003	1690
C00005	999 		C00004	1560
C00006	5000 		C00002	11000
C00003	1560 		C00002	11000
C00005	999 		C00006	5000
C00005	999 		C00003	1560
C00004	1560 		C00002	11000
C00004	1560 		C00003	1690
C00003	1560 		C00003	1690
C00005	999 		C00002	11000
C00003	1690 		C00006	5000

2. select distinct cust_no, name from customer5 where cust_no in (select cust_no from purchase5 where prod_no in (select prod_no from product5 where price < 1600));

CUST_NO    NAME
---------- ---------------
C00003	   Pramada Jaguste
C00004	   Basu Navindgi
C00005	   Ravi Sreedharan

3. select distinct prod_no from purchase5 where prod_no in (select prod_no from purchase5 group by prod_no having count(*) > 1);

PROD_NO
----------
P00002

4. select name from customer5 where cust_no in (select cust_no from purchase5 where prod_no = 'P00002');

NAME
---------------
Pramada Jaguste
Basu Navindgi

5. select name from customer5 where cust_no not in (select cust_no from purchase5 where prod_no = 'P00002');

NAME
---------------
Vandana Saitwal
Rukmini
Ravi Sreedharan
Ivan Bayross

6. select distinct name from customer5 where cust_no in (select cust_no from purchase5 where prod_no = all(select prod_no from purchase5 where cust_no = 'C00004') and cust_no <> 'C00004');

NAME
---------------
Pramada Jaguste
