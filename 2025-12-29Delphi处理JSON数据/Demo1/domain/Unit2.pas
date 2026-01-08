unit Unit2;

interface

type
  TStudent = class
  private
    FName: string;
    FAge: Integer;
  public
    property Name: string read FName write FName;
    property Age: Integer read FAge write FAge;
    constructor Create(); overload;
    constructor Create(FName: string; fage: Integer); overload;
  end;

implementation

{ TStudent }

constructor TStudent.Create(FName: string; fage: Integer);
begin
  Self.FName:=FName;
  Self.FAge:=FAge;

end;

constructor TStudent.Create;
begin

end;

end.

