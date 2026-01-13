unit UnitSyncThread;

interface

uses
  System.SyncObjs, System.SysUtils, System.Classes;

type
  TWorkingThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  public
    procedure Work();
  end;

implementation

uses
  Unit1;

var
  i: Integer;
  CriticalSection: TCriticalSection; //使用临界区类
 { TWorkingThread }

procedure TWorkingThread.Execute;
begin
  FreeOnTerminate := True;
 // Self.Synchronize(Work);  //使用同步机制
  CriticalSection.Enter;     //临界区进入
  Work();
  CriticalSection.Leave;     //临界区离开
end;

procedure TWorkingThread.Work;
begin
  while True do begin
    Form1.mmo1.Lines.Add('线程ID ' + Self.ThreadID.ToString + ', ' + i.ToString);
    if i = 10 then begin
      Exit;
    end;
    inc(i);
    Self.Sleep(100);
  end;
end;

initialization
  CriticalSection := TCriticalSection.Create;  //临界区创建

finalization
  CriticalSection.Free;   //临界区释放

end.

