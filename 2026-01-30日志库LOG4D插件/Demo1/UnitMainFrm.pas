unit UnitMainFrm;

interface

uses
  LoggerPro.GlobalLogger, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    mmo1: TMemo;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
// Self.mmo1.Lines.Add('按钮被点击了');


  Log.Debug('Debug message', 'main');
  Log.Info('Info message', 'main');
  Log.Warn('Warn message', 'main');
  Log.Error('Error message', 'error');
  Log.Fatal('Fatal message', 'error');

end;

end.

