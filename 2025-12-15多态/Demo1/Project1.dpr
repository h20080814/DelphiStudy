program Project1;

{$APPTYPE CONSOLE}

{$R *.res}
{*------------------------------------------------------------------------------
   面向对象主要有三个特征：封装、继承、多态
  多态：一类事物以多种形态存在。例如：动物类和狗类、猫类的关系 。但前提是两个类具备继承（派生）和实现这两种关系的一种。具体体现是父类接收或指向其子类对象
    作用：提高代码的复用性，方便我们对代码进行解耦（类和类之间不要出现直接的依赖关系）
    使用：
      声明 在Unit1
        interface

          type
            TColor = interface  //定义接口，接口类不能创建对象，但可以指向实现类的对象
            end;
            TAnimal = class(TInterfacedObject) //父类了继承接口类
              public
                procedure Run(); virtual; abstract;
            end;
            TDog = class(TAnimal, TColor) //子类继承了父类和接口
              public
                procedure Run(); override; //override重写
                procedure LookDoor();
              end;
            TCat = class(TAnimal)
              public
                procedure Run(); override;
                procedure CatchMice ();
              end;
      实现
        implementation

            //TDog
          procedure TDog.LookDoor;
            begin
              Writeln('狗看门');
            end;

          procedure TDog.Run;
            begin
              Writeln('狗在跑');
            end;

            //TCat
          procedure TCat.CatchMice;
            begin
              Writeln('猫抓鼠');
            end;

          procedure TCat.Run;
            begin
             Writeln('猫在跑');
            end;

        end.
      调用  在Project1
        uses
       System.SysUtils,
       Unit1 in 'Unit1.pas';

procedure ShowAnimalRun(Animal: TAnimal);  //向上转型：把子类对象的类型转换成了父类的数据类型
var
  Dog: TDog;
  Cat: TCat;
begin
  if Assigned(Dog) then begin  //Assigned：判断是否是空值
    Writeln('是空值');
  end;
  //运行时的数据类型
  Animal.Run;
  //强制转换数据类型
  Writeln(Animal.ClassName);
  //Writeln(Animal.ClassType);
  Writeln(Animal.InheritsFrom(TCat));
  //Writeln(Animal.ClassParen(TDog));
  Writeln(Animal.Instancesize);
  //Writeln(Animal.ClassInfo(TDog));
  if Animal.ClassName = 'TDog' then begin
    //Dog := TDog(Animal);  //向下转型：把父类对象的类型转换成子类的数据类型
    Dog := Animal as TDog;  //as强制类型转换
    Dog.LookDoor;
  end
  else begin
    //Cat := TCat(Animal);
    Cat := Animal as TCat; //as强制类型转换
    Cat.CatchMice;
  end;
  if Animal is TDog then  //is判断一个对象是否和一个类型兼容
  begin
    Writeln('确实是狗');
  end
  else begin
    Writeln('它是一只猫');
  end;
end;
//var
  //Animal: TAnimal;
  //ColorDog: TColor;



begin
  ShowAnimalRun(TDog.create());  //狗在跑
  ShowAnimalRun(TCat.create());  //猫在跑
  //Animal := TDog.create();
  //Animal := TCat.Create();
  //Animal.Run;
  //ColorDog := TDog.Create;
  Readln;
end.


  运行期类型信息（RTTI)：是一种语言特征，能使应用程序在运行时得到关于对象的信息，是Delphi组件能够融合到IDE中的关键。
   TObjiect的一些方法：
   ClassName() 返回string 返回值 对象的类名
   ClassType() 返回boolean 返回值 对象的类型
   InheritsFrom() 返回boolean 返回值 判断对象是否继承于一个指定的类
   ClassParent() 返回TClass 返回值 对象祖先类型
   Instancesize() 返回word 返回值 对象实例的长度（字节数）
   ClassInfo() 返回Pointer 返回值 指向RTTI的指针
 as和is:两个运算符，用它们通过RTTI能对对象进行比较和强制类型转换
 as:能把一个基层的对象强制类型转换成它的派生类。
    procedure Foo(AnObject : TObject);
      (AnObject as Tedit).text := '1982';
 is:判断两个对象是否是相兼容的类型
 Assigned（p）：判断是否是空值,或者用@p=nil来判断函数指针是否未空
-------------------------------------------------------------------------------}
uses
  System.SysUtils,
  Unit1 in 'Unit1.pas';

procedure ShowAnimalRun(Animal: TAnimal);  //向上转型：把子类对象的类型转换成了父类的数据类型
var
  Dog: TDog;
  Cat: TCat;
begin
  if Assigned(Dog) then begin  //Assigned：判断是否是空值
    Writeln('是空值');
  end;
  //运行时的数据类型
  Animal.Run;
//强制转换数据类型
  Writeln(Animal.ClassName);
  //Writeln(Animal.ClassType);
  Writeln(Animal.InheritsFrom(TCat));
  //Writeln(Animal.ClassParen(TDog));
  Writeln(Animal.Instancesize);
  //Writeln(Animal.ClassInfo(TDog));
  if Animal.ClassName = 'TDog' then begin
    //Dog := TDog(Animal);  //向下转型：把父类对象的类型转换成子类的数据类型
    Dog := Animal as TDog;  //as强制类型转换
    Dog.LookDoor;
  end
  else begin
    //Cat := TCat(Animal);
    Cat := Animal as TCat; //as强制类型转换
    Cat.CatchMice;
  end;
  if Animal is TDog then  //is判断一个对象是否和一个类型兼容
  begin
    Writeln('确实是狗');
  end
  else begin
    Writeln('它是一只猫');
  end;
end;
//var
  //Animal: TAnimal;
  //ColorDog: TColor;



begin
  ShowAnimalRun(TDog.create());  //狗在跑
  ShowAnimalRun(TCat.create());  //猫在跑
  //Animal := TDog.create();
  //Animal := TCat.Create();
  //Animal.Run;
  //ColorDog := TDog.Create;
  Readln;
end.

