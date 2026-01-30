unit UnitmainFrom;
{
无类型文件 ： 二进制文件
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    pb1: TProgressBar;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const
  Source_File: string = 'D:\92.jpg';
  Target_File: string = 'D:\Copy92.jpg';

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  SourceFile, TargetFile: file;
  Buff: array[0..255] of Byte; //缓存：临时存放数据的空间
begin
  try
  //关联变量
    AssignFile(SourceFile, Source_File);
    AssignFile(TargetFile, Target_File);
  //设置打开方式
    Reset(SourceFile);   //以读的方式打开
    Rewrite(TargetFile); //以写的方式打开
    Form1.pb1.Max := FileSize(SourceFile);
  //读写  边读边写
    while not Eof(SourceFile) do begin
      BlockRead(SourceFile, Buff, 1);  //读取1个字节的数据
      BlockWrite(TargetFile, Buff, 1); //写入1个字节
      Form1.pb1.Position := FileSize(TargetFile);
    end;

  finally
  //关闭文件
    CloseFile(SourceFile);
    CloseFile(TargetFile);
  end;
end;

end.

