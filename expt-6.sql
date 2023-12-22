PLSQL-BANKING SYSTEM
..............................................
AIM: Write a PLSQL program to implement the following operation in banking system
    i) credit, debit, show balance
    ii) Accept an account number from the user and debit an amount 200  from the account if the account has min balance of 500 after the account is debited.
  
TABLE DESIGN:
    ACCOUNTS(accno number(20), name varchar(20), balance number(20));
..............................................
  --table creation
create table ACCOUNTS(accno number(20) not null primary key, name varchar(20), balance number(20));
insert into accounts values(1, 'Ananya', 5000);
insert into accounts values(2, 'Aravind', 8900);
insert into accounts values(3, 'Elizabeth', 1200);
insert into accounts values(4, 'Helen', 16750);
insert into accounts values(5, 'Kavya', 7900);
insert into accounts values(6, 'Nithya', 1150);
..............................................
--code
set serveroutput on
accept taccno number prompt 'Enter the account number : ';
accept x number prompt '1. Debit  2. Credit  3. Show Balance ';
accept val number prompt 'Enter the value to be transacted (or 0 if none) : ';
DECLARE
bal number(20);
minbal number(20):=500;
taccno number(20);
val number(20);
x number(20);
BEGIN
x:=&x;
taccno:=&taccno;
val:=&val;
select balance into bal from accounts where accno = taccno;
case
	when x = 1 then
		if ((bal - val) >= minbal) then
			bal:=bal-val;
			update accounts set balance = bal where accno = taccno;
			dbms_output.put_line('Rs '||val ||' debited from account '||taccno||chr(10)||'Current Balance: '||bal);
			commit;
		else 
			dbms_output.put_line('Insufficient Balance');
		end if;
	when x = 2 then
		bal:=bal+val;
		update accounts set balance = bal where accno = taccno;
		dbms_output.put_line('Rs '||val||' credited to account '||taccno||chr(10)||'Current Balance: '||bal);
		commit;
	when x = 3 then
		dbms_output.put_line('Current Balance : ' || bal);
end case;
END;
/
  
..............................................
--output:

  Enter the account number : 2
1. Debit  2. Credit  3. Show Balance 3
Enter the value to be transacted (or 0 if none) : 0
old   8: x:=&x;
new   8: x:=	     3;
old   9: taccno:=&taccno;
new   9: taccno:=	  2;
old  10: val:=&val;
new  10: val:=	       0;
Current Balance : 8900
  
Enter the account number : 1            
1. Debit  2. Credit  3. Show Balance 2
Enter the value to be transacted (or 0 if none) : 500
old   8: x:=&x;
new   8: x:=	     2;
old   9: taccno:=&taccno;
new   9: taccno:=	  1;
old  10: val:=&val;
new  10: val:=	     500;
Rs 500 credited to account 1
Current Balance: 5300

Enter the account number : 1              --also the output for (ii)
1. Debit  2. Credit  3. Show Balance 1
Enter the value to be transacted (or 0 if none) : 200
old   8: x:=&x;
new   8: x:=	     1;
old   9: taccno:=&taccno;
new   9: taccno:=	  1;
old  10: val:=&val;
new  10: val:=	     200;
Rs 200 debited from account 1
Current Balance: 4800
