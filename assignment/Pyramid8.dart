import 'dart:io';

class Pyramid8
{
  void p8()
  {
    for(var i=1;i<=5;i++)
    {
      for(var j=i;j<5;j++)
      {
        stdout.write(' ');
      }
      for(var k=1;k<=(2*i-1);k++)
      {
        stdout.write(i);
      }
      print('');
    }
  }
}