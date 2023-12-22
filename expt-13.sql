PLSQL-TRAIN RESERVATION
..............................................
AIM: a) Perform COMMIT and ROLLBACK operations in the Train table. The train numbers
        should be automatically incremented for each row insertion.
     b) Write a PL/SQL program to implement the railway reservation system with PROCEDURE for 
        reservation and cancellation.
  
TABLE DESIGN:
    TRAIN (tno int, tname varchar(25), tdate Date, destination varchar(25), seats int)
    RESERVATIONS (train_id int, passenger_id int, status varchar2(30))
..............................................
  --table creation
create table train(tno int, tname varchar(25), tdate Date, destination varchar(25), seats int);

create table reservations(train_id int, passenger_id int, status varchar2(30));
..............................................
--code (a)
create or replace trigger tno_increment
before insert on train
for each row
declare
  max_tno number;
begin
  select nvl(max(tno), 0) + 1 into max_tno from train;
  :new.tno := max_tno;
end;
/

--code (b)
  create or replace procedure reservation (p_train_id in number, p_passenger_id in number) is
begin
  insert into reservations values (p_train_id, p_passenger_id, 'booked');
  commit;
exception
  when others then
    rollback;
    raise;
end reservation;
/

create or replace procedure cancel_reservation (p_reservation_id in number) is
begin
  update reservations
  set status = 'cancelled'
  where train_id = p_reservation_id;
  commit;
exception
  when others then
    rollback;
    raise;
end cancel_reservation;
/

begin
reservation(p_train_id => 1, p_passenger_id => 123);
reservation(p_train_id => 2, p_passenger_id => 124);
reservation(p_train_id => 3, p_passenger_id => 125);
cancel_reservation(p_reservation_id => 1);
end;
/
..............................................
--output(a)
insert into train (tname, tdate, destination, seats) values('Indira Express', '29-03-2003', 'AP', 45);
insert into train (tname, tdate, destination, seats) values('Rajdhani Express', '01-10-2022', 'Jammu', 60);
insert into train (tname, tdate, destination, seats) values('Shatabhthi Express', '02-11-1974', 'HP', 25);
select * from train;
       TNO 	TNAME		    TDATE    DESTINATION	SEATS
---------- ------------------------- -------- ------------------------- ----------
	 1 	Indira Express	     29-03-03 	AP		45
	 2 	Rajdhani Express	   01-10-22 	Jammu	60
	 3 	Shatabhthi Express   02-11-74 	HP		25

--output (b)
select * from reservations;
  TRAIN_ID PASSENGER_ID   STATUS
---------- ------------ --------------------
	 1	      123           booked
	 2	      124           booked
	 3	      125          cancelled
