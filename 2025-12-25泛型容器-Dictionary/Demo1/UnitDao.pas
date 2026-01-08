unit UnitDao;

interface

uses
  Vcl.Dialogs, Unit2, System.Generics.Collections;

type
  TDao = class
  public
    class procedure Add(student: TStudent); //添加过程，类过程，class方法调用时不需要创建对象
    class function ListStu(): TDictionary<string, TStudent>;
    class procedure DelStu();
  end;

implementation

var
  Students: TDictionary<string, TStudent>; //全局容器，存放学生信息

{ TDao }

class procedure TDao.Add(student: TStudent);
begin

  if not Students.ContainsKey(student.Id) then begin
    Students.Add(student.Id, student);
    ShowMessage('保存成功');
  end
  else begin
    ShowMessage('该信息已存在');
  end;

end;

class procedure TDao.DelStu;
begin
  Students.Clear;
end;

class function TDao.ListStu: TDictionary<string, TStudent>;
begin
  Result := Students;
end;

initialization
  Students := TDictionary<string, TStudent>.Create();

end.

