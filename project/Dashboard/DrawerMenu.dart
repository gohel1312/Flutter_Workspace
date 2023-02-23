//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../DrawerFiles/AboutUs.dart';
import '../DrawerFiles/ContactUs.dart';
import '../UserSideScreen/UserLogin.dart';
import '../constant/TextTileForDrawer.dart';
import 'homeScreen.dart';

class Sider extends StatefulWidget
{
  String member;

  Sider({this.member});
  @override
  _DrawerState createState() => _DrawerState();
}


class _DrawerState extends State<Sider>
{

  SharedPreferences logindata;
  String uemail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async
  {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      uemail =logindata.getString('email');
    });
  }
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // SizedBox(height: 100,child: Container(color: Colors.blue),),
            UserAccountsDrawerHeader(
              accountName: Text(""),
              accountEmail: Text("$uemail"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network('https://i.pinimg.com/originals/e0/21/cc/e021cccd68247bc9a6b64ac53c07d7a4.jpg',fit: BoxFit.cover,
                    width: 300,
                    height: 300
                    ,),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoad()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
              onTap: ()
              {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("AboutUs"),
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs()));
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts_rounded),
              title: Text("ContactUs"),
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Contact()));
              },
            ),
            Divider(thickness: 3,),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("LogOut"),
              onTap: ()
              {
                logout();
              },
            ),
          ],
        ),
      ),
    );
  }
  void logout() async
  {
    Widget actionButton = TextButton(
      onPressed: ()
      {
        logindata.setBool('login', true);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserLogin()));
      },
      child: Text("Yes,Logout"),
    );
    Widget actionButton1 = TextButton(
        onPressed: ()
        {
          Navigator.of(context).pop();
        },
        child: Text("Cancle")
    );
    AlertDialog dialog = AlertDialog(
      title: Text("Are you Sure want To Exit ?"),     // Alert Dialog Box Title
      content: Text("After this You Will Log Out"),
      actions: [actionButton,actionButton1],
    );
    
    showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return dialog;
        }
    );
  }
}