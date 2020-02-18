<?php
$servername = "mariadb";
$username = "root";
$password = "tiger";
$dbname = "animationDemo";

// $servername = "handson-mysql";
// 	$username = "kumar";
// 	$password = "kumar";
// 	$dbname = "animationDemo";

	//Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	//Check connection
	if ($conn->connect_error) {
    	die("Hi Dev Team your DB Connection for Patient details failed: " . $conn->connect_error);
	} 
?>