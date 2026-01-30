unit UnitMainFrm;
{
IO单元IOUnits
  绝对路径：以盘符为起点到达目标文件经过的文件夹称为绝对路径
  相对路径：以当前文件所在的位置为起点到达目标文件经过的文件夹称为相对路径
            ./(当前目录)../(上级目录)/xxx(目标文件名)
  递归：方法内部自己调用自己的方法名

}

interface

uses
  System.Types, System.IOUtils, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    mmo1: TMemo;
    btn2: TButton;
    lbl1: TLabel;
    edt1: TEdit;
    dlgOpen1: TOpenDialog;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    procedure ListFileName(FilePath: string);
    procedure ListDirName(DirPath: string);
    { Private declarations }
  public
    { Public declarations }
    //递归演示 过程：数字累加，声明过程
    procedure ProRecursion(i: Integer);
    //递归演示 函数：数字累加，声明过程
    function FunRecursion(i: Integer): Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
//  ProRecursion(0);   //调用过程
  ShowMessage('函数返回值：' + FunRecursion(0).ToString); //调用函数
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
//获取当前目录下的所有文件
  ListFileName(Self.edt1.Text);
 //获取当前目录下的所有文件夹
  ListDirName(Self.edt1.Text);
end;

//递归演示 函数实现，数字累加，递归方法一定要有出口否则出现死循环
function TForm1.FunRecursion(i: Integer): Integer;
begin
  ShowMessage('内部 i ，' + i.ToString);
  i := i + 1;
  if i < 10 then begin
    Result := FunRecursion(i);
  end
  else begin
    Result := i;
  end;
       //返回值
end;

procedure TForm1.ListDirName(DirPath: string);
var
  DirList: TStringDynArray;
  DirFileName: string;
begin
  //获取当前目录下的所有文件夹
  DirList := TDirectory.GetDirectories(DirPath);
  //遍历，获取每个文件夹（路径）
  for DirFileName in DirList do begin
  //获取每个文件夹（路径）窗口上显示
    Self.mmo1.Lines.Add(DirFileName);
    //获取当前路径下所有文件
    ListFileName(DirFileName);
    //递归，继续获取（DirFileName）当前目录下的文件夹
    ListDirName(DirFileName);
  end;
end;

procedure TForm1.ListFileName(FilePath: string);
var
  FileList: TStringDynArray;
  FileName: string;
begin
  //获取某个路径下的所有文件
  FileList := TDirectory.GetFiles(FilePath);
  //遍历数组，获取文件信息
  for FileName in FileList do begin
    Self.mmo1.Lines.Add(FileName);
  end;
end;

//递归演示 过程实现，数字累加，递归方法一定要有出口否则出现死循环
procedure TForm1.ProRecursion(i: Integer);
begin
  ShowMessage(i.ToString);
  i := i + 1;
  if i < 10 then begin
    ProRecursion(i);
  end;
end;

end.

