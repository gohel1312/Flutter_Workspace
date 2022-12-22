import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldSimple extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text Form Field"),
        ),
        body: Center(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Number"
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}