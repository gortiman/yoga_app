import 'dart:async';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/srcreens/workout_detail.dart';

class TimerModel with ChangeNotifier{
  TimerModel(context){
    MyTimer(context);
  }
  int countdown = 5;
  MyTimer(context) async{
    Timer.periodic(Duration(seconds: 1), (timer){
      countdown--;
      if(countdown == 0){
        timer.cancel();
        timer.cancel();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkOutDetail()));
      }
      notifyListeners();
    });
  }
}