object FlowExpForm: TFlowExpForm
  Left = 329
  Top = 192
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1061#1086#1076' '#1101#1082#1089#1087#1077#1088#1080#1084#1077#1085#1090#1072' / '#1087#1083#1072#1085#1080#1088#1086#1074#1097#1080#1082
  ClientHeight = 317
  ClientWidth = 581
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
  object RzClockStatus1: TRzClockStatus
    Left = 20
    Top = 289
    Alignment = taCenter
  end
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = 8
    Width = 565
    Height = 265
    TabOrder = 0
    object RzListBox1: TRzListBox
      Left = 8
      Top = 16
      Width = 154
      Height = 193
      DoubleBuffered = True
      FrameVisible = True
      ItemHeight = 13
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = RzListBox1Click
    end
    object RzListBox2: TRzListBox
      Left = 199
      Top = 16
      Width = 330
      Height = 241
      DoubleBuffered = False
      FrameVisible = True
      ItemHeight = 13
      ParentDoubleBuffered = False
      TabOrder = 1
    end
    object RzBitBtn1: TRzBitBtn
      Left = 168
      Top = 32
      Width = 25
      HotTrack = True
      TabOrder = 2
      ThemeAware = False
      OnClick = RzBitBtn1Click
      ImageIndex = 33
      Images = MainForm.MenuImageList
      Margin = 0
    end
    object RzBitBtn2: TRzBitBtn
      Left = 535
      Top = 32
      Width = 25
      Enabled = False
      HotTrack = True
      TabOrder = 3
      OnClick = RzBitBtn2Click
      DisabledIndex = 3
      ImageIndex = 2
      Images = MainForm.ButtonImageList
      Margin = 0
      Spacing = 0
    end
    object RzBitBtn4: TRzBitBtn
      Left = 535
      Top = 63
      Width = 25
      Enabled = False
      HotTrack = True
      TabOrder = 4
      DisabledIndex = 9
      ImageIndex = 8
      Images = MainForm.ButtonImageList
      Margin = 0
      Spacing = 0
    end
    object RzGroupBox2: TRzGroupBox
      Left = 8
      Top = 215
      Width = 154
      Height = 41
      Enabled = False
      TabOrder = 5
      object Label13: TLabel
        Left = 6
        Top = 15
        Width = 8
        Height = 13
        Caption = '+'
        Enabled = False
        Transparent = True
        WordWrap = True
      end
      object Label1: TLabel
        Left = 78
        Top = 15
        Width = 24
        Height = 13
        Caption = #1063#1072#1089#1072
        Enabled = False
        Transparent = True
        WordWrap = True
      end
      object RzSpinEdit2: TRzSpinEdit
        Left = 20
        Top = 12
        Width = 52
        Height = 21
        AllowKeyEdit = True
        CheckRange = True
        Decimals = 1
        Increment = 0.500000000000000000
        IntegersOnly = False
        Max = 23.000000000000000000
        Min = 0.500000000000000000
        Value = 1.500000000000000000
        Enabled = False
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 0
      end
      object RzBitBtn5: TRzBitBtn
        Left = 114
        Top = 10
        Width = 25
        Enabled = False
        HotTrack = True
        TabOrder = 1
        OnClick = RzBitBtn5Click
        DisabledIndex = 58
        ImageIndex = 58
        Images = MainForm.MenuImageList
        Margin = 0
      end
    end
  end
  object RzBitBtn3: TRzBitBtn
    Left = 493
    Top = 284
    Caption = 'OK'
    HotTrack = True
    TabOrder = 1
    ThemeAware = False
    OnClick = RzBitBtn3Click
    ImageIndex = 0
    Images = MainForm.ButtonImageList
  end
end
