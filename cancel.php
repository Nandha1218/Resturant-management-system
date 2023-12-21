<?php

// Database connection parameters
$servername = "localhost";  // Change this to your actual database host
$username = "root";          // Change this to your actual database username
$password = "";              // Change this to your actual database password
$dbname = "min_2";           // Change this to your actual database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);


// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the form is submitted

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Collect form data
    $OrderID = isset($_POST["OrderID"]) ? $_POST["OrderID"] : null;

    // Check if OrderID is provided for delete operation
    if (!empty($OrderID)) {
        // Attempt to delete the order
        $sql = "DELETE FROM Orders WHERE OrderID = '$OrderID'";
        
        if ($conn->query($sql) === TRUE) {
            header("Location: sucess3.html");
            exit();
        } else {
            // Check if the error is due to foreign key constraint
            if ($conn->errno == 1451) {
                echo "Error deleting order: This order is referenced in another table. Delete or update the references first.";
            } else {
                echo "Error deleting order: " . $conn->error;
            }
        }
    } else {
        echo "OrderID is required for deletion.";
    }
}

// Close connection
$conn->close();
?>
