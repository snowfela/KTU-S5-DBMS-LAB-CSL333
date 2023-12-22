PLSQL-STUDENT AVERAGE
..............................................
AIM: Write a PLSQL block to find average mark of students in a class and print the marks & print " Need improvement " if the class average < 40. At the bottom print current date and day.
  
TABLE DESIGN:
    STUDENT7(RollNo number(10), Name varchar(20), Mark1 number(10), Mark2 number(10), Mark3 number(10))
..............................................
  --table creation
create table STUDENT7(RollNo number(10) primary key not null, Name varchar(20), Mark1 number(10), Mark2 number(10), Mark3 number(10));
insert into student7 values(1, 'Ayan', 67, 30, 59);
insert into student7 values(2, 'Arya', 99, 70, 100);
insert into student7 values(3, 'Catherine', 10, 39, 20);
insert into student7 values(4, 'Keerthy', 69, 45, 70);
insert into student7 values(5, 'Raveena', 99, 78, 50);
insert into student7 values(6, 'Raghav', 5, 77, 25);
insert into student7 values(7, 'Rahul', 50, 20, 89);
..............................................
--code
set serveroutput on
accept x number prompt 'Enter roll no: ';
declare 
x number(10);
m1 number(10);
m2 number(10);
m3 number(10);
avgm number(10);
day varchar(20);
weekday varchar(20);
begin
x:=&x;
select mark1 into m1, mark2 into m2, mark3 into m3 from student7 where rollno = x;
avgm:=(m1+m2+m3)/3;
dbms_output.put_line('Average Marks: '||avgm);
if avgm < 40 then
	dbms_output.put_line('Need Improvement');
end if;
select to_char(current_date, 'dd-mm-yyyy') into day, to_char(current_date, 'DAY') into weekday from dual;
dbms_output.put_line('Date: '||day||' - '||weekday);
end;
/
..............................................
--output
Enter roll no: 2
old  10: x:=&x;
new  10: x:=	     2;
Average Marks: 80
Date: 02-11-2023  THURSDAY
