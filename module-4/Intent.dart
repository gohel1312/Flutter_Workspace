//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Intent1 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "Intent Example",
      debugShowCheckedModeBanner: false,
      home: IntentEx(),
    );
  }
}

class IntentEx extends StatelessWidget
{
  var url;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Intent Example"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton.icon
            (
              onPressed: () async
                {
                  url = Uri.parse("tel:8160419222");
                  launch(url);
                },
              icon: Icon(Icons.call),
              label: Text("call")
            ),
            ElevatedButton.icon
              (
                onPressed: () async
                {
                  url = Uri.parse("msg:8160419222");
                  launch(url);
                },
                icon: Icon(Icons.message),
                label: Text("message")
            ),
            ElevatedButton.icon
              (
                onPressed: () async
                {
                  url = Uri.parse("share:8160419222");
                  launch(url);
                },
                icon: Icon(Icons.share),
                label: Text("share")
            ),
            ElevatedButton.icon
              (
                onPressed: () async
                {
                  url = Uri.parse("email:goheldivya100@gmail.com");
                  launch(url);
                },
                icon: Icon(Icons.email),
                label: Text("email")
            ),
          ],
        ),
      ),
    );
  }
}