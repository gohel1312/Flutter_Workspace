//@dart=2.9
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Maintenance extends StatefulWidget {
  @override
  State<Maintenance> createState() => _MaintenanceState();
}

class _MaintenanceState extends State<Maintenance>
{
  var sum = 0;
  List Bill = ["Water Connection","Electricity Connection","Fire Safety","Municipal Tax","Employee salary","Other Charges"];
  List Pay = ["600","750","500","1000","400","350"];
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Column(
            children: [
              Center(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Shimmer.fromColors(
                    baseColor: Colors.amber,
                    highlightColor: Colors.white,
                    child: Text("golden Plaza Maintenance Charges",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)),
              ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.teal.shade200,
                ),
                margin: EdgeInsets.all(10),
                height: 450,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: Bill.length,
                  itemBuilder: (BuildContext context,int index){
                    return Card(
                      child: ListTile(
                        title: Text(Bill[index]),
                        trailing:  Text(Pay[index]),
                      ),
                    );
                  }),
              ),
              Align(alignment:Alignment.center,child: Text("Total Maintenance: 3600",style: TextStyle(fontSize: 20),))
            ],
          ),
        ),
      ),
    );
  }
}
