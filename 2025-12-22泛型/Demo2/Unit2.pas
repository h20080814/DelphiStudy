unit Unit2;

interface

type
  TStudent = class
  private
    FName: string;
  public
    property Name: string read FName write FName;
    constructor create; overload; //构造方法
    constructor Create(FName: string); overload ;  //有参构造方法

  end;

implementation

{ TStudent }

constructor TStudent.create(FName: string);
begin
  Self.FName := FName;
end;

constructor TStudent.create;
begin

end;

end.

