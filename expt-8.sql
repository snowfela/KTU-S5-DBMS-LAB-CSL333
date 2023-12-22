PLSQL-ACCOUNT CATEGORIZATION
..............................................
AIM: Create a PLSQL block to create a function to determine the category/type of customer after verifying their account balance and retrieve the details along with their category. 
     Categories – platinum (balance>50k), gold (balance<=50k & > 10k), silver (balance <= 10k). 
  
TABLE DESIGN:
    ACCOUNTS(accno number(20), name varchar(20), balance number(20))     --same as that of expt 6 can be used
..............................................
  --code
create or replace function category(x in number) return varchar is 
msg varchar(10);
begin
	if x > 50000 then
		msg:='Platinum';
	elsif x > 10000 then
		msg:='Gold';
	else 
		msg:='Silver';
	end if;
	return msg;
end;
/
set serveroutput on
accept x number prompt 'Enter account no: '
declare
x number(2);
bal number(10);
rating varchar(10);
begin
x:=&x;
select balance into bal from account8 where accno = x; 
if x > 50000 then
		msg:='Platinum';
	elsif x > 10000 then
		msg:='Gold';
	else 
		msg:='Silver';
	end if;
dbms_output.put_line('Account no: '||x||' - '||rating); 
end;
/
..............................................
--output
Function created.
Enter account no: 2
old   6: x:=&x;
new   6: x:=	     2;
Account no: 2 - Silver
