//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RadioColor extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "Radio_color",
      debugShowCheckedModeBanner: false,
      home: Radiocolor(),
    );
  }
}

class Radiocolor extends StatefulWidget
{
  @override
  State<Radiocolor> createState() => _RadiocolorState();
}

class _RadiocolorState extends State<Radiocolor>
{
  var colour;
  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Color"),
      ),
      body: Container(
        color: colour,
        child: Column(
          children: [
            ListTile(
              title: Text("red"),
              leading: Radio(
                value: 1,
                onChanged: (vlaue)
                {
                  setState(() {
                    colour = Colors.red;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Green"),
              leading: Radio(
                value: 2,
                onChanged: (value)
                {
                  setState(() {
                    colour = Colors.green;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Grey"),
              leading: Radio(
                value: 3,
                onChanged: (value)
                {
                  setState(() {
                    colour = Colors.grey;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}