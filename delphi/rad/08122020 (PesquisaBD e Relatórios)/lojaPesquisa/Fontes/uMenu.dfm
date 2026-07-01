object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 59
  ClientWidth = 222
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 24
    Top = 8
    object abelas1: TMenuItem
      Caption = 'Tabelas'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
      object Fornecedores1: TMenuItem
        Caption = 'Fornecedores'
        OnClick = Fornecedores1Click
      end
      object Vendedores1: TMenuItem
        Caption = 'Vendedores'
        OnClick = Vendedores1Click
      end
      object Produtos1: TMenuItem
        Caption = 'Produtos'
        OnClick = Produtos1Click
      end
    end
    object Pesquisas1: TMenuItem
      Caption = 'Pesquisas'
      object Consultar1: TMenuItem
        Caption = 'Consultar'
        OnClick = Consultar1Click
      end
    end
  end
end
