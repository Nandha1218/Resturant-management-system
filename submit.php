<?php
// Database connection parameters
$servername = "localhost";  // Change this to your actual database host
$username = "root";          // Change this to your actual database username
$password = "";          // Change this to your actual database password
$dbname = "min_2";       // Change this to your actual database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Collect form data
    $OrderID = $_POST["OrderID"];
    $CustomerName = $_POST["CustomerName"];
    $phn_num = $_POST["phn_num"];
    $OrderDate = $_POST["OrderDate"];
    $dish_name = $_POST["dish_name"];
    $DishID = $_POST["DishID"];
    $veg_or_nonveg = $_POST["veg_or_nonveg"];

    // Insert new order
    $sqlInsert = "INSERT INTO Orders (OrderID,CustomerName, phn_num, OrderDate, dish_name, DishID, veg_or_nonveg)
                  VALUES ('$OrderID','$CustomerName', '$phn_num', '$OrderDate', '$dish_name', '$DishID', '$veg_or_nonveg')";

    if ($conn->query($sqlInsert) === TRUE) {
        header("Location: sucess.html");
        exit();
    } else {
        echo "Error placing order: " . $conn->error;
    }

    // Update existing order if OrderID is provided
    
}

// Close connection
$conn->close();
?>
