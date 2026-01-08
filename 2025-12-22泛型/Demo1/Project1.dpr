program Project1;

{$APPTYPE CONSOLE}

{$R *.res}
{
泛型
  所有使用了类型参数的数据类型(如TSample<T>)称为泛型类型。广泛的数据类型 ，数据类型的变量
  type
    类名<类型参数1,类型参数2...> = class(父类   //类的类型参数只能用于当前或其派生中。
    end;
  作用：
    1、为了避免在程序中的数据类型强制转换 （强制转换会导致精度降低）
    2、在容器中使用数据类型更为灵活
  使用： <T>
}
uses
  System.SysUtils;

type
  TStingArr = array of string;  //定义一个字符串数组类

  TIntegerArr = array of Integer;  //定义一个整数数组类

  TArrayss<T> = array of T;  //定义一个泛型数组类  T可以是任意字母，但要求前后一致 ，类型参数的有效范围等同于当前中声明局部变量。

  TStudent<A>= class
  end;

  TPerson = class
  end;

var
  StingArr: TStingArr;
  IntegerArr: TIntegerArr;
  Arrayss: TArrayss<string>; //<>内可以是任意数据类型
  I: Integer;

begin
  StingArr := ['aa', 'bb'];
  IntegerArr := [11, 22, 33];
  Arrayss := ['aa', 'bb', 'cc'];

  for I := Low(Arrayss) to High(Arrayss) do begin
    Writeln(Arrayss[I]);

  end;
  TStudent<TPerson>.Create;

  Readln;

end.

