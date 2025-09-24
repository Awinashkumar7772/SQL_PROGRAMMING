--Q1
delimiter //
create procedure add_Sum(in num1 int,in num2 int)
begin 
select (num1+num2) as sum;
end //
delimiter ;
call add_Sum(3,5)

 -- Q2
 drop procedure Odd_Even;
 delimiter //
 create procedure Odd_Even(in num int)
 begin 
 if mod(num,2) = 0 then
 select "Num is even";
 else select "Num is odd";
 end if;
 end//
 call Odd_Even(2);
 
 -- Q3
 delimiter //
 create procedure uppercase_1(in name varchar(20))
 begin
 select upper(name) ;
end //
call uppercase_1("awinash");
-- Q4
drop procedure getFact;
delimiter //
create procedure getFact(in num int)
begin 
declare i int default 1;
declare result int default 1;
while i<=num do
set result = result*i;
set i = i+1; 
end while;
select concat("factorial is " , result);
end //
call getFact(6);

-- Q5

drop procedure getFact;
delimiter //
create procedure getFact(in num int)
begin 
declare i int default 1;
create temporary table mul(n int );
while i<=10 do
insert into mul(n) values (num*i);
set i = i+1; 
end while;
select * from mul;
end //
call getFact(6);
------------------------------------------------------------------
-- Q1
drop procedure getDetails;
delimiter //
create procedure getDetails(in eid int)
begin 
select empname,basicpay from emp where empcode = eid;
end //
delimiter ;
call getDetails(7888);

-- Q2
drop procedure getDetails;
delimiter //
create procedure getDetails(in deptid varchar(20))
begin 
select count(*) from emp where deptcode = deptid;
end //
delimiter ;
call getDetails("ACCT");

-- Q4
drop procedure getDetails;
delimiter //
create procedure getDetails(in eid int)
begin 
select product_name,stock_quantity from products where product_id = eid;
end //
delimiter ;
call getDetails(102);






