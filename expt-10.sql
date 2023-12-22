PLSQL-ELECTRICITY BILL
..............................................
AIM: Write a PL/SQL program using cursor to print the electricity bill of the consumer.
			Unit consumed       Charge
				1-100             	 5
				101-300           	7.5
				301-500           	15
				>500             	 22.5
  
TABLE DESIGN:
    ELECTRICITY(cno number(30), name varchar(10), prev_units float(10), curr_units float(10))
..............................................
  --table creation
create table ELECTRICITY(cno number(30), name varchar(10), prev_units float(10), curr_units float(10));
insert into electricity values(1,'Sree', 150, 390);
insert into electricity values(2,'Desna', 70, 270);
insert into electricity values(3,'Nikhil', 100, 600);
insert into electricity values(4,'Nayra', 590, 800);
insert into electricity values(5,'Jiya', 300, 680);
..............................................
--code
set serveroutput on
accept x number prompt 'Enter consumer no: ';
declare
cursor electricity_bill is select * from electricity;
unit float;
consumed float;
bill float;
x number(10);
begin
x:=&x;
for i in electricity_bill loop
	if i.cno = x then
		bill:=0;
		unit:=i.curr_units-i.prev_units;
		consumed:=unit;
		if unit>500 then
			unit := unit - 500;
			bill := 100 * 5 + 200 * 7.5 + 200 * 15 + unit * 22.5;
		elsif unit > 300 then
			unit := unit - 300;
			bill := 100 * 5 + 200 * 7.5 + unit * 15;
		elsif unit > 100 then
			unit := unit - 100;
			bill := 100 * 5 + unit * 7.5;
		else
			bill := unit * 5;
		end if;
		dbms_output.put_line('Consumer '||i.cno||' : '||i.name||chr(10)||'Units consumed : ' ||consumed||chr(10)||'Bill Amount : ' || bill||' Rs');
	end if;
end loop;
end;
/
..............................................
--output:
Enter consumer no: 1
old   8: x:=&x;
new   8: x:=	     1;
Consumer 1 : Sree
Units consumed : 240
Bill Amount : 1550 Rs
