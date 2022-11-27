import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogBox extends StatelessWidget
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
    ListTile(
      leading: Icon(Icons.battery_alert),
    );
  Widget Button1 = TextButton
    (
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text("ok")
  );

  AlertDialog box = AlertDialog
    (
    title: Text("Are You Sure To delete this File"),
    content: Text("This file will help you in future"),
    actions: [
      Button1
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
