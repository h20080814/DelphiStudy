unit Unit1;
{
JSON:
定义：
  1、指的是JavaScript对象表示法（JavaScript Object Notation）.
      是轻量级的文本数据交换格式。
  2、JSON使用JavaScript语法来描述数据对象，但是JSON仍然独立于语言和
      平台。
  3、JSON解析器和JSON库支持许多不同的编程语言。
语法规则
  1、数据在名称/值对中
  2、数据由逗号分隔
  3、花括号保存对象；方括号保存数组 ；字符串在双引号中；数字；逻辑值；nul
格式
  名称/值对   包括字段名称（在双引号中），后面写一个冒号，然后是值：例如 "firstname":"Json"


}

interface

uses
  System.JSON, System.Generics.Collections, System.TypInfo, Unit2, System.JSON.Serializers,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    mmo1: TMemo;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
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
var
  UseJson: string;
  Serializer: TJsonSerializer;
  Student: TStudent;
begin
  UseJson := '{"Name":"小包","Age":18}';  //字符串类型的JSON对象
  Serializer := TJsonSerializer.Create;
  Student := Serializer.Deserialize<TStudent>(UseJson); //Deserialize反序列化,把JSON对象转换为Delphi对象
  //Student:=Serializer.Deserialize(UseJson);
  //ShowMessage(UseJson);
  Self.mmo1.Lines.Add('反序列化' + ',' + Student.Name + ',' + Student.Age.ToString);

end;

procedure TForm1.btn2Click(Sender: TObject);
var
  UseJson: string;
  Serializer: TJsonSerializer;
  Student: TStudent;
begin
//创建Delphi对象
  Student := TStudent.Create();
  Student.Name := '小小';
  Student.Age := 34;
  //Self.mmo1.Lines.Add('序列化, '+Student.Name+', '+Student.Age.ToString);
//创建序列化对象
  Serializer := TJsonSerializer.Create();
 //序列化
   //Serializer.Serialize<TStudent>(Student);
  Self.mmo1.Lines.Add('序列化, ' + Serializer.Serialize<TStudent>(Student));
end;

procedure TForm1.btn3Click(Sender: TObject);
var
  UseJson: string;
  Student: TStudent;
  List: TList<TStudent>;
  Serializer: TJsonSerializer;
begin
  //UseJson := '{[{"Name":"小包","Age":18},{"Name":"小蒂","Age":38}]}';  //字符串类型的JSON对象
  //创建Delphi对象
  List := TList<TStudent>.Create;
  List.Add(TStudent.Create('小白', 23));
  List.Add(TStudent.Create('小何', 45));
  Serializer := TJsonSerializer.Create();
  Self.mmo1.Lines.Add('序列化' + Serializer.Serialize<TList<TStudent>>(List));

end;

procedure TForm1.btn4Click(Sender: TObject);
var
  UseJson: string;
  List: TList<TStudent>;
  Serializer: TJsonSerializer;
  Stu: TStudent;
begin
  UseJson := '{"FListHelper":{"FCount":2},"FItems":[{"FName":"小白","FAge":23},{"FName":"小何","FAge":45}],"FComparer":{}}';
  Serializer := TJsonSerializer.Create();
  List := Serializer.Deserialize<TList<TStudent>>(UseJson);
  for Stu in List do begin
    Self.mmo1.Lines.Add('反序列化' + ',' + Stu.Name + ',' + Stu.Age.ToString);
  end;
  Self.mmo1.Lines.Add(TJSONObject.ParseJSONValue(UseJson).GetValue < TJSONObject > ('FListHelper').GetValue<string>('FCount'));
  Self.mmo1.Lines.Add(TJSONObject.ParseJSONValue(UseJson).GetValue < TJSONArray > ('FItems').Count.ToString);  //TJSONArray数组
end;

end.

