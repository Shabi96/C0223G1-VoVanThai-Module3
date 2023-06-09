create database quan_ly_ban_hang;
use quan_ly_ban_hang;

CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(45),
    customer_age INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_price DOUBLE,
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)
);

CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(45),
    product_price DOUBLE
);

CREATE TABLE order_detail (
    order_qty INT,
    order_id INT,
    product_id INT,
    PRIMARY KEY (order_id , product_id),
    FOREIGN KEY (order_id)
        REFERENCES orders (order_id),
    FOREIGN KEY (product_id)
        REFERENCES product (product_id)
);

insert into customer(customer_name, customer_age)
value ("Minh Quan", 10),
	  ("Ngoc Oanh", 20),
	  ("Hong Ha", 50);
      
insert into orders(customer_id, order_date)
value (1, '2006-03-21'),
	  (2, '2006-03-23'),
	  (1, '2006-03-16');
      
insert into product(product_name, product_price)
value ("May Giat", 3),
	  ("Tu Lanh", 5),
	  ("Dieu Hoa", 7),
	  ("Quat", 1),
	  ("Bep Dien", 2);
      
insert into order_detail(order_id, product_id, order_qty)
value (1, 1, 3),
	  (1, 3, 7),
	  (1, 4, 2),
	  (2, 1, 1),
	  (3, 1, 8),
	  (2, 5, 4),
	  (2, 3, 3);
      
select order_id, order_date, total_price
from orders;

select c.customer_name, p.product_name, o.order_date
from customer c
join orders o
on c.customer_id = o.customer_id
join order_detail d
on o.order_id = d.order_id
join product p
on d.product_id = p.product_id;

select customer_name, c.customer_id
from customer c
left join orders o
on c.customer_id = o.customer_id
where o.customer_id is null;

select o.order_id, o.order_date,d.order_qty, p.product_price,d.order_qty * p.product_price as "total price"
from orders o
join order_detail d
on d.order_id = o.order_id
join product p
on p.product_id = d.product_id
