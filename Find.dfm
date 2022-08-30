object MainFindForm: TMainFindForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1086#1080#1089#1082
  ClientHeight = 445
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShortCut = FormShortCut
  PixelsPerInch = 96
  TextHeight = 13
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = 8
    Width = 505
    Height = 429
    TabOrder = 0
    object RzStatusPane1: TRzStatusPane
      Left = 8
      Top = 167
      Width = 489
    end
    object AdvWiiProgressBar1: TAdvWiiProgressBar
      Left = 427
      Top = 82
      Width = 45
      Height = 45
      Enabled = False
      Appearance.BlockBorderColorActive = clNone
      Appearance.BlockColor = 15650560
      Padding = 2
    end
    object RzListBox1: TRzListBox
      Left = 8
      Top = 193
      Width = 489
      Height = 224
      FrameVisible = True
      ItemHeight = 13
      TabOrder = 0
    end
    object RzBitBtn1: TRzBitBtn
      Left = 400
      Top = 16
      Width = 97
      Caption = #1055#1086#1080#1089#1082
      HotTrack = True
      TabOrder = 1
      ThemeAware = False
      OnClick = RzBitBtn1Click
      ImageIndex = 44
      Images = MainForm.MenuImageList
    end
    object RzBitBtn2: TRzBitBtn
      Left = 400
      Top = 47
      Width = 97
      Caption = #1042#1099#1093#1086#1076
      HotTrack = True
      TabOrder = 2
      ThemeAware = False
      OnClick = RzBitBtn2Click
      ImageIndex = 15
      Images = MainForm.MenuImageList
    end
    object RzGroupBox2: TRzGroupBox
      Left = 8
      Top = 8
      Width = 377
      Height = 153
      TabOrder = 3
      object RzLabel1: TRzLabel
        Left = 8
        Top = 12
        Width = 126
        Height = 13
        Caption = #1044#1080#1088#1077#1082#1090#1086#1088#1080#1103' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072':'
      end
      object RzLabel2: TRzLabel
        Left = 55
        Top = 125
        Width = 7
        Height = 13
        Caption = 'C'
        Enabled = False
      end
      object RzLabel3: TRzLabel
        Left = 195
        Top = 125
        Width = 12
        Height = 13
        Caption = #1087#1086
        Enabled = False
      end
      object RzButtonEdit1: TRzButtonEdit
        Left = 8
        Top = 31
        Width = 361
        Height = 21
        FrameVisible = True
        TabOrder = 0
        AltBtnWidth = 15
        ButtonWidth = 15
        FlatButtons = True
        OnButtonClick = RzButtonEdit1ButtonClick
      end
      object RzEdit1: TRzEdit
        Left = 8
        Top = 74
        Width = 361
        Height = 21
        Enabled = False
        FrameVisible = True
        TabOrder = 1
      end
      object RzCheckBox1: TRzCheckBox
        Left = 8
        Top = 53
        Width = 132
        Height = 15
        Caption = #1057#1083#1086#1074#1086' '#1074' '#1082#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080':'
        HotTrack = True
        State = cbUnchecked
        TabOrder = 2
        Transparent = True
      end
      object RzCheckBox2: TRzCheckBox
        Left = 8
        Top = 101
        Width = 99
        Height = 15
        Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103':'
        HotTrack = True
        State = cbUnchecked
        TabOrder = 3
        Transparent = True
      end
      object RzDateTimeEdit1: TRzDateTimeEdit
        Left = 68
        Top = 122
        Width = 121
        Height = 21
        EditType = etDate
        Enabled = False
        FrameVisible = True
        TabOrder = 4
      end
      object RzDateTimeEdit2: TRzDateTimeEdit
        Left = 213
        Top = 119
        Width = 121
        Height = 21
        EditType = etDate
        Enabled = False
        FrameVisible = True
        TabOrder = 5
      end
    end
  end
  object RzFormState1: TRzFormState
    RegIniFile = MainForm.RegIniFile
    Left = 136
    Top = 344
  end
  object JvThread1: TJvThread
    Exclusive = True
    MaxCount = 0
    RunOnCreate = True
    FreeOnTerminate = False
    Priority = tpIdle
    OnExecute = JvThread1Execute
    OnFinish = JvThread1Finish
    Left = 136
    Top = 248
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 136
    Top = 296
  end
  object RzSelectFolderDialog1: TRzSelectFolderDialog
    HotTrack = True
    Left = 136
    Top = 200
  end
end
