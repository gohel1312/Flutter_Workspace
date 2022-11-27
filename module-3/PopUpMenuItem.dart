//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//enum Menu{Profile , logout}
class OptionMenuItem extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "Option Menu",
      debugShowCheckedModeBanner: false,
      home: Option(),
    );
  }
}

class Option extends StatelessWidget
{
  String Selected;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Option Menu"),
        actions: <Widget>[
          PopupMenuButton<int>(
            onSelected: (item) => onSelected(context, item),//option menu
            itemBuilder: (BuildContext context)=>
            [
              PopupMenuItem<int>(
                  child: Text("Profile"),
                value: 0,
              ),
              PopupMenuItem<int>(
                  child: Text("LogOut"),
                  value: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}

  onSelected(BuildContext context, int item)
  {

    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Profile()),
        );
        break;
      case 1:
       /* Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SharePage()),
        );*/
        break;

    }
  }
}

class Profile extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
    //Easy SideMenu
      body: Center(
        child: Text("Divya Gohel"),
          /*Container(
            padding: EdgeInsets.fromLTRB(50, 50, 50, 90),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/ic_launcher.png")
              ),
            ),
          ),*/
          //Text("Android and IOS App Developer")
      ),
    );
  }
}