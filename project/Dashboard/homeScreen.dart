//@dart=2.9
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myproject/bottom/Maintenance.dart';
import 'package:myproject/bottom/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../bottom/home.dart';
import 'DrawerMenu.dart';

class DashBoad extends StatefulWidget
{
  @override
  State<DashBoad> createState() => _DashBoadState();
}

class _DashBoadState extends State<DashBoad>
{

  SharedPreferences logindata;
  String uemail;


  @override
  void initState()
  {
    super.initState();
    initial();
    getdata();
  }

  List data;

  Future getdata() async
  {
    final result = await http.get(
        Uri.parse("https://goheldivya.000webhostapp.com/api/view2.php"),
        headers: {
          "Accept" : "application/json"
        });
    setState(() {
      data = json.decode(result.body);
    });
  }
  void initial() async
  {
    logindata = await SharedPreferences.getInstance();
    setState((){
      uemail =logindata.getString('email');
    });
  }

  List<Widget> Pages =<Widget>[HomePage(),Maintenance(),ProfilePage()];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        backgroundColor: Colors.white60,
        appBar: AppBar(
          toolbarHeight: 50,
          brightness: Brightness.dark,
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                colors: [Colors.blueGrey,Colors.black]
              ),
            ),
          ),
          title: Text("Hello, $uemail",style: TextStyle(color: Colors.white),),
          leading: Builder(
            builder: (BuildContext context)
            {
              return IconButton(onPressed: (){
                Scaffold.of(context).openDrawer();
              }, icon: CircleAvatar(foregroundImage: AssetImage("asset/login1.jpg"),));
            },
          ),
        ),
        drawer: Sider(member: uemail),
        body: Center(
          child: Pages.elementAt(_selectedIndex)
        ),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: GNav(
              gap: 5,
              tabShadow: [BoxShadow(color: Colors.white)],
              color: Colors.black,
              activeColor: Colors.teal.shade500,
              tabBackgroundGradient: LinearGradient(colors: [Colors.white ,Colors.grey]),
              padding: EdgeInsets.all(15),
              tabs: [
                GButton(icon: Icons.home,text: "Home",),
                GButton(icon: Icons.receipt,text: "Maintenance",),
                GButton(icon: Icons.person,text: "Profile",)
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index){
                setState(() {
                  _selectedIndex = index ;
                });
                },
            ),
          ),
        ),
      ),
    );
  }
}