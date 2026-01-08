unit Unit2;

interface

type
  TStudent = class
  private
    FId: string;
    FName: string;
    FAge: Integer;
  public
    constructor Create(); overload;
    constructor Create(FId: string; FName: string; FAge: Integer); overload;
    property Id: string read FId write FId;
    property Name: string read FName write FName;
    property Age: Integer read FAge write FAge;
  end;

implementation


{ TStudent }

constructor TStudent.Create(FId: string; FName: string; FAge: Integer);
begin
  Self.FId := FId;
  Self.FName := FName;
  Self.FAge := FAge;
end;

constructor TStudent.Create;
begin

end;

end.

