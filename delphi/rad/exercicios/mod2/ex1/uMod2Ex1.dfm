object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'ex1'
  ClientHeight = 76
  ClientWidth = 186
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cbxCheck: TCheckBox
    Left = 56
    Top = 16
    Width = 75
    Height = 17
    Caption = 'Check'
    Enabled = False
    TabOrder = 0
  end
  object btnCheck: TButton
    Left = 89
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Check'
    TabOrder = 1
    OnClick = btnCheckClick
  end
  object btnUncheck: TButton
    Left = 8
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Uncheck'
    TabOrder = 2
    OnClick = btnUncheckClick
  end
end
