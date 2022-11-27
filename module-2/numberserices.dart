import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberSerices1 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "Number Serices",
      debugShowCheckedModeBanner:  false,
      home: Number(),
    );
  }
}

class Number extends StatefulWidget
{
  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number>
{
  List number = [];
  TextEditingController num1= TextEditingController();
  TextEditingController num2= TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number Serices"),
      ),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "number 1",icon: Icon(Icons.numbers)),
              keyboardType: TextInputType.number,
              controller: num1,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "number 1",icon: Icon(Icons.numbers)),
              keyboardType: TextInputType.number,
              controller: num2,
            ),
            ElevatedButton
            (
              onPressed: ()
                {
                  setState(() {
                    var n1 = int.parse(num1.text);
                    var n2 = int.parse(num2.text);

                    for(var i = n1 ; i <= n2 ; i++)
                    {
                      number.add(i);
                    }
                  });
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ShowNumber(number)));
                },
              child: Text("submit")
            )
          ],
        ),
      ),
    );
  }
}

class ShowNumber extends StatelessWidget
{
  List n = [];
  ShowNumber(this.n);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number"),
      ),
      body: Center(
        child: Text('$n')
      ),
    );
  }
}


