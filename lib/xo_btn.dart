
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class XOBtn extends StatelessWidget {
  Function OnBtnClicked;
  var BtnIndex;
  var symbol;

  XOBtn({required this.symbol, required this.BtnIndex,required this.OnBtnClicked});

  @override
  Widget build(BuildContext context) {
    return Container(height: double.infinity,
        margin: EdgeInsets.all(5),
        child: ElevatedButton(onPressed: () {
          OnBtnClicked(BtnIndex);
        }, child: Text("$symbol" ,style: TextStyle(fontSize: 39,fontWeight: FontWeight.bold),),
        style: ElevatedButton.styleFrom( primary: Color(0xff232C46)),));
  }
}