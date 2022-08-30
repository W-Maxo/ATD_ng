object ArchivingForm: TArchivingForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1040#1088#1093#1080#1074#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 443
  ClientWidth = 434
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
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = 8
    Width = 417
    Height = 427
    TabOrder = 0
    object RzProgressStatus1: TRzProgressStatus
      Left = 8
      Top = 369
      Width = 401
      ParentShowHint = False
      BarStyle = bsGradient
      PartsComplete = 0
      Percent = 0
      ShowPercent = True
      TotalParts = 0
    end
    object RzProgressStatus2: TRzProgressStatus
      Left = 8
      Top = 327
      Width = 401
      ParentShowHint = False
      BarStyle = bsGradient
      PartsComplete = 0
      Percent = 0
      ShowPercent = True
      TotalParts = 0
    end
    object Пароль: TRzLabel
      Left = 8
      Top = 279
      Width = 37
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100
    end
    object RzLabel1: TRzLabel
      Left = 16
      Top = 312
      Width = 87
      Height = 13
      Caption = #1054#1073#1097#1080#1081' '#1087#1088#1086#1075#1088#1077#1089#1089':'
    end
    object RzLabel2: TRzLabel
      Left = 16
      Top = 352
      Width = 78
      Height = 13
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1092#1072#1081#1083':'
    end
    object RzCheckList1: TRzCheckList
      Left = 8
      Top = 40
      Width = 401
      Height = 233
      DoubleBuffered = False
      FrameVisible = True
      ItemHeight = 17
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object RzButtonEdit1: TRzButtonEdit
      Left = 8
      Top = 13
      Width = 401
      Height = 21
      FrameVisible = True
      TabOrder = 1
      OnChange = RzButtonEdit1Change
      AltBtnWidth = 15
      ButtonWidth = 15
      FlatButtons = True
      OnButtonClick = RzButtonEdit1ButtonClick
    end
    object RzBitBtn1: TRzBitBtn
      Left = 167
      Top = 280
      Width = 122
      Caption = #1057#1085#1103#1090#1100' '#1074#1099#1076#1083#1077#1085#1080#1077
      HotTrack = True
      TabOrder = 2
      ThemeAware = False
      OnClick = RzBitBtn1Click
      ImageIndex = 17
      Images = MainForm.ButtonImageList
    end
    object RzBitBtn2: TRzBitBtn
      Left = 295
      Top = 280
      Width = 114
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1105
      HotTrack = True
      TabOrder = 3
      ThemeAware = False
      OnClick = RzBitBtn2Click
      ImageIndex = 16
      Images = MainForm.ButtonImageList
    end
    object RzBitBtn3: TRzBitBtn
      Left = 272
      Top = 395
      Width = 129
      Caption = #1040#1088#1093#1080#1074#1080#1088#1086#1074#1072#1085#1080#1077
      HotTrack = True
      TabOrder = 4
      ThemeAware = False
      OnClick = RzBitBtn3Click
      ImageIndex = 83
      Images = MainForm.MenuImageList
    end
    object RzEdit1: TRzEdit
      Left = 51
      Top = 279
      Width = 110
      Height = 21
      FrameVisible = True
      TabOrder = 5
    end
  end
  object RzSelectFolderDialog1: TRzSelectFolderDialog
    FrameVisible = True
    Left = 192
    Top = 120
  end
end
