unit Unit1;

interface

uses
  System.IOUtils, System.IniFiles, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    edtName: TEdit;
    rgSex: TRadioGroup;
    rbMan: TRadioButton;
    rbWoman: TRadioButton;
    lblSex: TLabel;
    lbl2: TLabel;
    edtAge: TEdit;
    grp1: TGroupBox;
    lbl3: TLabel;
    chkMoney: TCheckBox;
    chkPrograming: TCheckBox;
    lbl4: TLabel;
    cbbAddress: TComboBox;
    btnSave: TButton;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ConfigPath: string;

implementation

{$R *.dfm}

procedure TForm1.btnSaveClick(Sender: TObject);
var
  Inifile: TIniFile;
  Section: string;
begin
 //配置文件
  Section := '节，部分';
  Inifile := TIniFile.Create(ConfigPath);
  //Inifile.WriteString('aa', 'bb', 'cc');
  Inifile.WriteString(Section, 'edtName', edtName.Text);
  Inifile.WriteString(Section, 'edtAge', edtAge.Text);
  Inifile.WriteBool(Section, 'sex', rbMan.Checked);
  Inifile.WriteBool(Section, 'chkmoney', chkMoney.Checked);
  Inifile.WriteBool(Section, 'chkPrograming', chkPrograming.Checked);
  Inifile.WriteInteger(Section, 'Address', cbbAddress.ItemIndex);

end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Inifile: TIniFile;
begin
  ConfigPath := TDirectory.GetCurrentDirectory() + '\' + 'UserConfig.ini';
  Inifile := TIniFile.Create(ConfigPath);
  edtName.Text := Inifile.ReadString('节，部分', 'edtName', '');
  edtAge.Text := Inifile.ReadString('节，部分', 'edtAge', '');
  rbMan.Checked := Inifile.ReadBool('节，部分', 'sex', False);
  rbWoman.Checked := not rbMan.Checked;
  chkMoney.Checked := Inifile.ReadBool('节，部分', 'chkmoney', false);
  chkPrograming.Checked := Inifile.ReadBool('节，部分', 'chkPrograming', False);
  cbbAddress.ItemIndex := Inifile.ReadInteger('节，部分', 'Address', 0);

end;

end.

