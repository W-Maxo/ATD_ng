program ATD;

uses
  Forms,
  Windows,
  SysUtils,
  Dialogs,
  Messages,
  Main in 'Main.pas' {MainForm},
  About in 'About.pas' {AboutForm},
  Settings in 'Settings.pas' {SettingsForm},
  NewExp in 'NewExp.pas' {NewExpForm},
  StOpenExp in 'StOpenExp.pas' {StatusOpenExpForm},
  InfoExp in 'InfoExp.pas' {InfoExpForm},
  MainClasses in 'MainClasses.pas',
  MainSysUtils in 'MainSysUtils.pas',
  Calibration in 'Calibration.pas' {pHCalibrationForm},
  FlowExp in 'FlowExp.pas' {FlowExpForm},
  Change in 'Change.pas' {ChangeSolutionForm},
  MainConst in 'MainConst.pas',
  ServiceMenu in 'ServiceMenu.pas' {ServiceMenuForm},
  Refuelling in 'Refuelling.pas' {RefuellingForm},
  Find in 'Find.pas' {MainFindForm},
  MainTimeEdit in 'MainTimeEdit.pas' {MainTimeForm},
  ViewTask in 'ViewTask.pas' {ViewTaskForm},
  Archiving in 'Archiving.pas' {ArchivingForm},
  KCal in 'KCal.pas' {KCalForm},
  NewCal in 'NewCal.pas' {NewCalForm},
  CalInj in 'CalInj.pas' {CalInjForm},
  Sol in 'Sol.pas' {SolForm},
  Mass in 'Mass.pas' {MassForm},
  PCount in 'PCount.pas' {PCountForm},
  xClasses in 'xClasses.pas',
  Utils in 'Utils.pas',
  xType in 'xType.pas',
  View in 'View.pas' {ViewForm},
  Temperature in 'Temperature.pas' {TemperatureForm},
  TempCal in 'TempCal.pas' {TempCalForm};

{$R *.res}
{$SETPEFLAGS IMAGE_FILE_RELOCS_STRIPPED}

var
  xTargetWnd  : THandle;
  i           : integer;

function xSendMsg(hTargetWnd  : HWND; xMsg : String) : boolean;
var
  aCopyData : TCopyDataStruct;
begin
  with aCopyData do
    begin
      dwData:=0;
      cbData:=(length(PChar(xMsg)) + 1) * SizeOf(Char);
      lpData:=PChar(xMsg);
    end;

  SendMessage(hTargetWnd, WM_COPYDATA, Longint(Application.Handle), Longint(@aCopyData));
end;

function EnumWindowsProc(h: hwnd; lparam:Integer): BOOL; stdcall;
var
  buff: array[0..127] of Char;
begin
  if IsWindowVisible(h) then
    begin
      GetWindowText(h, buff, sizeof(buff));
      if Copy(StrPas(buff), 0, 6) = 'ATD v.' then
          xTargetWnd:=h;
    end;

 Result:=True;
end;

begin
  if IsRun('{74C3B606-9A3A-4547A46F-3C5E94FB633Ñ4C}') then
      begin
        EnumWindows(@EnumWindowsProc, 0);

        if xTargetWnd <> 0 then
            begin
              ShowWindow(xTargetWnd, SW_RESTORE);
              SetForegroundWindow(xTargetWnd);

              if ParamCount > 0 then
                  begin
                    for i := 1 to ParamCount do
                      begin
                        if LowerCase(ExtractFileExt(ParamStr(i))) = '.atd' then
                            begin
                              xSendMsg(xTargetWnd, ParamStr(i));
                              Break;
                            end;
                      end;
                  end;
            end;

        Halt(0);
      end;

  Application.Initialize;
  Application.Title := 'ATD';
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TTemperatureForm, TemperatureForm);
  Application.Run;
end.
