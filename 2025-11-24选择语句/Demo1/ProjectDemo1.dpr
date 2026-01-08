program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
  {*------------------------------------------------------------------------------
      语句
      主要由关键字和操作指令组成
      划分
          选择语句
            if 语句的格式
              1、标准格式
                if True then
                  begin
                    当判断条件成立时执行的语句
                end;
              2、简写方式：前提是只需要执行一行代码 ，省略掉begin and；
              3、如果否则
                 if True then
                  begin
                    当判断条件成立时执行的语句
                 end
                 else
                  begin
                    当判断条件不成立时执行的语句
                  end；


            case
  -------------------------------------------------------------------------------}

begin
   if 1<2 then
   begin
   //向控制台输出一行
   Writeln('第一美女');
   end;
   //从控制台读入一行文本， 直到遇到回车（换行符）
  Readln;

end.

