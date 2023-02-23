//@dart=2.9
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class EmergencyContact extends StatefulWidget {
  @override
  State<EmergencyContact> createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact>
{
  List Iconss = [Icons.local_police,Icons.fire_truck,Icons.local_hospital,Icons.woman,Icons.traffic,Icons.directions_train_outlined,Icons.add_road_sharp,Icons.waves,Icons.electric_bolt,Icons.dangerous];
  List Contacts = ["100","101","108","181","103","1072","1073","1096","155333","1800110031"];
  List NameOfContacts = ["Police","Fire Station","Ambulance","Women Helpline","Traffic Control","train Accident","Road Accident","Earth-quake","Electricity Complain","Drug de-addiction"];
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Emergency Contact"),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: Contacts.length,
              itemBuilder: (BuildContext context, int index){
                return Card(
                  elevation: 10,
                  color: Colors.teal.shade200,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    leading: Icon(Iconss[index],color: Colors.red,),
                    title: Text(NameOfContacts[index]+"\t"+Contacts[index]),
                    trailing: IconButton(onPressed: (){
                      var url =Uri.parse('tel:'+Contacts[index]);
                      launchUrl(url);
                    }, icon: Icon(Icons.phone,color: Colors.black,)),
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
