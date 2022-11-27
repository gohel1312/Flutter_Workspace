//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reverse extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title:"Reverse Number",
      debugShowCheckedModeBanner: false,
      home: ReverseNumber(),
    );
  }
}

class ReverseNumber extends StatefulWidget
{
  @override
  State<ReverseNumber> createState() => _ReverseNumberState();
}

int number,reverse=0,reminder;
class _ReverseNumberState extends State<ReverseNumber> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
          title:Text("Reverse A number")
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(hintText: "Enter number"),
              keyboardType: TextInputType.number,
              onFieldSubmitted: (value){},
              validator: (value){
                if(value!=null)
                  {
                    number = value as int ;
                  }
                else
                  {
                    return "enter number";
                  }
                // while(number!=0)
                // {
                //   reminder = number % 10 ;
                //   reverse = reverse * 10 + reminder ;
                //   number = number + 10 ;
                //   Text("Reverse Number is = $reverse");
                // }
              },
              //onTap:(){Text("Reverse Number is = $reverse");}
            ),
            // Text("Reverse Number is = $reverse"),
          ],
        ),
      ),
    );
  }
}