class Percentage()
{
  void p1()
  {
    var a = 85;
    var b = 85;
    var c = 53;
    var d = 36;
    var e = 62;

    var sum = a+b+c+d+e;

    var per = sum/5;

    if(per > 75)
    {
      print("Distinction");
    }
    else if(per <=75 && per > 60)
    {
      print("First Class");
    }
    else if(per <=60 && per > 50)
    {
      print(" Second Class");
    }
    else if(per <=50 && per > 35)
    {
      print("Pass Class");
    }
    else()
    {
      print("Fail");
    }

  }
}