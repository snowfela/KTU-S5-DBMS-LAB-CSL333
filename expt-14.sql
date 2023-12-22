PLSQL-PACKAGE
..............................................
AIM: Write a PLSQL program to implement Employee database using package for information retrieval(add, delete, list employees & a function to return salary of an employee).
  
TABLE DESIGN:
    EMPLOYEE14(eid int, name varchar2(20), salary number(38))
..............................................
  --table creation
create table EMPLOYEE14(eid int, name varchar2(20), salary number(38));
..............................................
--code
create or replace package employee_pkg is
  procedure add_employee(p_employee_id in number, p_name in varchar2, p_salary in number);
  procedure delete_employee(p_employee_id in number);
  procedure list_employees;
  function get_salary(p_employee_id in number) return number;
end employee_pkg;
/
create or replace package body employee_pkg is
  procedure add_employee(p_employee_id in number, p_name in varchar2, p_salary in number) is
  begin
    insert into employee14 (eid, name, salary) values (p_employee_id, p_name, p_salary);
    commit;
  end add_employee;
  procedure delete_employee (p_employee_id in number) is
  begin
    delete from employee14 where eid = p_employee_id;
    commit;
  end delete_employee;
  procedure list_employees is
    begin
      for r in (select * from employee14) loop
      dbms_output.put_line('id: ' || r.eid || ', name: ' || r.name || ', salary: ' || r.salary);
      end loop;
    end list_employees;
  function get_salary(p_employee_id in number) return number is
    v_salary employee14.salary%type;
  begin
    select salary into v_salary from employee14
    where eid = p_employee_id;
    return v_salary;
  exception
    when no_data_found then
      dbms_output.put_line('No employee found with id: ' || p_employee_id);
      return null;
    when others then
      dbms_output.put_line('Unexpected error occurred');
      return null;
  end get_salary;
end employee_pkg;
/

set serveroutput on
begin
employee_pkg.add_employee(1, 'Ravi', 150000);
employee_pkg.add_employee(2, 'Raghav', 200000);
employee_pkg.add_employee(3, 'Miya', 20000);
employee_pkg.list_employees();
employee_pkg.delete_employee(3);
employee_pkg.list_employees();
dbms_output.put_line('Salary of employee 1: ' || employee_pkg.get_salary(1));
end;
/
..............................................
--output:
id: 1, name: Ravi, salary: 150000
id: 2, name: Raghav, salary: 200000
id: 3, name: Miya, salary: 20000
id: 1, name: Ravi, salary: 150000
id: 2, name: Raghav, salary: 200000
Salary of employee 1: 150000
select * from employee14;
EID NAME 		    SALARY
---------- -------------------- ----------
1   Ravi 		    150000
2   Raghav		   200000
