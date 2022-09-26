import 'dart:io';

class Pyramid3
{
  void p3()
  {
    for(var i=1;i<=5;i++)
    {
      for(var j=1;j<=i;j++)
      {
        stdout.write(i);
      }
      print(' ');
    }
  }
}