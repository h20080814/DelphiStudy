unit UnitSendStrThread;

interface

uses
  Dm_TLB, System.Classes, Winapi.Windows;

type
  TSendStrThread = class(TThread)
  private
    Hand: Integer;
    MyDm: Idmsoft;
  protected
    procedure Execute; override;
  public
    constructor create; overload;
    constructor create(Hand: Integer); overload;
  end;

implementation

uses
  UnitTool;


{ TSendStrThread }

constructor TSendStrThread.create;
begin
  inherited create(False);
end;

constructor TSendStrThread.create(Hand: Integer);
begin
  inherited create(False);
  Self.Hand := Hand;

end;

procedure TSendStrThread.Execute;
begin
  MyDm := CreateComObjectFromDll(CLASS_dmsoft, LoadLibrary('dm.dll')) as Idmsoft;
  Self.Hand := MyDm.FindWindowEx(Self.Hand, '', '');
  //´°¿Ú°ó¶¨
  if MyDm.BindWindow(Self.Hand, 'gdi', 'windows', 'windows', 0) = 0 then begin
    Exit;
  end;
 //²Ù×÷Ïò´°¿ÚÖÐ·¢ËÍ×Ö·û´®
  while True do begin
    MyDm.SendString(Self.Hand, PWideChar('·¢ËÍ×Ö·û´®²âÊÔ') + #13);
    TSendStrThread.Sleep(1000);
  end;
end;

end.

