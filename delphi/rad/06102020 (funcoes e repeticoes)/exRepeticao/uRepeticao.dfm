object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 63
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblRes: TLabel
    Left = 8
    Top = 39
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object btnWhile: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'While Do'
    TabOrder = 0
    OnClick = btnWhileClick
  end
  object BtnRepeat: TButton
    Left = 89
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Repeat Until'
    TabOrder = 1
    OnClick = BtnRepeatClick
  end
  object edtVal: TEdit
    Left = 184
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Valor'
  end
end
