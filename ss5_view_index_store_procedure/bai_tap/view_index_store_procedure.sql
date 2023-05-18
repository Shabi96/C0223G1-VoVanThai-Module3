create database product_view_index_store_procedure;

use product_view_index_store_procedure;

create table product (
	id int primary key auto_increment,
	product_code varchar(45),
	product_name varchar(45),
	product_price double,
	product_amount int,
	product_description varchar(255),
	product_status bit
);

insert into product(product_code, product_name, product_price, product_amount, product_description, product_status)
value ("p01", "TV", 100, 5, "43inch", 1),
	  ("p02", "Máy Giặt", 70, 4, "Cửa trước", 1),
	  ("p03", "Tủ Lạnh", 80, 8, "Siêu to", 0),
	  ("p04", "Điều Hòa", 110, 10, "Siêu mát", 1),
	  ("p05", "Xe Máy", 300, 7, "Siêu nhanh", 1);
      
explain select * 
from product;
     
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)     
create unique index product_index
on product(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index composite_index
on product(product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * 
from product;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view product_view(`code`, `name`, price, amount) as
select product_code, product_name, product_price, product_description
from product;

-- Tiến hành sửa đổi view
update product_view
set price = 500
where `code` = "p01";

select *
from product_view;

-- Tiến hành xoá view
drop view product_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure product_procedure()
begin
select * 
from product;
end
// delimiter ;

call product_procedure;

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_product(`code` varchar(45), `name` varchar(45), 
		price double,amount int, `description` varchar(255), `status` bit)
begin
insert into product(product_code, product_name, product_price, product_amount, product_description, product_status)
value(`code`, `name`, price, amount, `description`, `status`);
end
// delimiter ;

call add_product("p06", "Máy Quạt", 30, 10, "Tiết kiệm điện", 0);

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure edit_product(id int, `code` varchar(45), `name` varchar(45),
price double,amount int, `description` varchar(255), `status` bit)
begin
update product
set product_code = `code`, 
	product_name = `name`,
	product_price = price,
	product_amount = amount, 
	product_description = `description`, 
	product_status = `status`
where product_id = id;
end
// delimiter ;

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_procedure(id int)
begin
delete from product
where product_id = id;
end
// delimiter ;