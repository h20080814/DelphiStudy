program ProjectReg;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {Form1},
  UnitTool in 'UnitTool.pas',
  UnitSendStrThread in 'UnitSendStrThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
