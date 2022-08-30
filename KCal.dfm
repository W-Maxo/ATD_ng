object KCalForm: TKCalForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #1050#1072#1083#1080#1073#1088#1086#1074#1082#1072
  ClientHeight = 419
  ClientWidth = 658
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShortCut = FormShortCut
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = 8
    Width = 641
    Height = 372
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 0
    object Label4: TLabel
      Left = 15
      Top = 16
      Width = 85
      Height = 13
      Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Chart1: TChart
      Left = 231
      Top = 10
      Width = 402
      Height = 351
      Legend.MaxNumRows = 0
      Legend.Visible = False
      Title.Text.Strings = (
        'TChart')
      Title.Visible = False
      BottomAxis.Logarithmic = True
      BottomAxis.MaximumOffset = 1
      BottomAxis.MinimumOffset = 1
      BottomAxis.Title.Caption = 'c(K+) mkM'
      BottomAxis.Title.Font.Style = [fsBold]
      DepthAxis.Automatic = False
      DepthAxis.AutomaticMaximum = False
      DepthAxis.AutomaticMinimum = False
      DepthTopAxis.Automatic = False
      DepthTopAxis.AutomaticMaximum = False
      DepthTopAxis.AutomaticMinimum = False
      LeftAxis.LabelsFont.Style = [fsBold]
      LeftAxis.MaximumOffset = 1
      LeftAxis.MinimumOffset = 1
      LeftAxis.Title.Caption = 'mV'
      LeftAxis.Title.Font.Style = [fsBold]
      View3D = False
      TabOrder = 0
      OnResize = Chart1Resize
      ColorPaletteIndex = 13
      object RzToolButton1: TRzToolButton
        Left = 8
        Top = 4
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        GradientColorStyle = gcsSystem
        ImageIndex = 36
        Images = MainForm.MenuImageList
        Layout = blGlyphBottom
        UseToolbarButtonLayout = False
        UseToolbarButtonSize = False
        UseToolbarVisualStyle = False
        VisualStyle = vsClassic
        OnClick = RzToolButton1Click
      end
      object RzSpinButtons1: TRzSpinButtons
        Left = 0
        Top = 160
        Width = 14
        Height = 25
        Flat = True
        OnDownLeftClick = RzSpinButtons1DownLeftClick
        OnUpRightClick = RzSpinButtons1UpRightClick
        TabOrder = 0
      end
      object RzSpinButtons2: TRzSpinButtons
        Left = 0
        Top = 335
        Width = 26
        Height = 14
        Direction = sdLeftRight
        Flat = True
        Orientation = orHorizontal
        OnDownLeftClick = RzSpinButtons2DownLeftClick
        OnUpRightClick = RzSpinButtons2UpRightClick
        TabOrder = 1
      end
      object Series1: TFastLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        SeriesColor = clRed
        LinePen.Color = clRed
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object ChartTool1: TAntiAliasTool
      end
      object ChartTool2: TFullScreenTool
      end
    end
    object TRzGroupBox
      Left = 8
      Top = 40
      Width = 217
      Height = 321
      TabOrder = 1
      object RzBitBtn3: TRzBitBtn
        Left = 72
        Top = 16
        Width = 25
        HotTrack = True
        TabOrder = 0
        OnClick = RzBitBtn3Click
        ImageIndex = 18
        Images = MainForm.ButtonImageList
        Margin = 0
        Spacing = 0
      end
      object RzBitBtn4: TRzBitBtn
        Left = 119
        Top = 16
        Width = 25
        Enabled = False
        HotTrack = True
        TabOrder = 1
        ImageIndex = 2
        Images = MainForm.ButtonImageList
        Margin = 0
        Spacing = 0
      end
      object RzListView1: TRzListView
        Left = 8
        Top = 47
        Width = 200
        Height = 266
        Checkboxes = True
        Columns = <>
        FrameVisible = True
        HotTrack = True
        TabOrder = 2
        ViewStyle = vsList
        OnCheckStateChange = RzListView1CheckStateChange
        OnClick = RzListView1Click
        OnCustomDrawItem = RzListView1CustomDrawItem
      end
    end
    object RzSpinEdit1: TRzSpinEdit
      Left = 127
      Top = 13
      Width = 70
      Height = 21
      AllowKeyEdit = True
      CheckRange = True
      Decimals = 2
      Increment = 0.010000000000000000
      IntegersOnly = False
      PageSize = 1.000000000000000000
      Value = 20.000000000000000000
      FlatButtons = True
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 2
    end
  end
  object RzBitBtn5: TRzBitBtn
    Left = 566
    Top = 386
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 1
    ThemeAware = False
    OnClick = RzBitBtn5Click
    ImageIndex = 0
    Images = MainForm.ButtonImageList
  end
  object RzBitBtn1: TRzBitBtn
    Left = 16
    Top = 386
    Width = 89
    Caption = #1069#1082#1089#1087#1086#1088#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 2
    ThemeAware = False
    OnClick = RzBitBtn1Click
    ImageIndex = 11
    Images = MainForm.MenuImageList
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 384
    Top = 128
  end
  object ChartExport: TChartEditor
    Chart = Chart1
    HideTabs = [cetMain, cetGeneral, cetAxis, cetTitles, cetLegend, cetPanel, cetPaging, cetWalls, cet3D, cetSeriesGeneral, cetSeriesMarks, cetAllSeries, cetSeriesData, cetExportNative, cetTools, cetPrintPreview]
    Options = [ceAdd, ceDelete, ceChange, ceClone, ceDataSource, ceTitle, ceGroupAll, ceOrderSeries, ceAskDelete]
    GalleryHeight = 0
    GalleryWidth = 0
    Height = 0
    Width = 0
    Left = 385
    Top = 177
  end
  object CustamizePopupMenu: TAdvPopupMenu
    MenuStyler = MainForm.AdvMenuOfficeStyler1
    Version = '2.5.3.1'
    Left = 382
    Top = 87
    object N19: TMenuItem
      Caption = #1045#1082#1089#1087#1086#1088#1090' '#1074' '#1073#1091#1092#1077#1088' '#1086#1073#1084#1077#1085#1072
    end
  end
end
