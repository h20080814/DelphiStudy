object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #36882#24402#28436#31034
  ClientHeight = 389
  ClientWidth = 274
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 80
    Width = 64
    Height = 13
    Caption = #36215#22987#30446#24405
  end
  object btn1: TButton
    Left = 8
    Top = 32
    Width = 75
    Height = 25
    Caption = #36882#24402#28436#31034
    TabOrder = 0
    OnClick = btn1Click
  end
  object mmo1: TMemo
    Left = 8
    Top = 160
    Width = 258
    Height = 221
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object btn2: TButton
    Left = 191
    Top = 32
    Width = 75
    Height = 25
    Caption = #36941#21382#25991#20214
    TabOrder = 2
    OnClick = btn2Click
  end
  object edt1: TEdit
    Left = 56
    Top = 77
    Width = 210
    Height = 21
    TabOrder = 3
    Text = 'G:\U'#30424#22791#20221
  end
  object dlgOpen1: TOpenDialog
    Left = 88
    Top = 32
  end
end
