object frmSkins: TfrmSkins
  Left = 0
  Top = 0
  Caption = 'Teste com Skins'
  ClientHeight = 375
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 633
    Height = 49
    Align = alTop
    TabOrder = 0
    DesignSize = (
      633
      49)
    object Label1: TLabel
      Left = 410
      Top = 16
      Width = 24
      Height = 16
      Anchors = [akTop, akRight]
      Caption = 'Skin'
    end
    object cmbSkins: TComboBox
      Left = 440
      Top = 13
      Width = 185
      Height = 24
      Style = csDropDownList
      Anchors = [akTop, akRight]
      TabOrder = 0
      OnChange = cmbSkinsChange
    end
  end
  object mmTxt: TMemo
    Left = 0
    Top = 49
    Width = 633
    Height = 326
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 488
    Top = 56
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Abrir1: TMenuItem
        Caption = 'Abrir'
        ShortCut = 16449
        OnClick = Abrir1Click
      end
      object Salvar1: TMenuItem
        Caption = 'Salvar'
        ShortCut = 16467
        OnClick = Salvar1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        ShortCut = 32883
        OnClick = Sair1Click
      end
    end
    object Editar1: TMenuItem
      Caption = 'Editar'
      object Copiar1: TMenuItem
        Caption = 'Copiar'
        ShortCut = 16451
        OnClick = Copiar1Click
      end
      object Colar1: TMenuItem
        Caption = 'Colar'
        ShortCut = 16470
        OnClick = Colar1Click
      end
      object Recortar1: TMenuItem
        Caption = 'Recortar'
        ShortCut = 16472
        OnClick = Recortar1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object ools1: TMenuItem
        Caption = 'Tools'
        object Limpar1: TMenuItem
          Caption = 'Limpar'
          ShortCut = 16452
          OnClick = Limpar1Click
        end
      end
    end
    object Formatar1: TMenuItem
      Caption = 'Formatar'
      object Fonte1: TMenuItem
        Caption = 'Fonte'
        OnClick = Fonte1Click
      end
    end
    object Utilitrios1: TMenuItem
      Caption = 'Utilit'#225'rios'
      object Contarcaracteres1: TMenuItem
        Caption = 'Contar caracteres'
        OnClick = Contarcaracteres1Click
      end
      object ConvMAISCULAS1: TMenuItem
        Caption = 'Conv. MAI'#218'SCULAS'
        OnClick = ConvMAISCULAS1Click
      end
      object ConvMinsculas1: TMenuItem
        Caption = 'Conv. min'#250'sculas'
        OnClick = ConvMinsculas1Click
      end
    end
    object Sobre1: TMenuItem
      Caption = 'Sobre'
      OnClick = Sobre1Click
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.TXT'
    Filter = 
      'Arquivos Texto|*.txt|Arquivos em Lote|*.BAT|Arquivos Delphi|*.PA' +
      'S|Formul'#225'rios Delphi|*.DFM'
    Title = 'Abrir Arquivo'
    Left = 344
    Top = 56
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.TXT'
    Filter = 
      'Arquivos Texto|*.txt|Arquivos em Lote|*.BAT|Arquivos Delphi|*.PA' +
      'S|Formul'#225'rios Delphi|*.DFM'
    Title = 'Salvar Arquivo'
    Left = 416
    Top = 56
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 560
    Top = 56
  end
end
