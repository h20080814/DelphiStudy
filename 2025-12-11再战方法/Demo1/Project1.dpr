program Project1;

{$APPTYPE CONSOLE}

{$R *.res}
{*------------------------------------------------------------------------------
方法：
    1、种类：
      1、静态方法：  类中缺省类型，执行速度快，不支持多态性
            1、关键字  无
            2、调用规则：类对象的调用
              1、声明  在interface下面
                          type
                            TPerson = class
                            public
                              procedure Talk();  Ctrl+Shift+C
                            end;
              2、实现  在implementation下面
                        procedure TPerson.Talk;
                          begin
                            Writeln('静态方法');
                          end;
              3、调用
                     var
                      Person: TPerson;

                     begin
                      Person := TPerson.Create(); //创建类的对象（类的实例化//类的初始化）
                      Person.Talk();
                      Person.Free();  //销毁/析构
                      Readln;
                     end.
      2、虚拟方法：父类可以实现多态性
          1、关键字  virtual
          2、调用规则：与静态方法的调用规则相同一般情况下，父类的虚拟方法会有一个空实现。
                        如果子类（派生类）要覆盖（重写）父类（基类）的方法，那么父类的方法必须是虚拟方法或者动态方法
      3、动态方法：
          1、关键字  Dynamic
          2、调用规则：与虚拟方法一致
小结：1、每个类都内含着两个表：虚方法（VMT）和动态方法表（DMT）；
      2、虚方法速度上有优势，动态方法会节约内存；
      3、两者是可以互相代替的。
                1、声明
                  type
                    TAnimal = clss
                     public
                      function Run(): Integer; virtual; //dynamic
                     end;
                    TDog = class(TAnimal)
                      public
                        function  Run(): Integer;  //重写/覆盖
                      end;
                2、实现    Ctrl+Shift+C
                    // TAnimal

                    function TAnimal.Run: Integer;
                      begin
                        Writeln('虚拟方法动态方法');
                      end;

                    // TDog

                    function TDog.Run: Integer;
                      begin
                        Writeln('四条腿跑');
                      end;
                3、调用
                  var
                   Dog: TDog;
                  begin
                    dog := TDog.Create();
                    dog.Run();
                      Readln;
                  end.
      4、类方法：类似于Java中的静态方法
        关键字：class
        规则：当class修饰属性时，该属性称为类属性；
              当class修饰方法时，该方法称为类方法。
              因为它是个类级别的方法，所以它的加载顺序高即可以通过对象来调用 ，也可以通过类名来调用
          1、声明
              type
                TAnimal = class
                class procedure  Eat();
          2、实现  Ctrl+Shift+C
              class procedure TAnimal.Eat;
                begin
                   Writeln('吃');
                end;
          3、调用
                1、通过类名来调用
              begin
               TAnimal.Eat;
               Readln;
              end.
                2、通过对象来调用
               var
                 Dog: TDog;
               begin
                TAnimal.Eat;
                dog := TDog.Create();
                dog.Eat();
                 Readln;
                end.
      5、抽象方法：一般指规定、规范
            关键字：abstract
            规则：1、必须是虚方法（动态、虚拟）
                  2、抽象方法一般定义在父类中，实现在子类中
               1、声明
                  type
                    TAnimal = class
                     public
                      procedure Sleep(); virtual; abstract;  //在父类中声明
                     end;
                  TDog = class(TAnimal)
                     public
                      procedure Sleep();  //在子类中实现  Ctrl+Shift+C
                     end;
               2、实现
               implementation
                  procedure TDog.Sleep;
                    begin
                      Writeln('不能吃人');
                    end;
               3、调用
                var
                  Dog: TDog;
                begin
                   Dog.Sleep();
                end;

      6、消息方法：需要处理窗口消息
      7、构造方法：
              关键字：constructor
      8、析构方法：
-------------------------------------------------------------------------------}
uses
  System.SysUtils,
  Unit1 in 'Unit1.pas';

var
  Dog: TDog;
//  Person: TPerson;



begin
  TAnimal.Eat;
  Dog := TDog.Create();
  Dog := TDog.create1();
  Dog := TDog.create2();
  Dog.Eat();
  Dog.Sleep();
  Dog.Run();
{
  Person := TPerson.Create();
  Person.Talk();
  Person.Free();
}
  Readln;
end.

