import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Listtile extends StatelessWidget
{

  var icons;
  var titles;
  var navigator;
  Listtile({this.icons,this.titles,this.navigator});

  @override
  Widget build(BuildContext context)
  {
    return ListTile(
      leading: icons,
      title: titles,
      onTap:(){navigator;} ,
    );
  }
}