program Project1;

{$APPTYPE CONSOLE}

{$R *.res}
{
 集合类型：
    集合：是由具有某些共同特征的元素构成的一个整体。
        一个集合是由具有同一有序类型的一组数据元素组成。又称之为该集合的基类型。
    定义：
      type
      类型名称 = set of 基类型
      var
        Vset1:set1;
        Vset2:set of byte;
    注意：
    1、一个集合类型的所有成员必须是同一有序类型且最多只能含256个成员；
    2、同一集合类型中不允许含有相同的成员；
    3、集合类型成员具有无序性，其中的成员没序数。无法像枚举型一样用序数表示集合成员。
    4、集合类型的值域由Base Type的值域决定。
    集合的运算：
    添加一个集合元素 Include(s,1);
    删除一个集合元素Exclude(s,1);
    对集合进行并（+）、交（*）、差（-）三种运算，每种运算只有一个运算符、两个运算对象，
    运算结果仍为集合。

}
uses
  System.SysUtils;

type   //主要作用是让用户（程序员）可以自定义类型
  TMySet = set of Char;  //标准定义方式

  TMySet1 = set of'a'..'z';  //用子界定义

  TMySet2 = set of (RED,GREEN,BLUE);  //用枚举定义，值域为3个标识符


var
  MySet: TMySet;  //使用集合类型



begin
    Readln;
end.

