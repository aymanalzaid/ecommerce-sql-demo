-- Create the database (if it doesn't exist)
-- Connect to 'postgres' database first if running this in psql
DROP DATABASE IF EXISTS ecommerce_demo;
CREATE DATABASE ecommerce_demo;

-- Connect to the new database
\c ecommerce_demo; -- For psql
-- If using a GUI, you might need to manually switch to the 'ecommerce_demo' database
-- before running the table and data creation steps.

-- Customers Table
CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    registration_date DATE NOT NULL,
    customer_segment VARCHAR(50)
);

-- Products Table
CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL
);

-- Orders Table
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Order_Items Table (Junction table for many-to-many relationship)
CREATE TABLE Order_Items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert data into Customers
INSERT INTO Customers (customer_name, city, registration_date, customer_segment) VALUES
('Alice Smith', 'New York', '2024-11-15', 'Loyal'),
('Bob Johnson', 'Los Angeles', '2024-12-01', 'Loyal'),
('Charlie Brown', 'Chicago', '2025-01-10', 'New'),
('Diana Prince', 'New York', '2025-02-20', 'High-Value'),
('Eve Adams', 'Chicago', '2025-03-05', 'New'),
('Frank White', 'Houston', '2025-04-12', 'Loyal'),
('Grace Lee', 'New York', '2025-05-01', 'New'),
('Harry Green', 'Los Angeles', '2025-05-10', 'New'),
('Ivy Black', 'Houston', '2025-05-25', 'New'),
('Jack Davis', 'Miami', '2024-06-01', 'Churn Risk'),
('Karen Hall', 'Chicago', '2024-07-07', 'Loyal'),
('Liam Wilson', 'New York', '2024-08-18', 'High-Value');


-- Insert data into Products
INSERT INTO Products (product_name, category, price) VALUES
('Laptop Pro', 'Electronics', 1200.00),
('Wireless Mouse', 'Electronics', 25.00),
('Ergonomic Chair', 'Office Furniture', 350.00),
('Coffee Mug Set', 'Home Goods', 30.00),
('Fiction Novel A', 'Books', 15.00),
('Bluetooth Speaker', 'Electronics', 75.00),
('Desk Lamp LED', 'Office Furniture', 50.00),
('Cookbook Basics', 'Books', 20.00),
('Smartwatch X', 'Electronics', 250.00),
('Yoga Mat Deluxe', 'Sports & Outdoors', 40.00);


-- Insert data into Orders
INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2025-01-05', 1230.00),
(2, '2025-01-15', 380.00),
(3, '2025-02-01', 100.00),
(4, '2025-02-10', 1200.00),
(1, '2025-03-01', 15.00),
(5, '2025-03-10', 50.00),
(6, '2025-04-01', 25.00),
(7, '2025-05-03', 40.00),
(8, '2025-05-12', 30.00),
(9, '2025-05-20', 75.00),
(1, '2025-04-25', 250.00),
(2, '2025-04-18', 20.00),
(4, '2025-05-08', 350.00),
(10, '2024-07-01', 1200.00),
(11, '2024-08-15', 350.00),
(12, '2024-09-01', 1230.00),
(4, '2025-04-05', 75.00),
(12, '2025-05-15', 25.00);

-- Insert data into Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 1),
(2, 4, 1),
(3, 6, 1),
(4, 1, 1),
(5, 5, 1),
(6, 7, 1),
(7, 2, 1),
(8, 10, 1),
(9, 4, 1),
(10, 6, 1),
(11, 9, 1),
(12, 8, 1),
(13, 3, 1),
(14, 1, 1),
(15, 3, 1),
(16, 1, 1),
(16, 2, 1),
(17, 6, 1),
(18, 2, 1);