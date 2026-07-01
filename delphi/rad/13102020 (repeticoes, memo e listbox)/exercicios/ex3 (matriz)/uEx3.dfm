object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 409
  ClientWidth = 454
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
    Text = 'Linhas'
  end
  object btnExec: TButton
    Left = 135
    Top = 6
    Width = 75
    Height = 25
    Caption = 'Gerar'
    TabOrder = 1
    OnClick = btnExecClick
  end
  object lstMatriz: TListBox
    Left = 8
    Top = 48
    Width = 431
    Height = 345
    ItemHeight = 13
    TabOrder = 2
  end
end
