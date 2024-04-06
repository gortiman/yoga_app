import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_app/provider/time_provider.dart';

class WorkOutDetail extends StatelessWidget {
  const WorkOutDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModelSec>(
      create: (context) => TimerModelSec(context),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: 785,
            child: Column(
              children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage("data:image/jpeg;base64,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",), fit: BoxFit.cover ),
                  ),
                ),
                Spacer(),
                Text("Anulom Vilom",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                )),
                Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 80),
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("00",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),),

                      Text(" : " ,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                          fontSize: 30 ,color: Colors.white),),
                      Consumer<TimerModelSec>(
                          builder: (context, myModel, child){
                            return Text(myModel.countdown.toString(),
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),);
                          }),
                  ],),
                ),
      Spacer(),
      SizedBox(height: 30,),
      ElevatedButton(onPressed: (){},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text("Pause",
                style: TextStyle(
                  fontSize: 20
                ),),
              )),
                Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: (){}, child: Text("Previous" , style: TextStyle(fontSize: 16),)),
                      TextButton(onPressed: (){}, child: Text("Next" , style: TextStyle(fontSize: 16),))
                    ],
                  ),
                ),          Divider( thickness: 2,),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 15),
                      child: Text("Next: Anulom Vilom" , style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold),),
                    ))

              ],
            ),
          ),
        ),
      ),);
  }
}
