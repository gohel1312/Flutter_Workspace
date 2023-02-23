//@dart=2.9
import 'package:contactus/contactus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: ContactUs(
            companyName: "Golden Plazza",
            textColor: Colors.black45,
            dividerThickness: 2,
            cardColor: Colors.white,
            companyColor: Colors.grey.shade800,
            tagLine: "Contact Us",
            taglineColor: Colors.black87,
            email: "TMKOC@gmail.com",
            instagram: "unwitting_soul",
            phoneNumber: "+918160419222",
        ),
      ),
    );
  }
}