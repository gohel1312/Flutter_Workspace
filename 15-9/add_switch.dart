class ArithmeticSwitch()
{
  void a1()
  {
    var a = 14;
    var b = 43;

    var num = 1;

    Switch(num)
    {
      case 1:
        print("Addition : $a + $b");
        break;

      case 2:
        print("Subtraction : $a - $b");
        break;

      case 3:
        print("Multiplication : $a * $b");
        break;

      case 4:
        print("Division : $a / $b");
        break;
    }
  }
}