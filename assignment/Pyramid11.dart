import 'dart:io';

class Pyramid11
{
  void p11()
  {
    for(var i=1;i<=5;i++)
      {
        for(var j=1;j<=i;j++)
          {
            if(j%2==0)
            {
              stdout.write("0");
            }
            else
              {
                stdout.write("1");
              }
          }
        print(' ');
      }
  }
}
