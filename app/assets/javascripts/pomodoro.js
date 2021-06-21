$(document).ready(function() {

let selectedOpBreak="",
      selectedOpWork="",
      breakTime="",
      workTime="",
      timer="",
      countTime="",
      minutes="",
      seconds="",
      minutesB="",
      secondsB="",
      intervalId =false,
      intervalIdBreak=false;

  breakTime += $('.breakT').html();
  workTime += $('.workT').html();
  minutes += $('.minutes').html();
  seconds += $('.seconds').html();
//BREAK OPERATORS

  $('.operatorB').click(function(){
    selectedOpBreak = $(this).html();
    if(selectedOpBreak === "+") {
      breakTime ++;
      $('.breakT').html(breakTime);
      minutesB = breakTime;
    } else if (selectedOpBreak === "-") {
      if(breakTime >0){
        breakTime --;
        $('.breakT').html(breakTime);
        minutesB = breakTime;
      }
    }
  });
// WORK OPERATOR
  $('.operatorW').click(function(){
    selectedOpWork = $(this).html();
    if(selectedOpWork === "+") {
      workTime ++;
    $('.workT').html(workTime);
    minutes = workTime;
      $('.minutes').html(workTime);
    }
    else if (selectedOpWork === "-") {
      if(workTime >0)
        workTime --;
      $('.workT').html(workTime);
      minutes = workTime;
      $('.minutes').html(workTime);
    }
  });

function startTimer(){
    $(".msg").html("Work time!");
    $(".minutes").text(--minutes);
    seconds=59;
    updateTime();
    intervalId = setInterval(updateTime,1000);
}

function updateTime(){
  $(".seconds").text(seconds);
  --seconds;
  if(minutes>0 && seconds<0){
    --minutes;
  }
  else if(minutes <= 0 && seconds < 0) {
    breakTimer();
  }
}


  function breakTimer(){
    if(breakTime>0){
      $(".msg").html("Break Time!");
      clearInterval(intervalId);
      $(".minutes").text(--breakTime);
      seconds=59;
      setBreakTime();
      intervalId =          setInterval(setBreakTime,1000);
    }
    else{
      $(".msg").html("The End.");
      stopTimer();
    }
  }
  function setBreakTime(){
    $(".seconds").text(seconds);
      --seconds;
  if(minutes>0 && seconds<0){
      --minutes;
   }
  else if(minutes <= 0 && seconds < 0) {
    $(".msg").html("The End.");
    stopTimer();
   }
  }

function stopTimer(){
  clearInterval(intervalId);
  minutes+=$(".minutes").html("25");
  seconds+=$(".seconds").html("00");
  $(".breakT").html("5");
  $(".workT").html("25");
}
  $(".start-btn").click(startTimer);
  $(".reset-btn").click(stopTimer);
});