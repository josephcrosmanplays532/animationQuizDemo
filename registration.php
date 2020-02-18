<html>
<head>
    <title>Registration</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./cssstyles/style.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css">
  <!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
  <!-- <script src="./scripts/register.js" type="text/javascript"></script> -->

</head>
<body>
<?php 
  $flag ="regnav";
  require("./navigationbar.php");
  $regStatus = $_GET["regstat"];
  if($regStatus == "failed"){
    ?>
    <script>swal("Registration Failed!", "Your username or phone number is already registered with us!", "warning");</script>
  <?php
    }
  ?>
<div id="main1" class="container">
<h2 style="text-align:center;margin-top:30px;margin-bottom:20px;color:#4CAF50"><i class="fa fa-registered"></i> Registration </h2>

<form method="post"  action="./services/register_user.php">
<div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">First Name</label>
      <input type="text" class="form-control" id="fname" name="fname" placeholder="First Name">
      <span class="error error_red" id="spanf_name" ></span> 

    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Last Name</label>
      <input type="text" class="form-control" id="inputPassword4" name="lname" placeholder="Last Name">
      <span class="error error_red" id="spanl_name" ></span> 

    </div>
  </div>
  <div class="form-row">
  <div class="form-group col-md-6">
      <label for="inputPassword4">Password</label>
      <input type="password" class="form-control" id="inputPassword4" name="password" placeholder="Password">
      <span class="error error_red" id="spanpassword" ></span> 

    </div>
    <div class="form-group col-md-6">
      <label for="inputConfirmPassword4">Confirm Password</label>
      <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm Password">
      <span class="error error_red" id="spanconfirmPassword" ></span> 

    </div>
  </div>
  <div class="form-row">
  <div class="form-group col-md-3">
      <label for="username">Username</label>
      <input type="text" class="form-control" id="username" name="username" placeholder="username">
      <span class="error error_red" id="spanConfirmUsername" ></span> 
  </div>  
  <div class="form-group col-md-3">
      <label for="username">Role</label>
      <select id="roleSelect" class="form-control" name="roleSelect">
      <option selected>Choose...</option>
                    <?php
                    $connType="PDO";
                    require("./connect.php");
                    $sql = "select * from pmp_role";
                    //echo $sql;

                        $stmt= $conn->prepare($sql);
                        $result=$stmt->execute([]);
                        if($result){
                          while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                            echo "<option value='" . $row["role_id"] . "'>" . $row["r_name"] . "</option>";
                          }
                        }else{
                          echo $e->getMessage();
                        }
                    ?>
      </select>
      <span class="error error_red" id="spanConfirmUsername" ></span> 
  </div>  
  <div class="form-group col-md-3">
      <label for="phonenumber">Phone Number</label>
      <input type="text" class="form-control" id="phnum" name="phnum" placeholder="Phone">
    </div>
    <div class="form-group col-md-3">
      <label for="inputEmail4">Email</label>
      <input type="email" class="form-control" id="inputEmail4" name="email" placeholder="Email">
    </div>
  </div>
  <div class="form-row">
       <div class="form-group col-md-2">
         <label for="age">Age:</label>
         <input type="text" class="form-control" placeholder="Age" name="age" id="age"/>
        </div>
        <div class="form-group col-md-4">
            <fieldset class="form-group">
             <div class="row">
                <legend class="col-form-label col-sm-2 pt-0">Gender</legend>
                <div class="col-sm-10">
                    <div class="form-check">
                    <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
                    <label class="form-check-label" for="gridRadios1">
                       Male
                    </label>
                    </div>
                    <div class="form-check">
                    <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
                    <label class="form-check-label" for="gridRadios2">
                        Female
                    </label>
                    </div>
                  </div>
                </div>
            </fieldset>
        </div>
        <div class="form-group col-md-6">
      <label for="inputPassword4">Organization</label>
      <input type="text" class="form-control" id="org" name= "org" placeholder="Organization">
    </div>
    </div>


  <div class="form-group">
    <label for="inputAddress">Address 1</label>
    <input type="text" class="form-control" id="inputAddress" name="addr1" placeholder="1234 Main St">
  </div>
  <div class="form-group">
    <label for="inputAddress2">Address 2</label>
    <input type="text" class="form-control" id="inputAddress2" name="addr2" placeholder="Apartment, studio, or floor">
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" id="inputCity" name="city" placeholder="City Name">
    </div>
    <div class="form-group col-md-4">
      <label for="inputState">State</label>
      <select id="inputState" class="form-control" name="state">
        <option selected>Choose...</option>
                <option value="AL">Alabama</option>
                <option value="AK">Alaska</option>
                <option value="AZ">Arizona</option>
                <option value="AR">Arkansas</option>
                <option value="CA">California</option>
                <option value="CO">Colorado</option>
                <option value="CT">Connecticut</option>
                <option value="DE">Delaware</option>
                <option value="FL">Florida</option>
                <option value="GA">Georgia</option>
                <option value="HI">Hawaii</option>
                <option value="ID">Idaho</option>
                <option value="IL">Illinois</option>
                <option value="IN">Indiana</option>
                <option value="IA">Iowa</option>
                <option value="KS">Kansas</option>
                <option value="KY">Kentucky</option>
                <option value="LA">Louisiana</option>
                <option value="ME">Maine</option>
                <option value="MD">Maryland</option>
                <option value="MA">Massachusetts</option>
                <option value="MI">Michigan</option>
                <option value="MN">Minnesota</option>
                <option value="MS">Mississippi</option>
                <option value="MO">Missouri</option>
                <option value="MT">Montana</option>
                <option value="NE">Nebraska</option>
                <option value="NV">Nevada</option>
                <option value="NH">New Hampshire</option>
                <option value="NJ">New Jersey</option>
                <option value="NM">New Mexico</option>
                <option value="NY">New York</option>
                <option value="NC">North Carolina</option>
                <option value="ND">North Dakota</option>
                <option value="OH">Ohio</option>
                <option value="OK">Oklahoma</option>
                <option value="OR">Oregon</option>
                <option value="PA">Pennsylvania</option>
                <option value="RI">Rhode Island</option>
                <option value="SC">South Carolina</option>
                <option value="SD">South Dakota</option>
                <option value="TN">Tennessee</option>
                <option value="TX">Texas</option>
                <option value="UT">Utah</option>
                <option value="VT">Vermont</option>
                <option value="VA">Virginia</option>
                <option value="WA">Washington</option>
                <option value="WV">West Virginia</option>
                <option value="WI">Wisconsin</option>
                <option value="WY">Wyoming</option>
        </select>
    </div>
    <div class="form-group col-md-2">
      <label for="inputZip">Zip</label>
      <input type="text" class="form-control" id="inputZip" name="zipcode" placeholder="Zip Code">
    </div>
  </div>
 
  <div style="text-align:center"><button type="submit" class="btn btn-primary">Sign in</button>
  </div>
</form>
</div>
</body>
</html>