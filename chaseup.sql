-- -- Create Database
-- CREATE DATABASE IF NOT EXISTS chaseup;
-- USE chaseup;

-- Create Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL DEFAULT 'Anonymous',
    city VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Products Table
CREATE TABLE IF NOT EXISTS Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2) DEFAULT 0.00,
    stock INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create OrderItems Table
CREATE TABLE IF NOT EXISTS OrderItems (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Insert Customers
INSERT INTO Customers (name, city, email) VALUES
('Ali Khan', 'Karachi', 'ali.khan@example.com'),
('Sara Ahmed', 'Lahore', 'sara.ahmed@example.com'),
('Hamza Malik', 'Islamabad', 'hamza.malik@example.com'),
('Zainab Rizvi', 'Karachi', 'zainab@example.com'),
('Usman Tariq', 'Lahore', 'usman@example.com'),
('Fatima Shah', 'Faisalabad', 'fatima@example.com'),
('Ali Khan', 'Karachi', 'alikhan2@example.com'),
('Hamza Malik', 'Islamabad', 'hamza.malik2@example.com');

-- Insert Products
INSERT INTO Products (product_name, category, price, stock) VALUES
('Shan Masala', 'Grocery', 120.00, 50),
('Surf Excel', 'Laundry', 320.00, 30),
('Nestle Milk Pack', 'Dairy', 200.00, 100),
('Tissue Roll', 'Household', 50.00, 200),
('Lifebuoy Soap', 'Toiletries', 85.00, 60),
("Olper's Milk", 'Dairy', 165.00, 90),
('Colgate Toothpaste', 'Toiletries', 120.00, 40),
('Sunridge Flour', 'Grocery', 920.00, 70),
('Pepsi 1.5L', 'Beverages', 180.00, 100),
('Shan Masala', 'Grocery', 120.00, 45),
('Tapal Tea', 'Beverages', 450.00, 15);

-- Insert Orders
INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2025-05-01'),
(2, '2025-05-02'),
(3, '2025-05-02'),
(4, '2025-05-03'),
(5, '2025-05-05'),
(2, '2025-05-06'),
(3, '2025-05-07'),
(1, '2025-05-11'),
(4, '2025-05-12');

-- Insert OrderItems
INSERT INTO OrderItems (order_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 4),
(3, 4, 5),
(4, 10, 3),
(4, 11, 2),
(5, 1, 1),
(5, 2, 2),
(6, 3, 2),
(7, 4, 5),
(8, 5, 2),
(8, 6, 1),
(9, 7, 1),
(9, 8, 1),
(9, 9, 4),
(9, 1, 1);

