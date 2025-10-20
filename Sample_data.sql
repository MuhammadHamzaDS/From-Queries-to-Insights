CREATE DATABASE ecommerce_db;
USE ecommerce_db;
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    city VARCHAR(100),
    signup_date DATE,
    membership_level ENUM('Basic', 'Silver', 'Gold', 'Platinum')
);
INSERT INTO Customers (name, age, gender, city, signup_date, membership_level) VALUES
('Ali Khan', 28, 'Male', 'Lahore', '2023-03-15', 'Silver'),
('Sara Ahmed', 24, 'Female', 'Karachi', '2022-10-20', 'Gold'),
('Bilal Iqbal', 35, 'Male', 'Islamabad', '2023-07-10', 'Basic'),
('Fatima Noor', 30, 'Female', 'Lahore', '2024-01-05', 'Platinum'),
('Ahmad Raza', 26, 'Male', 'Faisalabad', '2023-09-12', 'Gold');
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);
INSERT INTO Products (product_name, category, price, stock_quantity) VALUES
('Wireless Earbuds', 'Electronics', 4500.00, 120),
('Smartwatch', 'Electronics', 8500.00, 75),
('Yoga Mat', 'Fitness', 2000.00, 60),
('Water Bottle', 'Fitness', 1200.00, 200),
('Running Shoes', 'Footwear', 6500.00, 90),
('Bluetooth Speaker', 'Electronics', 5000.00, 45);
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2024-04-10', 9000.00),
(2, '2024-05-22', 6500.00),
(3, '2024-06-05', 3200.00),
(1, '2024-07-15', 8500.00),
(4, '2024-07-25', 7200.00),
(5, '2024-08-01', 5000.00);
CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 4, 1),
(2, 5, 1),
(3, 3, 2),
(4, 2, 1),
(4, 6, 1),
(5, 1, 1),
(6, 3, 1);
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method ENUM('Credit Card', 'Debit Card', 'Cash on Delivery', 'Easypaisa', 'JazzCash'),
    amount_paid DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
INSERT INTO Payments (order_id, payment_date, payment_method, amount_paid) VALUES
(1, '2024-04-10', 'Credit Card', 9000.00),
(2, '2024-05-23', 'Easypaisa', 6500.00),
(3, '2024-06-05', 'Cash on Delivery', 3200.00),
(4, '2024-07-15', 'Credit Card', 8500.00),
(5, '2024-07-25', 'JazzCash', 7200.00),
(6, '2024-08-01', 'Debit Card', 5000.00);
CREATE TABLE Website_Visits (
    visit_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    visit_date DATE,
    page_visited VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Website_Visits (customer_id, visit_date, page_visited) VALUES
(1, '2024-04-01', 'Home'),
(1, '2024-04-05', 'Product: Earbuds'),
(2, '2024-05-10', 'Product: Running Shoes'),
(3, '2024-06-01', 'Home'),
(4, '2024-07-20', 'Product: Smartwatch'),
(5, '2024-07-30', 'Product: Yoga Mat'),
(1, '2024-08-02', 'Checkout'),
(2, '2024-08-10', 'Home');
SHOW TABLES;

-- Verify sample data
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Order_Items;
-- Orders per Customer
SELECT c.name, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

-- Revenue by Category
SELECT p.category, SUM(oi.quantity * p.price) AS total_revenue
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.category;
