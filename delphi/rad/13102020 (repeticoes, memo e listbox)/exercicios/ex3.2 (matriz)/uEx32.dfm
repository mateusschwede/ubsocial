object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 349
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtVal: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    Text = 'Valor'
  end
  object btnGerar: TButton
    Left = 135
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Gerar'
    TabOrder = 1
    OnClick = btnGerarClick
  end
  object lstRes: TListBox
    Left = 8
    Top = 39
    Width = 273
    Height = 302
    ItemHeight = 13
    TabOrder = 2
  end
end
