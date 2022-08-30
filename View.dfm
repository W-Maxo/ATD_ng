object ViewForm: TViewForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1040#1085#1072#1083#1080#1079' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 448
  ClientWidth = 555
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Chart1: TChart
    Left = 8
    Top = 56
    Width = 538
    Height = 305
    Legend.MaxNumRows = 0
    Legend.Visible = False
    Title.Text.Strings = (
      '')
    Title.Visible = False
    BottomAxis.MaximumOffset = 3
    BottomAxis.MinimumOffset = 3
    BottomAxis.Title.Caption = #1084#1080#1085'.'
    LeftAxis.MaximumOffset = 3
    LeftAxis.MinimumOffset = 3
    View3D = False
    TabOrder = 0
    ColorPaletteIndex = 13
    object Series1: TFastLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      LinePen.Color = 10708548
      LinePen.Width = 4
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Line: TColorLineTool
      AllowDrag = False
      Draw3D = False
      Pen.Width = 3
      Value = 5.000000000000000000
      AxisID = 0
    end
  end
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = 367
    Width = 539
    Height = 44
    TabOrder = 1
    object RzBitBtn2: TRzBitBtn
      Left = 241
      Top = 12
      Width = 25
      HotTrack = True
      TabOrder = 0
      ThemeAware = False
      OnClick = RzBitBtn2Click
      OnMouseDown = RzBitBtn2MouseDown
      OnMouseUp = RzBitBtn2MouseUp
      ImageIndex = 32
      Images = MainForm.MenuImageList
      Margin = 0
    end
    object RzBitBtn1: TRzBitBtn
      Left = 272
      Top = 12
      Width = 25
      HotTrack = True
      TabOrder = 1
      ThemeAware = False
      OnClick = RzBitBtn1Click
      OnMouseDown = RzBitBtn1MouseDown
      OnMouseUp = RzBitBtn1MouseUp
      ImageIndex = 33
      Images = MainForm.MenuImageList
      Margin = 0
    end
  end
  object RzBitBtn3: TRzBitBtn
    Left = 464
    Top = 417
    Caption = 'OK'
    HotTrack = True
    TabOrder = 2
    ThemeAware = False
    OnClick = RzBitBtn3Click
    ImageIndex = 0
    Images = MainForm.ButtonImageList
  end
  object RzGroupBox2: TRzGroupBox
    Left = 8
    Top = 6
    Width = 539
    Height = 44
    TabOrder = 3
    object RzComboBox1: TRzComboBox
      Left = 11
      Top = 12
      Width = 97
      Height = 24
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      FlatButtons = True
      FrameVisible = True
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = 'pH'
      OnChange = RzComboBox1Change
      Items.Strings = (
        'pH'
        'K+')
      ItemIndex = 0
      Values.Strings = (
        '0'
        '1')
    end
  end
end
