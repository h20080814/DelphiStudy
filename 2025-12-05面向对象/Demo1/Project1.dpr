program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
 {面向对象
    1、面向过程 ：    C语言
        强调的是功能行为（方法、函数）。C语言就是面向过程的语言。
        解决一个问题时，第一步干什么；第二步干什么；等等；最后一步干什么。
    2、基于对象：   Vb,JavaScript
        使用已定义好的对象来解决问题。
    3、面向对象：  Delphi,C++,Java,C#
        将功能封装进对象，强调具备了功能的对象。
        对一个问题的解决方式是：先将相关的事物（对象）
        各自把其自身的属性、可用的方法（函数）写好且
        封装起来，再通过相互驱动、相互作用来解决问题。
    4、对象和类的关系：
         类：是某一类对象的属性、功能的共同点抽离出来
         形成一个模板。
         一个对象是此类的模板具体实现（此对象还具有自己
         本身特有的方法和属性）。
    5、 类和类之间的关系：
         描述了不同类如何相互关联和协作。常见的类间关
         系包括依赖、关联、聚合、组合、继承和实现。
         依赖（Dependency）‌：表现为一个类使用另一个类
          作为方法参数、局部变量或调用其静态方法，是一种
          临时的、偶然的使用关系。在UML类图中，用带箭头的
          虚线表示。
‌       关联（Association）‌：表示两个类之间存在固定的对
          应关系，通常通过将一个类的对象作为另一个类的成员
          变量来实现，关系较为持久和平等。在UML类图中，
          用实线连接
‌       聚合（Aggregation）‌：是一种特殊类型的关联，
          表示“整体-部分”的关系，但部分对象可以独立于整体存在
          （例如，大学包含系，但系可以独立存在）。在UML类图中
          ，用带空心菱形的实线表示。‌
‌       组合（Composition）‌：比聚合更强，表示“整体-部分”的关系，
          但部分对象不能独立于整体存在（例如，汽车包含引擎，引擎不
          能脱离汽车存在）。在UML类图中，用带实心菱形的实线表示。
‌       继承（Inheritance）‌：表示一个类（子类）继承另一个类（父
          类）的属性和方法，并可以扩展新功能，体现“is-a”关系。
          在UML类图中，用带空心三角箭头的实线表示，从子类指向父类。
‌       实现（Realization）‌：通常指一个类实现接口的契约，确保类
          提供接口中声明的方法。在UML类图中，用带空心三角箭头的虚
          线表示，从类指向接口。
        这些关系的耦合度从弱到强依次为：依赖 < 关联 < 聚合 < 组
          合；继承和实现则用于代码复用和扩展。在设计时，应优先使
          用关联、聚合或组合来降低耦合性，避免过度继承。
        继承与派生：类的继承是指一个类（派生类/子类）从另一个类（基类/父类）
        获取属性和方法的能力；派生是指从基类产生新类的过程，派生
        类可以扩展或重写基类的功能‌。
        继承是描述关系（派生类继承基类的特性），而派生是描述过程
        （从基类派生出新类）。
        封装：将不必要暴露的细节隐藏起来。
        多态：一类事物以多种形态存在。
    1、创建类及其对象：
          类的成员组成：属性（成员变量，字段）：
                        功能（方法，函数，过程，例程）：
          type
            TUser = class  //创建类
              FName:string; //字段（属性，变量）
              proceure SetName(Name:string); //声明（定义）过程（函数，方法等）
            end;
          procedure TUser.SetName(Name: string);   //实现类声明的功能Ctrl+Shift+C
            begin
              FName := Name;
            end;
          var
            user: TUser;  //定义一个对类引用的对象
           begin
             user := TUser.Create; //通过类的构造方法创建一个类
                                    的对象,（申请了一个存储空间
                                    ，并得到一个地址编号并且将
                                    其赋值给User）
              Readln;
            end.
    2、对象的生命周期
          对象从创建到消亡的过程。
            1、对象的创建
              1、构造方法  constructor
                  1、在内存中申请一个空间，从而实现对象的创建
                  2、初始化类成员的功能
            2、对象的销毁
              1、free;
              2、Destroy
              3、freeNil;
              4、nil  空值null
            3、self 表示本类对象  ，解决命名冲突
}

type
  TUser = class  //创建类
    FName: string; //字段（属性，变量）
    procedure SetName(Name: string); //声明（定义）过程（函数，方法等）
    constructor AAA();  //声明构造方法
    destructor Destroy; override;   //销毁对象的方法的声明 ，override覆盖，重写
  end;
{ TUser }

constructor TUser.AAA;
begin

end;

destructor TUser.Destroy; //销毁对象的方法的实现
begin

  inherited; //调用父类销毁对象的方法
end;

procedure TUser.SetName(Name: string);   //实现类声明的功能Ctrl+Shift+C
begin
  FName := Name;

end;

var
  User: TUser;  //定义一个对类引用的对象



begin

  User := TUser.Create; //通过类的构造方法创建一个类的对象 （申请了一个存储空间，并得到一个地址编号并且将其赋值给User）
  User.FName := '小包';  //字段（成员）赋值
  Writeln(User.FName);
  User.Free;  //销毁对象 ：模板方法设计模式，free过程调用了Destroy
  FreeAndNil(User); //销毁并清空对象
  Readln;
end.

