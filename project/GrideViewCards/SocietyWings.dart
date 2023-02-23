//@dart=2.9
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SocietyWings extends StatefulWidget {
  String i;
  SocietyWings({this.i});
  @override
  State<SocietyWings> createState() => _WingsState();
}

class _WingsState extends State<SocietyWings>
{
  List WingsData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWingData();
  }
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Members Of Wing "+ widget.i.toString()),
        ),
        body: ListView.builder(
          itemCount: WingsData==null ? 0 : WingsData.length,
          itemBuilder: (BuildContext context,int index){
            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black,style: BorderStyle.solid)),
              child: ListTile(
                leading: ClipOval(child: Image.network(WingsData[index]["img"])),
                title: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(WingsData[index]["name"]),
                    Text(WingsData[index]["number"]),
                    Text(WingsData[index]["email"])
                  ],
                ),
                trailing: Column(
                  children: [
                    Text(WingsData[index]["flatno"]),
                    Text(WingsData[index]["mem"]+ " Membsers")
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  Future getWingData() async
  {
    final result = await http.get(Uri.parse("https://goheldivya.000webhostapp.com/api/memberView.php"),
      headers: {
      "Accept":"application/json"
      }
    );
    setState(() {
      WingsData = json.decode(result.body);
    });
  }
}
