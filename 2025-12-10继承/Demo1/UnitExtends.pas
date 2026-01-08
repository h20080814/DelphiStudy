unit UnitExtends;

interface

type
  TAnimal = class //定义一个父类，一旦派生出多个子类，父类就具备了多态性
  private
    FWeight: Integer;
  public
    constructor create(FWeight: Integer);  //定义一个构造方法
    property Weight: integer read FWeight write FWeight;
    procedure GetName(); virtual; //声明一个动物类的虚方法
  end;

  Tdog = class(TAnimal)    //定义一个狗子类（派生）,产生TAnimal的继承关系
  public
    constructor create();
    procedure GetName(); override;//override 类名相同，声明一个狗类的重写（覆盖）的方法
  end;

 // Tcat = class(TAnimal)   //定义一个猫子类（派生）,
//  end;                    //产生对TAnimal的继承关系

implementation
{ TAnimal }

constructor TAnimal.create(FWeight: Integer);
begin
  Self.FWeight := FWeight;
end;

procedure TAnimal.GetName;
begin
  Writeln('动物类的方法');
end;

{ Tdog }

constructor Tdog.create;
begin
  //FWeight :=100;
  Writeln('狗类');
  inherited create(51);  //继承父类TAnimal.create的方法
end;

procedure Tdog.GetName;
begin
  inherited; // 无参数的话，则调用的是父类中同名的方法
             //如有参数，则调用参数指定名称的父类的方法
  Writeln('狗类的方法');
end;

end.

