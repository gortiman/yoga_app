import 'dart:html';

import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:yoga_app/srcreens/home_screen.dart';
import 'package:yoga_app/srcreens/startup_screen.dart';

// Future main() async {
//   if(Platform.isWindows || Platform.isLiux){
//     sqfliteFfiInit();
//   }
//   databaseFactory = databaseFactoryFfi;
//   runApp(const MyApp());
// }
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}



// https://github.com/codewithdhruv22/Flutter_Yoga_App/blob/254e4d6dd74f5b1ac08643ad939e1b60d8cb728b/lib/Screens/Home.dart
// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/c6fa564599b5914d323315ae39c90ac7e20d2bf6  #7
// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/955cbc264b1334c0913b2f8b29d46468ae65172f  #8 *
// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/25d9c0d6fe79f9b4363800617538537ca3e22395  #9
// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/b091b8b35b3e00b9edb39acd99a90b41b505ad03  #10
// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/aa99244b9d346b000991079ce9aa69e57c4459ed  #11
// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/9950791318a3bff4d817a85a05c3facf0f54d5b8  #12
// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/6cb18bed2cc4be5ee9e866650d23e41d84eab321/lib #13
// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/9950791318a3bff4d817a85a05c3facf0f54d5b8/lib  #14
// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/71174bb33d195740e931fcea2dd217762b51fac1  #15
// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/ffd2cc17e03949c087bbd8e764bab412103c5678  #16
// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/c34789bc8fe39ce21d1e076a55183431756fc0ed  #17
// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/2ad83a8e299ab2f6c10bbfeee4ca83b4de0bf3d9  #18
// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/7a4b27de19819d3db6a5b9ee0247c30595db04d2  #19
// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/a8ea32205af9d473d6bf1e6e3e9a5dc895ca34fa  #20
// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/cc37fb4a2985327864c99b56f19e0d479107a200  #21
// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/66d254c83b100a4b5ee03e005267edaa4d24bb74  #22
// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/6030ab86dfe56fdc6261ff21bad34c869f066924  #23
// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/cee5ca40df0708c3c60fb4881d989b48b4534476  #24

// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/1ba3da35a5ea7f03514d64b119717e88da0a05eb  #27
// https://github.com/codewithdhruv22/Flutter_Yoga_App/tree/6030ab86dfe56fdc6261ff21bad34c869f066924  #28 and #23 are same link
// https://github.com/codewithdhruv22/Flutter_Yoga_App  #29 final code


// https://github.com/codewithdhruv22/Flutter_Yoga_App/commit/c7e54b578f3886a30e736855a06d6612aa2d7b66#diff-9f3bf4d0663cce8d4276e08af1ebddee806dd87782630f57955d4af44c45839d