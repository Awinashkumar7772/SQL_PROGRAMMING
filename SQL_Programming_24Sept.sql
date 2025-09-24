use dac_dbt_2022;
drop procedure sayHello;
delimiter //
create procedure sayHello(in name varchar(20))
begin 

select concat("Hello  ",name) as Greeting;
end //
call sayHello("Awinash") ;
------------------------------------------
drop procedure getEmpDetails;
delimiter //
create procedure getEmpDetails(in eid int)
begin
select empcode,empname from emp
where empcode = eid;
end //
call getEmpDetails(7888);

delimiter //
create procedure getMaxDetails()
begin 
select empcode from emp 
where basicpay = (select max(basicpay) from emp);
end //
call getmaxDetails();
-----------------------------------------
drop procedure getMaximum;
delimiter //
create procedure getMaximum(in dept varchar(10))
begin
select empcode, empname from emp 
where deptcode = dept and basicpay = (select max(basicpay) from emp where deptcode = dept);
end//
call getMaximum("STOR");