program Project1;

{$APPTYPE CONSOLE}

{$R *.res}
{
子界：定义取值的范围，防止越界，便于检查出不合法的数据
    格式：type 子界类型标识符=常量1（下界）..常量2（上界）;
     type
        TSubrange = 1..10;
        TSubrange1 = 'a'..'z';
    注意：下界和上界必须是有序的数据类型（整数、字符、枚举等）同一顺序类型，上界的序号必须大于下界的序号
          上界大于或等于下界
 Color := Ecolors.RED;
  Week := EWeek.SUN;
  Writeln(ord(Color), ',', ord(Week)); //ord ordinal序数，表示事物在序列中的顺序或位置
}
uses
  System.SysUtils;

type
        {枚举}
  EColors = (RED, GREEN, BLUE);
        {子界}

  TSubrangeNumber = 1..10;

  TSubrangeMonth = 1..12;

  TSubrange1Char = 'a'..'z';
      {枚举-子界,调用时还是枚举的方法}

  TSubrangeColors = EColors.RED..EColors.BLUE;

var
  UseYear: Integer;
  UseMonth: Integer;
  IsLeapYear: Boolean;


//子界的下标，子界的上标
procedure TSubrangeDemo();
begin
  Writeln('数据类型是枚举-子界EColors的下标是', ord(Low(EColors)));  //ord ordinal序数，表示事物在序列中的顺序或位置
  Writeln('数据类型是枚举-子界EColors的上标是', ord(High(EColors)));
  Writeln('');
  Writeln('数据类型是整数的子界TSubrangeNumber的下标是', Low(TSubrangeNumber));
  Writeln('数据类型是整数的子界TSubrangeNumber的上标是', High(TSubrangeNumber));
  Writeln('');
  Writeln('数据类型是字符的子界TSubrange1Char的下标是', Low(TSubrange1Char));
  Writeln('数据类型是字符的子界TSubrange1Char的上标是', High(TSubrange1Char));
  Writeln('');
  Writeln('数据类型是枚举-子界TSubrangeColors的下标是', ord(Low(TSubrangeColors)));
  Writeln('数据类型是枚举-子界TSubrangeColors的上标是', ord(High(TSubrangeColors)));
  Writeln('');
end;

{
  打印输出闰年还是平年，每个月份的天数和所属的季节
  闰年判断：1、年份能被4整除；2、年份若是100的整数倍，需被400整除
}
procedure LeapYear();
begin
  Writeln('请输入年份： ');
  Readln(UseYear);
  Writeln('请输入月份： ');
  Readln(UseMonth);
  IsLeapYear := False;

  if UseYear mod 4 = 0 then begin
    if UseYear mod 100 = 0 then begin
      if UseYear mod 400 = 0 then begin
        IsLeapYear := True;
      end;
    end
    else begin
      IsLeapYear := True;
    end;
  end
  else begin
    IsLeapYear := False;
  end;

  if IsLeapYear then begin
    Write(UseYear, '是闰年！')
  end
  else begin
    Write(UseYear, '是平年！')
  end;

  if (UseMonth >= Low(TSubrangeMonth)) and (UseMonth <= High(TSubrangeMonth)) then begin
    case UseMonth of
      1:
        Writeln(UseMonth, '月是春季，共31天');
      2:
        if IsLeapYear then begin
          Writeln(UseMonth, '月是春季，共29天');
        end
        else begin
          Writeln(UseMonth, '月是春季，共28天');

        end;
      3:
        Writeln(UseMonth, '月是春季，共31天');

      4:
        Writeln(UseMonth, '月是夏季，共30天');

      5:
        Writeln(UseMonth, '月是夏季，共31天');

      6:
        Writeln(UseMonth, '月是夏季，共30天');

      7:
        Writeln(UseMonth, '月是秋季，共31天');

      8:
        Writeln(UseMonth, '月是秋季，共31天');

      9:
        Writeln(UseMonth, '月是秋季，共30天');

      10:
        Writeln(UseMonth, '月是冬季，共31天');

      11:
        Writeln(UseMonth, '月是冬季，共30天');

      12:
        Writeln(UseMonth, '月是冬季，共31天');

    end;
  end
  else begin
    Writeln('请输入一个正确的月份！');
  end;
end;

begin
  LeapYear();
  readln;
end.

