//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproject/GrideViewCards/SocietyWings.dart';

class MembersOfSociety extends StatefulWidget
{
  @override
  State<MembersOfSociety> createState() => _MembersOfSocietyState();
}

class _MembersOfSocietyState extends State<MembersOfSociety>
{
  List<dynamic> WingName = ["A","B","C","D"];
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: Colors.transparent,
          title: Text("Members Of Society"),
        ),
        backgroundColor: Colors.grey.shade100,
        body: Container(
          margin: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: WingName.length,
            itemBuilder: (BuildContext context, int index)
              {
                return InkWell(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SocietyWings(i:WingName[index])));
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(child: Icon(Icons.home_work_sharp)),
                      title: Text("Wing "+ WingName[index]),
                    ),
                    color: Colors.teal.shade300,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}
