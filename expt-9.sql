PLSQL-HONOR ELIGIBILITY
..............................................
AIM: Create a cursor storing the details of students eligible for honors (total grade for s1 and s2 greater than 12) in rollno order & print highest grade obtained in the previous semesters for them.
  
TABLE DESIGN:
    STUDENT9 (RollNo number(10), Name varchar(20), S1 float(10), S2 float(10))
..............................................
  --table creation
create table STUDENT9(RollNo number(10), Name varchar(20), s1 float(10), s2 float(10));
insert into student9 values(1, 'Aravind', 7.5, 8.9);
insert into student9 values(2, 'Aryan', 8.4, 9.6);
insert into student9 values(3, 'Bisna',5.6, 4.7);
insert into student9 values(4, 'Kripa', 7, 3.6);
insert into student9 values(5, 'Riya', 2.6, 5.5);
insert into student9 values(6, 'Sara', 9.9, 6.4);
..............................................
--code
set serveroutput on
declare
cursor honor is select * from student9 where s1+s2>12 order by rollno;
maxgrade float(5);
begin
dbms_output.put_line('Eligible honors students'||chr(10)||'Name      RollNo      Highest Grade');
for i in honor loop
	if i.s1 > i.s2 then
		maxgrade:=i.s1;
	else
		maxgrade:=i.s2;
	end if;
	dbms_output.put_line(i.name||'       '||i.rollno||'             '||maxgrade);
end loop;
end;
/
..............................................
--output:
Eligible honors students
Name	  	  RollNo    Highest Grade
Aravind       1 	    	8.9
Aryan	    	  2		      9.6
Sara	   	    6		      9.9
