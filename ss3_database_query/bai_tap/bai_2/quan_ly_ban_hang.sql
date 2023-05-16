CREATE DATABASE quan_ly_ban_hang;

USE quan_ly_ban_hang;

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

INSERT INTO customer(customer_name, customer_age)
VALUE ("Minh Quan", 10),
	  ("Ngoc Oanh", 20),
	  ("Hong Ha", 50);
      
INSERT INTO orders(customer_id, order_date)
VALUE (1, '2006-03-21'),
	  (2, '2006-03-23'),
	  (1, '2006-03-16');
      
INSERT INTO product(product_name, product_price)
VALUE ("May Giat", 3),
	  ("Tu Lanh", 5),
	  ("Dieu Hoa", 7),
	  ("Quat", 1),
	  ("Bep Dien", 2);
      
INSERT INTO order_detail(order_id, product_id, order_qty)
VALUE (1, 1, 3),
	  (1, 3, 7),
	  (1, 4, 2),
	  (2, 1, 1),
	  (3, 1, 8),
	  (2, 5, 4),
	  (2, 3, 3);
      
SELECT order_id, order_date, total_price
FROM orders;

SELECT c.customer_name, p.product_name, o.order_date
FROM customer c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_detail d
ON o.order_id = d.order_id
JOIN product p
ON d.product_id = p.product_id;

SELECT customer_name, c.customer_id
FROM customer c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

SELECT o.order_id, o.order_date, SUM(d.order_qty * p.product_price) total
FROM orders o
JOIN order_detail d
ON d.order_id = o.order_id
JOIN product p
ON p.product_id = d.product_id
GROUP BY o.order_id;