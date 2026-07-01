object frmRelProd: TfrmRelProd
  Left = 0
  Top = 0
  Caption = 'frmRelProd'
  ClientHeight = 780
  ClientWidth = 821
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object rlRel: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = dm.dsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    AfterPrint = rlRelAfterPrint
    BeforePrint = rlRelBeforePrint
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 35
      BandType = btTitle
      object RLLabel1: TRLLabel
        Left = 0
        Top = 0
        Width = 592
        Height = 35
        Align = faClient
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 592
        Top = 0
        Width = 126
        Height = 35
        Align = faRightMost
        Alignment = taRightJustify
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 73
      Width = 718
      Height = 40
      BandType = btColumnHeader
      object RLLabel2: TRLLabel
        Left = 3
        Top = 16
        Width = 44
        Height = 16
        Caption = 'C'#243'digo'
      end
      object RLLabel3: TRLLabel
        Left = 88
        Top = 16
        Width = 62
        Height = 16
        Caption = 'Descri'#231#227'o'
      end
      object RLLabel4: TRLLabel
        Left = 528
        Top = 16
        Width = 25
        Height = 16
        Caption = 'Qtd'
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 16
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLDBText1: TRLDBText
        Left = 3
        Top = 3
        Width = 44
        Height = 16
        DataField = 'CDPRODUTO'
        DataSource = dm.dsProdutos
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 88
        Top = 3
        Width = 62
        Height = 16
        DataField = 'DCPRODUTO'
        DataSource = dm.dsProdutos
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 528
        Top = 3
        Width = 81
        Height = 16
        DataField = 'QTESTOQUE'
        DataSource = dm.dsProdutos
        Text = ''
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 129
      Width = 718
      Height = 24
      BandType = btSummary
      object RLDBResult1: TRLDBResult
        Left = 528
        Top = 6
        Width = 120
        Height = 16
        DataField = 'QTESTOQUE'
        DataSource = dm.dsProdutos
        Holder = RLDBText3
        Info = riSum
        Text = ''
      end
      object RLLabel5: TRLLabel
        Left = 490
        Top = 5
        Width = 32
        Height = 16
        Caption = 'Total'
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 153
      Width = 718
      Height = 16
      BandType = btFooter
      object RLSystemInfo1: TRLSystemInfo
        Left = 0
        Top = 0
        Width = 718
        Height = 16
        Align = faClient
        Alignment = taCenter
        Info = itPageNumber
        Text = ''
      end
    end
  end
end
