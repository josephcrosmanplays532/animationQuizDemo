<?php
//PDO
error_reporting(0);
// ini_set('display_errors', 1);
// ini_set('display_startup_errors', 1);
// error_reporting(E_ALL);
session_start();
$connType = "PDO";
require("./connect.php");
include("./services/saveUserActivityPdo.php");
$useractivity = new ActivityHistory();
$useractivity->saveHistory($conn, "Home", "Opened Home Page with Quiz vedio1");
session_start();
if (!$_SESSION["loggedin"]) {
  header("Location:./index.php");
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
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css">

  <!-- Scripts By Self -->
  <script src="./scripts/animate.js" type="text/javascript"></script>
  <!-- <script src="./scripts/login.js" type="text/javascript"></script> -->

  <link rel="stylesheet" href="./cssstyles/style.css" />
</head>

<body>
  <?php 
require("./navigationbar.php");
?>
  
  <div class="container h-100">
    <div class="d-flex h-100 text-center align-items-center">
      <div class="w-100">
        <h1 class="animationHeading" id="questionHeader">Introduction
        </h1>
      </div>
    </div>
  </div>
  <div id="divVideo" style="text-align: center">
    <video id="video1" width="75%" controls playsinline autoplay>
      <source src="./vedios/intro.mp4" type="video/mp4">
    </video>
    <form action="#">
      <div id="optionsHolder">

      </div>
    </form>
  </div>
  <div>
    <section class="row" style="text-align: center">
      <div class="col-md-12">
          <button id="playVedio" type="button" onclick="playVid()" class="btn btn-success" type="button">Play Video</button>
        <button type="button" id="prev" class="btn btn-primary" disabled> Prev</button>
        <button type="button" id="next" class="btn btn-primary"> Next</button>
      </div>
    </section>
  </div>

</body>

</html>