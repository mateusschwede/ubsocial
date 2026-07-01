object frmDemoMatProcFunc: TfrmDemoMatProcFunc
  Left = 325
  Top = 186
  Caption = 'Matrizes'
  ClientHeight = 488
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 507
    Height = 447
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object tsMatrizes: TTabSheet
      Caption = 'Opera'#231#245'es com Matrizes'
      object sgMat: TStringGrid
        Left = 8
        Top = 8
        Width = 281
        Height = 281
        ColCount = 11
        DefaultColWidth = 24
        RowCount = 11
        TabOrder = 0
      end
      object btGera: TBitBtn
        Left = 352
        Top = 136
        Width = 97
        Height = 25
        Caption = 'Gerar Valores'
        TabOrder = 1
        OnClick = btGeraClick
      end
      object rgVis: TRadioGroup
        Left = 8
        Top = 296
        Width = 297
        Height = 105
        Caption = '[ Visualiza'#231#245'es ]'
        Columns = 2
        Items.Strings = (
          'Diagonal Principal (DP)'
          'Diagonal Secund'#225'ria (DS)'
          'Acima DP'
          'Abaixo DP'
          'Acima DS'
          'Abaixo DS'
          'Acima DP / Acima DS'
          'Acima DP / Abaixo DS'
          'Abaixo DP / Acima DS'
          'Abaixo DP / Abaixo DS')
        TabOrder = 2
        OnClick = rgVisClick
      end
    end
    object tsPlanilha: TTabSheet
      Caption = 'Planilha'
      ImageIndex = 1
      object btValores: TBitBtn
        Left = 8
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Valores'
        TabOrder = 0
        OnClick = btValoresClick
      end
      object sgPlan: TStringGrid
        Left = 8
        Top = 48
        Width = 265
        Height = 281
        DefaultColWidth = 50
        DefaultRowHeight = 20
        RowCount = 13
        TabOrder = 1
      end
      object sgPlan1: TStringGrid
        Left = 8
        Top = 328
        Width = 265
        Height = 89
        DefaultColWidth = 50
        DefaultRowHeight = 20
        RowCount = 4
        FixedRows = 0
        TabOrder = 2
      end
      object sgPlan2: TStringGrid
        Left = 280
        Top = 48
        Width = 209
        Height = 281
        ColCount = 4
        DefaultColWidth = 50
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 13
        TabOrder = 3
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Quadrado M'#225'gico'
      ImageIndex = 2
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 499
        Height = 73
        Align = alTop
        TabOrder = 0
        DesignSize = (
          499
          73)
        object TrackBar1: TTrackBar
          Left = 1
          Top = 1
          Width = 497
          Height = 32
          Align = alTop
          Max = 27
          Min = 1
          Frequency = 2
          Position = 5
          TabOrder = 0
          TickMarks = tmTopLeft
          OnChange = TrackBar1Change
        end
        object btGerarQuadMagico: TBitBtn
          Left = 420
          Top = 40
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Gerar'
          Default = True
          TabOrder = 1
          OnClick = btGerarQuadMagicoClick
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 73
        Width = 499
        Height = 346
        Align = alClient
        Caption = 'Panel3'
        TabOrder = 1
        object sgQM: TStringGrid
          Left = 1
          Top = 1
          Width = 497
          Height = 344
          Align = alClient
          ColCount = 1
          DefaultColWidth = 26
          DefaultRowHeight = 26
          FixedCols = 0
          RowCount = 1
          FixedRows = 0
          TabOrder = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Fun'#231#245'es'
      ImageIndex = 3
      object Label1: TLabel
        Left = 48
        Top = 32
        Width = 7
        Height = 13
        Caption = 'P'
      end
      object Label2: TLabel
        Left = 48
        Top = 72
        Width = 8
        Height = 13
        Caption = 'N'
      end
      object lbRes: TLabel
        Left = 264
        Top = 40
        Width = 3
        Height = 13
      end
      object Label5: TLabel
        Left = 56
        Top = 7
        Width = 275
        Height = 13
        Caption = 'Digite os valores de P e N para serem combinados entre si'
      end
      object edP: TEdit
        Left = 56
        Top = 32
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object edN: TEdit
        Left = 56
        Top = 64
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object btCombinar: TButton
        Left = 184
        Top = 32
        Width = 75
        Height = 25
        Caption = 'Combinar'
        TabOrder = 2
        OnClick = btCombinarClick
      end
      object btPrimo: TButton
        Left = 184
        Top = 64
        Width = 75
        Height = 25
        Hint = 'Verifica se um n'#250'mero '#233' primo'
        Caption = 'Primo'
        TabOrder = 3
        OnClick = btPrimoClick
      end
      object btPar: TButton
        Left = 184
        Top = 96
        Width = 75
        Height = 25
        Caption = 'Par'
        TabOrder = 4
        OnClick = btParClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 507
    Height = 41
    Align = alTop
    TabOrder = 1
    DesignSize = (
      507
      41)
    object lbNome: TLabel
      Left = 6
      Top = 4
      Width = 6
      Height = 31
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
    end
    object cbAuto: TCheckBox
      Left = 412
      Top = 8
      Width = 81
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Autom'#225'tico'
      TabOrder = 0
      OnClick = cbAutoClick
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 464
    Top = 72
  end
end
