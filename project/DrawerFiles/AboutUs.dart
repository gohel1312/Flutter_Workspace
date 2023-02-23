//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: NetworkImage("https://goheldivya.000webhostapp.com/images/t.jpg"),
                    fit: BoxFit.fill
                  ),
                ),
              ),
              Container(
                child: Text("Thank you for agreeing to be a Residency Essentials module reviewer ."
                    " The course was created to provide a standardized didactic curriculum."
                    " Consistent review and revision of the content in these modules is essential "
                    "to ensuring a product that is both valuable and achieves our slated goal."
                    " Please follow the revision instructions outlined in the following sections, and, hopefully,"
                    " with your help, the Residency Essentials will become a premier resource enviable of all"
                    " other specialties!"),
              )
            ],
          ),
        ),
      ),
    );
  }
}