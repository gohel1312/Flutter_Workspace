//@dart=2.9
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ItemsList extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "Items List",
      debugShowCheckedModeBanner: false,
      home: ItemList(),
    );
  }
}

class ItemList extends StatefulWidget
{
  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList>
{

  TextEditingController ItemName = TextEditingController();
  TextEditingController ItemPrice = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Items List"),
      ),
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context,int index)
          {
            return Card(
              color: Colors.grey.shade50,
              margin: EdgeInsets.all(10),
              borderOnForeground: true,
              elevation: 5,
              child: ListTile(
                //onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowData(Idata:data,Iid:index))),
                leading: Icon(Icons.my_library_books_sharp),
                title: Text(data[index]["name"]),  // Query Name
                trailing: Column(children:[ Icon(Icons.currency_rupee),Text(data[index]["price"])]),
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (ctx)=>AlertDialog(
                backgroundColor: Colors.white,
                title: Container(
                    height: 50,
                    color:Colors.brown,
                    child: Center(child: Text("Add Items",style: TextStyle(color: Colors.white),))),
                content: Container(
                  height: 200,
                  margin: EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: ItemName,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Item Name",
                          ),
                          validator: (value){
                            if(value.isEmpty)
                            {
                              Fluttertoast.showToast(msg: "Please Enter Item",toastLength: Toast.LENGTH_LONG,timeInSecForIosWeb: 1);
                            }
                          },
                        ),
                        TextFormField(
                          controller: ItemPrice,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Price",
                          ),
                          validator: (value){
                            if(value.isEmpty)
                            {
                              Fluttertoast.showToast(msg: "Please Enter Price of Item",toastLength: Toast.LENGTH_LONG,timeInSecForIosWeb: 1);
                            }
                          },
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.brown,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text("Add",style: TextStyle(color: Colors.white),),
                          onPressed: () {
                            final isvalid = _formKey.currentState.validate();
                            if(!isvalid)
                            {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ItemsList()));
                            }
                            additems(ItemName.text,ItemPrice.text);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ItemsList()));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        },
        child: Icon(Icons.add),
        tooltip: "Add Item",
        backgroundColor: Colors.brown,
      ),
    );
  }

  List data;
  Future getItems() async
  {
    final result = await http.get(Uri.parse("https://goheldivya.000webhostapp.com/TeaDiary/viewItems.php"),
        headers: {
          "Accept" : "application/json"
        });
    setState(() {
      data = json.decode(result.body);
    });
  }

  void additems(String name, String price) async
  {
    Map Data ={
      "item_name" : name,
      "item_price" : price
    };
    debugPrint(name);
    debugPrint(price);

    await http.post(Uri.parse("https://goheldivya.000webhostapp.com/TeaDiary/insertItems.php"),
        headers: {
          "Accept":"application/json",
          "content-Type":"application/x-www-form-urlencoded"
        },
        body: Data,
        encoding: Encoding.getByName("utf-8")
    );
  }

  void delete()
  {
    http.post(Uri.parse("https://goheldivya.000webhostapp.com/TeaDiary/DeleteItem.php"),body: {
      'id' : data
    });
  }
}