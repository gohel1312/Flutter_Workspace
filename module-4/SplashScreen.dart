//@dart=2.9
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "SplashScreen",
      debugShowCheckedModeBanner: false,
      home: SplashScreen1(),
    );
  }
}

class SplashScreen1 extends StatefulWidget
{
  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState()
  {
    super.initState();
    Timer(Duration (seconds:5)
        ,()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())));
  }

  @override
  Widget build(BuildContext context)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.network(
            "https://goheldivya.000webhostapp.com/images/login.jpg",
            height: 200.0,
            repeat: true,
            reverse: true,
            animate: true
        )
      ],
    );
  }
}

class HomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    Center(
      child: Text("Hello>>>How Are You>>>"),
    );
  }
}