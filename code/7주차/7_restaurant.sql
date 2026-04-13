-- Customer Table
CREATE TABLE Customer (
	customer_id INT PRIMARY KEY,
	name VARCHAR(100),
	phone VARCHAR(13),
	address VARCHAR(100)
);

-- Restaurant Table
CREATE TABLE Restaurant (
	restaurant_id INT PRIMARY KEY,
	name VARCHAR(100),
	phone VARCHAR(13),
	address VARCHAR(100)
);

-- Orders Table
CREATE TABLE Orders (
	order_id INT PRIMARY KEY,
	customer_id INT,
	restaurant_id INT,
	order_date TIMESTAMP,
	total NUMERIC,
	FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
	FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
);

-- Delivery
CREATE TABLE Delivery (
	delivery_id INT PRIMARY KEY,
	order_id INT,
	driver_name VARCHAR(100),
	status INT,
	FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Insert Data
INSERT INTO Customer VALUES
(1, 'ABC', '010-1234-2123', 'AA'),
(2, 'EFR', '010-2030-1111', 'BB');

INSERT INTO Restaurant VALUES
(1, 'Taco bell', '010-2999-9999', 'QWE'),
(2, 'Little Caesars', '010-2929-2131', 'QQQ');

INSERT INTO Orders VALUES
(1, 1, 1, '2026-04-13 14:13:22', 36000),
(2, 2, 2, '2026-04-12 13:13:44', 15000);

INSERT INTO Delivery VALUES
(1, 1, 'ZXC', 1),	-- 0: 받음, 1: 조리중, 2: 배달중, 3: 배달완료, 4: 취소
(2, 2, 'REW', 3);

-- DB QUERY
SELECT * FROM Orders;
SELECT * FROM Orders ORDER BY total DESC;
SELECT * FROM Orders WHERE total >= 10000;
SELECT * FROM Delivery WHERE status = 3;