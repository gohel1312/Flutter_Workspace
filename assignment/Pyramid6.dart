import 'dart:io';

class Pyramid6
{
  void p6()
  {
    for(var i=1;i<=5;i++)
    {
      for(var j=i;j<5;j++)
      {
        stdout.write(' ');
      }
      for(var k=1;k<=(2*i-1);k++)
      {
        stdout.write("*");
      }
      print('');
    }
  }
}