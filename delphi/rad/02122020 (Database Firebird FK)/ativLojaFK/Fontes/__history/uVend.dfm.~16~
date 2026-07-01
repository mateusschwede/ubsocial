object frmVend: TfrmVend
  Left = 0
  Top = 0
  Caption = 'Vendedores'
  ClientHeight = 125
  ClientWidth = 285
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pVend2: TPanel
    Left = 0
    Top = 90
    Width = 285
    Height = 35
    Align = alBottom
    TabOrder = 0
    object btInserir: TBitBtn
      Left = 8
      Top = 6
      Width = 49
      Height = 25
      Caption = 'Inserir'
      TabOrder = 0
      OnClick = btInserirClick
    end
    object btEditar: TBitBtn
      Left = 63
      Top = 6
      Width = 49
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btEditarClick
    end
    object btExcluir: TBitBtn
      Left = 118
      Top = 6
      Width = 43
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btExcluirClick
    end
    object btCancelar: TBitBtn
      Left = 167
      Top = 6
      Width = 50
      Height = 25
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 3
      OnClick = btCancelarClick
    end
    object btConfirmar: TBitBtn
      Left = 223
      Top = 6
      Width = 58
      Height = 25
      Caption = 'Confirmar'
      Enabled = False
      TabOrder = 4
      OnClick = btConfirmarClick
    end
  end
  object pVend: TPanel
    Left = 0
    Top = 0
    Width = 285
    Height = 90
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit2
    end
    object DBText1: TDBText
      Left = 8
      Top = 25
      Width = 65
      Height = 17
      DataField = 'CDVENDEDOR'
      DataSource = dm.dsVendedores
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 64
      Width = 129
      Height = 21
      DataField = 'DCVENDEDOR'
      DataSource = dm.dsVendedores
      TabOrder = 0
    end
    object DBNavigator1: TDBNavigator
      Left = 153
      Top = 2
      Width = 128
      Height = 25
      DataSource = dm.dsVendedores
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 1
    end
    object btSair: TBitBtn
      Left = 254
      Top = 59
      Width = 27
      Height = 25
      Caption = 'Sair'
      TabOrder = 2
      OnClick = btSairClick
    end
  end
end
