<?php

$host = "Имя хоста";
$user = "Имя пользователя";
$password = "Пароль";
$database = "sim_cards_db";

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    die("Ошибка подключения к базе данных: " . $conn->connect_error);
}
