//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "Navigation Drawer",
      debugShowCheckedModeBanner: false,
      home:DrawerNavigation(),
    );
  }
}

class DrawerNavigation extends StatefulWidget
{
  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Drawer"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader
              (
              accountName: Text("Gohel Divya"),
              accountEmail: Text("goheldivya100@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.indigo,
                child: Text("GD",style: TextStyle(fontSize: 40),),
              ),
            ),
            ListTile(
              leading: Icon(Icons.browse_gallery),
              title: Text("Gallery"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.audiotrack),
              title: Text("Audio"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.video_camera_back),
              title: Text("Video"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}