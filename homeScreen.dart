//@dart=2.9
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../UserSideScreen/UserLogin.dart';
import '../constant/constancs.dart';
import '../imagefile.dart';
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
          "Accept": "application/json"
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
        body: SafeArea(
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image:DecorationImage(
                            image:NetworkImage("https://goheldivya.000webhostapp.com/images/t.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image:DecorationImage(
                            image:NetworkImage("https://goheldivya.000webhostapp.com/images/t.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image:DecorationImage(
                            image:NetworkImage("https://goheldivya.000webhostapp.com/images/t.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image:DecorationImage(
                            image:NetworkImage("https://goheldivya.000webhostapp.com/images/t.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                    options:CarouselOptions(
                      height: 300,
                      autoPlay: true,
                      autoPlayCurve: Curves.decelerate,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      autoPlayInterval: Duration(seconds: 5),
                      pauseAutoPlayOnTouch: true,
                      autoPlayAnimationDuration: Duration(seconds: 5),
                    ),),
                GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data == null ? 0 : data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: ((context, index)
                  {
                    return Card(
                      shape: OutlineInputBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
                      borderOnForeground: true,
                      color: Colors.white,
                      elevation: 20,
                      margin: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.adb),
                          Text(data[index]["name"]),
                        ],
                      ),
                    );
                  }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}