//@dart=2.9
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:myproject/GrideViewCards/SocietyWings.dart';

class ComplainBox extends StatefulWidget {
  @override
  State<ComplainBox> createState() => _ComplainBoxState();
}

class _ComplainBoxState extends State<ComplainBox>
{
  TextEditingController name = TextEditingController();
  TextEditingController flat = TextEditingController();
  TextEditingController complain = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Drop Complain"),
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Container(
              height:750,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.orange, Colors.indigo.shade500]
                ),
              ),
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("For any type of issue which is face by society members\n "
                        "they will put here it and this information is keep \n "
                        "Confidential no one can see this application accept Scatter and apllicationer"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        hintText: "Flat Owner Name",
                      ),
                      keyboardType: TextInputType.text,
                      controller: name,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          hintText: "Flat Number"
                      ),
                      keyboardType: TextInputType.text,
                      controller: flat,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                    child: TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        hintText: "Complain Section",
                      ),
                      keyboardType: TextInputType.text,
                      controller: complain,
                    ),
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
                            else if(complain.text.isEmpty)
                            {
                              return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter Your Inquiry")));
                            }
                            else{
                              addComplain(name.text,flat.text,complain.text);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SocietyWings()));
                            }
                          },
                          child: Text("Submit",style: TextStyle(color: Colors.white),))),
                      ],
                  ),
              ),
            ),
        ),
      ),
    );
  }

  void addComplain(String name, String flatno, String complain) async
  {
    Map Data ={
      "c_name" : name,
      "c_flatno" : flatno,
      "complain" : complain
    };
    await http.post(Uri.parse("https://goheldivya.000webhostapp.com/api/Complain.php"),
        headers: {
          "Accept":"application/json",
          "content-Type":"application/x-www-form-urlencoded"
        },
        body: Data,
        encoding: Encoding.getByName("utf-8")
    );
  }
}
