object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 437
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 144
    Top = 288
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 144
    Top = 307
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 233
    Height = 57
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 256
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Carrega arq'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 256
    Top = 63
    Width = 361
    Height = 210
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button3: TButton
    Left = 424
    Top = 32
    Width = 193
    Height = 25
    Caption = 'Popula Classe'
    TabOrder = 3
    OnClick = Button3Click
  end
  object ListBox1: TListBox
    Left = 24
    Top = 96
    Width = 226
    Height = 177
    ItemHeight = 13
    TabOrder = 4
    OnClick = ListBox1Click
  end
  object Button4: TButton
    Left = 24
    Top = 279
    Width = 105
    Height = 25
    Caption = 'Mostra linha 50'
    TabOrder = 5
    OnClick = Button4Click
  end
end
