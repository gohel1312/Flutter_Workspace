class DefaultParameter
{
  void default1(int length,{int breath=3,int height=4})
  {
  print("length is $length");
  print("breath is $breath");
  print("Height is $height");

  print("Volume is ${length * breath * height}");
  }

}