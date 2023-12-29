CREATE DATABASE IF NOT EXISTS HelpDesk;

USE HelpDesk;

-- Таблица пользователей
CREATE TABLE IF NOT EXISTS Users (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Таблица траблтикет статусов
CREATE TABLE IF NOT EXISTS TTStatus (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Таблица заявок
CREATE TABLE IF NOT EXISTS TroubleTickets (
    tt_number INT PRIMARY KEY,
    user_id INT,
    work_time DATETIME,
    tt_status INT,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (tt_status) REFERENCES TTStatus(id)
);

-- Вставка данных в таблицу Users
INSERT INTO Users (id, name) VALUES
(1, 'Иванов Иван'),
(2, 'Петрова Мария'),
(3, 'Грачев Алексей'),
(4, 'Сидорова Екатерина'),
(5, 'Иванов Алексей');

-- Вставка данных в таблицу TTStatus
INSERT INTO TTStatus (id, name) VALUES
(1, 'Открыта'),
(2, 'Ожидание'),
(3, 'Закрыта');

-- Вставка данных в таблицу TroubleTickets
INSERT INTO TroubleTickets (tt_number, user_id, work_time, tt_status) VALUES
(1000, 1, '2020-12-01 11:05:00', 1),
(1001, 3, '2020-12-01 09:10:00', 3),
-- ... (вставьте остальные данные TroubleTickets)

