//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagesArround extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: ImagesText(),
    );
  }
}

class ImagesText extends StatefulWidget
{
  @override
  State<ImagesText> createState() => _ImagesTextState();
}

class _ImagesTextState extends State<ImagesText> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Images And Text"),
      ),
      body: Column(
        children: <Widget>[
          Image(image: AssetImage("asset/login1.jpg")),
          Row(
            children: [
              Image(image: AssetImage("asset/login1.jpg")),
              Text("Hello How Are You?"),
              Image(image: AssetImage("asset/login1.jpg")),
            ],
          ),
          Image(image: AssetImage("asset/login1.jpg")),
        ],
      ),
    );
  }
}