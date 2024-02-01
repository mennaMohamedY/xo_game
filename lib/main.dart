
import 'package:flutter/material.dart';
import 'package:untitled1/gameboard_screen.dart';

import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "XO GAME",
       debugShowCheckedModeBanner: false,
      initialRoute:LoginIn.routeName ,
      routes: {
        LoginIn.routeName: (context)=>LoginIn(),
        GameBoardScreen.routeName: (context)=>GameBoardScreen(),
      },
    );
  }



}




// //with gridview
// XOBtn itemBuilder(BuildContext context, int position){
//   return XOBtn(OnBtnClicked: OnBtnClicked,);
// // }
// Container(color: Colors.red,
// child: SizedBox(height:600,child: GridView.builder(itemBuilder:itemBuilder ,itemCount: 9,
// gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
// ),),
// )



