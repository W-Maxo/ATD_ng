object CalInjForm: TCalInjForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1072#1083#1080#1073#1088#1086#1074#1082#1072' '#1080#1085#1076#1078#1077#1082#1090#1086#1088#1086#1074
  ClientHeight = 398
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RzBitBtn5: TRzBitBtn
    Left = 476
    Top = 367
    Width = 89
    Caption = #1047#1072#1082#1088#1099#1090#1100
    HotTrack = True
    TabOrder = 0
    ThemeAware = False
    OnClick = RzBitBtn5Click
    ImageIndex = 2
    Images = MainForm.ButtonImageList
  end
  object RzGroupBox3: TRzGroupBox
    Left = 8
    Top = 8
    Width = 281
    Height = 353
    Caption = #1048#1085#1076#1078#1077#1082#1090#1086#1088' 1:'
    TabOrder = 1
    object RzPageControl1: TRzPageControl
      Left = 11
      Top = 18
      Width = 262
      Height = 324
      ActivePage = TabSheet1
      TabIndex = 0
      TabOrder = 0
      TabStyle = tsRoundCorners
      FixedDimension = 19
      object TabSheet1: TRzTabSheet
        Caption = #1050#1072#1083#1080#1073#1088#1086#1074#1082#1072
        object RzGroupBox4: TRzGroupBox
          Left = 8
          Top = 3
          Width = 241
          Height = 281
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
            Top = 75
            Width = 85
            Height = 13
            Caption = #1054#1073#1098#1077#1084' '#1088'-'#1088#1072' ('#1084#1083'.)'
            Transparent = True
            WordWrap = True
          end
          object RzProgressBar1: TRzProgressBar
            Left = 8
            Top = 114
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
          object RzStatusPane9: TRzStatusPane
            Left = 8
            Top = 16
            Width = 193
            FrameStyle = fsNone
            Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1096#1072#1075#1086#1074
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
            Value = 50.000000000000000000
            FlatButtons = True
            FrameHotTrack = True
            FrameVisible = True
            TabOrder = 0
          end
          object QuantumM1Edit: TRzSpinEdit
            Left = 123
            Top = 69
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
            Enabled = False
            FlatButtons = True
            FrameHotTrack = True
            FrameVisible = True
            TabOrder = 1
          end
          object RzBitBtn6: TRzBitBtn
            Left = 64
            Top = 144
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
          object CountStepsPerTurnM1Edit: TRzSpinEdit
            Left = 149
            Top = 15
            Width = 81
            Height = 21
            AllowKeyEdit = True
            CheckRange = True
            Max = 100000.000000000000000000
            Value = 2500.000000000000000000
            FlatButtons = True
            FrameHotTrack = True
            FrameVisible = True
            TabOrder = 3
          end
          object RzBitBtn4: TRzBitBtn
            Left = 199
            Top = 69
            Width = 31
            Height = 19
            Hint = #1055#1088#1080#1085#1103#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
            Enabled = False
            HotTrack = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = RzBitBtn4Click
            DisabledIndex = 1
            ImageIndex = 0
            Images = MainForm.ButtonImageList
          end
          object RzGroupBox1: TRzGroupBox
            Left = 8
            Top = 175
            Width = 222
            Height = 98
            TabOrder = 5
            object RzStatusPane2: TRzStatusPane
              Left = 128
              Top = 16
              Width = 87
              Alignment = taCenter
            end
            object RzStatusPane3: TRzStatusPane
              Left = 128
              Top = 42
              Width = 87
              Enabled = False
              Alignment = taCenter
            end
            object RzLabel1: TRzLabel
              Left = 8
              Top = 16
              Width = 69
              Height = 13
              Caption = #1054#1073#1098#1077#1084' '#1079#1072' '#1096#1072#1075
            end
            object RzLabel2: TRzLabel
              Left = 8
              Top = 42
              Width = 86
              Height = 13
              Caption = #1054#1073#1098#1077#1084' '#1079#1072' '#1086#1073#1072#1088#1086#1090
              Enabled = False
            end
            object RzBitBtn2: TRzBitBtn
              Left = 99
              Top = 68
              Width = 31
              Height = 19
              Hint = #1055#1088#1080#1085#1103#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
              Enabled = False
              HotTrack = True
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = RzBitBtn2Click
              DisabledIndex = 1
              ImageIndex = 0
              Images = MainForm.ButtonImageList
            end
          end
        end
      end
      object TabSheet2: TRzTabSheet
        TabVisible = False
        Caption = #1055#1088#1086#1074#1077#1088#1082#1072'/'#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
        object RzGroupBox7: TRzGroupBox
          Left = 8
          Top = 3
          Width = 241
          Height = 281
          TabOrder = 0
          object Label5: TLabel
            Left = 8
            Top = 50
            Width = 137
            Height = 33
            AutoSize = False
            Caption = #1048#1085#1090'. '#1084#1077#1078#1076#1091' '#1096#1072#1075#1072#1084#1080' ('#1084#1089#1077#1082'.)'
            Transparent = True
            WordWrap = True
          end
          object Label6: TLabel
            Left = 8
            Top = 75
            Width = 85
            Height = 13
            Caption = #1054#1073#1098#1077#1084' '#1088'-'#1088#1072' ('#1084#1083'.)'
            Transparent = True
            WordWrap = True
          end
          object RzProgressBar3: TRzProgressBar
            Left = 8
            Top = 114
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
          object RzStatusPane6: TRzStatusPane
            Left = 8
            Top = 16
            Width = 193
            FrameStyle = fsNone
            Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1096#1072#1075#1086#1074
          end
          object RzSpinEdit1: TRzSpinEdit
            Left = 178
            Top = 42
            Width = 52
            Height = 21
            AllowKeyEdit = True
            CheckRange = True
            Max = 1000.000000000000000000
            Min = 10.000000000000000000
            Value = 50.000000000000000000
            FlatButtons = True
            FrameHotTrack = True
            FrameVisible = True
            TabOrder = 0
          end
          object RzSpinEdit2: TRzSpinEdit
            Left = 123
            Top = 69
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
            Enabled = False
            FlatButtons = True
            FrameHotTrack = True
            FrameVisible = True
            TabOrder = 1
          end
          object RzBitBtn8: TRzBitBtn
            Left = 64
            Top = 144
            Width = 121
            Caption = #1048#1085#1076#1078#1077#1082#1094#1080#1103
            HotTrack = True
            TabOrder = 2
            DisabledIndex = 28
            ImageIndex = 25
            Images = MainForm.ImageList2
          end
          object RzSpinEdit3: TRzSpinEdit
            Left = 149
            Top = 15
            Width = 81
            Height = 21
            AllowKeyEdit = True
            CheckRange = True
            Max = 100000.000000000000000000
            Value = 2500.000000000000000000
            FlatButtons = True
            FrameHotTrack = True
            FrameVisible = True
            TabOrder = 3
          end
          object RzBitBtn9: TRzBitBtn
            Left = 199
            Top = 69
            Width = 31
            Height = 19
            Hint = #1055#1088#1080#1085#1103#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
            Enabled = False
            HotTrack = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            DisabledIndex = 1
            ImageIndex = 0
            Images = MainForm.ButtonImageList
          end
          object RzGroupBox8: TRzGroupBox
            Left = 8
            Top = 175
            Width = 222
            Height = 98
            TabOrder = 5
            object RzStatusPane7: TRzStatusPane
              Left = 128
              Top = 16
              Width = 87
              Alignment = taCenter
            end
            object RzStatusPane8: TRzStatusPane
              Left = 128
              Top = 42
              Width = 87
              Enabled = False
              Alignment = taCenter
            end
            object RzLabel5: TRzLabel
              Left = 8
              Top = 16
              Width = 69
              Height = 13
              Caption = #1054#1073#1098#1077#1084' '#1079#1072' '#1096#1072#1075
            end
            object RzLabel6: TRzLabel
              Left = 8
              Top = 42
              Width = 86
              Height = 13
              Caption = #1054#1073#1098#1077#1084' '#1079#1072' '#1086#1073#1072#1088#1086#1090
              Enabled = False
            end
            object RzBitBtn10: TRzBitBtn
              Left = 99
              Top = 68
              Width = 31
              Height = 19
              Hint = #1055#1088#1080#1085#1103#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
              Enabled = False
              HotTrack = True
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              DisabledIndex = 1
              ImageIndex = 0
              Images = MainForm.ButtonImageList
            end
          end
        end
      end
    end
  end
  object RzGroupBox6: TRzGroupBox
    Left = 295
    Top = 8
    Width = 281
    Height = 353
    Caption = #1048#1085#1076#1078#1077#1082#1090#1086#1088' 2:'
    TabOrder = 2
    object RzPageControl2: TRzPageControl
      Left = 11
      Top = 18
      Width = 262
      Height = 324
      ActivePage = RzTabSheet1
      TabIndex = 0
      TabOrder = 0
      TabStyle = tsRoundCorners
      FixedDimension = 19
      object RzTabSheet1: TRzTabSheet
        Caption = #1050#1072#1083#1080#1073#1088#1086#1074#1082#1072
        object RzGroupBox5: TRzGroupBox
          Left = 8
          Top = 3
          Width = 241
          Height = 281
          TabOrder = 0
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
            Top = 75
            Width = 85
            Height = 13
            Caption = #1054#1073#1098#1077#1084' '#1088'-'#1088#1072' ('#1084#1083'.)'
            Transparent = True
            WordWrap = True
          end
          object RzProgressBar2: TRzProgressBar
            Left = 8
            Top = 114
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
          object RzStatusPane1: TRzStatusPane
            Left = 8
            Top = 16
            Width = 193
            FrameStyle = fsNone
            Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1096#1072#1075#1086#1074
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
            Value = 50.000000000000000000
            FlatButtons = True
            FrameHotTrack = True
            FrameVisible = True
            TabOrder = 0
          end
          object QuantumM2Edit: TRzSpinEdit
            Left = 129
            Top = 69
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
            Enabled = False
            FlatButtons = True
            FrameHotTrack = True
            FrameVisible = True
            TabOrder = 1
          end
          object RzBitBtn7: TRzBitBtn
            Left = 56
            Top = 144
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
          object CountStepsPerTurnM2Edit: TRzSpinEdit
            Left = 149
            Top = 15
            Width = 81
            Height = 21
            AllowKeyEdit = True
            CheckRange = True
            Max = 100000.000000000000000000
            Value = 2500.000000000000000000
            FlatButtons = True
            FrameHotTrack = True
            FrameVisible = True
            TabOrder = 3
          end
          object RzBitBtn1: TRzBitBtn
            Left = 205
            Top = 69
            Width = 31
            Height = 19
            Hint = #1055#1088#1080#1085#1103#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
            Enabled = False
            HotTrack = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = RzBitBtn1Click
            DisabledIndex = 1
            ImageIndex = 0
            Images = MainForm.ButtonImageList
          end
          object RzGroupBox2: TRzGroupBox
            Left = 8
            Top = 175
            Width = 222
            Height = 98
            TabOrder = 5
            object RzStatusPane4: TRzStatusPane
              Left = 128
              Top = 16
              Width = 87
              Alignment = taCenter
            end
            object RzStatusPane5: TRzStatusPane
              Left = 128
              Top = 42
              Width = 87
              Enabled = False
              Alignment = taCenter
            end
            object RzLabel3: TRzLabel
              Left = 8
              Top = 16
              Width = 69
              Height = 13
              Caption = #1054#1073#1098#1077#1084' '#1079#1072' '#1096#1072#1075
            end
            object RzLabel4: TRzLabel
              Left = 8
              Top = 42
              Width = 86
              Height = 13
              Caption = #1054#1073#1098#1077#1084' '#1079#1072' '#1086#1073#1072#1088#1086#1090
              Enabled = False
            end
            object RzBitBtn3: TRzBitBtn
              Left = 99
              Top = 68
              Width = 31
              Height = 19
              Hint = #1055#1088#1080#1085#1103#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
              Enabled = False
              HotTrack = True
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = RzBitBtn3Click
              DisabledIndex = 1
              ImageIndex = 0
              Images = MainForm.ButtonImageList
            end
          end
        end
      end
      object RzTabSheet2: TRzTabSheet
        TabVisible = False
        Caption = #1055#1088#1086#1074#1077#1088#1082#1072'/'#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
      end
    end
  end
  object IdThreadComponent1: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = IdThreadComponent1Run
    Left = 152
    Top = 416
  end
  object IdThreadComponent2: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = IdThreadComponent2Run
    Left = 280
    Top = 416
  end
end
