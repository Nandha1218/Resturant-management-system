function submitOrder() {
    // Get form data
    var orderData = {
        OrderID: document.getElementById("OrderID").value,
        CustomerName: document.getElementById("CustomerName").value,
        phn_num: document.getElementById("phn_num").value,
        OrderDate: document.getElementById("OrderDate").value,
        dish_name: document.getElementById("dish_name").value,
        DishID: document.getElementById("DishID").value,
        veg_or_nonveg: document.getElementById("veg_or_nonveg").value,
    };

    // Create a new table row with the order data
    var table = document.getElementById("orderTable").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(table.rows.length);
    for (var key in orderData) {
        var cell = newRow.insertCell();
        cell.appendChild(document.createTextNode(orderData[key]));
    }

    // Clear form fields
    document.getElementById("orderForm").reset();
}

