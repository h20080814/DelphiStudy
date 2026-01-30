program ProjectMain;

uses
  Vcl.Forms,
  UnitmainFrom in 'UnitmainFrom.pas' {Form1},
  UnitThread in 'UnitThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
