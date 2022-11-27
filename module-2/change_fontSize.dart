//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FontSize extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "Change FontSize",
      debugShowCheckedModeBanner: false,
      home: Font_size(),
    );
  }
}

class Font_size extends StatefulWidget
{
  @override
  State<Font_size> createState() => _Font_sizeState();
}

class _Font_sizeState extends State<Font_size> {
  var font = 20.0;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Font Size"),
      ),
      body:Container(
        child: Center(
          child: Column(
            children: [
              ElevatedButton
              (
                onPressed: ()
                {
                  setState(() {
                    font = font + 1.0;
                  });
                },
                child: Text("+")
              ),
              ElevatedButton
                (
                  onPressed: ()
                  {
                    setState(() {
                      font = font  + 1.0;
                    });
                  },
                  child: Text("-")
              ),
              Text("Hello",style: TextStyle(fontSize: font),)
            ],
          ),
        ),
      )
    );
  }
}
