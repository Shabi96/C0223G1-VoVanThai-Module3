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
      
delimiter //
create procedure findAll()
begin
select * from users;
end //
delimiter ;

delimiter //
create procedure addNewUser(name varchar(50), email varchar(250), country varchar(50))
begin
insert into users (name, email, country)
value (name, email, country);
end //
delimiter ;

delimiter //
create procedure updateUsers(new_name varchar(50), new_email varchar(250), new_country varchar(50), update_id int)
begin
update quan_ly_user.users set name = new_name, email = new_email, country = new_country
where id = update_id;
end //
delimiter ;

delimiter //
create procedure deleteUser(delete_id int)
begin
delete from users
where id = delete_id;
end //
delimiter ;

delimiter //
create procedure findUser(country_find varchar(50))
begin
select * from users
where country like country_find;
end //
delimiter ;      