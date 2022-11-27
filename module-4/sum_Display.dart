//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TwoNumber extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "Display Sum",
      debugShowCheckedModeBanner: false,
      home: Secondpage(),
    );
  }
}

class Secondpage extends StatefulWidget
{
  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage>
{
  TextEditingController fnumber = TextEditingController();
  TextEditingController snumber = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sum"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "First Number",border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
              keyboardType: TextInputType.number,
              onFieldSubmitted: (value){},
              controller: fnumber,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Second Number",border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
              keyboardType: TextInputType.number,
              onFieldSubmitted: (value){},
              controller: snumber,
            ),
            ElevatedButton
            (
              onPressed: ()
                {
                  var n1 = int.parse(fnumber.text);
                  var n2 = int.parse(snumber.text);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ShowSum(n1,n2)));
                },
              child: Text("Sum")
            )
          ],
        ),
      ),
    );
  }
}

class ShowSum extends StatefulWidget
{
  int n1,n2;
  ShowSum(this.n1, this.n2);

  @override
  State<ShowSum> createState() => _ShowSumState(n1,n2);
}

class _ShowSumState extends State<ShowSum>
{
  int no1,no2;
  _ShowSumState(this.no1,this.no2);

  @override
  Widget build(BuildContext context)
   {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sum"),
      ),
      body: Center(
        child: Text("Sum of Those two number is ${[no1+no2]}"),
      ),
    );
  }
}
