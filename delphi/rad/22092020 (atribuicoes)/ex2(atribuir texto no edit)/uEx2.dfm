object Form1: TForm1
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Form1'
  ClientHeight = 71
  ClientWidth = 121
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblResposta: TLabel
    Left = 0
    Top = 0
    Width = 45
    Height = 13
    Caption = 'Resposta'
  end
  object edtTexto: TEdit
    Left = 0
    Top = 19
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Texto aqui'
  end
  object btnExecutar: TButton
    Left = 0
    Top = 46
    Width = 75
    Height = 25
    Caption = 'Executar'
    TabOrder = 1
    OnClick = btnExecutarClick
  end
end
