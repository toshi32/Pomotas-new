/*
Copyright (c) December 19, 2015 by Amanze Ogbonna
Released under the MIT license
http://opensource.org/licenses/mit-license.php
(https://codepen.io/darlingtonamz/pen/pgyqMz)
*/

var workTime = 25;
var breakTime = 5;
var timerClock = $('#clock');
var workPlus = $('#work_plus');
var workMinus = $('#work_minus');

var breakPlus = $('#break_plus');
var breakMinus = $('#break_minus');

var timerTime = workTime * 60;
var timerInterval = 0;
var timerClock;

var alarmSound = new Audio('https://lit-beach-52312.herokuapp.com/gong.mp3');
// var alarmSound = new Audio('http://localhost:3000/gong.mp3');

workPlus.on('click', function(e){
  if (workTime < 60){
    workTime++;
    $('#work_view').empty().append(workTime);
    resetTimer();
  }
});

workMinus.on('click', function(e){
  if (workTime > 1){
    workTime--;
    $('#work_view').empty().append(workTime);
    resetTimer();
  }
});

breakPlus.on('click', function(e){
  if (breakTime < 60){
    breakTime++;
    $('#break_view').empty().append(breakTime);
  }
});

breakMinus.on('click', function(e){
  if (breakTime > 1){
    breakTime--;
    $('#break_view').empty().append(breakTime);
  }
});
timerClock.on('click',function(e){
    if(timerClock.hasClass('inactive')){
        if(timerTime>0) {
            startTimer();
        }
    }
    else{
        pauseTimer();
    }

});

function startTimer() {

    clearInterval(timerInterval);

    timerInterval = setInterval(function () {
        timerTime--;
            timerClock.text(returnFormattedToSeconds(timerTime));

        if (timerTime <= 0) {
            alarmSound.play();
            pauseTimer();
            startBreakTimer();
            timerClock.removeClass(work-time);
        }
    }, 1000);

    timerClock.removeClass('inactive');
    timerClock.addClass('work-time');
}

function startBreakTimer() {

    clearInterval(timerInterval);
    timerTime = breakTime * 60;

    timerInterval = setInterval(function () {
        timerTime--;
        timerClock.text(returnFormattedToSeconds(timerTime));

        if (timerTime <= 0) {
            alarmSound.play();
            timerClock.removeClass('break-time');
            pauseTimer();
            resetTimer();
        }
    }, 1000);

    timerClock.removeClass('inactive');
    timerClock.addClass('break-time');
}


function pauseTimer(){
    clearInterval(timerInterval);

    timerClock.addClass('inactive');
}

function resetTimer(){
    pauseTimer();
    if(timerClock.hasClass('break-time')){
      timerClock.removeClass('break-time');
    }

    if(workTime){
        timerTime = workTime * 60;
        timerClock.text(returnFormattedToSeconds(timerTime));
    }
}


function returnFormattedToSeconds (seconds){
    var min = Math.floor(seconds / 60);
    var sec = seconds % 60;
    return min+":"+(sec >= 10 ? sec : "0"+sec);
}