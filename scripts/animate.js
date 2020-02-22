
// REsponsive Navbar

var currentQuestionIndex = 0;
var enableNext = function(){}
//var formSubmit = function(){}
var questions = [
  {
    "options": [],
    "videoPath": "intro.mp4",
    "heading": "Introduction",
    "answer": ""
  },
  {
    "options": ["Always", "Very Often", "Sometimes", "Almost Never", "Never (pops up)"],
    "videoPath": "q1.mp4",
    "heading": "Question 1",
    "answer": ""
  },
  {
    "options": ["Always", "Very Often", "Sometimes", "Almost Never", "Never (pops up)"],
    "videoPath": "q2.mp4",
    "heading": "Question 2",
    "answer": ""
  }
];

$(document).ready(function () {
  $("#next").attr("disabled", true);

  enableNext = function() {
    $("#next").attr("disabled", false);
    $("#submitQuiz").attr("disabled", false);
  };

  $("#next").click(function () {
    var ans = $("input:radio[name ='question']:checked").val();
    if (currentQuestionIndex > 0) {
      if (!ans) {
        // alert("please check the answer");
        swal({ type: "error", title: 'Error!', text: 'Please check any one option to view next question!', confirmButtonClass: "btn-danger", confirmButtonText: 'OK' });
        return;
      } else {
        questions[currentQuestionIndex].answer = ans;
        console.log(currentQuestionIndex);
        answerValidation(ans,currentQuestionIndex);
        
      }
    }
    currentQuestionIndex += 1;
    var ql = questions.length;
    //last question
    if (currentQuestionIndex == questions.length - 1) {
      $("#formOptions").append('<button id="submitQuiz" type="button" onclick = "formSubmit()"  class="btn btn-success" type="button" disabled> Submit </button>');
      $("#next").hide();
      // questions[currentQuestionIndex].answer = ans;
      // console.log(currentQuestionIndex + "for last question in quiz ");
      // answerValidation(ans,currentQuestionIndex);

      // $("#submitQuiz").attr("disabled",false);
      //enableNext();//for enabling submit
      // $("#submitQuiz").attr("disabled", false);
    //  } else if (currentQuestionIndex >= questions.length - 1) {
    //   $("#next").attr("disabled", "disabled");
    //   // currentQuestionIndex = questions.length - 1;
    //   console.log(currentQuestionIndex); 
    }
    else{
      $("#next").attr("disabled", true);
      // $("#prev").attr("disabled", false);
    }
    playQuestion();
  });

  $("#prev").click(function () {
    $("#submitQuiz").hide();
    $("#next").show();
    currentQuestionIndex -= 1;
    if (currentQuestionIndex <= 0) {
      
      $("#prev").attr("disabled", "disabled");
      currentQuestionIndex = 0;
    } else {
      $("#prev").attr("disabled", false);
      $("#next").attr("disabled", true);
    }
    playQuestion();
  });

});

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
      //  alert("Error select any form ");
       swal({ type: "error", title: 'Error!', text: 'Please check any one option to submit!', confirmButtonClass: "btn-danger", confirmButtonText: 'OK' });
        return;
    }else {
      swal({
        title: "Are you sure?",
        text: "Once Submitted you cannot retake the quiz!",
        type: "warning",
        // showCancelButton: true,
        confirmButtonClass: "btn-success",
        confirmButtonText: "Yes, Submit my Quiz!",
        closeOnConfirm: false
      },
      function(){
        questions[currentQuestionIndex].answer = ans1;
        console.log(currentQuestionIndex + "for last question in quiz ");
        answerValidation(ans1,currentQuestionIndex);
        window.location = "./home.php?qs=1";
      });


     
    }      
}


function playVid() { 
  var vid = document.getElementById("video1"); 
  vid.play(); 
} 
function playQuestion() {
  var videoFile = './vedios/' + questions[currentQuestionIndex].videoPath;
  $('#divVideo video source').attr('src', videoFile);
  $("#divVideo video")[0].load();
  $("#questionHeader").html(questions[currentQuestionIndex].heading);
  // appedning options into Input tag
  var optionsContent = "";
  //  i is index, d is value of each index in array
  $.each(questions[currentQuestionIndex].options, function (i, d) {
    // console.log(d);
    optionsContent += '<label class="checkbox-inline" style="padding:10px"><input id="question" type="radio"  name="question" value="' + d + '"required> ' + d + '</label>';
  });
  if(currentQuestionIndex){
    $("#playVedio").hide();
  }
  // console.log(currentQuestionIndex + "is the cirrent index");

  $("#optionsHolder").html(optionsContent);
}
//Responsive Hamberger Menu
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}

