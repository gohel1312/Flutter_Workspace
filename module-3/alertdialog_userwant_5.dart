//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserWantToBack extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "Use WillPopScore",
      debugShowCheckedModeBanner: false,
      home: BackSide(),
    );
  }
}

class BackSide extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return WillPopScope
    (
      onWillPop: ()=>_BackSide(context),
      child:Scaffold(
        appBar: AppBar(
          title: Text("Use WillPopScope"),
        ),
        body: Center(
          child: Text(
            "Simon Go Back",
            style: TextStyle(
              color: Colors.blueGrey,
              backgroundColor: Colors.yellow,
              shadows: <Shadow>[
                Shadow(
                  color: Colors.blueGrey
                )
              ]
            ),
          ),
        )
      ),
    );
  }

  _BackSide(BuildContext context) async
  {
    await showDialog
    (
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog
          (
            title: Text("Are You Sure To Exit ?"),
            content: Text("You Will ThrowOut within Home."),
            actions: [
              TextButton
              (
                onPressed: (){
                  SystemNavigator.pop();
                },
                child: Text("Yes")
              ),
              TextButton
              (
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("No")
              ),
            ],
          );
        }
    );
  }
}