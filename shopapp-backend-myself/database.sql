CREATE DATABASE shopapp;
USE shopapp;

CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(100) DEFAULT "",
    phone_number VARCHAR(10) NOT NULL,
    address VARCHAR(200) DEFAULT "",
    password VARCHAR(100) NOT NULL DEFAULT "",
    created_at DATETIME,
    updated_at DATETIME,
    is_active TINYINT(1) DEFAULT 1,
    date_of_birth DATE,
    facebook_account_id INT DEFAULT 0,
    google_account_id INT DEFAULT 0
);

CREATE TABLE roles(
    
);

CREATE TABLE tokens(
    id INT PRIMARY KEY AUTO_INCREMENT,
    token VARCHAR(255) UNIQUE NOT NULL,
    token_type VARCHAR(50) NOT NULL,
    expiration_date DATETIME,
    revoked TINYINT(1) NOT NULL,
    expired TINYINT(1) NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE social_accounts(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `provider` VARCHAR(20) NOT NULL COMMENT "Tên nhà social media",
    `provider_id` VARCHAR(50) NOT NULL,
    `email` VARCHAR(150) NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `user_id` INT,
    FOREIGN KEY (`user_id`) REFERENCES users(`id`)
);

CREATE TABLE categories(
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL DEFAULT "", 
);

CREATE TABLE products(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(350),
    price FLOAT NOT NULL CHECK (price >= 0),
    thumbnail VARCHAR(300) DEFAULT "",
    description LONGTEXT DEFAULT "",
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);