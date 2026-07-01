object Form1: TForm1
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Ex2'
  ClientHeight = 71
  ClientWidth = 169
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
    Width = 169
    Height = 13
    Caption = 'Resposta'
    OnClick = bntSalvarClick
  end
  object edtTexto: TEdit
    Left = 0
    Top = 19
    Width = 169
    Height = 21
    TabOrder = 0
    Text = 'Texto aqui...'
  end
  object btnSalvar: TButton
    Left = 0
    Top = 46
    Width = 74
    Height = 25
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = bntSalvarClick
  end
end
