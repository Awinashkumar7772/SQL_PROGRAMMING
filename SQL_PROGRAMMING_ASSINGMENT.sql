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
------------------------------------
-- q4
drop procedure display_product;
delimiter //
create procedure display_product(in id int)
begin
select * from products
where product_id = id;
end //
delimiter ;
call display_product(103);

-- q3
drop procedure display_product;
delimiter //
create procedure display_product(in cus_id int)
begin
select customer_id, order_id, product_name from orders
where cus_id = customer_id;
end //
delimiter ;
call display_product(3);

-- q5
drop procedure display_student;
delimiter //
create procedure display_student(in stu_id int, out Nmarks int)
begin
declare grade char(1) default null;
select marks into Nmarks from students where stu_id = student_id;
if(Nmarks>80) then
set grade = 'A';
else
set grade = 'C';
end if;
select student_name, student_id, grade as grading from students where 
stu_id = student_id;
end //
delimiter ;
call display_student(2, @Nmarks);

select @Nmarks;







