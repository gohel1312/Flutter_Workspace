//@dart=2.9

import 'package:flutter/material.dart';

import '../SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title:"SQlFLITE DATABASE",
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}

