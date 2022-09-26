import 'dart:io';

class Pyramid9
{
  void p9()
  {
    for(var i=1;i<=5;i++)
      {
        for(var j=1;j<=i;j++)
          {
            stdout.write(i * i);
          }
        print('');
      }
  }
}