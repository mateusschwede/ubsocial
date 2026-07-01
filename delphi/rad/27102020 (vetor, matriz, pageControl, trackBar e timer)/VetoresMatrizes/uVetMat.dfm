object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Vetores / Matrizes e outros'
  ClientHeight = 797
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 72
    Top = 587
    Width = 37
    Height = 16
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 400
    Top = 120
    Width = 4
    Height = 16
  end
  object sgMat: TStringGrid
    Left = 56
    Top = 72
    Width = 265
    Height = 113
    ColCount = 4
    RowCount = 4
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
    TabOrder = 0
    ColWidths = (
      64
      57
      64
      64)
  end
  object BitBtn1: TBitBtn
    Left = 432
    Top = 545
    Width = 193
    Height = 58
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    Kind = bkClose
    Layout = blGlyphRight
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 1
  end
  object BitBtn2: TBitBtn
    Left = 56
    Top = 8
    Width = 265
    Height = 58
    Caption = 'Preencher valores'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    Kind = bkOK
    Layout = blGlyphRight
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object sgVet: TStringGrid
    Left = 56
    Top = 191
    Width = 529
    Height = 58
    ColCount = 10
    DefaultColWidth = 50
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
    TabOrder = 3
  end
  object btSoma: TBitBtn
    Left = 400
    Top = 152
    Width = 185
    Height = 25
    Caption = 'Soma dos elementos'
    TabOrder = 4
    OnClick = btSomaClick
  end
  object btAdd: TBitBtn
    Left = 56
    Top = 272
    Width = 121
    Height = 25
    Caption = 'Adiciona'
    TabOrder = 5
    OnClick = btAddClick
  end
  object ListBox1: TListBox
    Left = 56
    Top = 303
    Width = 121
    Height = 202
    TabOrder = 6
  end
  object PageControl1: TPageControl
    Left = 200
    Top = 272
    Width = 361
    Height = 249
    ActivePage = TabSheet1
    MultiLine = True
    TabOrder = 7
    TabPosition = tpLeft
    object TabSheet1: TTabSheet
      Caption = 'Calend'#225'rio'
      ExplicitLeft = 34
      object DateTimePicker1: TDateTimePicker
        Left = 32
        Top = 24
        Width = 186
        Height = 24
        Date = 44131.000000000000000000
        Time = 0.855575081019196700
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Bot'#227'o'
      ImageIndex = 1
      object BitBtn3: TBitBtn
        Left = 32
        Top = 40
        Width = 75
        Height = 25
        Caption = 'BitBtn3'
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Aba 3'
      ImageIndex = 2
      object StringGrid1: TStringGrid
        Left = 16
        Top = 16
        Width = 320
        Height = 120
        TabOrder = 0
      end
    end
  end
  object TrackBar1: TTrackBar
    Left = 64
    Top = 545
    Width = 313
    Height = 45
    Max = 70
    Min = 8
    Position = 8
    TabOrder = 8
    TickMarks = tmTopLeft
    OnChange = TrackBar1Change
  end
  object ProgressBar1: TProgressBar
    Left = 400
    Top = 32
    Width = 185
    Height = 21
    TabOrder = 9
  end
  object Button1: TButton
    Left = 400
    Top = 1
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 10
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 360
    Top = 88
    Width = 97
    Height = 17
    Caption = 'Liga Rel'#243'gio'
    TabOrder = 11
    OnClick = CheckBox1Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 352
    Top = 112
  end
end
