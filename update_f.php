<?php
// Database connection parameters
$servername = "localhost";
$username = "root";
$password = ""; // Change this to your actual database password
$dbname = "min_2";

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

    // Validate and sanitize inputs
    // ... (add your validation and sanitation logic here)

    // Insert new order
    if (!empty($OrderID)) {
        // Prepare and execute SQL query to update data
        $sql = "UPDATE Orders
                SET CustomerName = '$CustomerName',
                    phn_num = '$phn_num',
                    OrderDate = '$OrderDate',
                    dish_name = '$dish_name',
                    DishID = '$DishID',
                    veg_or_nonveg = '$veg_or_nonveg'
                WHERE OrderID = '$OrderID'";

        if ($conn->query($sql) === TRUE) {
            header("Location: sucess2.html");
        exit();
        } else {
            echo "Error updating order: " . $conn->error;
        }
    }
}

// Close connection
$conn->close();
?>
