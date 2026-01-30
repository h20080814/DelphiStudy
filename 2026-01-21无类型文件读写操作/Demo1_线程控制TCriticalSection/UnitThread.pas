unit UnitThread;

interface

uses
  System.SyncObjs, System.SysUtils, System.Classes;

type
  TFileRWThread = class(TThread)
  private
  protected
    procedure Execute; override;
  public
    procedure FRWFile();
  end;

implementation

uses
  UnitmainFrom;

var
  CriticalSection: TCriticalSection; //使用临界区类

procedure TFileRWThread.Execute;
begin
//FreeOnTerminate := True;
  CriticalSection.Enter;     //临界区进入
  FRWFile();
  CriticalSection.Leave;
end;

procedure TFileRWThread.FRWFile;
var
  SourceFile, TargetFile: file;
  Buff: array[0..255] of Byte; //缓存：临时存放数据的空间
  Str: string;
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
   //   Str := '线程ID ' + Self.ThreadID.ToString; //这两个语句使得程序运行变慢
   //   Form1.mmo1.Lines.Add(Str);
      Form1.pb1.Position := FileSize(TargetFile);
    end;

  finally
  //关闭文件
    CloseFile(SourceFile);
    CloseFile(TargetFile);
  end;

end;

initialization
  CriticalSection := TCriticalSection.Create;  //临界区创建

finalization
  CriticalSection.Free;   //临界区释放

end.

