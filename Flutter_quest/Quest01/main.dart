import 'package:flutter/material.dart';

import 'dart:async';

void main() {
  startPomodoroTimer();
}

void startPomodoroTimer() {
  print('flutter: Pomodoro 타이머를 시작합니다.');
  int cycle = 4;
  int studyMinutes = 24;
  int studyss = 60;
  int breakMinutes = 5;
  int breakss = 60;

  Timer.periodic(Duration(seconds: 1), (Timer timer) {
    if (cycle > 1) {
      if (studyMinutes > 0 || studyss > 0) {
        if (studyss > 10) {
          studyss--;
          print('flutter : $studyMinutes:$studyss');
        } else if (studyss > 0) {
          studyss--;
          print('flutter : $studyMinutes:0$studyss');
        } else {
          studyMinutes--;
          studyss = 60;
          if (studyMinutes < 0) {
            print('공부시간이 끝났습니다.');
            print('쉬는 시간 시작합니다');
          }
        }
      } else {
        if (breakss > 10) {
          breakss--;
          print('flutter : $breakMinutes:$breakss');
        } else if (breakss > 0) {
          breakss--;
          print('flutter : $breakMinutes:0$breakss');
        } else {
          breakMinutes--;
          breakss = 60;
          if (breakMinutes < 0) {
            print('쉬는 시간이 끝났습니다');
            print('공부 시간 시작합니다.');
            studyMinutes = 24;
            studyss = 60;
            breakMinutes = 4;
            breakss = 60;
            cycle --;
          }
        }
      }
    } else {
      if (studyMinutes > 0 || studyss > 0) {
        if (studyss > 10) {
          studyss--;
          print('flutter : $studyMinutes:$studyss');
        } else if (studyss > 0) {
          studyss--;
          print('flutter : $studyMinutes:0$studyss');
        } else {
          studyMinutes--;
          studyss = 60;
          if (studyMinutes < 0) {
            print('공부시간이 끝났습니다.');
            print('쉬는 시간 시작합니다');
          }
        }
      } else {
        breakMinutes = 14;
        breakss = 59;
        if (breakss > 10) {
          breakss--;
          print('flutter : $breakMinutes:$breakss');
        } else if (breakss > 0) {
          breakss--;
          print('flutter : $breakMinutes:0$breakss');
        } else {
          breakMinutes--;
          breakss = 60;
          if (breakMinutes < 0) {
            print('타이머가 종료 되었습니다.');           
          }
        }
      }
    }
  });
}
