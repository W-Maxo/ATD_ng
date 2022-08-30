object MainTimeForm: TMainTimeForm
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1074#1088#1077#1084#1077#1085#1080
  ClientHeight = 289
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClick = FormClick
  PixelsPerInch = 96
  TextHeight = 13
  object RzClockStatus1: TRzClockStatus
    Left = 18
    Top = 263
    Alignment = taCenter
  end
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = 8
    Width = 329
    Height = 241
    TabOrder = 0
    object RzStatusPane1: TRzStatusPane
      Left = 10
      Top = 16
      Width = 305
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Alignment = taCenter
    end
    object RzCalendar1: TRzCalendar
      Left = 10
      Top = 42
      Width = 143
      Height = 159
      OnChange = RzCalendar1Change
      BorderOuter = fsLowered
      TabOrder = 0
    end
    object RzTimePicker1: TRzTimePicker
      Left = 159
      Top = 42
      Width = 156
      Height = 190
      RestrictMinutes = True
      ShowTime = False
      OnChange = RzTimePicker1Change
      TabOrder = 1
      Touch.ParentTabletOptions = False
      Touch.TabletOptions = [toPressAndHold, toSmoothScrolling]
    end
    object AdvSpinEdit1: TAdvSpinEdit
      Left = 39
      Top = 207
      Width = 89
      Height = 26
      AllowNullValue = False
      SpinType = sptTime
      Value = 0
      HexValue = 0
      SpinFlat = True
      Enabled = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      ShowSeconds = False
      TabOrder = 2
      Visible = True
      Version = '1.4.5.1'
      OnChange = AdvSpinEdit1Change
    end
  end
  object RzBitBtn1: TRzBitBtn
    Left = 248
    Top = 255
    Caption = 'OK'
    HotTrack = True
    TabOrder = 1
    ThemeAware = False
    OnClick = RzBitBtn1Click
    ImageIndex = 0
    Images = MainForm.ButtonImageList
  end
end
