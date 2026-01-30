library ProjectDll;

uses
  Winapi.Windows,
  Vcl.Forms,
  System.SysUtils,
  System.Classes;

{$R *.res}
//重载，两个过程名相同，参数类型不同overload
function Add(Num1, Num2: Integer): Integer; overload; stdcall;
begin
  Result := Num1 + Num2;
end;

function Add(Num1, Num2: Double): Double; overload; stdcall;
begin
  Result := Num1 + Num2;
end;

exports
  Add(Num1, Num2: Integer) name 'AddInteger',
  Add(Num1, Num2: Double) name 'AddDouble';

procedure ShowMeg(Meg: string);
begin
  Application.MessageBox(PWideChar(Meg), PWideChar('提示'), MB_OK);
end;
//退出函数

procedure MyExit(Res: Integer);
begin
  //ShowMeg(Res.ToString);
  case Res of
    DLL_PROCESS_ATTACH:
      begin
        //Application.MessageBox(PWideChar('附加，初始化'), PWideChar('提示'), 0);
        ShowMeg('过程附加，初始化');
        ShowMeg(Res.ToString);
      end;

    DLL_PROCESS_DETACH:
      begin
         //Application.MessageBox(PWideChar('销毁，剥离进程'), PWideChar('提示'), 0);
        ShowMeg('过程销毁，剥离进程');
        ShowMeg(Res.ToString);
      end;
    DLL_THREAD_ATTACH:
      begin
        ShowMeg('线程附加，初始化');
        ShowMeg(Res.ToString);
      end;
    DLL_THREAD_DETACH:
      begin
        ShowMeg('线程销毁，剥离进程');
        ShowMeg(Res.ToString);
      end;
  end;

end;

begin
//  Application.MessageBox(PWideChar('执行成功'), PWideChar('提示'), 0);
  //ShowMeg('前');
  DllProc := @MyExit;
  MyExit(DLL_PROCESS_ATTACH); //如果是单纯的释放，不需要调用
  //ShowMeg('后');
end.

