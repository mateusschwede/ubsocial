object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 201
  ClientWidth = 331
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblSinal: TLabel
    Left = 8
    Top = 8
    Width = 22
    Height = 13
    Caption = 'Sinal'
  end
  object btnVerde: TButton
    Left = 8
    Top = 27
    Width = 75
    Height = 25
    Caption = 'Verde'
    TabOrder = 0
  end
  object btnAmarelo: TButton
    Left = 8
    Top = 58
    Width = 75
    Height = 25
    Caption = 'Amarelo'
    TabOrder = 1
  end
  object btnVermelho: TButton
    Left = 8
    Top = 89
    Width = 75
    Height = 25
    Caption = 'Vermelho'
    TabOrder = 2
    OnClick = btnVermelhoClick
  end
end
