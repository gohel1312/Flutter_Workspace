//@dart=2.9
import 'package:flutter/material.dart';

class Functions extends StatefulWidget {
  @override
  State<Functions> createState() => _FunctionsState();
}

class _FunctionsState extends State<Functions>
{
  List Events = ["Diwali","Holi","Makarshankranti","New Year"];
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Events"),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: ListView.builder(
          itemCount: Events.length,
          itemBuilder:(BuildContext context,int index)
          {
            return InkWell(
              child: Card(
                color: Colors.teal.shade200,
                margin: EdgeInsets.all(20),
                child: ListTile(
                  title: Text(Events[index]),
                ),
              ),
            );
          }),
      ),
    );
  }
}
