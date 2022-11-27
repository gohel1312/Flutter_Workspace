//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Gmail extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "Gmail App",
      debugShowCheckedModeBanner: false,
      home: AppGmail(),
    );
  }
}

class AppGmail extends StatefulWidget
{
  @override
  State<AppGmail> createState() => _AppGmailState();
}

class _AppGmailState extends State<AppGmail>
{
  // List Custom = ["Divya","Kartik","Anmol","Shivam","Hamir","Akshay"];
  //
  // List url=["images/divya.jpg",
  //   "images/divya.jpg",
  //   "images/divya.jpg",
  //   "images/divya.jpg",
  //   "images/divya.jpg",
  //   "images/divya.jpg"];

  List<EmailDetail> Customer =[
    EmailDetail(id: '1',name: 'Divya',image: 'images/divya.jpg'),
    EmailDetail(id: '2',name: 'Kartik',image: 'images/divya.jpg'),
    EmailDetail(id: '3',name: 'Anmol',image: 'images/divya.jpg'),
    EmailDetail(id: '4',name: 'Shivam',image: 'images/divya.jpg'),
    EmailDetail(id: '5',name: 'Hamir',image: 'images/divya.jpg'),
    EmailDetail(id: '6',name: 'Akshay',image: 'images/divya.jpg'),
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gmail"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader
            (
              accountName: Text("XYZ ABC"),
              accountEmail: Text("ABC@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Image(image: AssetImage("images/divya.jpg"),),
              ),
            ),
            ListTile(
              leading: Icon(Icons.send),
              title: Text("Send"),
            ),
            ListTile(
              leading: Icon(Icons.drafts),
              title: Text("Draft"),
            ),
            ListTile(
              leading: Icon(Icons.send),
              title: Text("Send"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("LogOut"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Mail",
        child: Icon(Icons.mail),
      ),

      body: ListView.builder(
        itemCount: Customer.length,
        itemBuilder: (context , index)
          {
            return Card(
              child:ListTile(
                leading:SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(Customer[index].image),
                ),
                title:Text(Customer[index].name),
            ),
            );
          }
      ),
    );
  }
}

class EmailDetail
{
  String id,name,image;

  EmailDetail({this.id,this.name,this.image});
}