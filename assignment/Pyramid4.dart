import 'dart:io';

class Pyramid4
{
  void p4()
  {
    for(var i=1;i<=5;i++)
    {
      for(var j=i;j<5;j++)
      {
       stdout.write(' ');
      }
      for(var k=1;k<=i;k++)
        {
          stdout.write("*");
        }
      print('');
    }
  }
}