<?php
// error_reporting(0);
// ini_set('display_errors', 1);
// ini_set('display_startup_errors', 1);
// error_reporting(E_ALL);
session_start();
$connType="PDO";
require("./connect.php");
include("./services/saveUserActivityPdo.php");
$useractivity = new ActivityHistory();

  if (isset($_SESSION["userid"])) {
    redirectBasedOnPermission($_SESSION["userid"], "home");
    //header("Location:./home.php");
  }
  //Check if username is empty
   if ($_SERVER["REQUEST_METHOD"] == "POST"){
        if (empty(trim($_POST["username"]))) {
          $username_err = "Please enter username.";
          echo '<script>alert("Please enter Username");</script>';
          
          } else if (empty(trim($_POST["password"]))) {
            $password_err = "Please enter your password.";
            echo '<script>alert("Please enter Password");</script';
          } else {
            $username = trim($_POST["username"]);
            $password = trim($_POST["password"]);
        }

        // Validate credentials
  if (empty($username_err) && empty($password_err)) {
    // Prepare a select statement 
    $sql = "SELECT u.id,u.fname,u.lname, u.username as username, u.password as password,u.email,ur.role_id,r.r_name,r.role_status as roleStatus FROM users u LEFT join pmp_user_role_mapping ur on u.id = ur.user_id left join pmp_role r on ur.role_id = r.role_id WHERE u.username = ?";
    //pass values to ? in sql statement to execute method
        try{
          $stmt= $conn->prepare($sql);
          $stmt->execute([$username]);
          //fetch the result row and put it in $result
          $result=$stmt->fetchAll(PDO::FETCH_ASSOC);
          // var_dump($result);

        }
        catch(Exception $e){
          echo $e->getMessage();
        }
        

    if ($result) {
      if ($stmt->rowCount() == 1) {
        foreach ($result as $row) {
          // Password is correct, so start a new session
          $hashedPwd = $row["password"];
          if (password_verify($password, $hashedPwd)) {
            // Store data in session variables
            $_SESSION["loggedin"] = true;
            $_SESSION["userid"] = $row["id"];
            $_SESSION["username"] = $username;
            $_SESSION["firstname1"] = $row["fname"];
            $_SESSION["lastname2"] = $row["lname"];
            $_SESSION["rname"] = $row["r_name"];


            try{
              $_SESSION["roleId"] = $row["role_id"];
              $sql1 = "SELECT * FROM pmp_role_feature_mapping where r_id=?";

              $stmt1= $conn->prepare($sql1);
          
              $stmt1->execute([$_SESSION["roleId"]]);
              //fetch the result row and put it in $result
              $result1=$stmt1->fetchAll(PDO::FETCH_ASSOC);
              foreach ($result1 as $row1) {
                $_SESSION["f" . $row1["fid"]] = true;
                // $q = $_SESSION["f" . $row1["fid"]];
                // var_dump($result1);
                // die();
              }

              // $sql1_result = $conn->query($sql1);
              // if ($sql1_result == TRUE) {
              //   while ($row1 = $sql1_result->fetch_assoc()) {
              //     $_SESSION["f" . $row1["fid"]] = true;
              //   }
              // }
              $useractivity->saveHistory($conn, "LOGIN", "Just logged in");
  
            }
            catch(Exception $e){
              echo $e->getMessage();
            }
           

            header("Location: ./home.php");
            die('Should have redirected by now');
          } else {
            echo "<script>alert('Invalid username or password.Try again');</script>";
            //header("Location: ./pmpDisabledRole.php");
          }
        }
      } else {
        echo "no rows";
        echo "<script>alert('Cannot Login!!Username doesnot exist in Database');</script>";
      }
    }else{
      echo "<script>alert('Username doesnot exist in Database');</script>";
    }
      
  }
}
    
?> 

<!doctype html>

<html lang="en">

<head>
  <title>Animation Demo</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous">
  </script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css">
  <!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->

  <!-- Scripts By Bootstrap Saved  for vedio header-->
  <link rel="stylesheet" href="./cssstyles/downloadedCss/bootstrap_bundle_min.css" />
  <script src="./scripts/downloadedJs/bootstrap_bundle_min.js" type="text/javascript"></script>
  <script src="./scripts/downloadedJs/jquery_Slim_min.js" type="text/javascript"></script>
  <!-- Scripts By Self -->
  <link rel="stylesheet" href="./cssstyles/style.css" />
    <script src="./scripts/login.js" type="text/javascript"></script>

</head>

  <body>
  <?php
    require("./navigationbar.php");
    $regStatus = $_GET["regstat"];
    if($regStatus == "registered"){
    ?>
    <script>swal("Registered Successfully!", "You can now login", "success");</script>
    <!-- <script>alert("successfully registered");</script> -->
    <?php
      }
    ?>
  
  <div id="main1">
    <header>
      <div class="overlay"></div>
      <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop"  style="height: 600px;
        width: 100%;" >
        <source src="https://storage.googleapis.com/coverr-main/mp4/Mt_Baker.mp4" type="video/mp4">
      </video>
      <div class="container h-100">
        <div class="d-flex h-100 text-center align-items-center">
          <div class="w-100 " style="color:#e6550e">
          <h1 class="display-3">Video Playing Quiz</h1>
          <p class="lead mb-0">Welcome to the Animation Demo Portal</p>
        </div>
      </div>
    </div>
   </header>

 
  </div>
 </body>

</html>