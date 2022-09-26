import 'dart:io';

class Pyramid10
{
  var k=1;
  void P10()
  {
    for(var i=1;i<=5;i++)
      {
        for(var j=1;j<=i;j++)
          {
            stdout.write(k);
            k++;
          }
        print('');
      }
  }
}