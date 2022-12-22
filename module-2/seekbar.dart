//@dart=2.9
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Seek_Bar extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Seekbar(),
    );
  }
}

class Seekbar extends StatefulWidget
{
  @override
  State<Seekbar> createState() => _SeekbarState();
}

class _SeekbarState extends State<Seekbar>
{
  double value = 0.0;
  double secondValue = 0.0;

  Timer progressTimer;
  Timer secondProgressTimer;

  bool done = false;

  @override
  void initState() {
    resumeProgressTimer();
    secondProgressTimer = Timer.periodic(Duration(milliseconds:10),(_) {
      setState(() {
        secondValue += 0.001;
        if(secondValue >=1)
          {
            secondProgressTimer.cancel();
          }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seek Bar"),
      ),
      body: Seekbar(

      ),
    );
  }

  void resumeProgressTimer()
  {
    progressTimer = Timer.periodic(Duration(milliseconds:10) ,(_){
      setState(() {
        value += 0.0005;
        if(value>=1)
          {
            progressTimer.cancel();
            done = true;
          }
      });
    });
  }
}