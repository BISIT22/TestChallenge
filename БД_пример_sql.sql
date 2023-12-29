CREATE DATABASE IF NOT EXISTS sim_cards_db;
USE sim_cards_db;

CREATE TABLE IF NOT EXISTS tariff_plans (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    available_minutes INT NOT NULL,
    available_sms INT NOT NULL,
    cost DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS sim_cards (
    id INT PRIMARY KEY AUTO_INCREMENT,
    imei VARCHAR(15) UNIQUE NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    registration_date DATE NOT NULL,
    tariff_plan_id INT,
    FOREIGN KEY (tariff_plan_id) REFERENCES tariff_plans(id)
);
