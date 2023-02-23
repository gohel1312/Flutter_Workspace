//@dart=2.9
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:myproject/GrideViewCards/SocietyWings.dart';

class Inquiry extends StatefulWidget
{
  @override
  State<Inquiry> createState() => _InquaryState();
}

class _InquaryState extends State<Inquiry>
{
  TextEditingController name = TextEditingController();
  TextEditingController flat = TextEditingController();
  TextEditingController inquiry = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Help"),
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.teal, Colors.indigo.shade500]
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("For Internal Inquiry",style: TextStyle(color: Colors.white,fontSize: 30,),),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 500,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              hintText: "Flat Owner Name",
                            ),
                            keyboardType: TextInputType.text,
                            controller: name,
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              hintText: "Flat Number"
                            ),
                            keyboardType: TextInputType.text,
                            controller: flat,
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            maxLines: 5,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                hintText: "Inquiry Section",
                            ),
                            keyboardType: TextInputType.text,
                            controller: inquiry,
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black
                            ),
                              child: TextButton(
                                onPressed: (){
                                  if(name.text.isEmpty)
                                    {
                                      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter Name")));
                                    }
                                  else if(flat.text.isEmpty)
                                    {
                                      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter Flat number")));
                                    }
                                  else if(inquiry.text.isEmpty)
                                    {
                                      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter Your Complain")));
                                    }
                                  else
                                    {
                                      additems(name.text, flat.text,inquiry.text);
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SocietyWings()));
                                    }
                                },
                                child: Text("Submit",style: TextStyle(color: Colors.white),)))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


void additems(String name, String price,String complain) async
{
  Map Data ={
    "I_name" : name,
    "I_flatno" : price,
    "Inquiry" : complain
  };
  debugPrint(name);
  debugPrint(price);

  await http.post(Uri.parse("https://goheldivya.000webhostapp.com/api/Inquiry.php"),
      headers: {
        "Accept":"application/json",
        "content-Type":"application/x-www-form-urlencoded"
      },
      body: Data,
      encoding: Encoding.getByName("utf-8")
  );
}