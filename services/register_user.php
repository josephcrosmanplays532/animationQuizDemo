<?php
// error_reporting(0);
// ini_set('display_errors', 1);
// ini_set('display_startup_errors', 1);
// error_reporting(E_ALL);
// $connType="PDO";
require("../connect.php");


if (isset($_POST['fname']) && isset($_POST['lname'])&& isset($_POST['username']) &&  isset($_POST['password']) && isset($_POST['email']) && isset($_POST['roleSelect']) && isset($_POST['phnum']) && isset($_POST['gridRadios']) && isset($_POST['org']) && isset($_POST['addr1']) && isset($_POST['addr2']) && isset($_POST['city']) && isset($_POST['state']) && isset($_POST['zipcode'])){
	
				$first_name=$_POST['fname'];
				$last_name=$_POST['lname'];
				$pwd=password_hash($_POST['password'], PASSWORD_DEFAULT);
				$user_name=$_POST['username'];
				$useremail = $_POST['email'];
				$phnum = $_POST['phnum'];
				$role_id = $_POST['roleSelect'];
				$gridRadio = $_POST['gridRadios'];
				$org = $_POST['org'];
				$addr1 = $_POST['addr1'];
				$addr2 = $_POST['addr2'];
				$city = $_POST['city'];
				$state = $_POST['state'];
				$zipcode = $_POST['zipcode'];
 
		try{
			// echo "testting";
			$sql2 = "INSERT INTO  users (`fname`,`lname`, `password`,`username`,`phnum`, `email`, `age`, `gender`, `org`,`addr1`, `addr2`, `city`, `state`, `zip`) VALUES ('$first_name','$last_name','$pwd','$user_name', $phnum ,'$useremail',$role_id,'$gridRadio','$org','$addr1','$addr2','$city','$state',$zipcode)";
			echo $sql2;			
			$sql_result2 = $conn->query($sql2);
			 if ($sql_result2 == TRUE)
			 	{

					$user_id = $conn->insert_id;
					$sql3 = " INSERT INTO `pmp_user_role_mapping` (user_id,role_id) VALUES ('$user_id','$role_id')";
					$sql_result3 = $conn->query($sql3);
					try {
					 if ($sql_result3 == TRUE) 
					  {
						header('Location: ../index.php?regstat=registered');
					  }
					}catch (Exception $e) {
						echo $e->errorMessage();
					}//try catch ends for sqll_result3

				 }else{
				header('Location: ../registration.php?regstat=failed');
					  
				 }
			}//end of try
			catch (Exception $e) {
				echo $e->errorMessage();
			}
     }
?>