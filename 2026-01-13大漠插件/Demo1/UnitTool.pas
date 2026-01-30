unit UnitTool;

interface
 {
 在windows下，可以用系统提供的regsvr32工具注册和卸载COM组件：
  注册：regsvr32 文件名
  卸载：regsvr32 /u 文件名
 COM组件一般存在于动态链接库中，库文件扩展名为dll,ocx,ax(音频和视频的Filter)等。
 必须导出以下4个函数：
  function DLLGetClassObject(const CLSID,IID,TGUID;var Obj):HResult;stdcall;
  function DLLCanUnloadNow:HResult;stdcall;
  function DLLRegisterServer:HResult;stdcall;
  function DLLUnregisterServer:HResult;stdcall;
 regsvr32就是调用组件库导出的DLLRegisterServer函数来注册组件，调用DLLUnregisterServer来
 卸载组件，实际上注册就是在系统注册表里写入一些信息，卸载时删除这些信息。
 }

uses
  System.Win.ComObj, Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL,
  Vcl.Graphics, Vcl.OleServer, Dm_TLB, Winapi.ActiveX;

//将DLL信息添加（删除）到注册表
function OLERegister(sOleFileName: string; OleAction: Byte): Boolean;
//创建com对象（大漠对象）

function CreateComObjectFromDLL(CLSID: TGUID; DllHandle: THandle): IUnknown;

implementation

function OLERegister(sOleFileName: string; OleAction: Byte): Boolean;
const
  RegisterOle = 1;  //注册
  UnRegisterOle = 0;  //卸载
type
  TOleRegisterFunction = function: HRESULT;  //注册或卸载函数原型
var
  hLibraryHadle: THandle;  //由LoadLibray返回的DLL或ocx句柄
  hFunctionAddress: TFarProc;  //DLL或ocx中的函数句柄，由GetProAddress返回
  RegFunction: TOleRegisterFunction;  //注册或卸载函数指针
begin
  Result := False;
  //打开文件，返回DLL或ocx句柄
  hLibraryHadle := LoadLibrary(PChar(sOleFileName));
  if (hLibraryHadle > 0) then  //DLLakg OCX句柄正确
  try
  //返回注册或卸载函数指针
    if (OleAction = RegisterOle) then  //返回注册函数指针
    begin
      hFunctionAddress := GetProcAddress(hLibraryHadle, PAnsiChar('DLLRegisterSever'));
    end
    else begin
      hFunctionAddress := GetProcAddress(hLibraryHadle, PAnsiChar('DLLUnRegisterSever'));
    end;
    if (hFunctionAddress <> nil) then begin  //判断注册或卸载函数是否存在
      RegFunction := TOleRegisterFunction(hFunctionAddress); //获得操作函数的指针
      if RegFunction >= 0 then begin  //执行注册或卸载操作，返回值>=0表示成功
        Result := True;
      end;
    end;
  finally
    FreeLibrary(hLibraryHadle);  //关闭已打开的文件

  end;
end;

function CreateComObjectFromDLL(CLSID: TGUID; DllHandle: THandle): IUnknown;
var
  Factory: IClassFactory;
  hr: HRESULT;
  DllGetClassObject: function(const CLSID, IID: TGUID; var Obj): HResult; stdcall;
begin
  DllGetClassObject := GetProcAddress(DllHandle, 'DllGetClassObject');
  if Assigned(DllGetClassObject) then begin  //如果DllGetClassObject获取的对象为空
    hr := DllGetClassObject(CLSID, IClassFactory, Factory);
    if hr = S_OK then begin
      Factory.CreateInstance(nil, IUnknown, Result); //创建
    end;

  end;
end;

end.

