import 'package:flutter/material.dart';
import 'package:yoga_app/srcreens/startup_screen.dart';
import 'package:yoga_app/widgets/customDrawer.dart';
import 'package:yoga_app/services/yogadb.dart';

import '../widgets/CustomAppBar.dart';
import '../model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  // make the variables which will pass in customAppBar
  late AnimationController _animationController;
  late Animation _colorTween,_homeTween,_yogaTween,_iconTween,_drawerTween;
  late AnimationController _textAnimationController;

  Future makeYogaEntry(Yoga yoga, String TableName) async{
    await YogaDatabase.instance.Insert(yoga, TableName);
  }

  Future makeYogaSumEntry(YogaSummary yogaSummary) async{
    await YogaDatabase.instance.InsertYogaSum(yogaSummary);
  }


  bool isLoading = true;
  late List<YogaSummary> yogasumlst;
  Future readYogaSumEntry() async{
    this.yogasumlst = await YogaDatabase.instance.readAllYogaSum();
    isLoading = false;
    print(yogasumlst[0].YogaWorkOutName.toString());
  }

  @override
  void initState() {
    _animationController = AnimationController(vsync: this , duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent , end: Colors.white).animate(_animationController);
    _iconTween = ColorTween(begin: Colors.white , end: Colors.lightBlue).animate(_animationController);
    _drawerTween = ColorTween(begin: Colors.white , end: Colors.black).animate(_animationController);
    _homeTween = ColorTween(begin: Colors.white , end: Colors.blue).animate(_animationController);
    _yogaTween = ColorTween(begin: Colors.white , end: Colors.black).animate(_animationController);
    _textAnimationController = AnimationController(vsync: this , duration: Duration(seconds: 0));
    super.initState();

    makeYogaSumEntry(
        YogaSummary(YogaWorkOutName: YogaModel.YogaTable1,
        BackImg: "https://www.istockphoto.com/photo/handsome-young-man-practicing-yoga-at-park-gm1194094647-339879461?utm_campaign=srp_photos_top&utm_content=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fyoga-pose&utm_medium=affiliate&utm_source=unsplash&utm_term=yoga+pose%3A%3A%3A",
        TimeTaken: "30",
        TotaleNoOfWork: "12")
    );

    makeYogaEntry(Yoga(
        Seconds: true,
        YogaTitle: "Anulom Vilom",
        YogaImgUrl: "https://media.istockphoto.com/id/538353314/photo/women-meditating-pastel-on-high-mountain-in-sunset-background.webp?b=1&s=170667a&w=0&k=20&c=Eie0ez94GUY3kwAFNrJ97OtWetesWVoZyxM5_SP10kY=",
        SecondsOrTimes: '15'),
        YogaModel.YogaTable1
    );

    makeYogaEntry(Yoga(
            Seconds: true,
        YogaImgUrl: "https://www.istockphoto.com/photo/woman-doing-ashtanga-vinyasa-yoga-asana-dhanurasana-bow-pose-gm627908748-111299923?utm_campaign=srp_photos_top&utm_content=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fyoga-pose&utm_medium=affiliate&utm_source=unsplash&utm_term=yoga+pose%3A%3A%3A",
        YogaTitle: "Pranam",
        SecondsOrTimes: '12'),
        YogaModel.YogaTable1);

    makeYogaEntry(Yoga(
        Seconds: true,
        YogaImgUrl: "https://media.istockphoto.com/id/1360259197/photo/young-woman-in-eka-pada-rajakapotasana-pose-king-pigeon-pose.webp?b=1&s=170667a&w=0&k=20&c=jLxV_5FulhZ8hs8PcxjuKju-aepXHr8AgLZxr4pV3zs=",
        YogaTitle: "SuryaNamaskar",
        SecondsOrTimes: '12'),
        YogaModel.YogaTable1);
  }



  // a bool return function with ScrollNotification type scrollNotification variable
  bool scrollListner(ScrollNotification scrollNotification){
    bool scroll = false; // initially it will be false
    if(scrollNotification.metrics.axis == Axis.vertical){ // on vertical scroll
      _animationController.animateTo(scrollNotification.metrics.pixels/80);  // it will take divide 80 pixel part
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroll = true;  // it will return true if this condition will true
    }
    return scroll; // else it will return false as prev
  }
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: NotificationListener(
        onNotification: scrollListner,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            // Container(height: 1000, color: Colors.blue,),
                            // Container(height: 1000, color: Colors.green,),
                            // Container(height: 1000, color: Colors.blue,)


                            Container(
                              padding: EdgeInsets.fromLTRB(50, 150, 50, 40),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(13),
                                      bottomLeft: Radius.circular(13))),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "1",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 23),
                                      ),
                                      Text("Streak",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "120",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 23),
                                      ),
                                      Text("kCal",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "26",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 23),
                                      ),
                                      Text("Minutes",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13))
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(

                                padding : EdgeInsets.only(bottom: 15),
                                width: MediaQuery.of(context).size.width,

                                child: Text("Yoga For All" , style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                )),

        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>StartUpScreen()));
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Stack(

              children: [
                Container(

                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=920&q=80"))),
                ),

                Container(

                  height: 150,
                  color: Colors.black26,
                ),
                Positioned(
                  right: 20,
                  left: 10,
                  top: 10,

                  child: Text("Yoga For Begineers" , style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),),
                ),
                Positioned(
                  right: 30,
                  left: 12,
                  top: 38,

                  child: Text("Last Time : 2 Feb" , style: TextStyle(
                      color: Colors.white,
                      fontSize: 10
                  ),),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Stack(

            children: [
              Container(

                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1510894347713-fc3ed6fdf539?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"))),
              ),

              Container(

                height: 150,
                color: Colors.black26,
              ),
              Positioned(
                right: 20,
                left: 10,
                top: 10,

                child: Text("Weight Loss Yoga" , style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
              ),
              Positioned(
                right: 30,
                left: 12,
                top: 38,

                child: Text("Last Time : 22 Jan" , style: TextStyle(
                    color: Colors.white,
                    fontSize: 10
                ),),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Stack(

            children: [
              Container(

                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1573590330099-d6c7355ec595?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"))),
              ),

              Container(

                height: 150,
                color: Colors.black26,
              ),
              Positioned(
                right: 20,
                left: 10,
                top: 10,

                child: Text("Suryanamaskar" , style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
              ),
              Positioned(
                right: 30,
                left: 12,
                top: 38,

                child: Text("Last Time : Yesterday"
                  , style: TextStyle(
                      color: Colors.white,
                      fontSize: 10
                  ),),
              )
            ],
          ),
        ),
                            Container(

                                padding : EdgeInsets.only(bottom: 15),
                                width: MediaQuery.of(context).size.width,

                                child: Text("Choose Your Type" , style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold), )),





        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Stack(

            children: [
              Container(

                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1599901860904-17e6ed7083a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"))),
              ),

              Container(

                height: 150,
                color: Colors.black26,
              ),
              Positioned(
                right: 20,
                left: 10,
                top: 10,

                child: Text("Power Yoga" , style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
              ),
              Positioned(
                right: 30,
                left: 12,
                top: 38,

                child: Text("Last Time : Yesterday"
                  , style: TextStyle(
                      color: Colors.white,
                      fontSize: 10
                  ),),
              )
            ],
          ),
        ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Stack(

                                children: [
                                  Container(

                                    height: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://media.istockphoto.com/photos/young-woman-in-yoga-pose-using-laptop-at-home-picture-id1334071264?b=1&k=20&m=1334071264&s=170667a&w=0&h=0wnQzJJJIA5NMo6dOmVepS6mXC0eqLjI26ADDlIK4Lg="))),
                                  ),
                                  Container(

                                    height: 150,
                                    color: Colors.black26,
                                  ),
                                  Positioned(
                                    right: 20,
                                    left: 10,
                                    top: 10,

                                    child: Text("Breathing Yoga" , style: TextStyle(
                                        color: Colors.white,fontWeight: FontWeight.bold,
                                        fontSize: 18
                                    ),),
                                  ),
                                  Positioned(
                                    right: 30,
                                    left: 12,
                                    top: 38,

                                    child: Text("Last Time : 29 Jan"
                                      , style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10
                                      ),),
                                  )
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Stack(

                                children: [
                                  Container(

                                    height: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://images.unsplash.com/photo-1556816723-1ce827b9cfbb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=792&q=80"))),
                                  ),
                                  Container(

                                    height: 150,
                                    color: Colors.black26,
                                  ),
                                  Positioned(
                                    right: 20,
                                    left: 10,
                                    top: 10,

                                    child: Text("Increase Flexibility" , style: TextStyle(
                                        color: Colors.white,fontWeight: FontWeight.bold,
                                        fontSize: 18
                                    ),),
                                  ),
                                  Positioned(
                                    right: 30,
                                    left: 12,
                                    top: 38,

                                    child: Text("Last Time : 29 Jan"
                                      , style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10
                                      ),),
                                  )
                                ],
                              ),
                            ),


                          ],
                        ),
                      ],
                    ),
                  ),


                  CustomAppBar(
                      animationController: _animationController,
                      colorsTween: _colorTween,
                      drawerTween: _drawerTween,
                      homeTween: _homeTween,
                      iconTween: _iconTween,
                      onPressed: (){
                        scaffoldKey.currentState?.openDrawer();
                        },
                      yogaTween: _yogaTween
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}













// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("Indian Yoga App"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     children: [
//                       Text("1"),
//                       Text("Streak")
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text("1"),
//                       Text("Streak")
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text("1"),
//                       Text("Streak")
//                     ],
//                   )
//
//                 ],
//               ),
//             ),
//             Divider(thickness: 3,indent: 20, endIndent: 20,),
//             Container(
//               padding: EdgeInsets.all(25),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Yoga For All"),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Container(
//                       color: Colors.blueGrey,
//                       height: 150,
//
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Container(
//                       color: Colors.blueGrey,
//                       height: 150,
//
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(25),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Yoga For Students"),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Container(
//                       color: Colors.blueGrey,
//                       height: 150,
//
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Container(
//                       color: Colors.blueGrey,
//                       height: 150,
//
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Container(
//                       color: Colors.blueGrey,
//                       height: 150,
//
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Container(
//                       color: Colors.blueGrey,
//                       height: 150,
//
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }