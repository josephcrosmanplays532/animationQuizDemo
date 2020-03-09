 
<?php
include("./php/class.phpmailer.php");
class sendEmail{

  public function sendCGEmail($email,$consent_Form,$fnamelnamevalue){
    echo "<script>console.log".($fnamelnamevalue).";</script>".
    $mail = new PHPMailer();

      $emailId = $email;
      $firstlastname= $fnamelnamevalue;
      $mail->SMTPDebug = false;             // Enable verbose debug output
      $mail->Port = '587';
      $mail->isSMTP();      // Set mailer to use SMTP 
      // Specify main and backup SMTP servers                                   // Set mailer to use SMTP
      $mail->Host = gethostbyname('smtp.gmail.com');  // Specify main and backup SMTP servers
      $mail->SMTPAuth = true; // Authentication must be disabled

      
      $message = 'Welcome to Patient Medication Access Portal | <div>Hello  <b style="color:#1c84c6">'.$firstlastname.'</b>,<br><br>  You have been successfully Registered to the Portal. Please use your Registered email to login and Temporary password is : aaaa /</div>';
    
      $messageContent = explode('|', $message);
      $subject = $messageContent[0];
      $matter = $messageContent[1];

      // $file_name = md5(rand()) . '.pdf';
      // $file_name = "./consent.pdf";
      // $f = file_put_contents($file_name, "testingdom");
      // $matter .= $f;
      // $mail->addAttachment($file_name);
      // $mail->IsHTML(true);
      
      //to send html it works
      // $filename="consentform.html";
      // $encoding = "base64";
      // $type = "text/html";
      // $mail->addStringAttachment($consent_Form,$filename,$encoding,$type,"attachment");


      $filename="consentform.pdf";
      // $encoding = "base64";
      $type = "application/octet-stream";
      $mail->addStringAttachment($consent_Form,$filename);
      // $mail->AddEmbeddedImage("./Sign.png", "digitalSign");
      // $mail->AddAttachment("Sign.png");

      $mail->Username = 'clinicaltraining2019@gmail.com';
      $mail->Password = 'hANDSON123';
      $mail->SMTPSecure= 'tls';
      $mail->setFrom('DO-NOT-REPLY@CLT.com',"DO-NOT-REPLY-ODU Patient Medical Access Portal");
      $mail->AddAddress($emailId); 
      // Optional name
      $mail->isHTML(true);            // Set email format to HTML
      $mail->Subject = $subject;
      $mail->Body    = $matter;
      $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';          
      if(!$mail->Send()){
        echo "Failed at email Notify file " .$emailId." ".$role." ".$invite."Error Info:".$mail->ErrorInfo;
      }else{
       
      }
  }

  public function email($email,$invite,$role){

      $return_arrfinal = array();
      $status_array['status'] = '1';
      $mail = new PHPMailer();
      if($role=="Admin"){
      $message = 'Welcome to Patient Medication Access Portal | Hello <b>Admin</b> ,<br><br> Below is the link to  register <a  href="http://qav2.cs.odu.edu/anusha_matcha/AgiTech_DashBoard/pmpRegistration.php?ic='.$invite.'">CLICK TO REGISTER</a> <br><br>Thanks,<br>Principle Investigator';
      }else if ($role =='Care Giver'){
      $message = 'Welcome to Patient Medication Access Portal | Hello <b>CareGiver</b>,<br><br> Below is the link to register <a  href="http://qav2.cs.odu.edu/anusha_matcha/AgiTech_DashBoard/pmpRegistration.php?ic='.$invite.'">CLICK TO REGISTER</a> <br><br>Thanks,<br>Principle Investigator';
      }else if ($role =='Physician'){
        $message = 'Welcome to Patient Medication Access Portal | Hello <b>Physician</b>,<br><br> Below is the link to register <a  href="http://qav2.cs.odu.edu/anusha_matcha/AgiTech_DashBoard/pmpRegistration.php?ic='.$invite.'">CLICK TO REGISTER</a><br><br>Thanks,<br>Principle Investigator';
      }else if ($role =='Principle Investigator'){
          $message = 'Welcome to Patient Medication Access Portal | Hello <b>Principle Investigator</b>,<br><br> Below is the link to register <a  href="http://qav2.cs.odu.edu/anusha_matcha/AgiTech_DashBoard/pmpRegistration.php?ic='.$invite.'">CLICK TO REGISTER</a><br><br>Thanks,<br>Principle Investigator';
      }else if ($role =='Faculty'){
            $message = 'Welcome to Patient Medication Access Portal | Hello <b>Faculty</b>,<br><br> Below is the link to register <a  href="http://qav2.cs.odu.edu/anusha_matcha/AgiTech_DashBoard/pmpRegistration.php?ic='.$invite.'">CLICK TO REGISTER</a><br><br>Thanks,<br>Principle Investigator';
      }else if ($role =='Nurse Practitioner'){
        $message = 'Welcome to Patient Medication Access Portal | Hello <b>Nurse Practitioner</b>,<br><br> Below is the link to register <a  href="http://qav2.cs.odu.edu/anusha_matcha/AgiTech_DashBoard/pmpRegistration.php?ic='.$invite.'">CLICK TO REGISTER</a><br><br>Thanks,<br>Principle Investigator';
        }else if ($role =='Medical Admin'){
          $message = 'Welcome to Patient Medication Access Portal | Hello <b>Medical Admin</b>,<br><br> Below is the link to register <a  href="http://qav2.cs.odu.edu/anusha_matcha/AgiTech_DashBoard/pmpRegistration.php?ic='.$invite.'">CLICK TO REGISTER</a><br><br>Thanks,<br>Principle Investigator';
          }
      //  $emailId = 'anusha.m21@gmail.com';
      // $message = 'abc | anc';
      $emailId = $email;
      $emailString = '';
      // $toarraymail=$lastName;
      // $toarraymail="cmuth001@odu.edu";
      $mail->SMTPDebug = false;                               // Enable verbose debug output
      $mail->Port = '587';
      $mail->isSMTP();                                      // Set mailer to use SMTP // Specify main and backup SMTP servers                                    // Set mailer to use SMTP
      $mail->Host = gethostbyname('smtp.gmail.com');  // Specify main and backup SMTP servers
      $mail->SMTPAuth = true; // Authentication must be disabled
      // $mail->Username = 'tasteofindiahr@gmail.com';
      // $mail->Password = 'Toiwebweb22';
      // $mail->Username = 'vbumc.sitetraffic@gmail.com';
      // $mail->Password = 'VBUMCgoogle';
      // $mail->SMTPSecure= 'tls';
      $messageContent = explode('|', $message);
      $subject = $messageContent[0];
      $matter = $messageContent[1];

      $mail->Username = 'clinicaltraining2019@gmail.com';
      $mail->Password = 'hANDSON123';
      $mail->SMTPSecure= 'tls';
      $mail->setFrom('DO-NOT-REPLY@CLT.com',"DO-NOT-REPLY-ODU Patient Medical Access Portal");
      $mail->AddAddress($emailId); 
     // $mail->AddCC("aweld002@odu.edu");  
      // Optional name
      $mail->isHTML(true);                                  // Set email format to HTML
      $mail->Subject = $subject;
      $mail->Body    = $matter;
      $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';          
      if(!$mail->Send()){
        // return "failed";
        echo "Failed at email Notify file " .$emailId." ".$role." ".$invite."Error Info:".$mail->ErrorInfo;
      }else{
        // echo "Email with Invite link sent to the ".$role;
        // echo "sent";
      }
  }
}
?>