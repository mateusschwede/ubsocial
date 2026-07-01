object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'MatAtiv2'
  ClientHeight = 585
  ClientWidth = 357
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
    Text = 'Quantidade'
  end
  object lstRes2: TListBox
    Left = 8
    Top = 39
    Width = 330
    Height = 542
    ItemHeight = 13
    TabOrder = 1
  end
  object btnGerar: TButton
    Left = 135
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Gerar'
    TabOrder = 2
    OnClick = btnGerarClick
  end
end
