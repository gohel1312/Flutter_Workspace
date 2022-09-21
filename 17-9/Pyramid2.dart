import 'dart:io';

class Pyramid2
{
  void p2()
  {
    for(var i=1;i<=5;i++)
      {
        for(var j=1;j<=i;j++)
          {
            stdout.write(j);
          }
        print(' ');
      }
  }
}