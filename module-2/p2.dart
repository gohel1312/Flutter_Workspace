// //@dart=2.9
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class NumberSerices extends StatelessWidget
// {
//   @override
//   Widget build(BuildContext context)
//   {
//     return MaterialApp(
//       title: "Number Serices",
//       themeMode: ThemeMode.dark,
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }
//
//
// class HomePage extends StatefulWidget
// {
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   TextEditingController a_controller = new TextEditingController();
//
//   TextEditingController b_controller = new TextEditingController();
//
//
//   @override
//   Widget build(BuildContext context)
//   {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Enter Number"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           children: <Widget>[
//             TextFormField(
//               controller: a_controller,
//               decoration: InputDecoration(labelText: "First Number",border: OutlineInputBorder(),),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 10),
//             TextFormField(
//               controller: b_controller,
//               decoration: InputDecoration(labelText: "Second Number",border: OutlineInputBorder(),),
//               keyboardType: TextInputType.number,
//             ),
//             ElevatedButton(onPressed: ()
//             {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context)=>ShowData(number1: int.parse(a_controller.text),number2: int.parse(b_controller.text),),
//                   ),
//               );
//             },
//                 child: Text("Show"))
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ShowData extends StatefulWidget
// {
//
//   var number1,number2;
//   ShowData({this.number1,this.number2});
//
//   @override
//   State<ShowData> createState() => _ShowDataState(number1, number2);
// }
//
// class _ShowDataState extends State<ShowData> {
//   _ShowDataState(this.ans1,this.ans2);
//   var ans1;
//   var ans2;
//   var key_1;
//   var num1,num2;
//   // var ready=answer();
//
//     @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("number serices"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Text("this is ans:${[ans1+ans2]}"),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DMAS extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "DMAS",
      debugShowCheckedModeBanner: false,
      home: DMAS1(),
    );
  }

}

class DMAS1 extends StatefulWidget
{
  @override
  State<DMAS1> createState() => _DMAS1State();
}

class _DMAS1State extends State<DMAS1>
{
  var ans;
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("DMAS"),
      ),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "number 1"),
              keyboardType: TextInputType.number,
              controller: num1,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "number 2"),
              keyboardType: TextInputType.number,
              controller: num2,
            ),
            ListTile(
              title: Text("Division...%"),
              leading: Radio(
                value: 1,
                groupValue: ans,
                onChanged: (value)
                {
                  setState(() {
                    var n1 = int.parse(num1.text);
                    var n2 = int.parse(num2.text);
                    ans = n1 / n2 ;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Multiplication...*"),
              leading: Radio(
                value: 2,
                groupValue: ans,
                onChanged: (value)
                {
                  setState(() {
                    var n1 = int.parse(num1.text);
                    var n2 = int.parse(num2.text);
                    ans = n1 * n2 ;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Adition...+"),
              leading: Radio(
                value: 3,
                groupValue: ans,
                onChanged: (value)
                {
                  setState(() {
                    var n1 = int.parse(num1.text);
                    var n2 = int.parse(num2.text);
                    ans = n1 + n2 ;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Substraction...-"),
              leading: Radio(
                value: 4,
                groupValue: ans,
                onChanged: (value)
                {
                  setState(() {
                    var n1 = int.parse(num1.text);
                    var n2 = int.parse(num2.text);
                    ans = n1 - n2 ;
                  });
                },
              ),
            ),
            Text("Ans is : $ans"),
          ],
        ),
      ),
    );
  }
}