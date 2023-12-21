--table creation
create table DEPARTMENT(dep_no number(38) primary key not null, depname varchar2(15) not null, loc varchar2(15) not null, mgr number(38) not null, exp_bdg number(38) not null, rev_bdg number(38) not null);
insert into Department values (60,'shipping','trivandrum',215,90000,0);
insert into Department values (10,'accounting','cochin',200,100000,0);
insert into Department values (30,'research','cochin',105,125000,0);
insert into Department values (40,'sales','trichur',109,28000,8000);
insert into Department values (50,'manufacturing','kottayam',210,130000,0);

create table EMPLOYEE(empno number(38) primary key not null, name varchar2(15) not null, job varchar2(15) not null, salary number(38) not null, comm varchar2(15), dep_no number(38), sex varchar2(6), foreign key(dep_no) references department(dep_no) on delete cascade);
insert into Employee values (100,'wilson','clrk',17000,NULL,10,'M');
insert into Employee values (101,'smitha','slsm',25000,1300,40,'F');
insert into Employee values (103,'roy','anlst',35000,NULL,30,'M');
insert into Employee values (105,'watson','mngr',45000,0,30,'M');
insert into Employee values (109,'alan','mngr',30000,8000,40,'M');
insert into Employee values (110,'tina','clrk',18000,NULL,50,'F');
insert into Employee values (200,'karthika','mngr',29000,NULL,10,'F');
insert into Employee values (210,'rita','mngr',36500,NULL,50,'F');
insert into Employee values (213,'manacy','clrk',16250,NULL,10,'F');
insert into Employee values (214,'simpson','drvr',8250,NULL,60,'M');
insert into Employee values (215,'deepa','anlst',27000,NULL,60,'F');
insert into Employee values (220,'soosan','slsm',28500,5300,60,'F');

create table DEPENDANT(pid number(38) primary key not null, fname varchar2(15) not null, lname varchar2(15) not null, place varchar2(15) not null, empno number(38) not null, foreign key(empno) references employee(empno) on delete cascade);
insert into Dependant values (1010,'anu','jose','trivandrum',214);
insert into Dependant values (1020,'neenu','thomas','kollam',200);
insert into Dependant values (1022,'anamika','thampi','kollam',200);
insert into Dependant values (1031,'swetha','das','kottayam',109);

--queries
1. select * from employee where job = 'mngr' order by name asc;

     EMPNO NAME 	   JOB	       SALARY 	COMM   DEP_NO SEX
---------- ------- ---------- ------
       109 	alan 	   	mngr 		30000 	8000	       40 	M
       200 	karthika	mngr 		29000			      10 	F
       210 	rita 	   	mngr 		36500			      50 	F
       105 	watson	mngr 		45000 	0 	      30 	M
       
2.select * from employee where dep_no = 40 order by empno asc;

     EMPNO NAME 	JOB	SALARY COMM		DEP_NO    SEX
---------- ------- ---------- ------
       101 	smitha	slsm 	25000 	1300		      40 	F
       109 	alan 	   	mngr 	30000 	8000		      40 	M

3. select * from employee where sex = 'F' order by name asc;

     EMPNO NAME 	   JOB	    SALARY 	COMM	DEP_NO SEX
---------- ------- ---------- ------
       215 	deepa	   	anlst		27000			      	60 		F
       200 	karthika	mngr 		29000			      	10 		F
       213 	manacy	clrk 		16250			      	10 		F
       210 	rita 	   	mngr 		36500			      	50 		F
       101 	smitha	slsm 		25000          1300		40 		F
       220 	soosan	slsm 		28500          5300		60 		F
       110 	tina 	   	clrk 		18000			      	50 		F

4. select dep_no, min(salary), max(salary), avg(salary) from employee group by dep_no;

 DEP_NO     MIN(SALARY) 	MAX(SALARY) 	AVG(SALARY)
---------- ----------- ----------- -----------
	30	 	35000	     	45000	 		40000
	40	 	25000	     	30000	 		27500
	50	 	18000	     	36500	 		27250
	10	 	16250	     	29000	 		20750
	60	  	8250	     	28500	 		21250

5. select max(comm), min(comm), sum(comm), count(*) from employee where comm > 0;

MAX(COMM)	MIN(COMM)	 SUM(COMM)   COUNT(*)
--------------- --------------- ---------- ----------
8000			1300		     	14600	    		3

6. select job, count(*) from employee group by job;

JOB		  COUNT(*)
--------------- ----------
mngr			 4
drvr			 1
anlst			 2
clrk			 3
slsm			 2

7.select job, sum(salary) from employee group by job;

JOB		SUM(SALARY)
--------------- -----------
mngr		     140500
drvr		       8250
anlst		      62000
clrk		      51250
slsm		      53500

8.select distinct dep_no from employee;

    DEP_NO
----------
	30
	40
	50
	10
	60

9.select empno, name, salary from employee where sex = 'F' and dep_no = 10;

   EMPNO    NAME 	       SALARY
---------- --------------- ----------
       200 	karthika		29000
       213 	manacy		16250

10. select empno, name, salary from employee where sex = 'M' and job = 'mngr' order by name asc;
     EMPNO NAME 	       SALARY
---------- --------------- ----------
       109 	alan 			30000
       105 	watson		45000
11. select name, job from employee where sex = 'F' and (job = 'slsm' or job = 'mngr');

NAME		JOB
--------------- ---------------
smitha		slsm
karthika		mngr
rita			mngr
soosan		slsm

12. select empno, name from employee where (job = 'mngr' or job = 'clrk') and dep_no = 50;

     EMPNO NAME
---------- ---------------
       110 tina
       210 rita

13. select name from employee where job != 'slsm' and job != 'clrk';
NAME
---------------
roy
watson
alan
karthika
rita
simpson
deepa

14. select * from employee where job = 'clrk' and dep_no != 10;

     EMPNO NAME 	JOB		SALARY 	COMM	DEP_NO 	SEX
---------- ------- ---------- ------
       110 	tina 	clrk 		18000			     50 		F

15. select * from employee where name like '%u%' or name like '%e%';

   EMPNO 	NAME 	  JOB		SALARY 	COMM	DEP_NO 	SEX
---------- ------- ---------- ------
       215 	deepa	   	anlst		27000			      	60 		F
16. select * from employee where comm > 0;

     EMPNO NAME 	   JOB		SALARY 	COMM	DEP_NO 	SEX
---------- ------- ---------- ------
       101 	smitha	slsm 		25000 	1300		      40 	F
       109 	alan 	   	mngr 		30000 	8000		      40 	M
       220 	soosan	slsm 		28500 	5300		      60 	F

17. select empno, name, job from employee where sex = 'F' and job != 'mngr';

     EMPNO NAME 	   JOB
---------- --------------- ---------------
       101 	smitha	slsm
       110 	tina 	   	clrk
       213 	manacy	clrk
       215 	deepa	   	anlst
       220 	soosan	slsm

18. select empno, name, salary from employee where salary > 10000 and salary < 40000;

   EMPNO    NAME 	SALARY
---------- --------------- ----------
       100 	wilson	17000
       101 	smitha	25000
       103 	roy		35000
       109 	alan 		30000
       110 	tina 		18000
       200 	karthika	29000
       210 	rita 		36500
       213 	manacy	16250
       215 	deepa		27000
       220 	soosan	28500

19. select empno, name, job from employee where job = 'anlst' or job = 'mngr' order by name asc;

   EMPNO 	NAME 	   JOB
---------- --------------- ---------------
       109 	alan 	   	mngr
       215 	deepa	   	anlst
       200 	karthika	mngr
       210 	rita 	   	mngr
       103 	roy		anlst
       105 	watson	mngr

20. select empno, name, job, salary from employee where comm is not null and salary > 30000;

     EMPNO NAME 	   JOB		       SALARY
---------- --------------- --------------- ----------
       105 watson	   mngr 		45000

21. select d.dep_no, d.depname, e.salary, e.job, e.sex from employee e, department d where d.dep_no = e.dep_no order by e.empno;

    DEP_NO DEP_NAME	       SALARY JOB	      SEX
-- ------
	10 Accounting		17000 CLRK	      M
	40 Sales		25000 SLSM	      F
	30 Research		35000 ANLST	      M
	30 Research		45000 MNGR	      M
	40 Sales		35000 MNGR	      M
	50 Manufacturing	18000 CLRK	      F
	10 Accounting		29000 MNGR	      F
	50 Manufacturing	36500 MNGR	      F
	10 Accounting		16250 CLRK	      F
	60 Shipping		 8250 DRVR	      M
	60 Shipping		27000 ANLST	      F
	60 Shipping		28500 SLSM	      F

22. select employee.name, dependant.fname from employee, dependant, department where dependant.empno = employee.empno and ( dependant.place = department.loc and employee.dep_no = department.dep_no);

NAME		FNAME
--------------- ---------------
Simpson 	Anu

23. select department.loc from department, employee where employee.name = 'Watson' and employee.dep_no = department.dep_no;

LOC
---------------
Cochin

24. select e.name, e.empno, d.dep_no from employee e, department d where loc = 'Trichur' and e.dep_no = d.dep_no order by e.empno desc;

NAME		     EMPNO     DEP_NO
--------------- ---------- ----------
Alan		       109	   40
Smitha		       101	   40

25. select name, salary from employee where salary > all( select avg(salary) from employee);

NAME		    SALARY
--------------- ----------
Roy		     35000
Watson		     45000
Alan		     35000
Karthika	     29000
Rita		     36500
Deepa		     27000
Soosan		     28500

26. select e.name, e.job, e.dep_no, d.loc from employee e, department d where e.sex = 'F' and d.dep_no = e.dep_no order by e.empno;

NAME		JOB		    DEP_NO LOC
-------
Smitha		SLSM			40 Trichur
Tina		CLRK			50 Kottayam
Karthika	MNGR			10 Cochin
Rita		MNGR			50 Kottayam
Manacy		CLRK			10 Cochin
Deepa		ANLST			60 Trivandrum
Soosan		SLSM			60 Trivandrum

27. select e.name, d.dep_name from employee e, department d where d.dep_no = e.dep_no and job = 'MNGR' order by d.dep_name;

NAME		DEP_NAME
--------------- ---------------
Karthika	Accounting
Rita		Manufacturing
Watson		Research
Alan		Sales

28. select e.name, d.dep_name from employee e, department d where e.dep_no = d.dep_no and salary = all (select max(salary) from employee);

NAME		DEP_NAME
--------------- ---------------
Watson		Research

29. select e.name, d.dep_name, e.comm from employee e, department d where e.comm is not null and d.dep_no = e.dep_no;

NAME		DEP_NAME	COMM
--------------- --------------- -
Alan		Sales		8000
Smitha		Sales		1300


30. select e.name, d.dep_name from employee e, department d where e.dep_no = d.dep_no and d.dep_no in (select dep_no from employee group by dep_no having count(*) >= 3);

NAME		DEP_NAME
--------------- ---------------
Wilson		Accounting
Karthika	Accounting
Manacy		Accounting
Simpson 	Shipping
Deepa		Shipping
Soosan		Shipping

31. select e.name, d.dep_name, e.comm from employee e, department d where e.comm is null and e.dep_no = d.dep_no order by e.name;

NAME		DEP_NAME	COMM
--------------- --------
Deepa		Shipping
Karthika	Accounting
Manacy		Accounting
Rita		Manufacturing
Roy		Research
Simpson 	Shipping
Tina		Manufacturing
Wilson		Accounting

32. select name, salary from employee where dep_no = 10 or dep_no = 30;

NAME		    SALARY
--------------- ----------
Wilson		     17000
Roy		     35000
Watson		     45000
Karthika	     29000
Manacy		     16250

33. select job from employee where dep_no = 30 and job <> any(select job from employee where dep_no = 40);

JOB
---------------
ANLST
MNGR

34. select job, salary from employee where dep_no = 10 and salary = any(select salary from employee where dep_no = 40)

no rows selected

35. create view test2 as select empno, name, job from employee where job = 'MNGR';

     EMPNO NAME 	   JOB
---------- --------------- ---
       105 Watson	   MNGR
       109 Alan 	   MNGR
       200 Karthika	   MNGR
       210 Rita 	   MNGR

36. select empno, name, job, salary from employee where job = 'CLRK' and salary > 1650;

     EMPNO NAME 	   JOB		       SALARY
---------- --------------- --------------
       100 Wilson	   CLRK 		17000
       110 Tina 	   CLRK 		18000
       213 Manacy	   CLRK 		16250

37. create index fl on dependant(fname, lname);

select * from all_indexes where table_name = 'dependant';

38. delete from dependant where pid = 1031;

       PID FNAME	   LNAME	   PLACE		EMPNO
---------- --------------- --------------- --------------- ----------
      1010 Anu		   Jose 	   Trivandrum		  214
      1020 Neenu	   Thomas	   Kollam		  200
      1022 Anamika	   Thampi	   Kollam		  200
      
     
39. select empno, name, salary from employee where sex = 'F' and dep_no = 10 and ROWNUM = 1;

     EMPNO NAME 	       SALARY
---------- --------------- ----------
       200 Karthika		29000


40. delete from dependant where empno in (select empno from employee where name = 'Karthika');
    delete from employee where name = 'Karthika';
