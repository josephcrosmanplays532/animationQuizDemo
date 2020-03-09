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
// sent from animate.js
//checks if url has qs ==1 from get
//and then uopdates the table with column quiz_status = 1
if($_GET["qs"]==1){
  //update db value 
  $sql = "update users set quiz_status=1 where id=?";
  $stmt= $conn->prepare($sql);
  $stmt->execute([$_SESSION["userid"]]);
  $_SESSION["quizStatus"]=1;
}
//
$qsval = $_SESSION["quizStatus"];

// var_dump($_SESSION);
?>
<!doctype html>
<html lang="en">

<head>
<link rel="icon" 
      type="image/png" 
      href="./resources/favicon.jpeg">
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
  <link rel="stylesheet" href="./cssstyles/style.css" />

</head>

<body>
  <?php 
    require("./navigationbar.php");
    //fetching qsval to check if the quiz is done
    if ($qsval == 1)
    {
 ?>
    <div class="container h-100">
      <div class="d-flex h-100 text-center align-items-center">
        <div class="w-100">
          <h1 class="animationHeading" id="questionHeader">You have No quiz to submit
          </h1>
        </div>
      </div>
    </div>
  <?php
  }else {

    $sql1="select qs.id,qs.qurl as videoPath,qs.heading,qs.all_option as options from fb_qs qs where id not in (select ans.q_id from fb_ans ans where ans.user_id=? and ans.ans_flag is not null)";
    //$sql1 = "select qs.id,qs.qurl as videoPath,qs.heading,qs.all_option as options from fb_qs qs left join fb_ans ans on qs.id=ans.q_id where ans_flag is null";

    // $sql1 = "select qs.id,qs.qurl as videoPath,qs.heading,qs.all_option as options from fb_qs qs left join fb_ans ans on qs.id=ans.q_id where ans_flag is null user AND ans.user_id = ?";
    $stmt1= $conn->prepare($sql1);
    $stmt1->execute([$_SESSION["userid"]]);

    // $stmt1->execute($_SESSION["userid"]);
    $result=$stmt1->fetchAll(PDO::FETCH_ASSOC);

    $formattedResult = array();
    foreach($result as $row){
      $row["options"]=explode(",",$row["options"]);
      $formattedResult[]=$row;
      //var_dump($row);
          // var_dump($formattedResult);

    }
    echo "<script>var questions=".json_encode($formattedResult).";</script>";
    echo '<script src="./scripts/animate.js" type="text/javascript"></script>';
  ?>
  <div class="container h-100">
    <div class="d-flex h-100 text-center align-items-center">
      <div class="w-100">
        <h1 class="animationHeading" id="questionHeader"><?php echo $formattedResult[0]["heading"]; ?>
        </h1>
      </div>
    </div>
  </div>
  <div id="divVideo" style="text-align: center">
    <video id="video1" width="75%" controls playsinline autoplay onended="enableNext()">
      <source src='./vedios/<?php echo $formattedResult[0]["videoPath"] ?>' type="video/mp4">
    </video>
    <form action="#">
      <!-- <div id="optionsHolder">
      </div> -->
      <div class="col-md-12" id= "formOptions">
        <button type="button" id="prev" style="display:none" class="btn btn-primary" disabled> Prev</button>
        <!-- <button type="button" id="next" class="btn btn-primary" disabled> Next</button>        -->
      </div>
    </form>
  </div>
  <?php
  }
  ?>

  <!-- Option modal -->
<div class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"> Title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div id="optionsHolder">
      </div>
      </div>
      <div class="modal-footer">
         <button id="submitQuiz" type="button" onclick = "formSubmit()"  class="btn btn-success" type="button"> Submit </button>
        <button type="button" id = "saveAndNext"  class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="nextbtn" type="button"  class="btn btn-success" type="button" > next </button>
      </div>
    </div>
  </div>
</div>
  
</body>

</html>