var currentQuestionIndex = 0;

$(document).ready(function () {
  playQuestion();
  $("#submitQuiz").hide();
  $("#nextbtn").hide();
  enableNext = function() {
    if (questions[currentQuestionIndex].id == 1) {
      ans = "null";
      $('.modal').modal('toggle'); 
      $("#nextbtn").show();
          //After Intro  next button click function in modal 
      $("#nextbtn").click(function () {
        questions[currentQuestionIndex].answer = ans;
        console.log(currentQuestionIndex + " enable next");

        // console.log(currentQuestionIndex);
        answerValidation(ans,questions[currentQuestionIndex].id);  
        $('.modal').modal('toggle');
        currentQuestionIndex += 1;
        playQuestion();
      });
      $("#saveAndNext").hide();

    } else if (currentQuestionIndex < questions.length - 1){

      $('.modal').modal('toggle'); 
      $("#nextbtn").hide();
      $("#saveAndNext").show();
      // currentQuestionIndex += 1;

   console.log(currentQuestionIndex + "middle question");
    } else {
      $('.modal').modal('toggle'); 
      $("#nextbtn").hide();
      $("#saveAndNext").hide();
    }
    $("#submitQuiz").attr("disabled", false);
  };
    //savequestion and go got next
  $("#saveAndNext").click(function () {
    var ans = $("input:radio[name ='question']:checked").val();
    if ( questions[currentQuestionIndex].id>1) {
      if (!ans) {
        // alert("please check the answer");
        swal({ type: "error", title: 'Error!', text: 'Please check any one option to view next question!', confirmButtonClass: "btn-danger", confirmButtonText: 'OK' });
        return;
      } else {
        questions[currentQuestionIndex].answer = ans;
        //console.log(currentQuestionIndex);
        answerValidation(ans,questions[currentQuestionIndex].id);  
        $('.modal').modal('toggle');
      }
    }else if (questions[currentQuestionIndex].id==1){
      //intro video
      answerValidation("intro",questions[currentQuestionIndex].id);
    }
    currentQuestionIndex += 1;
    var ql = questions.length;
    //last question
    if (currentQuestionIndex == questions.length - 1) {
      $("#saveAndNext").hide();
    }
    else{
    }
    playQuestion();
  });

});
//Document Ready ends

function answerValidation(ans,currentQuestionIndex){
  $.ajax({
    data : {'selectedAns': ans,'questionID':currentQuestionIndex},
    url:'./services/insert_feedback_ans.php',
    type: 'POST',
    datatype: 'text',
    success: function(data){
     console.log(data);
    }
  });
}
function formSubmit() {
  var ans1 = $("input:radio[name ='question']:checked").val();
    if (!ans1) {
       swal({ type: "error", title: 'Error!', text: 'Please check any one option to submit!', confirmButtonClass: "btn-danger", confirmButtonText: 'OK' });
        return;
    }else {
      swal({
        title: "Are you sure?",
        text: "Once Submitted you cannot retake the quiz!",
        type: "warning",
        showCancelButton: true,
        confirmButtonClass: "btn-success",
        confirmButtonText: "Yes, Submit my Quiz!",
        closeOnConfirm: false
      },
      function(){
        questions[currentQuestionIndex].answer = ans1;
        console.log(currentQuestionIndex + "for last question in quiz ");
        answerValidation(ans1,questions[currentQuestionIndex].id);
        window.location = "./home.php?qs=1";
      });     
    }      
}
function playVid() { 
  var vid = document.getElementById("video1"); 
  vid.play(); 
} 
function playQuestion() {
  console.log(currentQuestionIndex + "inside playQuestion");

  var videoFile = './vedios/' + questions[currentQuestionIndex].videoPath;
  $('#divVideo video source').attr('src', videoFile);
  $("#divVideo video")[0].load();
  $("#questionHeader").html(questions[currentQuestionIndex].heading);
  // Appending options into Input tag
  var optionsContent = "";
  //  i is index, d is value of each index in array
  $.each(questions[currentQuestionIndex].options, function (i, d) {
    console.log(d);
    optionsContent += '<label class="checkbox-inline" style="padding:10px"><input id="question" type="radio"  name="question" value="' + d + '"required> ' + d + '</label>';
  });

  if (currentQuestionIndex == questions.length - 1) {
    $("#submitQuiz").show();
    $("#saveAndNext").hide();
  }
  // console.log(currentQuestionIndex + "is the cirrent index");
$(".modal-title").html( currentQuestionIndex+ " currentQuestionIndex");
  $("#optionsHolder").html(optionsContent);
}
//Responsive code Hamberger Menu
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}

