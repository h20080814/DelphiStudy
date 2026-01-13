unit Unit1;
 {
 线程和进程的关系
    进程中至少有一个线程
 多线程的运行机制   抢占模式
 生命周期：
                --暂停--
                |       |
                |       |
     创建---->等待---->执行---->销毁
 delphi多线程编写   TThread
 循环引用单元
        在本节课中，unit1单元的interface部分中引用了UnitTThread单元,而且在UnitTThread单元
    的implementation部分的uses从句后引用了unit1单元。
    无论是间接引用还是循环引用均指在interface部分，对于implementation不存在这种说法。
    为避免循环引用 ，建议手动引用某个单元时，在 implementation部分的uses 从句中列出。
}

interface

uses
  UnitTThread, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    btnStart: TButton;
    btnEnd: TButton;
    grpTThread: TGroupBox;
    lbl2: TLabel;
    btnBegin: TButton;
    btnPause: TButton;
    btnContinue: TButton;
    btnStop: TButton;
    procedure btnStartClick(Sender: TObject);
    procedure btnEndClick(Sender: TObject);
    procedure btnBeginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure btnContinueClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

var
  TThreadwork: TWork;

implementation

{$R *.dfm}
procedure work();
var
  Num: Integer;
begin
  for Num := 0 to 100 do begin
    form1.lbl1.Caption := Num.ToString;
    TThread.Sleep(100); //线程休眠100毫秒
  end;
end;

procedure TForm1.btnBeginClick(Sender: TObject);
begin
  try
    TThreadwork.Start;   //线程运行
  except
    on E: Exception do
      ShowMessage('启动失败');
  end;

end;

procedure TForm1.btnContinueClick(Sender: TObject);
begin
  TThreadwork.Suspended := False;
end;

procedure TForm1.btnEndClick(Sender: TObject);
begin
  Form1.lbl1.Caption := '0';
end;

procedure TForm1.btnPauseClick(Sender: TObject);
begin
  TThreadwork.Suspended := True;
end;

procedure TForm1.btnStartClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(work).Start; //匿名线程
end;

procedure TForm1.btnStopClick(Sender: TObject);
begin
  TThreadwork.FreeOnTerminate := True;
 // try
 //   TerminateThread(TThreadwork.Handle, 0);
 // except
 //   on E: Exception do
 //     ShowMessage('终止失败');
 // end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TThreadwork := TWork.Create(True);  //True表示线程创建对象后立即执行
end;

end.

