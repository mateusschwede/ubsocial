object Form1: TForm1
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Form1'
  ClientHeight = 106
  ClientWidth = 120
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblCor: TLabel
    Left = 0
    Top = 0
    Width = 97
    Height = 13
    Caption = 'Cor'
  end
  object btnVermelho: TButton
    Left = 0
    Top = 19
    Width = 75
    Height = 25
    Caption = 'Vermelho'
    TabOrder = 0
    OnClick = btnVermelhoClick
  end
  object btnAmarelo: TButton
    Left = 0
    Top = 50
    Width = 75
    Height = 25
    Caption = 'Amarelo'
    TabOrder = 1
  end
  object btnVerde: TButton
    Left = 0
    Top = 81
    Width = 75
    Height = 25
    Caption = 'Verde'
    TabOrder = 2
  end
end
