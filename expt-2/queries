--Table creation
create table SUPPLIER(s_no varchar(10) not null, sname varchar(15) not null, age int not null, city varchar(15) not null, primary key(s_no));
insert into SUPPLIER values('S001','ivan bayross',35,'bombay');
insert into SUPPLIER values('S002','nirmala agarwal',35,'madras');
insert into SUPPLIER values('C003','susmitha',55,'bombay');
insert into SUPPLIER values('C004','basu navindgi',45,'bombay');
insert into SUPPLIER values('C005','ravi sreedharan',25,'delhi');
insert into SUPPLIER values('C006','nanda gopal',25,'madras');

create table CUSTOMER(cust_no varchar(10) not null,name varchar(15) not null,age int not null,city varchar(15) not null,pincode int not null,state varchar(15) not null,primary key(cust_no));
insert into customer values('C00001','ivan bayross',35,'bombay',400054,'maharastra');
insert into customer values('C00002','vandana saitval',35,'madras',780001,'tamil nadu');
insert into customer values('C00003','pramada jaguste',55,'bombay',400057,'maharastra');
insert into customer values('C00004','basu navindgi',45,'bombay',400056,'maharastra');
insert into customer values('C00005','ravi sreedharan',25,'delhi',100001,'delhi');
insert into customer values('C00006','rukmini',25,'madras',780001,'tamil nadu');

create table PRODUCT(prod_no varchar(10) not null, description varchar(15) not null, company varchar(15) not null, price int not null, primary key(prod_no));
insert into product values('P00001','12W flood light','wipro',5000);
insert into product values('P00002','laptop adaptor','dell',1560);
insert into product values('P00003','tablet','hcl',11000);
insert into product values('P00004','garnet 50W led','wipro',999);
insert into product values('P00005','laptop charger','hcl',1690);

create table PURCHASE (order_no varchar(10) not null, cust_no varchar(10) not null, prod_no varchar(10) not null, quantity int not null, orderdate date, primary key(order_no), foreign key(cust_no) references customer(cust_no) on delete cascade, foreign key(prod_no) references product(prod_no) on delete cascade);
insert into purchase values('O00001','C00002','P00003',2,'20-jan-16');
insert into purchase values('O00002','C00003','P00002',1,'22-jan-16');
insert into purchase values('O00003','C00006','P00001',3,'20-feb-16');
insert into purchase values('O00004','C00003','P00005',4,'02-apr-16');
insert into purchase values('O00005','C00004','P00002',2,'22-may-16');
insert into purchase values('O00006','C00005','P00004',1,'26-may-16');

--queries

1. select sname from customer where city='madras';

SNAME
---------------
vandana saitval
rukmini

2. select cust_no as jan_cust from purchase where orderdate like '%-01-%';

JAN_CUST
---------------
C00002
C00003

3. select company from product where price>5000;

COMPANY
---------------
hcl

4. select sname from customer where sname not like 'r%';

SNAME
---------------
ivan bayross
vandana saitval
pramada jaguste
basu navindgi

5. alter table customer add email varchar(20);

Table altered.

6. select sname from customer where age>40 and state='maharastra';

SNAME
---------------
pramada jaguste
basu navindgi

7. select company from product order by price;

COMPANY
---------------
wipro
dell
hcl
wipro
hcl

8. select avg(age) from customer;

  AVG(AGE)
----------
36.6666667

9. select distinct city from customer where state='maharastra' or state='tamil nadu';

CITY
---------------
madras
bombay

10. select avg(price) from product;

AVG(PRICE)
----------
    4049.8

11. select cust_no, quantity from purchase order by quantity;

CUST_NO 	 	 QUANTITY
--------------- ----------
C00003			 1
C00005			 1
C00002			 2
C00004			 2
C00006			 3
C00003			 4

12. update purchase set prod_no='P00003' where cust_no='C00003';

2 rows updated.

13. select count(cust_no) from customer where city='delhi';

COUNT(CUST_NO)
--------------
	     1

14. select cust_no from purchase where quantity>3;

CUST_NO
---------------
C00003

15.  alter table purchase modify orderdate varchar(15);

16. select min(price),max(price) from product;

MIN(PRICE) MAX(PRICE)
---------- ----------
       999	11000

17. select count(product_no),company from product group by company having company='hcl' or company='wipro';

COUNT(PRODUCT_NO)    COMPANY
----------------- ---------------
		2 			hcl
		2 			wipro

18. select * from customer order by sname;

CUST_NO   SNAME		AGE CITY		PINCODE     STATE 	EMAIL
-- ---------- ---------------
C00004	basu navindgi	45 	bombay	400056 	maharastra
C00001	ivan bayross		35 	bombay	400054 	maharastra
C00003	pramada jaguste	55 	bombay	400057 	maharastra
C00005	ravi sreedharan	25 	delhi		100001 	delhi
C00006	rukmini		25 	madras	780001 	tamil nadu
C00002	vandana saitval	35 	madras	780001 	tamil nadu

19. select * from purchase order by orderdate desc;

ORDER_NO	CUST_NO 	PROD_NO 	  QUANTITY ORDERDATE
--------------- --------------- --------------- ---------- --------
O00006		C00005		P00004	1 	26-05-16
O00005		C00004		P00002	2 	22-05-16
O00004		C00003		P00003	4 	07-04-16
O00003		C00006		P00001	3 	20-02-16
O00002		C00003		P00003	1 	27-01-16
O00001		C00002		P00003	2 	20-01-16

20.  delete from product where product_no='P00003';

1 row deleted.

21. create table orders as ( select order_no, orderdate from purchase);

Table created.

22. drop table orders;

Table dropped.

23. create view cuss as select * from customer;

View created.

24. select sname from customer where cust_no in (select cust_no from purchase group by cust_no having count(*)>1);

no rows selected

25. select purchase.*, customer.city from purchase inner join customer on purchase.cust_no=customer.cust_no where customer.city in (select city from customer group by city having count(*)>1 );

ORDER_NO     CUST_NO    PROD_NO 	QUANTITY  ORDERDATE  CITY
--------------- --------------- --------------- ---------- --------
O00005		C00004	P00002		2 	22-05-16	bombay
O00003		C00006	P00001		3 	20-02-16	madras

26. select sname from customer where sname like'r%';

SNAME
---------------
ravi sreedharan
rukmini

27. select sname as name from supplier union select sname from customer;

NAME
---------------
basu navindgi
ivan bayross
nanda gopal
nirmala agarwal
pramada jaguste
ravi sreedharan
rukmini
susmitha
vandana saitval
