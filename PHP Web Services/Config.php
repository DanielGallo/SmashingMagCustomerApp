<?php

header('Content-Type: application/json');

$method = $_SERVER["REQUEST_METHOD"];
$con = new PDO("mysql:host=127.0.0.1;port=8889;dbname=customers", "user_name", "password");

?>
