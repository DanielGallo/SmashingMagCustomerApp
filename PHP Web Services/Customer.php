<?php

include "Config.php";

/*
	Name:			Customer.php

	Purpose:		RESTful web service for Customer records. Allows the retrieval, updating, adding and deletion of Customer records.
	
	Description:	In the code we check the type of request being made to the page by the browser - either GET, PUT, POST or DELETE. The appropriate portion of SQL code is then executed based on the request method. 
					If a record is being added, updated or deleted then details of the record are submitted in JSON format to the page. This is decoded from JSON to an object so the values can be extracted.
*/

switch ($method) {
	case "GET":		// Return all records

		$sql = 	"SELECT * FROM customer " .
				"ORDER BY Name";

		$sql = $con->prepare($sql);
		$sql->execute();
		$rows = array();

		while ($row = $sql->fetch(PDO::FETCH_OBJ)) {
			$rows['data'][] = $row;
		}

		echo json_encode($rows, JSON_NUMERIC_CHECK);

		break;

	case "PUT":		// Update existing record, requires ID
		$postData = getPostData();
		$ID = getPostValue($postData, 'ID');
		$Name = getPostValue($postData, 'Name');
		$Address = getPostValue($postData, 'Address');

		$sql = 	"UPDATE customer " .
				"SET Name = '$Name', " .
				"Address = '$Address' " .
				"WHERE ID = '$ID' ";

		$sql = $con->prepare($sql);
		$result = $sql->execute();

		break;

	case "POST":	// New record
		$postData = getPostData();
		$Name = getPostValue($postData, 'Name');
		$Address = getPostValue($postData, 'Notes');

		$sql = 	"INSERT INTO customer (Name, Address) " .
				"VALUES ('$Name', '$Address')";

		$sql = $con->prepare($sql);
		$result = $sql->execute();
		$ID = $con->lastInsertId();

		echo "{\"ID\": $ID}";

		break;

	case "DELETE":	// Delete existing record, requires ID
		$postData = getPostData();
		$ID = getPostValue($postData, 'ID');

		$sql = 	"DELETE FROM customer " .
				"WHERE ID = '$ID' ";

		$sql = $con->prepare($sql);
		$result = $sql->execute();

		if (! $result) {
			echo "{\"success\": false}";
		} else {
			echo "{\"ID\": $ID}";
		}

		break;
}

$con = null;

function getPostData() {
	$fileContents = file_get_contents("php://input");
	return json_decode($fileContents, true);
}

function getPostValue($postData, $fieldName) {
	return (!empty($postData[$fieldName]) ? htmlspecialchars($postData[$fieldName]) : NULL);
}

?>