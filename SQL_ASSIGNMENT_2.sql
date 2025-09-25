CREATE DATABASE school;
drop database school;
USE school;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50),
    marks INT
);
INSERT INTO students (name, age, course, marks) VALUES
('Alice', 20, 'Computer Science', 19),
('Bob', 21, 'Electronics', 78),
('Charlie', 22, 'Mechanical', 65),
('David', 20, 'Electrical', 50),
('Eva', 23, 'Civil', 88),
('Frank', 21, 'Computer Science', 73),
('Grace', 22, 'Electronics', 81),
('Helen', 20, 'Mechanical', 55),
('Ian', 21, 'Civil', 60),
('Jane', 22, 'Computer Science', 95);
select * from  students;
-- Q3 
delimiter //
create procedure getDetails(in student_name varchar(20))
begin
declare sid int default 0;

select id into sid from students where student_name= name;
select sid; 
end //
call getDetails("Grace");

-- Q4 
drop procedure getDetails;
delimiter //
create procedure getDetails(in student_id varchar(20))
begin
declare average double default 0;
select avg(marks) into average from students where student_id = name;
select distinct average,name from students where student_id= name; 
end //
call getDetails("Alice");


-- Q5
drop procedure getStudent;
delimiter //
create procedure getStudent(in student_name varchar(20))
begin
declare cname varchar(20) default null;
select course into cname from students where student_name = name;
select cname,name from students where student_name = name;
end //
call getStudent("Alice");

-------------------------------------------------------------------
-- Q6 
delimiter //
create procedure getTopper(out student_name varchar(20))
begin 
select name into student_name from students where marks = (
select max(marks) from students);
end //
call getTopper(@name);
select @name, marks from students where name = @name;

-- Q7
delimiter //
create procedure getLowest(out student_name varchar(20))
begin 
select name into student_name from students where marks = (
select min(marks) from students);
end //
call getLowest(@name);
select @name, marks from students where name = @name;

-- Q8
delimiter //
create procedure getTotal(out student_id int)
begin 
select count(*) into student_id from students;
end //
call getTotal(@id);
select @id;
-- Q9
drop procedure getaverage;
delimiter //
create procedure getaverage(out average double)
begin

select avg(marks) into average from students;
end //
call getaverage(@abg);
select @abg;

-- Q10
drop procedure 
delimiter //
create procedure getName(in Student_id int,out course_name varchar(20))
begin
select course into course_name from students where Student_id = id;
end//
call getname(1,@cname);
select @cname,name from students where @cname = course limit 1;









