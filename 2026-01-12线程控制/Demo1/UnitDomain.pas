unit UnitDomain;

interface

uses
  System.Classes;

type
  TProduct = class     //产品类
  private
    FId: Integer;
    FName: string;
    FIsConsumption: Boolean;  //是否已消费
  public
    property Id: Integer read FId write FId;
    property Name: string read FName write FName;
    property IsConsumption: Boolean read FIsConsumption write FIsConsumption;
  end;

implementation

end.

