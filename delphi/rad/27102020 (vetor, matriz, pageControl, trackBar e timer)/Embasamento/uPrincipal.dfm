object frmPrincipal: TfrmPrincipal
  Left = 252
  Top = 137
  Caption = 'In'#237'cio'
  ClientHeight = 164
  ClientWidth = 368
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -29
  Font.Name = 'Arial Narrow'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 33
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 179
    Height = 33
    Caption = 'Digite seu nome:'
  end
  object edNome: TEdit
    Left = 8
    Top = 64
    Width = 241
    Height = 41
    TabOrder = 0
  end
  object btExec: TButton
    Left = 256
    Top = 64
    Width = 105
    Height = 41
    Caption = 'Executar'
    Default = True
    TabOrder = 1
    OnClick = btExecClick
  end
end
