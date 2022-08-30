object InfoExpForm: TInfoExpForm
  Left = 690
  Top = 300
  ActiveControl = RzBitBtn1
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1101#1082#1089#1087#1077#1088#1077#1084#1077#1085#1090#1077':'
  ClientHeight = 376
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShortCut = FormShortCut
  PixelsPerInch = 96
  TextHeight = 13
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = 8
    Width = 369
    Height = 329
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 73
      Height = 13
      Caption = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1091':'
      Transparent = True
    end
    object Label2: TLabel
      Left = 8
      Top = 72
      Width = 65
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103':'
      Transparent = True
    end
    object Label3: TLabel
      Left = 8
      Top = 224
      Width = 80
      Height = 13
      Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103':'
      Transparent = True
    end
    object RzLabel1: TRzLabel
      Left = 8
      Top = 24
      Width = 353
      Height = 49
      AutoSize = False
      Caption = 'RzLabel1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object RzLabel2: TRzLabel
      Left = 8
      Top = 240
      Width = 353
      Height = 17
      AutoSize = False
      Caption = 'RzLabel1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label4: TLabel
      Left = 8
      Top = 288
      Width = 109
      Height = 13
      Caption = #1056#1072#1079#1084#1077#1088' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093':'
      Transparent = True
    end
    object RzLabel3: TRzLabel
      Left = 8
      Top = 304
      Width = 353
      Height = 17
      AutoSize = False
      Caption = 'RzLabel1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label5: TLabel
      Left = 8
      Top = 256
      Width = 109
      Height = 13
      Caption = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100':'
      Transparent = True
    end
    object RzLabel4: TRzLabel
      Left = 8
      Top = 272
      Width = 353
      Height = 17
      AutoSize = False
      Caption = 'RzLabel1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object NotesMemo: TRzMemo
      Left = 8
      Top = 88
      Width = 353
      Height = 129
      Color = clCream
      ReadOnly = True
      TabOrder = 0
      FrameVisible = True
      ReadOnlyColor = clCream
    end
  end
  object RzBitBtn1: TRzBitBtn
    Left = 160
    Top = 344
    Caption = 'OK'
    HotTrack = True
    TabOrder = 1
    ThemeAware = False
    OnClick = RzBitBtn1Click
    ImageIndex = 0
    Images = MainForm.ButtonImageList
  end
end
