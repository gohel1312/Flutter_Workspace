//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget
{
  var controller;
  String labelText;
  bool obscureText;
  String message;
  MyTextField(this.controller,this.labelText,this.obscureText,this.message);


  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
        obscureText: obscureText,
        validator: (value){
          if(value.isEmpty)
            {
              return message;
            }
        },
      ),
    );
  }
}