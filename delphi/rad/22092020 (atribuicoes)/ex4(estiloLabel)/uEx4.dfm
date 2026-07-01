object Form1: TForm1
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Form1'
  ClientHeight = 137
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
  object lblTexto: TLabel
    Left = 0
    Top = 0
    Width = 28
    Height = 13
    Caption = 'Texto'
    Transparent = False
  end
  object btnFundo: TButton
    Left = 0
    Top = 19
    Width = 75
    Height = 25
    Caption = 'Fundo'
    TabOrder = 0
    OnClick = btnFundoClick
  end
  object btnCor: TButton
    Left = 0
    Top = 50
    Width = 75
    Height = 25
    Caption = 'Cor'
    TabOrder = 1
    OnClick = btnCorClick
  end
  object btnFonte: TButton
    Left = 0
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Fonte'
    TabOrder = 2
    OnClick = btnFonteClick
  end
  object btnTamanho: TButton
    Left = 0
    Top = 81
    Width = 75
    Height = 25
    Caption = 'Tamanho'
    TabOrder = 3
    OnClick = btnTamanhoClick
  end
end
