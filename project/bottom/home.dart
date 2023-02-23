//@dart=2.9
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myproject/GrideViewCards/ComplainBox.dart';
import 'package:myproject/GrideViewCards/EmergencyContacts.dart';
import 'package:myproject/GrideViewCards/Functions.dart';
import 'package:myproject/GrideViewCards/Inquary.dart';
import 'package:myproject/IndividualCards/Members.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  List CardPages=[MembersOfSociety(),Inquiry(),ComplainBox(),ComplainBox(),Functions(),EmergencyContact()];

  @override
  void initState()
  {
    super.initState();
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
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
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
              SizedBox(height: 10,),
              Column(
                children: [
                  Container(child: Align(
                    alignment: Alignment.topCenter,
                      child: Text("Community",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),))),
                  GridView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data == null ? 0 : data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: ((context, index)
                    {
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CardPages[index]));
                        },
                        child: Card(
                          shape: OutlineInputBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
                          borderOnForeground: true,
                          color: Colors.white,
                          elevation: 20,
                          margin: EdgeInsets.all(20),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width:50,height:50,child: ClipOval(child: Image.network(data[index]["images"]))),
                                SizedBox(height: 10,),
                                Text(data[index]["name"]),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
