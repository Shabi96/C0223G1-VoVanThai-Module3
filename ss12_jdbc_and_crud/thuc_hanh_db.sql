create database quan_ly_user;
use quan_ly_user;

create table users(
	id int primary key auto_increment,
    name varchar(120) not null,
    email varchar(220) not null,
    country varchar(120)
);

insert into users (name, email, country)
value ('Minh','minh@codegym.vn','Viet Nam'),
	  ('Kante','kante@che.uk','Kenia');