<?php
header('Content-Type: application/json');
error_reporting(0); // Suppress warnings for debugging

// Database connection credentials
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "meal_planner";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    echo json_encode(["status" => "error", "message" => "Connection failed: " . $conn->connect_error]);
    exit();
}

// Collect form data
$name = $_POST['name'] ?? '';
$age = $_POST['age'] ?? '';
$weight = $_POST['weight'] ?? '';
$height = $_POST['height'] ?? '';
$gender = $_POST['gender'] ?? '';
$dietary_restrictions = is_array($_POST['dietary_restrictions']) ? implode(", ", $_POST['dietary_restrictions']) : '';
$food_habits = is_array($_POST['food_habits']) ? implode(", ", $_POST['food_habits']) : '';
$health_goals = is_array($_POST['health_goals']) ? implode(", ", $_POST['health_goals']) : '';
$medical_history = is_array($_POST['medical_history']) ? implode(", ", $_POST['medical_history']) : '';

// SQL to insert data into the table
$sql = "INSERT INTO users (name, age, weight, height, gender, dietary_restrictions, food_habits, health_goals, medical_history)
        VALUES ('$name', '$age', '$weight', '$height', '$gender', '$dietary_restrictions', '$food_habits', '$health_goals', '$medical_history')";

// Execute SQL query
if ($conn->query($sql) === TRUE) {
    echo json_encode(["status" => "success", "message" => "New record created successfully"]);
} else {
    echo json_encode(["status" => "error", "message" => "Error: " . $sql . "<br>" . $conn->error]);
}

// Close connection
$conn->close();
?>
