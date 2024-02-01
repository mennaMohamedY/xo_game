


import 'package:flutter/material.dart';
import 'package:untitled1/dataClass.dart';
import 'package:untitled1/gameboard_screen.dart';


class LoginIn extends StatelessWidget{
  static const String routeName="LoginScreen";
  var fstName='';
  var scdName='';

  @override
  Widget build(BuildContext context) {

    return Scaffold( appBar:  AppBar(title: Text("Tic Tac Toe Game "), centerTitle: true,backgroundColor: Color(0xff232C46)),
    body: Container(color: Color(0xff232C46), child: Column( crossAxisAlignment:CrossAxisAlignment.stretch,children: [
      Container(margin:EdgeInsets.only(top: 42,right: 42,left: 42,bottom: 12),child: Image.asset("assets/images/tictactoe.png" ,width: 90, height: 90,)),
      Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text("Tic Tac Toe", style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),)],),
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(19)),color: Colors.white),margin:  EdgeInsets.only(top: 54,left: 24,right: 24),child: TextFormField(onChanged:(value) => {fstName=value},decoration: InputDecoration(hintText:  "First Player",
        hintStyle: TextStyle( fontSize: 18)
        ,contentPadding: EdgeInsets.all(12)
        ,border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(19))),))),
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(19)),color: Colors.white),margin:  EdgeInsets.only(top: 24,left: 24,right: 24),child: TextFormField(onChanged:(value) => {scdName=value},decoration: InputDecoration(hintText:  "Second Player",
        hintStyle: TextStyle( fontSize: 18)
        ,contentPadding: EdgeInsets.all(12)
        ,border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(19))),))),
      Container(margin: EdgeInsets.only(left: 24,right: 24,top: 42,bottom: 10), child: ElevatedButton(onPressed: (){
        OnPlayClickListener(context);
      }, child: Text("Let's Play "),
        style: ElevatedButton.styleFrom( // ElevatedButton styles
        primary: Color(0xff95A7D6),
        padding: EdgeInsets.fromLTRB(25, 15,25, 15), // Some padding example
        shape: RoundedRectangleBorder( // Border
          borderRadius: BorderRadius.circular(17.0),
        ),
        textStyle: TextStyle( // Text styles
          color: Color(0xff95A7D6),
          fontSize: 18,
          overflow: TextOverflow.ellipsis,
        ),),))

    ])),);
  }

  void OnPlayClickListener(BuildContext context){
    Navigator.pushNamed(context, GameBoardScreen.routeName, arguments: Players( fstName: fstName,scdName: scdName ));

  }


}