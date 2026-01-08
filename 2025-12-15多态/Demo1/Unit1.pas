unit Unit1;

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

implementation

{ TDog }

procedure TDog.LookDoor;
begin
Writeln('狗看门');
end;

procedure TDog.Run;
begin
  Writeln('狗在跑');
end;

{ TCat }

procedure TCat.CatchMice;
begin
Writeln('猫抓鼠');
end;

procedure TCat.Run;
begin
  Writeln('猫在跑');
end;

end.

