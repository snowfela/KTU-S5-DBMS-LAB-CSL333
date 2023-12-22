PLSQL-AVERAGE TRIGGER 
..............................................
AIM: Create a trigger to automatically calculate total & average of student marks whenever a record is inserted.
  
TABLE DESIGN:
    STUDENT12 (rollno number(10), name varchar(25), mark1 float(10), mark2 float(10), mark3 float(10), total float(20), average float(20))
..............................................
--table creation
  create table student12(rollno number(10) primary key not null, name varchar(25), mark1 float(10), mark2 float(10), mark3 float(10), total float(20), average float(20));
..............................................
--code
create or replace trigger student_avg 
before insert on student7
for each row 
begin
    :new.total := :new.mark1 + :new.mark2 + :new.mark3;
    :new.average := :new.total / 3;
end;
/
..............................................
--output:
insert into student12 values (1,'Aryan',78,89,67,null,null);
insert into student12 values (2,'Nivya',77,67,56,null,null);
insert into student12 values (3,'Nira',93,92,99,null,null);
select * from student12;
ROLLNO    NAME 			  MARK1  MARK2	MARK3	  TOTAL    AVERAGE
---------- ------------------------- ---------- ----------
	 1     Aryan			     78 	89	   67	     234	   78
	 2     Nivya			     77 	67	   56	     200     66.66667
	 3     Nira 			     93 	92	   99	     284     94.66667
