<?php
// PDO
error_reporting(0);
// ini_set('display_errors', 1);
// ini_set('display_startup_errors', 1);
// error_reporting(E_ALL);
session_start();
$connType = "PDO";
require("./connect.php");
include("./services/saveUserActivityPdo.php");
$useractivity = new ActivityHistory();
$useractivity->saveHistory($conn, "Quiz Feedback", "Opened Quiz Feedback");
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css">

  <!-- Scripts By Self -->
  <!-- <script src="./scripts/login.js" type="text/javascript"></script> -->

  <link rel="stylesheet" href="./cssstyles/style.css" />
</head>

<body>
  <?php 
    require("./navigationbar.php");
  ?>



<div class="container-fluid" >
<div class="centerAlign">
               <h2 class="animationHeading">
                   Profile Details 
                </h2>
            </div>
  <div class="card " >
  <!-- Button trigger modal -->
  <h1>
  <form>
  <div class="form-group row">
      <label for="staticEmail"  style="margin-top: 30px;" class="col-sm-2 col-form-label">User</label>
      <label for="staticEmail"  style="margin-top: 30px;" class="col-sm-6 col-form-label">Anusha matcha</label>
    <div class="col-sm-4">
    <button type="button" class="btn btn-primary" style="margin-top: 40px;" data-toggle="modal" data-target=".bd-example-modal-lg">
  Open Feedback Form
    </button>
    </div>
  </label>
  </form>

   
 </h1>

  </div>
</div>
  

<!-- Modal -->
<div class="modal fade bd-example-modal-lg" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div>
  
          <div class="card cardPadfb">
            <p class="FBAUTO" id="1" name="1"> 1. The learning objectives for this module were met:</p>
            <div class="row ">
              <div class="col-sm-2 "><input class="FBAUTO" type="radio" name="1" value="Strongly Agree" required=""> Strongly Agree</div>
              <div class="col-sm-2 "><input class="FBAUTO" type="radio" name="1" value="Agree" required=""> Agree</div>
              <div class="col-sm-2 "><input class="FBAUTO" type="radio" name="1" value="Neutral" required=""> Neutral</div>
              <div class="col-sm-2 "><input class="FBAUTO" type="radio" name="1" value="Disagree" required=""> Disagree</div>
              <div class="col-sm-2 "><input class="FBAUTO" type="radio" name="1" value="Strongly Disagree" required=""> Strongly Disagree</div>
            </div>
          </div>
          <div class="card cardPadfb">
            <p class="FBAUTO" id="2" name="2">2. The content for this module was presented clearly.</p>
            <div class="row ">
              <div class="col-sm-2 "><input class="FBAUTO" type="radio" name="2" value="Strongly Agree" required=""> Strongly Agree</div>
              <div class="col-sm-2 "><input class="FBAUTO" type="radio" name="2" value="Agree" required=""> Agree</div>
              <div class="col-sm-2 "><input class="FBAUTO" type="radio" name="2" value="Neutral" required=""> Neutral</div>
              <div class="col-sm-2 "><input class="FBAUTO" type="radio" name="2" value="Disagree" required=""> Disagree</div>
              <div class="col-sm-2 "><input class="FBAUTO" type="radio" name="2" value="Strongly Disagree" required=""> Strongly Disagree</div>
            </div>
          </div>
  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
  

</body>

</html>