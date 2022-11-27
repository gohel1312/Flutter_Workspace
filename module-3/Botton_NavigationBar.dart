//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottonNavigationBar extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "Bottom Navigation Bar",
      home: Navigation(),
    );
  }
}

class Navigation extends StatefulWidget
{
  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation>
{
  int SetStateIndex = 0 ;
  List WidgetOption =
  [
    // ListTile(
    //   leading: Image(
    //     width: 200,
    //     height: 300,
    //     image: AssetImage("images/divya.jpg"),
    //   ),
    // ),
    // ListTile(
    //   leading: Image(
    //     width: 200,
    //     height: 300,
    //     image: AssetImage("images/divya.jpg"),
    //   ),
    //   title: Text("Audio"),
    // ),
    // ListTile(
    //   leading: Image(
    //     width: 200,
    //     height: 300,
    //     image: AssetImage("images/divya.jpg"),
    //   ),
    //   title: Text("Video"),
    // ),
    Image(image: AssetImage("images/divya.jpg")),
    Image(image: AssetImage("images/divya.jpg")),
    Image(image: AssetImage("images/divya.jpg")),
  ];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Bar"),
      ),
      body: Center(
        child: WidgetOption.elementAt(SetStateIndex),
      ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem
            (
              icon: Icon(Icons.browse_gallery),
              label: "Gallery",
              backgroundColor: Colors.blue
            ),
            BottomNavigationBarItem
              (
                icon: Icon(Icons.audio_file),
                label: "Audio"
            ),
            BottomNavigationBarItem
              (
                icon: Icon(Icons.video_camera_back),
                label: "Video"
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: SetStateIndex,
          selectedItemColor: Colors.greenAccent,
          iconSize: 40,
          onTap: _onItemTapped,
        ),
    );
  }

  void _onItemTapped(int value)
  {
    setState(() {
      SetStateIndex = value ;
    });
  }
}
