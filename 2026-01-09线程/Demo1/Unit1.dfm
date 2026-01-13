object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 234
  ClientWidth = 311
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 32
    Top = 16
    Width = 6
    Height = 13
    Caption = '0'
  end
  object btnStart: TButton
    Left = 24
    Top = 56
    Width = 75
    Height = 25
    Caption = #24320#22987#36816#31639
    TabOrder = 0
    OnClick = btnStartClick
  end
  object btnEnd: TButton
    Left = 144
    Top = 56
    Width = 75
    Height = 25
    Caption = #36824#21407#26631#31614
    TabOrder = 1
    OnClick = btnEndClick
  end
  object grpTThread: TGroupBox
    Left = 0
    Top = 96
    Width = 303
    Height = 137
    Caption = #22810#32447#31243#25511#21046
    TabOrder = 2
    object lbl2: TLabel
      Left = 32
      Top = 48
      Width = 16
      Height = 13
      Caption = 'lbl2'
    end
    object btnBegin: TButton
      Left = 216
      Top = 16
      Width = 75
      Height = 25
      Caption = #24320#22987
      TabOrder = 0
      OnClick = btnBeginClick
    end
    object btnPause: TButton
      Left = 216
      Top = 47
      Width = 75
      Height = 25
      Caption = #26242#20572
      TabOrder = 1
      OnClick = btnPauseClick
    end
    object btnContinue: TButton
      Left = 216
      Top = 78
      Width = 75
      Height = 25
      Caption = #32487#32493
      TabOrder = 2
      OnClick = btnContinueClick
    end
    object btnStop: TButton
      Left = 216
      Top = 109
      Width = 75
      Height = 25
      Caption = #20572#27490
      TabOrder = 3
      OnClick = btnStopClick
    end
  end
end
