PLSQL-TRIGGER PRINT MESSAGE
..............................................
AIM: Create a trigger to print messages when insert, delete or update operation is performed on student table
                          Operation               Action/Message
                     row/tuple inserted           inserted sname 
                name, roll, s1 or s2 updated     updated to sname 
                     row/tuple deleted            deleting sname

TABLE DESIGN:
    STUDENT9 (RollNo number(10), Name varchar(20), S1 float(10), S2 float(10))      --same as that of expt 9 can be used
..............................................
--code
set serveroutput on
create or replace trigger print_msg
before insert or update or delete on student9
for each row
begin
case 
    when inserting then
        dbms_output.put_line('Inserted '||:new.name);
    when updating('rollno') then   
        dbms_output.put_line('Updating rollno '||:old.rollno||' to '||:new.rollno);
    when updating('name') then   
        dbms_output.put_line('Updating name '||:old.name||' to '||:new.name);
    when updating('s1') then 
        dbms_output.put_line('Updating s1 grade '||:old.s1||' to '||:new.s1);
    when updating('s2') then 
        dbms_output.put_line('Updating s2 grade '||:old.s2||' to '||:new.s2);
    when deleting then
        dbms_output.put_line('Deleting '||:old.name);
end case;
end;
/
..............................................
--output:
insert into student9 values(7, 'Balaji', 8.9, 7.6);
Inserted Balaji
update student9 set name = ‘Sekhar’ where rollno=7;
Updating name Balaji to Sekhar
delete from student9 where rollno=7;
Deleting Sekhar
