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
  <script src="./scripts/animate.js" type="text/javascript"></script>

  <link rel="stylesheet" href="./cssstyles/style.css" />
</head>

<body>
  <?php 
    require("./navigationbar.php");
  ?>



<div class="container-fluid" >
    <div class="centerAlign">
        <h2 class="animationHeading">
 Your Quiz Results
        </h2>
    </div>
    <div class="card ">
      <form>
        <div class="form-group row">
          <div class = "col-sm-12 col-md-12">
            <table class="table tabresponsive">
                <thead>
                    <tr>
                        <th>Question Number</th>
                        <th>Always</th>
                        <th>Very Often</th>
                        <th>Sometimes</th>
                        <th>Almost Never</th>
                        <th>Never(pops up)</th>
                    </tr>
                </thead>
                <tbody id="pullquizans">
                  <?php 
                  $sql = "SELECT q.id,a.user_id, a.ans_value,a.timestamp FROM fb_qs as q LEFT JOIN fb_ans as a on q.id = a.q_id WHERE a.user_id = ?
                  ";
                  $stmt= $conn->prepare($sql);
                  $stmt->execute([$_SESSION["userid"]]);
                  $result=$stmt->fetchAll(PDO::FETCH_ASSOC);
                  if($result){
                      // echo json_encode($result);
                      foreach($result as $row){
                        echo '<tr>';
                        echo '<td>'.$row["id"].'</td>';
                          if($row["ans_value"]=="Always"){
                          echo '<td><label><input type="radio" disabled  name="optradio'.$row["id"].'" checked></label></td>';
                          }else {
                            echo '<td><label><input type="radio" disabled name="optradio'.$row["id"].'"></label></td>';
                          }
                         if($row["ans_value"]=="Very Often"){
                          echo '<td><label><input type="radio"  disabled name="optradio'.$row["id"].'" checked></label></td>';
                         }else {
                           echo '<td><label><input type="radio"  disabled name="optradio'.$row["id"].'"></label></td>';
                         }
                         if($row["ans_value"]=="Sometimes"){
                          echo '<td><label><input type="radio"  disabled name="optradio'.$row["id"].'" checked></label></td>';
                         }else {
                           echo '<td><label><input type="radio"  disabled name="optradio'.$row["id"].'"></label></td>';
                         }
                         if($row["ans_value"]=="Almost Never"){
                          echo '<td><label><input type="radio"  disabled name="optradio'.$row["id"].'" checked></label></td>';
                         }else {
                           echo '<td><label><input type="radio"  disabled name="optradio'.$row["id"].'"> </label></td>';
                         }
                         if($row["ans_value"]=="Never"){
                          echo '<td><label><input type="radio"  disabled name="optradio'.$row["id"].'" checked></label></td>';
                         }else {
                           echo '<td><label><input type="radio"  disabled name="optradio'.$row["id"].'"></label></td>';
                         }
                        echo '</tr>';
                      }
                      }
                  ?>

                </tbody>
            </table>
          </div>
        </div>
      </form>
    </div>
</div>
</body>

</html>