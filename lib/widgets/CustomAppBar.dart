import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  // make animation controller to controll the animation( ex-duration,colors of the animation)
  AnimationController animationController;
  // we want to change the color of these four things
  Animation colorsTween, homeTween, yogaTween, iconTween,drawerTween;
  // a function will call on onpressed, here we use this to open drawer because there is not inbuild function of drawer
  Function()? onPressed;

  // this is the constructor and required parameters
  CustomAppBar({
    required this.animationController,
    required this.colorsTween,
    required this.drawerTween,
    required this.homeTween,
    required this.iconTween,
    required this.onPressed,
    required this.yogaTween
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,

      //  appbar will build this animation
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context,child)=>AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.dehaze,
              color: drawerTween.value,
            ),
            onPressed: onPressed,

          ),
          backgroundColor: colorsTween.value,
          elevation: 0,
          title: Row(
            children: [
              Text("HOME " , style: TextStyle(
                  color: homeTween.value,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),
              Text("YOGA", style: TextStyle(
                  color: yogaTween.value,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),)
            ],
          ),
          actions: [
            Icon(Icons.notifications , color: iconTween.value,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundColor: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}