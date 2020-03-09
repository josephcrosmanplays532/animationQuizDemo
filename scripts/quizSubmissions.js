
$(document).ready(function(){
  var data = "nullhkj";

  
});

// function $("#resetQuizAnswers").click(function () {
  function resetQuiz() {

  // alert ("test reset quiz");
  var idfromphp = $('#resetID').val();

  $.ajax({
    url:'services/delete_fbAns_to_reset.php',
    type: 'POST',
    datatype: 'text',
    data: {'idtoReset': idfromphp},
    success: function(data){
      if (data == "true") {
          swal({
          title: "Yay!",
          text: "Quiz has been reset.Please tell the student to Logout and Login to re-attempt the quiz.",
          imageUrl: './resources/thumbsupSmiley.jpeg'
        });         
      } else {
        swal({
          title: "Oops",
          text: "No Quiz to reset",
          imageUrl: './resources/thumbsDown.jpeg'
        });    
      }
    }
  });
}

function showQuizResults(uid){
  // alert(uid);
  $.ajax({
    url:'services/pullAnswers.php',
    type: 'POST',
    datatype: 'text',
    data: {'userid': uid},
    success: function(data){
      // alert(data);
      $("#ansresults").html(data);
    }
    });
}