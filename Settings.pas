unit Settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzStatus, StdCtrls, Mask, RzEdit, RzSpnEdt,
  RzButton, RzLabel, RzTabs, RzRadChk, RzCmboBx,
  IdBaseComponent, IdThreadComponent, MainSysUtils, IdThread,
  AdvProgressBar, AdvWiiProgressBar, SetupAPI, DeviceHelper, MainConst,
  ListViewHelper, ImgList, ComCtrls, OleServer, SpeechLib_TLB, RzPrgres, ActiveX;

type
  TSettingsForm = class(TForm)
    RzPanel1: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    TabSheet4: TRzTabSheet;
    TabSheet5: TRzTabSheet;
    RzGroupBox1: TRzGroupBox;
    RzStatusPane1: TRzStatusPane;
    RzStatusPane2: TRzStatusPane;
    RzStatusPane3: TRzStatusPane;
    RzStatusPane9: TRzStatusPane;
    VolumPerTurnM1Edit: TRzSpinEdit;
    IntervalBetweenStepsM1Edit: TRzSpinEdit;
    CountStepsPerTurnM1Edit: TRzSpinEdit;
    ComentM1Edit: TRzEdit;
    RzGroupBox2: TRzGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Edit5: TEdit;
    Label5: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Label7: TLabel;
    RzGroupBox3: TRzGroupBox;
    RzGroupBox5: TRzGroupBox;
    ComboBox1: TRzComboBox;
    SayEdit: TRzEdit;
    RzToolButton1: TRzToolButton;
    RzGroupBox6: TRzGroupBox;
    RzComboBox1: TRzComboBox;
    RzGroupBox7: TRzGroupBox;
    RzCheckBox1: TRzCheckBox;
    RzEdit1: TRzEdit;
    RzEdit3: TRzEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzGroupBox4: TRzGroupBox;
    RzStatusPane4: TRzStatusPane;
    RzStatusPane5: TRzStatusPane;
    RzStatusPane6: TRzStatusPane;
    RzStatusPane7: TRzStatusPane;
    VolumPerTurnM2Edit: TRzSpinEdit;
    IntervalBetweenStepsM2Edit: TRzSpinEdit;
    CountStepsPerTurnM2Edit: TRzSpinEdit;
    ComentM2Edit: TRzEdit;
    RzGroupBox8: TRzGroupBox;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzEdit2: TRzEdit;
    RzEdit4: TRzEdit;
    RzCheckBox2: TRzCheckBox;
    RzGroupBox9: TRzGroupBox;
    RzLabel5: TRzLabel;
    AdvWiiProgressBar1: TAdvWiiProgressBar;
    Label8: TLabel;
    RzGroupBox10: TRzGroupBox;
    RzGroupBox11: TRzGroupBox;
    RzCheckBox3: TRzCheckBox;
    RzCheckBox4: TRzCheckBox;
    RzCheckBox5: TRzCheckBox;
    RzGlyphStatus1: TRzGlyphStatus;
    TabSheet6: TRzTabSheet;
    memEnginePhonemes: TMemo;
    Label12: TLabel;
    Label13: TLabel;
    RzGroupBox12: TRzGroupBox;
    ProgressBar: TRzProgressBar;
    lblVU: TRzStatusPane;
    RzToolButton2: TRzToolButton;
    lstEngineInfo: TListBox;
    btnStop: TRzToolButton;
    RzGroupBox13: TRzGroupBox;
    Label10: TLabel;
    tbRate: TTrackBar;
    lblMinSpeed: TLabel;
    lblRate: TLabel;
    lblMaxSpeed: TLabel;
    tbVolume: TTrackBar;
    lblVolume: TLabel;
    lblMinVolume: TLabel;
    lblMaxVolume: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    SpVoice: TSpVoice;
    cbVoices: TRzComboBox;
    reText: TRzMemo;
    RzGroupBox14: TRzGroupBox;
    RzComboBox2: TRzComboBox;
    RzGlyphStatus2: TRzGlyphStatus;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpVoiceAudioLevel(ASender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant; AudioLevel: Integer);
    procedure RzToolButton2Click(Sender: TObject);
    procedure cbVoicesChange(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure SpVoiceWord(ASender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant; CharacterPosition, Length: Integer);
    procedure SpVoiceStartStream(ASender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant);
    procedure SpVoiceSentence(ASender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant; CharacterPosition, Length: Integer);
    procedure SpVoicePhoneme(ASender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant; Duration: Integer; NextPhoneId: Smallint;
      Feature: TOleEnum; CurrentPhoneId: Smallint);
    procedure tbRateChange(Sender: TObject);
    procedure tbVolumeChange(Sender: TObject);
  private
    hAllDevices: HDEVINFO;
    DeviceHelper: TDeviceHelper;

    BeenPaused, StreamJustStarted: Boolean;
    OldSentencePos, OldSentenceLen: Integer;

    SOTokens: ISpeechObjectTokens;

    procedure SetTextHilite(FirstChar, Len: Integer);
    procedure SetTextStyle(FirstChar, Len: Integer; Styles: TFontStyles);
  public
    procedure InitDeviceList;
    procedure FillDeviceList;
    procedure ReleaseDeviceList;
  end;

var
  SettingsForm: TSettingsForm;

implementation

uses Main;

{$R *.dfm}

procedure TSettingsForm.SetTextHilite(FirstChar, Len: Integer);
begin
  reText.SelStart := FirstChar; //highlight word
  reText.SelLength := Len;
end;

procedure TSettingsForm.SetTextStyle(FirstChar, Len: Integer; Styles: TFontStyles);
begin
  {with reText do
  begin
    Lines.BeginUpdate;
    try
      SelStart := FirstChar; //highlight word
      SelLength := Len;
      SelAttributes.Style := Styles; //apply requested style
      SelLength := 0; //unhighlight word
    finally
      Lines.EndUpdate
    end
  end}
end;

procedure TSettingsForm.InitDeviceList;
const
  PINVALID_HANDLE_VALUE = Pointer(INVALID_HANDLE_VALUE);
var
  dwFlags: DWORD;
begin
  dwFlags := DIGCF_ALLCLASSES;
  dwFlags := dwFlags or DIGCF_PRESENT;

  hAllDevices := SetupDiGetClassDevsExA(nil, nil, 0,
    dwFlags, nil, nil, nil);
  if hAllDevices = PINVALID_HANDLE_VALUE then RaiseLastOSError;
  DeviceHelper.DeviceListHandle := hAllDevices;
end;

procedure TSettingsForm.ReleaseDeviceList;
begin
  SetupDiDestroyDeviceInfoList(hAllDevices);
end;

procedure TSettingsForm.FillDeviceList;

  procedure AdvancedInfo(const DeviceIndex: Integer; var HardwareID, FriendlyName : String);
  var
    DeviceInfoData: SP_DEVINFO_DATA;
    EmptyGUID: TGUID;
  begin
    ZeroMemory(@EmptyGUID, SizeOf(TGUID));

    ZeroMemory(@DeviceInfoData, SizeOf(SP_DEVINFO_DATA));
    DeviceInfoData.cbSize := SizeOf(SP_DEVINFO_DATA);

    if not SetupDiEnumDeviceInfo(hAllDevices,
      DeviceIndex, DeviceInfoData) then Exit;

    DeviceHelper.DeviceInfoData := DeviceInfoData;

    HardwareID:=DeviceHelper.HardwareID;

    FriendlyName:=DeviceHelper.FriendlyName;
  end;

var
  dwIndex             : DWORD;
  DeviceInfoData      : SP_DEVINFO_DATA;
  DeviceName          : AnsiString;
  DeviceClassesCount  : integer;
  HardwareID,
  FriendlyName        : String;
  TmpStr              : AnsiString;
  xTmp                : AnsiString;
  xHardwareID         : AnsiString;
  xPos                : integer;
begin
  RzComboBox1.Items.BeginUpdate;
  try
    dwIndex := 0;

    ZeroMemory(@DeviceInfoData, SizeOf(SP_DEVINFO_DATA));
    DeviceInfoData.cbSize := SizeOf(SP_DEVINFO_DATA);

    while SetupDiEnumDeviceInfo(hAllDevices, dwIndex, DeviceInfoData) do
    begin
      DeviceHelper.DeviceInfoData := DeviceInfoData;

      DeviceName := PAnsiChar(DeviceHelper.FriendlyName);

      if DeviceName = '' then
        DeviceName := PAnsiChar(DeviceHelper.Description);

      AdvancedInfo(Integer(dwIndex), HardwareID, FriendlyName);

      xHardwareID:=(AnsiString(UpperCase(PAnsiChar(HardwareID))));

      xTmp:=UpperCase(HardwID);

      if (Pos(xTmp, xHardwareID) > 0) then
          begin
            xPos:=Pos('(', DeviceName) + 1;

            TmpStr:=Copy(DeviceName, xPos, Length(DeviceName) - xPos);

            RzComboBox1.Add(TmpStr);
          end;

      Inc(dwIndex);
    end;

    RzComboBox1.Sorted:=True;;

  finally
    RzComboBox1.Items.EndUpdate;
  end;
end;

procedure TSettingsForm.RzBitBtn1Click(Sender: TObject);
begin
  With MainForm.RegIniFile do
    begin
      WriteFloat('Motor1Settings', 'VolumPerTurn', VolumPerTurnM1Edit.Value);
      WriteInteger('Motor1Settings', 'CountStepsPerTurn', CountStepsPerTurnM1Edit.IntValue);
      WriteInteger('Motor1Settings', 'IntervalBetweenSteps', IntervalBetweenStepsM1Edit.IntValue);
      WriteString('Motor1Settings', 'Coment', ComentM1Edit.Text);

      WriteFloat('Motor2Settings', 'VolumPerTurn', VolumPerTurnM2Edit.Value);
      WriteInteger('Motor2Settings', 'CountStepsPerTurn', CountStepsPerTurnM2Edit.IntValue);
      WriteInteger('Motor2Settings', 'IntervalBetweenSteps', IntervalBetweenStepsM2Edit.IntValue);
      WriteString('Motor2Settings', 'Coment', ComentM2Edit.Text);

      MainForm.Config.VoiceEngine:=cbVoices.Text;

      WriteString('Voice', 'VoiceEngine', MainForm.Config.VoiceEngine);
      WriteString('Device', 'Port', RzComboBox1.Text);
      MainForm.ComPort1.Port:=RzComboBox1.Text;
    end;

    MainForm.SpVoice.Voice:=SpVoice.Voice;

    With MainForm do
    begin
      Config.VolumPerTurnM1:=VolumPerTurnM1Edit.Value;
      Config.CountStepsPerTurnM1:=CountStepsPerTurnM1Edit.IntValue;
      Config.IntervalBetweenStepsM1:=IntervalBetweenStepsM1Edit.IntValue;
      M1StatusPane.Caption:=ComentM1Edit.Text;

      Experiment.StepCircA:=12 / Config.IntervalBetweenStepsM1;
      Experiment.StepCircB:=12 / Config.IntervalBetweenStepsM1;
      Experiment.M1Interval:=Config.IntervalBetweenStepsM1;
      Experiment.M2Interval:=Config.IntervalBetweenStepsM2;

      Config.VolumPerTurnM2:=VolumPerTurnM2Edit.Value;
      Config.CountStepsPerTurnM2:=CountStepsPerTurnM2Edit.IntValue;
      Config.IntervalBetweenStepsM2:=IntervalBetweenStepsM2Edit.IntValue;
      Experiment.M1Interval:=Config.IntervalBetweenStepsM1;
      M2StatusPane.Caption:=ComentM2Edit.Text;

      //Config.VoiceEngineIndex:=combobox1.ItemIndex;

      Config.PortDev:=RzComboBox1.Text;

      Experiment.VolPerStepA:=Config.VolumPerTurnM1 / Config.CountStepsPerTurnM1;
      QuantumM1Edit.Increment:=Experiment.VolPerStepA;
    end;
    Close;
end;

procedure TSettingsForm.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  try
    if not LoadSetupApi then
        RaiseLastOSError;
    
    DeviceHelper := TDeviceHelper.Create;

    InitDeviceList;
    FillDeviceList;

    RzComboBox1.FindItem(MainForm.Config.PortDev);

    RzComboBox1.Visible:=True;
    AdvWiiProgressBar1.Visible:=False;
    Label8.Visible:=False;
  finally end;
  
  With MainForm.Config do
    begin
      VolumPerTurnM1Edit.Value:=VolumPerTurnM1;
      CountStepsPerTurnM1Edit.IntValue:=CountStepsPerTurnM1;
      IntervalBetweenStepsM1Edit.IntValue:=IntervalBetweenStepsM1;
      ComentM1Edit.Text:=MainForm.M1StatusPane.Caption;

      VolumPerTurnM2Edit.Value:=VolumPerTurnM2;
      CountStepsPerTurnM2Edit.IntValue:=CountStepsPerTurnM2;
      IntervalBetweenStepsM2Edit.IntValue:=IntervalBetweenStepsM2;
      ComentM2Edit.Text:=MainForm.M2StatusPane.Caption;
    end;

  SpVoice.EventInterests := SVEAllEvents;
  SOTokens := SpVoice.GetVoices('', '');
  for I := 0 to SOTokens.Count - 1 do
  begin
    try
      cbVoices.Items.Add(SOTokens.Item(i).GetDescription(0));
    finally end;
  end;
  if cbVoices.Items.Count > 0 then
  begin
    cbVoices.ItemIndex := 0;
    cbVoices.OnChange(cbVoices);
  end;
  tbRate.Position := SpVoice.Rate;
  lblRate.Caption := IntToStr(tbRate.Position);
  tbVolume.Position := SpVoice.Volume;
  lblVolume.Caption := IntToStr(tbVolume.Position);

  cbVoices.FindItem(MainForm.Config.VoiceEngine);
  cbVoices.OnChange(Self);
end;

procedure TSettingsForm.RzBitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TSettingsForm.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
  if Msg.CharCode = 13 then
    RzBitBtn1.Click;
  if Msg.CharCode = 27 then
      Close;
end;

procedure TSettingsForm.ComboBox1Change(Sender: TObject);
begin
  {if EngineInit(combobox1.ItemIndex) then
    begin
      MainForm.mi := getmodeinfo;
      edit1.Text := MainForm.mi.szMfgName;
      edit2.Text := MainForm.mi.szProductName;
      edit3.Text := MainForm.mi.szModeName;
      edit4.Text := MainForm.mi.Language.szDialect;
      edit5.Text := MainForm.mi.szSpeaker;
      edit6.Text := MainForm.mi.szStyle;
      edit7.Text := IntToStr(MainForm.mi.wAge);
    end;}
end;

procedure TSettingsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DeviceHelper.Free;
  ReleaseDeviceList;
end;

procedure TSettingsForm.SpVoiceAudioLevel(ASender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant; AudioLevel: Integer);
begin
  ProgressBar.Percent := AudioLevel;
  lblVU.Caption := IntToStr(AudioLevel);
end;

procedure TSettingsForm.RzToolButton2Click(Sender: TObject);
begin
  if not BeenPaused then
    SpVoice.Speak(reText.Text, SVSFlagsAsync)
  else
  begin
    SpVoice.Resume;
    BeenPaused := False
  end
end;

procedure TSettingsForm.cbVoicesChange(Sender: TObject);
var
  SOToken: ISpeechObjectToken;
begin
  with lstEngineInfo.Items do
  begin
      try
        Clear;

        SOToken := SOTokens.Item(cbVoices.ItemIndex);

        SpVoice.Voice := SOTokens.Item(cbVoices.ItemIndex);
        Add(Format('Name: %s', [SOToken.GetAttribute('Name')]));
        Add(Format('Vendor: %s', [SOToken.GetAttribute('Vendor')]));
        Add(Format('Age: %s', [SOToken.GetAttribute('Age')]));
        Add(Format('Gender: %s', [SOToken.GetAttribute('Gender')]));
        Add(Format('Language: %s', [SOToken.GetAttribute('Language')]));
        Add(Format('Reg key: %s', [SOToken.Id]));
      finally end;
  end
end;

procedure TSettingsForm.btnStopClick(Sender: TObject);
begin
  SpVoice.Skip('Sentence', MaxInt);
end;

procedure TSettingsForm.SpVoiceWord(ASender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant; CharacterPosition,
  Length: Integer);
begin
  SetTextHilite(CharacterPosition, Length);
end;

procedure TSettingsForm.SpVoiceStartStream(ASender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant);
begin
  StreamJustStarted := True;
  memEnginePhonemes.Clear;
end;

procedure TSettingsForm.SpVoiceSentence(ASender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant; CharacterPosition,
  Length: Integer);
begin
  SetTextStyle(OldSentencePos, OldSentenceLen, []);
  SetTextStyle(CharacterPosition, Length, [fsItalic]);
  OldSentencePos := CharacterPosition;
  OldSentenceLen := Length;
  if not StreamJustStarted then
    memEnginePhonemes.Text := memEnginePhonemes.Text + #13#10;
  StreamJustStarted := False;
end;

procedure TSettingsForm.SpVoicePhoneme(ASender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant; Duration: Integer;
  NextPhoneId: Smallint; Feature: TOleEnum; CurrentPhoneId: Smallint);
begin
  if CurrentPhoneId <> 7 then //Display phonemes, except silence
    memEnginePhonemes.Text := memEnginePhonemes.Text + Phonemes[CurrentPhoneId] + #32;
end;

procedure TSettingsForm.tbRateChange(Sender: TObject);
begin
  SpVoice.Skip('Sentence', MaxInt);
  SpVoice.Rate := tbRate.Position;
  lblRate.Caption := IntToStr(tbRate.Position);
end;

procedure TSettingsForm.tbVolumeChange(Sender: TObject);
begin
  SpVoice.Skip('Sentence', MaxInt);
  SpVoice.Volume := tbVolume.Position;
  lblVolume.Caption := IntToStr(tbVolume.Position);
end;

end.
