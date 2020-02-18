<?php
if (!$_SESSION["loggedin"]) {
    ?>
  <script src="./scripts/login.js" type="text/javascript"></script>
  <div class="topnav" id="myTopnav">
    <div><a href="./index.php" class="active">Animation Demo</a>
        <a href="javascript:void(0);" class="icon" onclick="myFunction()">
          <i class="fa fa-bars"></i>
        </a>
    </div>
    <div class="topnav-right">
      <a id="loginDiv" data-toggle="collapse" href="#collapseLogin"> <span class="glyphicon glyphicon-log-in"></span> LOGIN
       </a>
      <div class="collapse" style="position: fixed;padding: 10px;z-index: 99999999;right: 0px;color: white;background: rgba(76, 84, 138, 0.23);top: 50px;" id="collapseLogin" >
       <form name="myForm" role="form" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post"  onsubmit="return validateLogin();">
          <div class="form-group" style="text-align:center">
            <label class="" for="username" style="color: black;font-weight: 600;">
              <span class="glyphicon glyphicon-user "></span> Username
            </label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Enter email">
            <span class="error" id="span_email"></span>
          </div>
          <div class="form-group" style="text-align:center">   
            <label class="" for="password" style="color: black;font-weight: 600;">
              <span class="glyphicon glyphicon-eye-open " ></span> Password
            </label>
            <input type="password" class="form-control" name="password" id="password" placeholder="Enter password">
            <span class="error" id="span_pwd"></span>
          </div>
          <div style="text-align:center">
            <button type="submit" id="loginBtn" class="btn btn-success"><span class="glyphicon glyphicon-log-in"></span> Login</button>
          </div>
          <!-- <button id="loginBtn" type="submit" class="btn"><span class="glyphicon glyphicon-log-in"></span> Login</button> <br> -->
          <a href="./registration.php" style="color:blue; float:right; padding:8px;">Not a member? Register Here</a>
        </form>
      </div>
    </div>
  </div> 
<?php
}
else 
{
?>  
<div class="topnav" id="myTopnav">
    <div>
        
        <a href="./home.php" class="active">Home</a>
        <?php
        if ($_SESSION["f2"]) {
        ?>
        <a href="./accessCtrl.php">Access Control</a>
        <?php
        }
        if ($_SESSION["f3"]) {
        ?>
        <a href="./quizSubmissions.php"> Submissions</a>
        <?php
       }
        if ($_SESSION["f4"]) {
        ?>
        <a href="./UserActivity.php">User Activity</a>
        <?php
      }
        ?>
        <a href="./profile.php">Profile</a>
        <a href="javascript:void(0);" class="icon" onclick="myFunction()">
          <i class="glyphicon glyphicon-bars"></i>
        </a>  
    </div>
    <div class="topnav-right">
        <a href="./logout.php">
          <i class="fa fa-sign-out"></i>
        </a>
  </div>
  </div> 

<?php

}
?>

<script>
  $(document).ready(function()
 {

   $("#main1").not("collapseLogin").click(function() {
    console.log("collapse login func");
    $("#collapseLogin").removeClass("show");
    }); 
  
 });
  </script>

