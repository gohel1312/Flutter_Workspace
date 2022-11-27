import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialog2 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "AlertDialogBox",
      debugShowCheckedModeBanner: false,
      home: AlertDialogBoxes(),
    );
  }
}

class AlertDialogBoxes extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Alert Dialog Box'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: ()
          {
            ShowDialog(context);
          },
          child: Text(
              "Alert"
          ),
        ),
      ),
    );
  }


  void ShowDialog(BuildContext context) {
    Widget Button1 = TextButton
      (
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Hello()));
        },
        child: Text("Yes")
    );

    Widget Button2 = TextButton
      (
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("No")
    );

    Widget Button3 = TextButton
      (
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("Cancel")
    );

    AlertDialog box = AlertDialog
      (
      title: Text("Are You Sure To delete this File"),
      content: Text("This file will help you in future"),
      actions: [
        Button1,
        Button2,
        Button3
      ],
    );

    showDialog
      (
        context: context,
        builder: (BuildContext context) {
          return box;
        }
    );
  }
}

class Hello extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
