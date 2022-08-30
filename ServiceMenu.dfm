object ServiceMenuForm: TServiceMenuForm
  Left = 588
  Top = 355
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1077#1088#1074#1080#1089#1085#1086#1077' '#1084#1077#1085#1102
  ClientHeight = 333
  ClientWidth = 521
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
  OnShortCut = FormShortCut
  PixelsPerInch = 96
  TextHeight = 13
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = 8
    Width = 505
    Height = 129
    TabOrder = 0
    object RzBitBtn1: TRzBitBtn
      Left = 56
      Top = 13
      Width = 113
      Height = 33
      Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1085#1072#1089#1086#1089
      HotTrack = True
      TabOrder = 0
      ThemeAware = False
      OnClick = RzBitBtn1Click
      ImageIndex = 0
      Images = MainForm.ButtonImageList
    end
    object RzBitBtn2: TRzBitBtn
      Left = 56
      Top = 52
      Width = 113
      Height = 33
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1082#1083#1072#1087#1072#1085
      HotTrack = True
      TabOrder = 1
      ThemeAware = False
      OnClick = RzBitBtn2Click
      ImageIndex = 0
      Images = MainForm.ButtonImageList
    end
    object RzGroupBox2: TRzGroupBox
      Left = 223
      Top = 23
      Width = 273
      Height = 84
      Caption = #1048#1085#1076#1078#1077#1082#1090#1086#1088#1099':'
      TabOrder = 2
      object RzStatusPane2: TRzStatusPane
        Left = 0
        Top = 14
        Width = 273
        FrameStyle = fsNone
        Alignment = taCenter
        Caption = #1047#1072#1087#1088#1072#1074#1082#1072' '#1080#1085#1076#1078#1077#1082#1090#1086#1088#1086#1074
      end
      object RzBitBtn3: TRzBitBtn
        Left = 8
        Top = 40
        Width = 121
        HotTrack = True
        TabOrder = 0
        ThemeAware = False
        OnClick = RzBitBtn3Click
        ImageIndex = 18
        Images = MainForm.ImageList2
      end
      object RzBitBtn4: TRzBitBtn
        Left = 144
        Top = 40
        Width = 121
        HotTrack = True
        TabOrder = 1
        ThemeAware = False
        OnClick = RzBitBtn4Click
        ImageIndex = 18
        Images = MainForm.ImageList2
      end
    end
    object ChangeSBitBtn: TRzBitBtn
      Left = 56
      Top = 91
      Width = 113
      Caption = #1047#1072#1084#1077#1085#1072' '#1088#1072#1089#1090#1074#1086#1088#1072
      Enabled = False
      HotTrack = True
      TabOrder = 3
      ThemeAware = False
      OnClick = ChangeSBitBtnClick
      DisabledIndex = 0
      ImageIndex = 0
    end
  end
  object RzGroupBox3: TRzGroupBox
    Left = 8
    Top = 143
    Width = 505
    Height = 153
    TabOrder = 1
    object RzGroupBox4: TRzGroupBox
      Left = 8
      Top = 8
      Width = 241
      Height = 137
      Caption = #1048#1085#1076#1078#1077#1082#1090#1086#1088' 1:'
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 50
        Width = 137
        Height = 33
        AutoSize = False
        Caption = #1048#1085#1090'. '#1084#1077#1078#1076#1091' '#1096#1072#1075#1072#1084#1080' ('#1084#1089#1077#1082'.)'
        Transparent = True
        WordWrap = True
      end
      object Label3: TLabel
        Left = 8
        Top = 21
        Width = 85
        Height = 13
        Caption = #1054#1073#1098#1077#1084' '#1088'-'#1088#1072' ('#1084#1083'.)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object RzProgressBar1: TRzProgressBar
        Left = 8
        Top = 74
        Width = 222
        BackColor = clBtnFace
        BarStyle = bsGradient
        BorderInner = fsFlat
        BorderOuter = fsNone
        BorderWidth = 1
        InteriorOffset = 0
        PartsComplete = 0
        Percent = 0
        TotalParts = 0
      end
      object IntervalBetweenStepsM1Edit: TRzSpinEdit
        Left = 178
        Top = 42
        Width = 52
        Height = 21
        AllowKeyEdit = True
        CheckRange = True
        Max = 1000.000000000000000000
        Min = 10.000000000000000000
        Value = 100.000000000000000000
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 0
      end
      object QuantumM1Edit: TRzSpinEdit
        Left = 160
        Top = 15
        Width = 70
        Height = 21
        AllowKeyEdit = True
        CheckRange = True
        Decimals = 4
        Increment = 0.000100000000000000
        IntegersOnly = False
        Max = 1000.000000000000000000
        PageSize = 1.000000000000000000
        Value = 0.000100000000000000
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 1
      end
      object RzBitBtn6: TRzBitBtn
        Left = 64
        Top = 104
        Width = 121
        Caption = #1048#1085#1076#1078#1077#1082#1094#1080#1103
        HotTrack = True
        TabOrder = 2
        ThemeAware = False
        OnClick = RzBitBtn6Click
        DisabledIndex = 28
        ImageIndex = 25
        Images = MainForm.ImageList2
      end
    end
    object RzGroupBox5: TRzGroupBox
      Left = 255
      Top = 8
      Width = 241
      Height = 137
      Caption = #1048#1085#1076#1078#1077#1082#1090#1086#1088' 2:'
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 50
        Width = 137
        Height = 33
        AutoSize = False
        Caption = #1048#1085#1090'. '#1084#1077#1078#1076#1091' '#1096#1072#1075#1072#1084#1080' ('#1084#1089#1077#1082'.)'
        Transparent = True
        WordWrap = True
      end
      object Label4: TLabel
        Left = 8
        Top = 21
        Width = 85
        Height = 13
        Caption = #1054#1073#1098#1077#1084' '#1088'-'#1088#1072' ('#1084#1083'.)'
        Transparent = True
        WordWrap = True
      end
      object RzProgressBar2: TRzProgressBar
        Left = 8
        Top = 74
        Width = 222
        BackColor = clBtnFace
        BarStyle = bsGradient
        BorderInner = fsFlat
        BorderOuter = fsNone
        BorderWidth = 1
        InteriorOffset = 0
        PartsComplete = 0
        Percent = 0
        TotalParts = 0
      end
      object IntervalBetweenStepsM2Edit: TRzSpinEdit
        Left = 178
        Top = 42
        Width = 52
        Height = 21
        AllowKeyEdit = True
        CheckRange = True
        Max = 1000.000000000000000000
        Min = 10.000000000000000000
        Value = 100.000000000000000000
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 0
      end
      object QuantumM2Edit: TRzSpinEdit
        Left = 160
        Top = 15
        Width = 70
        Height = 21
        AllowKeyEdit = True
        CheckRange = True
        Decimals = 4
        Increment = 0.000100000000000000
        IntegersOnly = False
        Max = 1000.000000000000000000
        PageSize = 1.000000000000000000
        Value = 0.000100000000000000
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 1
      end
      object RzBitBtn7: TRzBitBtn
        Left = 64
        Top = 104
        Width = 121
        Caption = #1048#1085#1076#1078#1077#1082#1094#1080#1103
        HotTrack = True
        TabOrder = 2
        ThemeAware = False
        OnClick = RzBitBtn7Click
        DisabledIndex = 28
        ImageIndex = 25
        Images = MainForm.ImageList2
      end
    end
  end
  object RzBitBtn5: TRzBitBtn
    Left = 415
    Top = 302
    Width = 89
    Caption = #1047#1072#1082#1088#1099#1090#1100
    HotTrack = True
    TabOrder = 2
    ThemeAware = False
    OnClick = RzBitBtn5Click
    ImageIndex = 2
    Images = MainForm.ButtonImageList
  end
  object IdThreadComponent1: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = IdThreadComponent1Run
    Left = 48
    Top = 256
  end
  object IdThreadComponent2: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = IdThreadComponent2Run
    Left = 296
    Top = 256
  end
end
