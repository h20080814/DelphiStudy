library TestDll;

uses
  System.SysUtils,
  System.Classes;

{$R *.res}
 //stdcalll参数的传递顺序从右到左
function Add(Num1, Num2: Integer): Integer; stdcall;
begin
 result := Num1 + Num2;
  Exit;
end;
  //导出函数列表
  exports
   Add;
begin
end.

