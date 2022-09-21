class UserDefinaFunction
{
  void answer(int a,int b)
  {
    //1.with parameter with return type
    int add(int a,int b)
    {
      return a+b;
    }

    //2.with parameter without return type
     sub(int a,int b)
    {
      return a-b;
    }


    //3.without parameter with return type
    int mul()
    {
      var a=12;
      var b=10;

      return a*b;
    }

    //4.without return type and without parameter
    div()
    {
      var c=30;
      var d=2;
      print(c/d);
    }
  }
}

