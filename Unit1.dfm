object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 201
  ClientWidth = 324
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
  object img1: TImage
    Left = 8
    Top = 8
    Width = 201
    Height = 169
    Proportional = True
    Stretch = True
  end
  object btnLoad: TButton
    Left = 224
    Top = 8
    Width = 75
    Height = 25
    Caption = 'btnLoad'
    TabOrder = 0
    OnClick = btnLoadClick
  end
  object btnClear: TButton
    Left = 224
    Top = 39
    Width = 75
    Height = 25
    Caption = 'btnClear'
    TabOrder = 1
    OnClick = btnClearClick
  end
  object btnNewLoad: TButton
    Left = 224
    Top = 152
    Width = 75
    Height = 25
    Caption = 'NewLoad'
    TabOrder = 2
    OnClick = btnNewLoadClick
  end
  object oDlg: TOpenDialog
    Left = 272
    Top = 96
  end
end
