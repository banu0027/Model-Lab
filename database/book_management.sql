CREATE DATABASE IF NOT EXISTS bookdb;
USE bookdb;

CREATE TABLE IF NOT EXISTS books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

INSERT INTO books (title, author, price) VALUES
('Clean Code', 'Robert C. Martin', 499.00),
('Effective Java', 'Joshua Bloch', 650.00),
('Head First Servlets and JSP', 'Bryan Basham', 550.00);
