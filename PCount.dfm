object PCountForm: TPCountForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1086#1095#1077#1082
  ClientHeight = 127
  ClientWidth = 256
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
    Width = 241
    Height = 81
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 8
      Top = 16
      Width = 227
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1086#1095#1077#1082' '#1076#1083#1103' '#1087#1086#1089#1090#1088#1086#1077#1085#1080#1103' '#1075#1088#1072#1092#1080#1082#1072':'
    end
    object RzSpinEdit1: TRzSpinEdit
      Left = 96
      Top = 48
      Width = 47
      Height = 21
      Min = 2.000000000000000000
      Value = 5.000000000000000000
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 0
    end
  end
  object RzBitBtn1: TRzBitBtn
    Left = 88
    Top = 95
    Caption = 'OK'
    HotTrack = True
    TabOrder = 1
    ThemeAware = False
    OnClick = RzBitBtn1Click
    ImageIndex = 0
    Images = MainForm.ButtonImageList
  end
end
