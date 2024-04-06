import 'package:flutter/material.dart';
import 'package:yoga_app/srcreens/are_you_ready.dart';

class StartUpScreen extends StatefulWidget {
  const StartUpScreen({super.key});

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>RUready()));
      },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: Text("START", style: TextStyle(
              fontSize: 20,
            ),),
          )),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            // backgroundColor: Colors.red,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: Text("Yoga"),
              background: Image.network(
                "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=920&q=80" , fit: BoxFit.cover,),
            ),
            actions: [
              IconButton(onPressed: (){},
                  icon: Icon(Icons.thumb_up_alt_rounded))
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("16 Mins || 26 Workouts" , style: TextStyle(fontWeight: FontWeight.w400),)
                    ],
                  ),
                  Divider(thickness: 2,),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index)=>Divider(thickness: 2,),itemBuilder: (context, index)=>
                      ListTile(leading: Container(margin: EdgeInsets.only(right: 20),
                          child: Image.network("data:image/jpeg;base64,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" ,
                            fit: BoxFit.cover,)),
                        title: Text("Yoga $index" ,
                          style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 18),),
                        subtitle: Text((index%2 == 0) ?"00:20" : "x20" , style: TextStyle(fontSize: 15),),) ,
                      itemCount: 10)
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}