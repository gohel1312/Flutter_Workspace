//@dart=2.9
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:module_6/one/Registration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Employee_login_Regis extends StatefulWidget {
  @override
  State<Employee_login_Regis> createState() => _Employee_login_RegisState();
}

class _Employee_login_RegisState extends State<Employee_login_Regis>
{
  final FormKey = GlobalKey<FormState>();
  bool Passvisibility = false;
  SharedPreferences logindata;
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool newuser;


  Future login() async
  {

    final result = FormKey.currentState.validate();
    if(!result)
    {
      return ;
    }
    FormKey.currentState.save();

    var url = "https://goheldivya.000webhostapp.com/api/login.php";
    var response = await http.post(Uri.parse(url), body: {
      "member_email" : user.text,
      "member_pass": pass.text,
    });
    var data = json.decode(response.body);

    if(data==0)
    {
      print("fail2");
    }
    else
    {
      String username = user.text;
      String password = pass.text;

      if (username != '' && password != '')
      {
        print("success2");
        logindata.setBool('login', false);
        logindata.setString('email', username);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashBoad(),),);
      }
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async
  {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    if (newuser == false)
    {
      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => DashBoad()));
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: FormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("asset/login1.jpg")),
              SizedBox(height: 10,),
              Center(
                child: Shimmer.fromColors(
                    baseColor: Colors.blue,
                    highlightColor: Colors.red,
                    child: Text("Your Own Home",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(labelText: "Email",prefixIcon: Icon(Icons.email),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                controller: user,
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value){},
                validator: (value) {
                  if (value.isEmpty ||
                      !RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText:Passvisibility,
                decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(Passvisibility ? Icons.visibility : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,),
                      onPressed: (){
                        setState(() {
                          Passvisibility = !Passvisibility;
                        });
                      },),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                controller: pass,
                onFieldSubmitted: (value) {},
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter a valid password!';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      login();
                    },
                    child: Text("Login"),style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),),
                  ElevatedButton(
                    onPressed: ()
                    {
                    },
                    child: Text("Reset"),style: ElevatedButton.styleFrom(backgroundColor: Colors.red),)
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton
                  (
                    onPressed: () {},
                    child: Text("Forgot Password")
                ),
              ),
              SizedBox(height: 10,),
              RichText(
                text: TextSpan(
                  text: "If You Haven't Any Account ? ",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'SignUP ',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserSignUp())),
                        style: TextStyle(
                          color: Colors.blue,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DashBoad extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
      ),
    );
  }
}
