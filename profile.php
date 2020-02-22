<?php
//mqsqli
// ini_set('display_errors', 1);
// ini_set('display_startup_errors', 1);
// error_reporting(E_ALL);
// error_reporting(0);
session_start();
require("./connect.php");
include("./services/saveUserActivity.php");
$useractivity = new ActivityHistory();
$useractivity->saveHistory($conn, "Profile Page ", "Opened Profile Page");
$uname = $_SESSION["username"];
$uid = $_SESSION["userid"];
if (!$_SESSION["loggedin"]) {
    header("Location:./index.php");
  }
// var_dump($_SESSION);
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $fname = $_POST['f_name'];
    $lname = $_POST['l_name'];
    $age = $_POST['age'];
    $emailaddress = $_POST['email_at_registration'];
    $phnum = $_POST['phnum'];

    $sql1 = "UPDATE users SET fname='$fname',lname='$lname',email='$emailaddress',age='$age',phnum='$phnum' WHERE id= $uid";
    $sql_result1 = $conn->query($sql1);
    if ($sql_result1 == TRUE) {
        echo "<script>alert('successully updated');</script> ";
        // return true;
    }
}
echo "<script>console.log($uid);</script>";

$sql0 = "SELECT  fname,lname,email,id,age,phnum FROM users WHERE  username = '$uname' ";
// echo $sql0;
$sql0_result = $conn->query($sql0);
if ($sql0_result == TRUE) {
    while ($row = $sql0_result->fetch_assoc()) {

        $firstname = $row["fname"];
        $lastname = $row["lname"];
        $emailaddr = $row["email"];
        $ageRetrieved = $row["age"];
        $phNumRetrieved = $row["phnum"];
        // var_dump ($firstname);

    }
}



?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Profile</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css">
  <script src="./scripts/animate.js" type="text/javascript"></script>

 <!-- Scripts By Self   -->
    <link rel="stylesheet" href="./cssstyles/style.css" />
         <script>
           $(document).ready(function() {
                $("#update_profile").on("click",function(){
                    // swal("Success!", "You profile has been updated Successfuly", "success");
                    // return false;
                               });
            });

            
        </script>
</head>

<body>
<?php 
require("./navigationbar.php");
?>    <div class="container col-sm-4 col-md-4" id="registration_form">
           <div class="centerAlign">
               <h2 class="animationHeading">
                   Profile Details 
                </h2>
            </div>
        <form class="form_properties" method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
            <div class="form-group">
                <label for="fname">First Name :</label>
                <div class="input-group">
                    <input id="f_name" name="f_name" type="text" class="form-control" size="100" value="<?php echo htmlspecialchars($firstname) ?>" required>
                    <span class="error error_red" id="spanf_name"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="lname">Last Name :</label>
                <div class="input-group">
                    <input id="l_name" name="l_name" type="text" class="form-control" size="100" value="<?php echo htmlspecialchars($lastname) ?>" required>
                    <span class="error error_red" id="spanl_name"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="Email">Email :</label>
                <div class="input-group">
                    <input id="email_at_registration" name="email_at_registration" type="email" class="form-control" size="100" value="<?php echo htmlspecialchars($emailaddr) ?>" required>
                    <span class="error error_red" id="spanEmail_at_registration"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="age">Age :</label>
                <div class="input-group">
                    <input id="age" name="age" type="age" class="form-control" size="100" value="<?php echo htmlspecialchars($ageRetrieved) ?>" required>
                    <span class="error error_red" id="spanage"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="age">Phone Number :</label>
                <div class="input-group">
                    <input id="phnum" name="phnum" type="phonenumber" class="form-control" size="100" value="<?php echo htmlspecialchars($phNumRetrieved) ?>" required>
                    <span class="error error_red" id="spanage"></span>
                </div>
            </div>
            
            <div class="text-align form-group">
                <div class="centerAlign">
                    <button class="btn btn-success" id="update_profile" name="update_profile" type="submit"><i class="fa fa-edit" style="font-size: 20px"></i> UPDATE</button>
                </div>
            </div>
    </div>
    </form>
    
    </div>
</body>
</html>