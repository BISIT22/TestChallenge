<?php
require_once('config.php');

// Вывод информации
$sql = "SELECT sim_cards.id, imei, phone_number, full_name, registration_date, name
        FROM sim_cards
        JOIN tariff_plans ON sim_cards.tariff_plan_id = tariff_plans.id";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<h2>Список SIM-карт:</h2>";
    echo "<table border='1'>
            <tr>
                <th>ID</th>
                <th>IMEI</th>
                <th>Номер телефона</th>
                <th>ФИО клиента</th>
                <th>Дата регистрации</th>
                <th>Тарифный план</th>
            </tr>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>{$row['id']}</td>
                <td>{$row['imei']}</td>
                <td>{$row['phone_number']}</td>
                <td>{$row['full_name']}</td>
                <td>{$row['registration_date']}</td>
                <td>{$row['name']}</td>
            </tr>";
    }

    echo "</table>";
} else {
    echo "Нет данных о SIM-картах.";
}
 
// Добавление СИМ
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['add_sim'])) {
        $imei = $_POST['imei'];
        $phone_number = $_POST['phone_number'];
        $full_name = $_POST['full_name'];
        $registration_date = $_POST['registration_date'];
        $tariff_plan_id = $_POST['tariff_plan_id'];

        $sql = "INSERT INTO sim_cards (imei, phone_number, full_name, registration_date, tariff_plan_id)
                VALUES ('$imei', '$phone_number', '$full_name', '$registration_date', '$tariff_plan_id')";

        if ($conn->query($sql) === TRUE) {
            echo "SIM-карта успешно добавлена.";
        } else {
            echo "Ошибка при добавлении SIM-карты: " . $conn->error;
        }
    }
}

//Добавление СИМ (форма)
echo "<h2>Добавить SIM-карту:</h2>";
echo "<form method='post'>
        IMEI: <input type='text' name='imei' required><br>
        Номер телефона: <input type='text' name='phone_number' required><br>
        ФИО клиента: <input type='text' name='full_name' required><br>
        Дата регистрации: <input type='date' name='registration_date' required><br>
        Тарифный план ID: <input type='text' name='tariff_plan_id' required><br>
        <input type='submit' name='add_sim' value='Добавить'>
    </form>";

$conn->close();
?>
