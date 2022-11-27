//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cities extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'List Of Cities',
      debugShowCheckedModeBanner: false,
      home: _cities(),
    );
  }

}

class _cities extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _Cities();
}

class _Cities extends State<_cities>
{

  @override
  Widget build(BuildContext context)
  {
    List<String> City = [
      'Rajkot','Ahmedabad','Surat','Baroda','Gandhinagar','Bharuch','Junagadh'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("City List"),
      ),
      body:ListView.builder
      (
        itemCount: City.length,
        itemBuilder:(context, index) {
          return Card(
            child: ListTile(
              title: Text(City[index]),
              leading: SizedBox(
                width: 50,
                height: 50,
              ),
              onTap: ()
              {
                ShowAlertDialog(City[index]);
              },
            ),
          );
        },
      ),
    );
  }

void ShowAlertDialog(String city) {
  Widget Button1 = TextButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    child: Text("Yes"),
  );

  Widget Button2 = TextButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    child: Text("NO"),
  );

  AlertDialog Box = AlertDialog(
    title: Text('$city'),
    content: Text("Are You Sure ???"),
    actions: [
      Button1,
      Button2
    ],
  );

  showDialog
    (
      context: context,
      builder: (BuildContext city) {
        return Box;
      }
  );
  }
}