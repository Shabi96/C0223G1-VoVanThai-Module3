create database student_management;
use student_management;
create table class(
id int auto_increment primary key,
`name` varchar(45)
);

create table teacher(
id int auto_increment primary key,
`name` varchar(45),
age int,
country varchar(45)
);

insert into class(`name`)
value ("C0223G1"),
("C0323G1"),
("C0423G1");

insert into teacher(`name`, age, country)
value ("CHÁNH TV", 37, "Việt Nam"),
 ("CÔNG NT", 35, "Việt Nam"),
 ("TRUNG MINI", 27, "Việt Nam");
 
 update class 
 set `name` = "C0123G1"
 where id = 2;
 
 delete from class
 where id = 2;