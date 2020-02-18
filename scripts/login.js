$(document).ready(function (){
    $("#loginBtn").click(function () {
       //alert("hi");
      //  swal({
      //   title: "Success",
      //   text: "Your credentials have been verified!",
      //   type: "success",
      //   showCancelButton: true,
      //   confirmButtonClass: "btn-success",
      //   confirmButtonText: "Yes, Login!",
      //   cancelButtonText: "No, cancel pls!",
      //   closeOnConfirm: false,
      //   closeOnCancel: false
      // },
      // function(isConfirm) {
      //   console.log(isConfirm);
      //   if (isConfirm) {
      //     // window.location.href = './home.php'; 
      //     $("#loginBtnSubmit").click();
          
      //   } else {
      //     swal("Cancelled", "Please come back soon :)", "error");
          
      //   }
      // });     
    });

    
});

function validateLogin(e) {
  var u_name = $('#username').val();
  var pwd = $('#password').val();
  return true;
  $('.error').html('');
  if (u_name == "") {
      $('#span_email').html("<p class='error_red paddingTop'>Enter FIRST NAME " + " " + '<i class = "fa fa-times" aria-hidden="true"></i></p>');
      return false;
  } else if (pwd == "") {
      $('#span_pwd').html("<p class='error_red paddingTop'>Enter LAST NAME " + " " + '<i class = "fa fa-times error_red" aria-hidden="true"></i></p>');
      return false;
  } else {
      console.log('All Validations passed the data will be inserted in to DB');
      return true;
  }
}
