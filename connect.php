<?php
// $servername = "mariadb";
// $username = "root";
// $password = "tiger";
// $dbname = "animationDemo";

    $servername = "handson-mysql";
	$username = "kumar";
	$password = "kumar";
	$dbname = "animationDemo";

if(isset($connType) && $connType=="PDO"){
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $conn->setAttribute(PDO::ATTR_STRINGIFY_FETCHES, false);
  $conn->setAttribute(PDO::ATTR_PERSISTENT, true);
  $conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
}else{
  	//Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	//Check connection
	if ($conn->connect_error) {
    	die("Hi Dev Team your DB Connection for Patient details failed: " . $conn->connect_error);
	}
}
?>