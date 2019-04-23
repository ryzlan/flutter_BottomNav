import 'package:flutter/material.dart';



class PageOne extends StatelessWidget{
  Widget build(BuildContext context){
    return Container(
      child: Center(
        child: Text("Page One" ,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 40.0
          )
                          ),
      ),
    );
  }
}