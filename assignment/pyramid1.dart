import 'dart:io';

class Pyramid
{
  void p1()
  {
    for(var i=1;i<=5;i++)
      {
        for(var j=1;j<=i;j++)
          {
            stdout.write("*");
          }
        print(" ");
      }
  }
}