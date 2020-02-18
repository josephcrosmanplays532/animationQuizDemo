
// REsponsive Navbar

var currentQuestionIndex = 0;
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
//Responsive Hamberger Menu
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
//Validation of Radio Button 

$(document).ready(function () {
  // $("#playVedio").click()
  // setTimeout(function(){
  //   $("#video1").prop('muted', false);
  // }, 500);
  $("#next").click(function () {
    var ans = $("input:radio[name ='question']:checked").val();
    if (currentQuestionIndex > 0) {
      if (!ans) {
        // alert("please check the answer");
        swal({ type: "error", title: 'Error!', text: 'Please check any one option to view next question!', confirmButtonClass: "btn-danger", confirmButtonText: 'OK' });
        return;
      } else {
        questions[currentQuestionIndex].answer = ans;
      }
    }
    //Previous and Next button enable and disable  

    currentQuestionIndex += 1;
    if (currentQuestionIndex >= questions.length - 1) {
      $("#next").attr("disabled", "disabled");
      currentQuestionIndex = questions.length - 1;
    } else {
      $("#next").attr("disabled", false);
      $("#prev").attr("disabled", false);
    }

    playQuestion();
  });

  $("#prev").click(function () {
    currentQuestionIndex -= 1;
    if (currentQuestionIndex <= 0) {
      $("#prev").attr("disabled", "disabled");
      currentQuestionIndex = 0;
    } else {
      $("#prev").attr("disabled", false);
      $("#next").attr("disabled", false);
    }
    playQuestion();
  });
});
// start vedio

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
    console.log(d);
    optionsContent += '<label class="checkbox-inline" style="padding:10px"><input id="question" type="radio"  name="question" value="' + d + '"required> ' + d + '</label>';
  });
  if(currentQuestionIndex){
    $("#playVedio").hide();
  }
  console.log(currentQuestionIndex + "is the cirrent index");

  $("#optionsHolder").html(optionsContent);
}
