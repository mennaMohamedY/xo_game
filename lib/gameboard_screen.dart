
import 'package:flutter/material.dart';
import 'package:untitled1/dataClass.dart';
import 'package:untitled1/xo_btn.dart';


class GameBoardScreen extends StatefulWidget{
  static const String routeName="GameBoardScreen";


  @override
  State<GameBoardScreen> createState() => _GameBoardScreenState();
}

class _GameBoardScreenState extends State<GameBoardScreen> {
  List<String> xoList = [
    '', '', '',
    '', '', '',
    '', '', '',
  ];

  var Score1=0;

  var Score2=0;

  var count = 0;
  String fstPlayer='Unkown';
  String scdPlayer='Unkown';

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as Players;
    fstPlayer=args.fstName;
    scdPlayer=args.scdName;

    return Scaffold(
      appBar: AppBar( title: Text("XO GAME"),  backgroundColor: Color(0xff232C46)),
      body: Column( children: [
        Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text("$fstPlayer (X) \n Score $Score1",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20)),
          Text("$scdPlayer (O) \n Score $Score2",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
        ],)),
        Expanded(child: Row(crossAxisAlignment:CrossAxisAlignment.stretch,children: [
          Expanded(child: XOBtn(symbol: xoList[0],BtnIndex: 0,OnBtnClicked: OnBtnClicked,)),
          Expanded(child: XOBtn(symbol: xoList[1],BtnIndex: 1,OnBtnClicked: OnBtnClicked,)),
          Expanded(child: XOBtn(symbol: xoList[2],BtnIndex: 2, OnBtnClicked: OnBtnClicked,)),
        ],)),
        Expanded(child: Row(crossAxisAlignment:CrossAxisAlignment.stretch,children: [
          Expanded(child: XOBtn(symbol: xoList[3],BtnIndex: 3,OnBtnClicked: OnBtnClicked,)),
          Expanded(child: XOBtn(symbol: xoList[4], BtnIndex: 4,OnBtnClicked: OnBtnClicked,)),
          Expanded(child: XOBtn(symbol: xoList[5],BtnIndex: 5,OnBtnClicked: OnBtnClicked,)),
        ],)),
        Expanded(child: Row(crossAxisAlignment:CrossAxisAlignment.stretch,children: [
          Expanded(child: XOBtn(symbol: xoList[6],BtnIndex: 6,OnBtnClicked: OnBtnClicked,)),
          Expanded(child: XOBtn(symbol: xoList[7],BtnIndex: 7,OnBtnClicked:OnBtnClicked ,)),
          Expanded(child: XOBtn(symbol: xoList[8],BtnIndex: 8,OnBtnClicked: OnBtnClicked,)),
        ],))


      ]),
    );
  }

  void OnBtnClicked(int index) {



    if(xoList[index].isNotEmpty){
      return;
    }
    if (count % 2 == 0) {
      xoList[index] = 'X';
      print(xoList[index]);

      if(count>=5){
        if(checkWin("X")){
          xoList=[
            '', '', '',
            '', '', '',
            '', '', '',
          ];
          Score1+=5;
          setState(() {
            showDialog(context: context, builder:(context){return AlertDialog(titleTextStyle: TextStyle(color: Colors.white,fontSize: 15,),
              contentTextStyle: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w500), backgroundColor: Color(0xff95A7D6),
              title:Text("winner winner chicken dinner!"),content: Text("$fstPlayer Won! "),actions: [MaterialButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Ok",style: TextStyle(color: Colors.white),),)],);
            } );
          });
          count=0;
        }
      }

    } else {
      xoList[index] = 'O';
      print(xoList[index]);
      if(count>=5){
        if(checkWin("O")){
          xoList=[
            '', '', '',
            '', '', '',
            '', '', '',
          ];
          Score2+=5;
          setState(() {
            showDialog(context: context, builder:(context){return AlertDialog( backgroundColor: Color(0xff95A7D6), titleTextStyle: TextStyle(color: Colors.white,fontSize: 15,),
              contentTextStyle: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w500),
              title:Text("winner winner chicken dinner!"),content: Text("$scdPlayer Won !"),actions: [MaterialButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Ok",style:  TextStyle(color: Colors.white),),)],);
            } );
          });
          count=0;
        }
      }
    }

    if(count == 9){
      print(count);
      xoList=[
        '', '', '',
        '', '', '',
        '', '', '',
      ];
      setState(() {
        showDialog(context: context, builder:(context){return AlertDialog(titleTextStyle: TextStyle(color: Colors.white,fontSize: 15,),
          contentTextStyle: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w500), backgroundColor: Color(0xff95A7D6),
          title:Text("stalement"),content: Text("Play again?"),actions: [MaterialButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Ok",style: TextStyle(color: Colors.white),),)],);
        } );
      });
      count=0;
    }

    setState(() {
      print(count);

    });
    count ++;
    print(count);
    print(xoList.length);
  }

  bool checkWin(String symbol){

    for(int i=0; i<=6; i+=3){
      if(symbol==xoList[i] && symbol==xoList[i+1] && symbol==xoList[i+2]){
        return true;
      }
    }
    for(int i=0; i<3; i++){
      if(symbol==xoList[i] && symbol==xoList[i+3] && symbol==xoList[i+6]){
        return true;
      }
    }
    if(symbol==xoList[0] && symbol==xoList[4] && symbol == xoList[8]){
      return true;
    }
    if(symbol==xoList[2] && symbol==xoList[4] && symbol==xoList[6]){
      return true;
    }
    return false;
  }

}