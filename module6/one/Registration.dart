//@dart=2.9
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:module_6/const/TextField.dart';

class UserSignUp extends StatefulWidget
{
  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp>
{

  String Mname;
  String Memail;
  String Mpass;

  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Confpass = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Adminpass = TextEditingController();
  TextEditingController Flatnumber = TextEditingController();
  TextEditingController SocietyName = TextEditingController();

  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  var regpass = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}");
  //Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character:

  var regphone = RegExp(r"^\(\d{3}\)\s\d{3}-\d{4}");

  final Formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Registration"),
        ),
        body: Container(
          child: Form(
            key: Formkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // TextFormField(
                  //   controller: Name,
                  //   keyboardType: TextInputType.text,
                  //   decoration: InputDecoration(
                  //     labelText: "Full Name",
                  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  //   ),
                  //   onFieldSubmitted: (value){},
                  //   validator: (value)
                  //   {
                  //     if(value.isEmpty)
                  //       {
                  //         return "Please enter full Name";
                  //       }
                  //   },
                  // ),
                  // SizedBox(height: 10,),
                  // TextFormField(
                  //   controller: Email,
                  //   keyboardType: TextInputType.emailAddress,
                  //   decoration: InputDecoration(
                  //     labelText: "Email Address",
                  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  //   ),
                  //   onFieldSubmitted: (value){},
                  //   validator: (value)
                  //   {
                  //     if(value.isEmpty)
                  //       {
                  //         return "Please Enter Email";
                  //       }
                  //   },
                  // ),
                  // SizedBox(height: 10,),
                  // TextFormField(
                  //   controller: Password,
                  //   keyboardType: TextInputType.text,
                  //   decoration: InputDecoration(
                  //     labelText: "Password",
                  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  //   ),
                  //   onFieldSubmitted: (value){},
                  //   validator: (value)
                  //   {
                  //     if(value.isEmpty)
                  //       {
                  //         return "Please enter Password";
                  //       }
                  //   },
                  // ),
                  // SizedBox(height: 10,),
                  // TextFormField(
                  //   controller: Confpass,
                  //   keyboardType: TextInputType.text,
                  //   decoration: InputDecoration(
                  //     labelText: "Conform Password",
                  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  //   ),
                  //   onFieldSubmitted: (value){},
                  //   validator: (value)
                  //   {
                  //     if(value.isEmpty || value!=Password.text)
                  //     {
                  //       return "Please enter Conform Password";
                  //     }
                  //   },
                  // ),
                  // SizedBox(height: 10,),
                  // TextFormField(
                  //   controller: Phone,
                  //   keyboardType: TextInputType.phone,
                  //   decoration: InputDecoration(
                  //     labelText: "Phone Number",
                  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  //   ),
                  //   onFieldSubmitted: (value){},
                  //   validator: (value)
                  //   {
                  //     if(value.isEmpty)
                  //     {
                  //       return "Please enter Phone Number";
                  //     }
                  //   },
                  // ),
                  // SizedBox(height: 10,),
                  // TextFormField(
                  //   controller: Adminpass,
                  //   keyboardType: TextInputType.text,
                  //   decoration: InputDecoration(
                  //     labelText: "Admin Password",
                  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  //   ),
                  //   onFieldSubmitted: (value){},
                  //   validator: (value)
                  //   {
                  //     if(value.isEmpty)
                  //     {
                  //       return "Please enter AdminPassword";
                  //     }
                  //   },
                  // ),
                  // SizedBox(height: 10,),
                  // TextFormField(
                  //   controller: Flatnumber,
                  //   keyboardType: TextInputType.number,
                  //   decoration: InputDecoration(
                  //     labelText: "Flat Number",
                  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  //   ),
                  //   onFieldSubmitted: (value){},
                  //   validator: (value)
                  //   {
                  //     if(value.isEmpty)
                  //     {
                  //       return "Please enter Flatnumber";
                  //     }
                  //   },
                  // ),
                  // SizedBox(height: 10,),
                  // TextFormField(
                  //   controller: SocietyName,
                  //   keyboardType: TextInputType.text,
                  //   decoration: InputDecoration(
                  //     labelText: "Society Name",
                  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  //   ),
                  //   onFieldSubmitted: (value){},
                  //   validator: (value)
                  //   {
                  //     if(value.isEmpty)
                  //     {
                  //       return "Please enter SocietyName";
                  //     }
                  //   },
                  // ),
                  MyTextField(Name, "full Name", false,"Please Enter Name"),
                  SizedBox(height: 10,),
                  MyTextField(Email, "Email Address", false,"Please Enter Name"),
                  SizedBox(height: 10,),
                  MyTextField(Password, "Password", true,"Please Enter Name"),
                  SizedBox(height: 10,),
                  MyTextField(Confpass, "Conform Password", true,"Please Enter Name"),
                  SizedBox(height: 10,),
                  MyTextField(Phone, "Phone Number", false,"Please Enter Name"),
                  SizedBox(height: 10,),
                  MyTextField(Adminpass, "Admin Password", false,"Please Enter Name"),
                  SizedBox(height: 10,),
                  MyTextField(Flatnumber, "Flat Number", false,"Please Enter Name"),
                  SizedBox(height: 10,),
                  MyTextField(SocietyName, "Society Name", false,"Please Enter Name"),
                  SizedBox(height: 10,),


                  // InkWell(
                  //   onTap: ()
                  //   {
                  //     if(Name.text.isEmpty)
                  //     {
                  //       return "Please Enter Name";
                  //     }
                  //     else if(Email.text.isEmpty)
                  //     {
                  //       return "Please Enter Email";
                  //     }
                  //     else if(!reg.hasMatch(Email.text))
                  //     {
                  //       return "Please Enter Valid Email Address";
                  //     }
                  //     else if(Password.text.isEmpty)
                  //     {
                  //       return "Please Enter Password";
                  //     }
                  //     else if(!regpass.hasMatch(Password.text))
                  //     {
                  //       return "Minimum eight characters, at least one uppercase letter, one lowercase letter,"
                  //           " one number and one special character";
                  //     }
                  //     else if(Confpass.text.isEmpty)
                  //     {
                  //       return "Please Enter Conform Password";
                  //     }
                  //     else if(Confpass.text != Password.text)
                  //     {
                  //       return "Please Enter Same Password As You Enter In Password";
                  //     }
                  //     else if(Phone.text.isEmpty)
                  //     {
                  //       return "Please Enter Phone Number";
                  //     }
                  //     else if(!regphone.hasMatch(Phone.text))
                  //     {
                  //       return "Please Enter Valid phone Number";
                  //     }
                  //     else if(Adminpass.text.isEmpty)
                  //     {
                  //       return "Please Enter Admin Password";
                  //     }
                  //     else if(Flatnumber.text.isEmpty)
                  //     {
                  //       return "Please Enter Flat Number";
                  //     }
                  //     else if(SocietyName.text.isEmpty)
                  //     {
                  //       return "Please Enter Society Name";
                  //     }
                  //   },
                  // ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: ()
                          {
                            final result = Formkey.currentState.validate();
                            if(!result)
                            {
                              return ;
                            }
                            registration(Name.text,Email.text,Password.text,Confpass.text,Phone.text,Adminpass.text,Flatnumber.text,SocietyName.text);
                          },
                          child: Text("Registration")
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void registration(_Name,_Email,_Password,_confpass,_phone,_adminpass,_flatno,_societyname) async
  {

    Map Data =
    {
      "member_name" : _Name,
      "member_email" : _Email,
      "member_pass" : _Password,
      "member_confpass" : _confpass,
      "member_number" : _phone,
      "adminpass" : _adminpass,
      "flatnumber" : _flatno,
      "societyname":_societyname
    };
    debugPrint(_Name);
    debugPrint(_Email);
    debugPrint(_Password);
    debugPrint(_confpass);

    await http.post(Uri.parse("https://goheldivya.000webhostapp.com/api/member.php"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body:Data,
        encoding: Encoding.getByName("utf-8")
    );
  }
}