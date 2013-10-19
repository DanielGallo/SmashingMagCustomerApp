<?php

/*
	Name:			Order.php

	Purpose:		Allows the retrieval of Order data for a specified Customer.
	
	Description:	Returns a set of Orders for a particular Customer, based on the passed-in CustomerID parameter. The SQL query gets a total value of all Orders for the Customer, and groups it by each month. 
					The returned data will be shown inside a bar chart in the app.
*/

include "Config.php";

$CustomerID = $_GET["CustomerID"];

// Get the Order data, grouped by Year and Month. Concatenate the Month and Year in to a new string.
$sql = 	"SELECT CONCAT(MONTHNAME(OrderDate), ' ', YEAR(OrderDate)) AS Date, SUM(TotalValue) AS Total " .
		"FROM customer_order " .
		"WHERE CustomerID = $CustomerID " .
		"GROUP BY YEAR(OrderDate), MONTH(OrderDate)";

$sql = $con->prepare($sql);
$sql->execute();
$rows = array();

while ($row = $sql->fetch(PDO::FETCH_OBJ)) {
	$rows['data'][] = $row;
}

echo json_encode($rows, JSON_NUMERIC_CHECK);

$con = null;

?>