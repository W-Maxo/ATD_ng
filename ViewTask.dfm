object ViewTaskForm: TViewTaskForm
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1079#1072#1076#1072#1085#1080#1081
  ClientHeight = 186
  ClientWidth = 302
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RzListBox2: TRzListBox
    Left = 0
    Top = 0
    Width = 302
    Height = 186
    Align = alClient
    DoubleBuffered = False
    FrameVisible = True
    ItemHeight = 13
    ParentDoubleBuffered = False
    TabOrder = 0
  end
  object RzFormState1: TRzFormState
    RegIniFile = MainForm.RegIniFile
    Left = 120
    Top = 32
  end
  object JvFormMagnet1: TJvFormMagnet
    Active = True
    FormGlue = False
    Left = 120
    Top = 80
  end
end
