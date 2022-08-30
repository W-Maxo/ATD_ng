unit MainClasses;

interface

uses                                
  Windows, uSQLite3, SQLiteTable3, SysUtils, Series, Chart, HTMListB, StdCtrls,
  TeeTools, Graphics, MainSysUtils, IdThreadComponent, CPort, TeEngine, xTrend,
  AdvCircularProgress, RzStatus, Forms, ExtCtrls, TypInfo, Classes, MainConst,
  Dialogs, Controls, JvThread, Utils, xClasses, xType, DateUtils, SQLite3, Math;

type
  TNotifyExpEvent = procedure(Sender : TObject; Tmr : Double) of object;

  TExp = class(TObject)
  protected
    OldChTime,
    xLast                     : Double;

    sl3db                     : TSQLiteDatabase;
    sl3tb                     : TSQLIteTable;

    WriteThread               : TIdThreadComponent;
    ReadThread                : TJvThread;

    FOnTmrAdd                 : TNotifyExpEvent;
  private
    BuffArray                 : BuffData;

  published
    property OnTmrAdd : TNotifyExpEvent read FOnTmrAdd write FOnTmrAdd;

    procedure RunWrite(Sender: TIdThreadComponent);
  public
    ListCh                    : Array of TATD;

    CheckWriteTread           : TTimer;

    FullLoadProgress,
    CurrentLoadProgress,
    TrendPCA,
    TrendPCB                  : byte;

    StatusLoading             : String;

    SolA,
    SolB,
    Mass,
    VSol,
    //K0, K1, K2, K3,
    //K4, K5, K6, K7,
    //V0, V1, V2, V3,
    //V4, V5, V6, V7,
    //b0, b1, b2, b3,
    //b4, b5, b6, b7,
    LockTime,
    StWtA,
    StWtB,
    KA,
    KB,
    xDay,
    xVolum,
    OneSec,
    FiveMinut,
    xFiveMinut,
    CuteTime,
    DownEventTime1,
    DownEventTime2,
    MixEventTime1,
    MixEventTime2,
    LockValueA,
    LockValueB,
    CircAPos,
    CircBPos,
    StepCircA,
    StepCircB,
    Quantum1,
    Quantum2,
    VolPerStepA,
    VolPerStepB,
    pHK, pHb,
    Xmin, Xmax,
    Ymin, Ymax,
    ThresholdA,
    ThresholdB,
    StartTime,
    DataCreatedDB,
    Explength,
    TmrK,
    Tmrb,
    TmrVolt                   : Double;

    cK,
    cV,
    cb                        : TKvb;

    StAmV,
    StBmV,
    xStWtA,
    xStWtB,
    LockValue,
    Changing,
    StartExp,
    CancelLoad,
    ExpLoading                : boolean;

    FormatSettings            : TFloatFormat;//TFormatSettings;

    LockValuepH,
    LockValueKCI              : TColorLineTool;

    VolumSeriesA,
    DifVolumSeriesA,
    DifVolum2SeriesA,
    VolumSeriesB,
    DifVolumSeriesB,
    DifVolum2SeriesB          : TLineSeries;

    TmrSeries                 : TAreaSeries;

    SeriespH,
    SeriesKCI,
    mVAS,
    mVBS                      : TFastLineSeries;

    ComPort                   : TComPort;

    ExpNotes,
    DBFile                    : AnsiString;

    VolumChartA,
    VolumChartB,
    Chart1,
    Chart2,
    TmrChart                  : TChart;

    DifxHourSeriesA,
    DifxHourSeriesB           : TPointSeries;

    memo                      : TListBox;

    vCapt1,
    vCapt2                    : TAnnotationTool;

    Average1                  : Tlabel;
    
    AdvCircularProgressA      : TAdvCircularProgress;

    VolumStatusPaneA,
    VolumPaneA,
    VolumStatusPaneB,
    VolumPaneB,
    pHStatusPane,
    KCIStatusPane             : TRzStatusPane;

    AdvCircularProgressB      : TAdvCircularProgress;

    LogHTMListBox             : THTMListBox;

    StepsToQuaA,
    StepsToQuaB,
    StageA,
    StageB,
    m1, m2,
    M1Interval,
    M2Interval,
    StageActA,
    StageActB,
    StartChCount,
    EndChCount,
    iID,
    LChCount                  : integer;

    f                         : HFile;

    ToWriteBD                 : Array of String;

    ErrorMessage,
    ErrorHelpContext          : String;

    ErrorLoad                 : Boolean;
  published
    procedure Init;
    procedure StopExperiment;
    procedure Clear;
    procedure CreateDefaultDB;
    procedure RunRead(var Time : DWORD; ListBox : THTMListBox);
    procedure AddToLog(Event: String; Color : TColor);
    procedure StartExperiment;
    procedure PLockValue;
    procedure AddToWrite(sSQL : String);
    procedure ReBuildK;
    procedure WriteThreadTerminate(Sender: TIdThreadComponent; AException: Exception);
    procedure CheckWriteTreadTimerRun(Sender : TObject);
    procedure AddTmrPoint(Volt, TmpTime : Double);

    function GetC   (VoltmV : Double):Double;

    procedure StartChanging;
    procedure EndChanging;

    procedure AddLabel(Color : TColor);
  end;

implementation

procedure TExp.AddTmrPoint(Volt, TmpTime : Double);
var
  i,
  Ln        : Integer;

  xVolt,
  AvrTmp,
  XT,
  XI,
  TmrV      : Double;

  sSQL      : String;
begin
  try
    if BuffArray.Count <= AvrLhT then
        begin
          try
            BuffArray.Data[BuffArray.Count].Time:=TmpTime;
            BuffArray.Data[BuffArray.Count].Data:=Volt;
            inc(BuffArray.Count);
          finally end;
        end
      else
        begin
          try
            AvrTmp:=0;
            xVolt :=0;

            try
              for i:=0 to BuffArray.Count - 1 do
                begin
                  AvrTmp:=AvrTmp + BuffArray.Data[i].Data;
                end;

              if (BuffArray.Count - 1) > 0 then
                  begin
                    try
                      xVolt:=AvrTmp / BuffArray.Count;
                    finally end;
                  end
                else
                  begin
                    xVolt:=Volt;
                  end;
            finally end;

            TmrVolt:=xVolt;

            TmrV:=RoundTo(xGetpH(xVolt, Tmrb, TmrK), - 1);

            try
              if StartExp then
              begin
                XT:=HourSpan(TmpTime, 0);

                TmrSeries.AddXY(XT, TmrV);

                sSQL := 'INSERT INTO Tmr VALUES (null, ' +
                        FloatToStrF(XT, FormatSettings, 10, 7) +
                        ', ' +
                        FloatToStrF(TmrV, FormatSettings, 8, 1) + ');';

                AddToWrite(sSQL);

                if XT > 0.5 then
                  begin
                    if TmrChart.BottomAxis.AutomaticMaximum then
                      begin
                        TmrChart.BottomAxis.AutomaticMaximum:=False;
                        TmrChart.BottomAxis.AutomaticMinimum:=False;
                      end;

                    XI:=XT - xLast;

                    With TmrChart.BottomAxis do
                      SetMinMax(Minimum + XI, Maximum + XI);
                    end;
                xLast:=XT;
              end;

              if Assigned(FOnTmrAdd) then
                begin
                  FOnTmrAdd(SELF, TmrV);
                end;
            finally end;
            BuffArray.Count:=0;
          finally end;
        end;
  finally end;
end;

procedure TExp.AddToWrite(sSQL : String);
var
  Ln : Integer;
begin
  Ln:=Length(ToWriteBD);
  SetLength(ToWriteBD, Ln + 1);

  ToWriteBD[Ln]:=sSQL;
end;

procedure TExp.AddLabel(Color : TColor);
var
  sSQL      : String;
  vTime,
  TmpTimeV  : Double;
begin
  TmpTimeV:=Now - StartTime;

  vTime:=TmpTimeV;

  sSQL := 'INSERT INTO Label VALUES (NULL, ' +
            FloatToStrF(vTime, FormatSettings, 10, 7) + ', "' + ColorToString(Color) + '");';

  AddToWrite(sSQL);

  vTime:=HourSpan(TmpTimeV, 0);

  AddLineXEx('LCh' + IntToStr(LChCount), vTime,  Color, Chart1, 3, True);
  AddLineXEx('LCh' + IntToStr(LChCount), vTime,  Color, Chart2, 3, True);
  AddLineXEx('LCh' + IntToStr(LChCount), vTime,  Color, VolumChartA, 3, True);
  AddLineXEx('LCh' + IntToStr(LChCount), vTime,  Color, VolumChartB, 3, True);

  Inc(LChCount);
end;

procedure TExp.StartChanging;
var
  TmpTimeV : Double;
  iTime    : Double;
begin
  TmpTimeV:=Now - StartTime;

  ListCh[0].Changing:=True;
  ListCh[1].Changing:=True;

  OldChTime:=TmpTimeV;

  iTime:=HourSpan(TmpTimeV, 0);

  AddLineX('StartCh' + IntToStr(StartChCount), iTime,  $00E8E800, Chart1);
  AddLineX('StartCh' + IntToStr(StartChCount), iTime,  $00E8E800, Chart2);
  AddLineX('StartCh' + IntToStr(StartChCount), iTime,  $00E8E800, VolumChartA);
  AddLineX('StartCh' + IntToStr(StartChCount), iTime,  $00E8E800, VolumChartB);

  inc(StartChCount);

  Chart1.Repaint;
  Chart2.Repaint;
  VolumChartA.Repaint;
  VolumChartB.Repaint;
end;

procedure TExp.EndChanging;
var
  TmpTimeV : Double;
  sSQL     : String;
  iTime    : Double;
begin
  TmpTimeV:=Now - StartTime;

  ListCh[0].Changing:=False;
  ListCh[1].Changing:=False;

  sSQL := 'INSERT INTO Changing VALUES(null, ' + FloatToStrF(OldChTime, FormatSettings, 10, 7) +
                                          ', ' + FloatToStrF(TmpTimeV,  FormatSettings, 10, 7) + ')';

  AddToWrite(sSQL);

  iTime:=HourSpan(TmpTimeV, 0);

  AddLineX('EndCh' + IntToStr(EndChCount), iTime,  clBlack, Chart1);
  AddLineX('EndCh' + IntToStr(EndChCount), iTime,  clBlack, Chart2);
  AddLineX('EndCh' + IntToStr(EndChCount), iTime,  clBlack, VolumChartA);
  AddLineX('EndCh' + IntToStr(EndChCount), iTime,  clBlack, VolumChartB);

  inc(EndChCount);

  Chart1.Repaint;
  Chart2.Repaint;
  VolumChartA.Repaint;
  VolumChartB.Repaint;
end;

procedure TExp.ReBuildK;
begin
  try
    cK[0]:=(cV[0] - cV[1]) / (Sol0 - Sol1);
    cb[0]:=cV[0] - (Sol0 * cK[0]);

    cK[1]:=(cV[1] - cV[2]) / (Sol1 - Sol2);
    cb[1]:=cV[1] - (Sol1 * cK[1]);

    cK[2]:=(cV[2] - cV[3]) / (Sol2 - Sol3);
    cb[2]:=cV[2] - (Sol2 * cK[2]);

    cK[3]:=(cV[3] - cV[4]) / (Sol3 - Sol4);
    cb[3]:=cV[3] - (Sol3 * cK[3]);

    cK[4]:=(cV[4] - cV[5]) / (Sol4 - Sol5);
    cb[4]:=cV[4] - (Sol4 * cK[4]);

    cK[5]:=(cV[5] - cV[6]) / (Sol5 - Sol6);
    cb[5]:=cV[5] - (Sol5 * cK[5]);

    cK[6]:=(cV[6] - cV[7]) / (Sol6 - Sol7);
    cb[6]:=cV[6] - (Sol6 * cK[6]);
  finally end;
end;

procedure TExp.Init;
begin
  StartExp:=False;

  TrendPCA:=5;
  TrendPCB:=5;

  ReBuildK;

  SetLength(BuffArray.Data, AvrLhT + 1);
  BuffArray.Count:=0;

  SetLength(ListCh, 2);

  ListCh[0]:=TATD.Create;

  ListCh[0].Chart:=Chart1;
  ListCh[0].DifVolumSeries:=DifVolumSeriesA;
  ListCh[0].DifxHourSeries:=DifxHourSeriesA;

  ListCh[0].DifVolum2Series:=DifVolum2SeriesA;

  ListCh[0].Series:=SeriespH;
  ListCh[0].vCapt:=vCapt1;
  ListCh[0].AdvCircularProgressA:=AdvCircularProgressA;
  ListCh[0].StatusPane:=pHStatusPane;
  ListCh[0].VolumPane:=VolumPaneA;
  ListCh[0].mVAS:=mVAS;
  ListCh[0].VolumSeries:=VolumSeriesA;
  ListCh[0].VolumStatusPane:=VolumStatusPaneA;
  ListCh[0].M1Interval:=M1Interval;
  ListCh[0].VolPerStep:=VolPerStepA;
  ListCh[0].Comport:=Comport;
  ListCh[0].DownEventTime:=DownEventTime1;
  ListCh[0].MixEventTime:=MixEventTime1;
  ListCh[0].Threshold:=ThresholdA;
  ListCh[0].StepsToQuaA:=StepsToQuaA;
  ListCh[0].mass:=mass;
  ListCh[0].Sol:=SolA;
  ListCh[0].Threshold:=ThresholdA;
  ListCh[0].TrendPC:=TrendPCA;
  ListCh[0].pH:=True;
  ListCh[0].MotorShift:=6;
  ListCh[0].StepCircA:=StepCircA;

  ListCh[0].b:=pHb;
  ListCh[0].k:=pHk;

  ListCh[0].cK:=cK;
  ListCh[0].cV:=cV;
  ListCh[0].cb:=cb;


  ListCh[0].Init;

  ListCh[1]:=TATD.Create;

  ListCh[1].Chart:=Chart2;
  ListCh[1].DifVolumSeries:=DifVolumSeriesB;
  ListCh[1].DifxHourSeries:=DifxHourSeriesB;

  ListCh[1].DifVolum2Series:=DifVolum2SeriesB;

  ListCh[1].Series:=SeriesKCI;
  ListCh[1].vCapt:=vCapt2;
  ListCh[1].AdvCircularProgressA:=AdvCircularProgressB;
  ListCh[1].StatusPane:=KCIStatusPane;
  ListCh[1].VolumPane:=VolumPaneB;
  ListCh[1].VolumSeries:=VolumSeriesB;
  ListCh[1].mVAS:=mVBS;
  ListCh[1].VolumStatusPane:=VolumStatusPaneB;
  ListCh[1].M1Interval:=M2Interval;
  ListCh[1].VolPerStep:=VolPerStepB;
  ListCh[1].Comport:=Comport;
  ListCh[1].DownEventTime:=DownEventTime2;
  ListCh[1].MixEventTime:=MixEventTime2;
  ListCh[1].Threshold:=ThresholdB;
  ListCh[1].StepsToQuaA:=StepsToQuaB;
  ListCh[1].mass:=mass;
  ListCh[1].Sol:=SolB;
  ListCh[1].Threshold:=ThresholdB;
  ListCh[1].TrendPC:=TrendPCB;
  ListCh[1].pH:=False;
  ListCh[1].MotorShift:=2;
  ListCh[1].StepCircA:=StepCircB;

  ListCh[1].b:=pHb;
  ListCh[1].k:=pHK;

  ListCh[1].cK:=cK;
  ListCh[1].cV:=cV;
  ListCh[1].cb:=cb;

  ListCh[1].Init;
  
  WriteThread:=TIdThreadComponent.Create();
  WriteThread.Priority:=tpHighest;
  WriteThread.OnException:=WriteThreadTerminate;
  WriteThread.OnRun:=RunWrite;

  CheckWriteTread:=TTimer.Create(Application);
  CheckWriteTread.Enabled:=False;
  CheckWriteTread.Interval:=3000;
  CheckWriteTread.OnTimer:=CheckWriteTreadTimerRun;

  StartChCount  :=0;
  EndChCount    :=0;

  FormatSettings:=ffFixed; //.DecimalSeparator:='.';

  FiveMinut :=EncodeTime(0, 5, 0, 0);
  xFiveMinut:=5 / 60;
  CuteTime  :=EncodeTime(1, 0, 0, 0);
  OneSec    :=EncodeTime(0, 0, 1, 0);

  with VolumChartA do
    begin
      ClipPoints := False;

      Title.Visible := False;
      Legend.Visible := False;

      LeftAxis      .Axis.Width:=1;
      BottomAxis    .Axis.Width:=1;
      RightAxis     .Axis.Width:=1;
      TopAxis       .Axis.Width:=1;

      BottomAxis.RoundFirstLabel := False;

      View3D := False;
  end;

  with VolumChartB do
    begin
      ClipPoints := False;

      Title.Visible := False;
      Legend.Visible := False;

      LeftAxis      .Axis.Width:=1;
      BottomAxis    .Axis.Width:=1;
      RightAxis     .Axis.Width:=1;
      TopAxis       .Axis.Width:=1;

      BottomAxis.RoundFirstLabel := False;

      View3D := False;
  end;

  Clear;
end;

procedure TExp.CheckWriteTreadTimerRun(Sender : TObject);
begin
  {if not WriteThread.Active then
      ShowMessage(':-(');}
end;

procedure TExp.WriteThreadTerminate(Sender: TIdThreadComponent; AException: Exception);
begin
  //
end;

procedure TExp.StopExperiment;
var
  sSQL : String;
begin
  StartExp:=False;
  LockValue:=False;

  ListCh[0].StartExp:=StartExp;
  ListCh[1].StartExp:=StartExp;

  ListCh[0].LockValueA:=LockValue;
  ListCh[1].LockValueA:=LockValue;

  ListCh[0].Timer.Enabled:=False;
  ListCh[1].Timer.Enabled:=False;

  //CheckWriteTread.Enabled:=False;

  ListCh[0].Active:=False;
  ListCh[1].Active:=False;

  try
    sSQL := 'INSERT INTO Mass VALUES (' + FloatToStrF(Mass,   FormatSettings, 8, 4) +
                                          ', ' +
                                          FloatToStrF(xVolum, FormatSettings, 8, 4) +
                                          ', ' +
                                          FloatToStrF(xDay,   FormatSettings, 8, 4) +
                                          ', ' +
                                          FloatToStrF(SolA,   FormatSettings, 8, 4) +
                                          ', ' +
                                          FloatToStrF(SolB,   FormatSettings, 8, 4) +
                                          ');';
    sl3db.ExecSQL(sSQL);
  finally end;

  ListCh[0].ReBuildDifSer(True);
  ListCh[1].ReBuildDifSer(True);
end;

procedure TExp.StartExperiment;
var
  sSQL      : String;
begin
  ListCh[0].Clear;
  ListCh[1].Clear;

  TmrSeries.Clear;
  TmrChart.BottomAxis.AutomaticMaximum:=True;
  TmrChart.BottomAxis.AutomaticMinimum:=True;

  StartExp:=True;
  Explength:=0;
  StartTime:=Now;

  sSQL := 'INSERT INTO pH VALUES (' +
          FloatToStrF(Xmin, FormatSettings, 8, 4) +
          ', ' +
          FloatToStrF(Xmax, FormatSettings, 8, 4) +
          ', ' +
          FloatToStrF(Ymin, FormatSettings, 8, 4) +
          ', ' +
          FloatToStrF(Ymax, FormatSettings, 8, 4) +
          ', ' +
          FloatToStrF(pHK,  FormatSettings, 8, 4) +
          ', ' +
          FloatToStrF(pHb,  FormatSettings, 8, 4) +
          ');';

  sl3db.ExecSQL(sSQL);

  sSQL := 'INSERT INTO StartF VALUES (' +
          FloatToStrF(StartTime, FormatSettings, 10, 7) +
          ');';

  sl3db.ExecSQL(sSQL);

  WriteThread.Start;
  AddToLog(WideString('Начало эксперемента'), ClBlue);

  //ListCh[0].StartTime:=StartTime;
  //ListCh[1].StartTime:=StartTime;

  //ListCh[0].StartExp:=StartExp;
  //ListCh[1].StartExp:=StartExp;

  ListCh[0].StartExperiment(StartTime);
  ListCh[1].StartExperiment(StartTime);

  //CheckWriteTread.Enabled:=True;
end;

function TExp.GetC(VoltmV : Double):Double;
begin
  try
    if VoltmV > cV[1] then
        begin
          Result:=(VoltmV - cb[0]) / cK[0];
          Exit;
        end;

    if VoltmV > cV[2] then
        begin
          Result:=(VoltmV - cb[1]) / cK[1];
          Exit;
        end;

    if VoltmV > cV[3] then
        begin
          Result:=(VoltmV - cb[2]) / cK[2];
          Exit;
        end;

    if VoltmV > cV[4] then
        begin
          Result:=(VoltmV - cb[3]) / cK[3];
          Exit;
        end;

    if VoltmV > cV[5] then
        begin
          Result:=(VoltmV - cb[4]) / cK[4];
          Exit;
        end;

    if VoltmV > cV[6] then
        begin
          Result:=(VoltmV - cb[5]) / cK[5];
          Exit;
        end;

    Result:=(VoltmV - cb[6]) / cK[6];
  finally end;
end;

procedure TExp.PLockValue;
var
  sSQL      : String;
begin
  ListCh[0].LockValue:=ListCh[0].xVolt;
  ListCh[1].LockValue:=ListCh[1].xVolt;

  LockValueA:=ListCh[0].LockValue;
  LockValueB:=ListCh[1].LockValue;

  LockTime :=Now;

  ListCh[0].LockTime:=LockTime;
  ListCh[1].LockTime:=LockTime;

  ListCh[0].LockValueA:=True;
  ListCh[1].LockValueA:=True;

  ListCh[0].Timer.Enabled:=True;
  ListCh[1].Timer.Enabled:=True;

  //sl3db.BeginTransaction;

  sSQL := 'INSERT INTO Fixed_Values VALUES (null, ' +
          FloatToStrF(LockValueA, FormatSettings, 8, 4) +
          ', ' +
          FloatToStrF(LockValueB, FormatSettings, 8, 4) +
          ');';
  //sl3db.ExecSQL(sSQL);
  AddToWrite(sSQL);

  AddToLog(WideString('Фиксированное значение pH: ' + FloatToStrF(xGetpH(LockValueA, pHb, pHk), ffFixed,6,3) + ' (' + FloatToStrF(LockValueA, ffFixed,6,1)+' mV)'), ClGreen);
  AddToLog(WideString('Фиксированное значение KCI: ' + FloatToStrF(LockValueB, ffFixed,6,1)+' mV'), ClGreen);

  //sl3db.Commit;
end;

procedure TExp.Clear;
var
  i,
  Cnt,
  TmpInt : Integer;
begin
  ListCh[0].Clear;
  ListCh[1].Clear;

  Changing:=False;

  LockValue:=False;

  for Cnt := 0 to 1 do
    begin
      if ListCh[Cnt].LineCount > 0 then
          begin
            TmpInt:=ListCh[Cnt].LineCount;
            ListCh[Cnt].LineCount:=0;

            for i:=0 to TmpInt - 1 do
              begin
                ListCh[Cnt].Chart.FindComponent('Line' + IntToStr(i)).Free;
              end;
          end;
    end;

  TmpInt:=StartChCount;
  StartChCount:=0;

  if StartChCount > 0 then
      begin
        for i:=0 to TmpInt - 1 do
          begin
            Chart1.FindComponent('StartCh' + IntToStr(i)).Free;
            Chart2.FindComponent('StartCh' + IntToStr(i)).Free;
            VolumChartA.FindComponent('StartCh' + IntToStr(i)).Free;
            VolumChartB.FindComponent('StartCh' + IntToStr(i)).Free;
          end;
      end;

  TmpInt:=EndChCount;
  EndChCount:=0;

  if EndChCount > 0 then
      begin
        for i:=0 to TmpInt - 1 do
          begin
            Chart1.FindComponent('EndCh' + IntToStr(i)).Free;
            Chart2.FindComponent('EndCh' + IntToStr(i)).Free;
            VolumChartA.FindComponent('EndCh' + IntToStr(i)).Free;
            VolumChartB.FindComponent('EndCh' + IntToStr(i)).Free;
          end;
      end;

  TmpInt:=LChCount;
  LChCount:=0;

  if LChCount > 0 then
      begin
        for i:=0 to TmpInt - 1 do
          begin
            Chart1.FindComponent('LCh' + IntToStr(i)).Free;
            Chart2.FindComponent('LCh' + IntToStr(i)).Free;
            VolumChartA.FindComponent('LCh' + IntToStr(i)).Free;
            VolumChartB.FindComponent('LCh' + IntToStr(i)).Free;
          end;
      end;
end;

procedure TExp.CreateDefaultDB;
var
  sSQL: String;
  Major, Minor, Relese, Build : integer;
begin
  if FileExists(DBFile) then DeleteFile(DBFile);
  sl3db := TSQLiteDatabase.Create(DBFile);

  f :=Createfile(PWideChar(DBFile), GENERIC_READ, 0, nil, OPEN_EXISTING, 0, 0);

  try
    sl3db.BeginTransaction;
  finally end;

  sl3db.execsql('CREATE TABLE pH (Xmin REAL, Xmax REAL, Ymin REAL, Ymax REAL, K REAL, b REAL);');
  sl3db.execsql('CREATE TABLE Version (Major INTEGER, Minor INTEGER, Relese INTEGER, Build INTEGER);');
  sl3db.execsql('CREATE TABLE Discr (ID INTEGER PRIMARY KEY, DateTime REAL, Notes BLOB);');
  sl3db.execsql('CREATE TABLE Events (ID INTEGER PRIMARY KEY, DateTime REAL, Event BLOB, Color BLOB);');
  sl3db.execsql('CREATE TABLE Data_0 (ID INTEGER PRIMARY KEY, Time REAL, Data REAL);');
  sl3db.execsql('CREATE TABLE Data_1 (ID INTEGER PRIMARY KEY, Time REAL, Data REAL);');
  sl3db.execsql('CREATE TABLE Data_VA (ID INTEGER PRIMARY KEY, Time REAL, Data REAL);');
  sl3db.execsql('CREATE TABLE Data_VDifA (ID INTEGER PRIMARY KEY, Time REAL, Data REAL);');
  sl3db.execsql('CREATE TABLE Data_VB (ID INTEGER PRIMARY KEY, Time REAL, Data REAL);');
  sl3db.execsql('CREATE TABLE Data_VDifB (ID INTEGER PRIMARY KEY, Time REAL, Data REAL);');
  sl3db.execsql('CREATE TABLE Data_0_Ev (ID INTEGER PRIMARY KEY, Start REAL, End REAL);');
  sl3db.execsql('CREATE TABLE Data_1_Ev (ID INTEGER PRIMARY KEY, Start REAL, End REAL);');
  sl3db.execsql('CREATE TABLE Fixed_Values(ID INTEGER PRIMARY KEY, pH REAL, KCI REAL);');
  sl3db.execsql('CREATE TABLE Mass (xMass REAL, xVolum REAL, xDay REAL, SolA REAL, SolB REAL);');
  sl3db.execsql('CREATE TABLE Changing (ID INTEGER PRIMARY KEY, Start REAL, End REAL);');
  sl3db.execsql('CREATE TABLE StartF (Start REAL);');
  sl3db.execsql('CREATE TABLE Label (ID INTEGER PRIMARY KEY, Time REAL, Color BLOB);');
  sl3db.execsql('CREATE TABLE Tmr (ID INTEGER PRIMARY KEY, Time REAL, Data REAL);');

  DataCreatedDB:=Now;
  sSQL := 'INSERT INTO Discr VALUES (NULL, ' +
          FloatToStrF(DataCreatedDB, FormatSettings, 9, 5) +
          ', "' +
          ExpNotes +
          '");';

  sl3db.ExecSQL(sSQL);

  xGetFileVersionEx(Application.ExeName, Major, Minor, Relese, Build);

  sSQL := 'INSERT INTO Version VALUES (' +
          IntToStr(Major)   + ', ' +
          IntToStr(Minor)   + ', ' +
          IntToStr(Relese)  + ', ' +
          IntToStr(Build)   + ');';

  sl3db.ExecSQL(sSQL);

  try
    sl3db.Commit;
  finally end;
end;

procedure TExp.RunRead(var Time : DWORD; ListBox: THTMListBox);
  function InGetPh(K, b, VoltmV : Double):Double;
  begin
    try
      Result:=(VoltmV - b) / k;
    finally end;
  end;

  procedure InAddToLog(Event: AnsiString; Color : TColor; InTime : Double; var HTMListBox : THTMListBox);
  var
    S : String;
    begin
      S:='<FONT color="#0000FF"><B>' +
          FloatToStrF(HourSpan(InTime, StartTime), ffFixed,6,2) +
          ' : </B></FONT>';

      HTMListBox.AddItem(S + '<FONT color="' + ColorToHtml(Color) + '">' + TimeToStr(InTime) + ' : ' + Event + '</FONT>', Self);
      HTMListBox.Selected[LogHTMListBox.Count - 1]:=True;
    end;

  procedure AddInSer(Cnt : integer; TmpTime, TmpData, xb, xk : Double);
  var
    xVal : Double;
    begin
      if not ((TmpTime = 0) and (TmpData = 0)) then
          begin
            SetLength(ListCh[Cnt].OutputArray, ListCh[Cnt].VCn + 1);

            if ListCh[Cnt].pH then
                xVal:=xGetPh(TmpData, xb, xk)
              else
                xVal:=xGetC(TmpData, cK, cV, cb);

            ListCh[Cnt].Series.AddXY(HourSpan(TmpTime, 0), xVal);
            ListCh[Cnt].mVAS.AddXY(HourSpan(TmpTime, 0), TmpData);

            ListCh[Cnt].OutputArray[ListCh[Cnt].VCn].Time:=TmpTime;
            ListCh[Cnt].OutputArray[ListCh[Cnt].VCn].Data:=xVal;
            ListCh[Cnt].OutputArray[ListCh[Cnt].VCn].DataI:=TmpData;

            inc(ListCh[Cnt].VCn);
          end;
    end;

    procedure AddEvent(Cnt : Integer; TmpTime, TmpTimeEnd : Double);
    var
      xLn     : Integer;
      i,
      Ti,
      xHigh,
      Lng     : Integer;
      xInd    : Integer;

      cpi     : Double;
      begin
        try
          AddLineX('Line' + IntToStr(ListCh[Cnt].LineCount), HourSpan(TmpTime, 0),  $000080FF, ListCh[Cnt].Chart);
          inc(ListCh[Cnt].LineCount);
        finally end;

        try
          AddLineX('Line' + IntToStr(ListCh[Cnt].LineCount), HourSpan(TmpTimeEnd, 0),  clLime, ListCh[Cnt].Chart);
          inc(ListCh[Cnt].LineCount);
        finally end;

        xLn:=Length(ListCh[Cnt].CrrArray);

        ListCh[Cnt].CrrIndex:=GetMyTimeIndex(TmpTime, ListCh[Cnt].OutputArray) - 1;

        ListCh[Cnt].CrrArray[xLn - 1].Cn:=ListCh[Cnt].CrrIndex - ListCh[Cnt].OldIndex + 1;

        SetLength(ListCh[Cnt].CrrArray[xLn - 1].Arr, ListCh[Cnt].CrrArray[xLn - 1].Cn);
        SetLength(ListCh[Cnt].TmpTr.NotMandatoryValueList, ListCh[Cnt].CrrArray[xLn - 1].Cn);
        SetLength(ListCh[Cnt].TmpTr.Value, ListCh[Cnt].CrrArray[xLn - 1].Cn);

        cpi:=0;

        for i := 0 to ListCh[Cnt].CrrArray[xLn - 1].Cn - 1 do
          begin
            try
              Ti:= i + ListCh[Cnt].OldIndex;

              try
                ListCh[Cnt].CrrArray[xLn - 1].Arr[i].Time:=ListCh[Cnt].OutputArray[Ti].Time;
                ListCh[Cnt].CrrArray[xLn - 1].Arr[i].Data:=ListCh[Cnt].OutputArray[Ti].Data;
              finally end;

              ListCh[Cnt].TmpTr.NotMandatoryValueList[i]:=MinuteSpan(ListCh[Cnt].CrrArray[xLn - 1].Arr[i].Time,
                                                     ListCh[Cnt].CrrArray[xLn - 1].Arr[0].Time);

              ListCh[Cnt].TmpTr.Value[i]:=ListCh[Cnt].CrrArray[xLn - 1].Arr[i].Data;

              if cpi <= ListCh[Cnt].TmpTr.Value[i] then
                  begin
                    cpi:=ListCh[Cnt].TmpTr.Value[i];
                    xHigh:=i;
                  end;
            finally end;
          end;

          try
            ListCh[Cnt].TmpTr.CalculateTrend(ListCh[Cnt].CrrArray[xLn - 1].DifK,
                                             ListCh[Cnt].CrrArray[xLn - 1].DifB,
                                             ListCh[Cnt].CrrArray[xLn - 1].Cn - (xHigh div 2),
                                             ListCh[Cnt].CrrArray[xLn - 1].Cn);
          finally end;

          ListCh[Cnt].Dif2Volum:=ListCh[Cnt].CrrArray[xLn - 1].DifK;

          try
            ListCh[Cnt].DifVolum2Series.AddXY(HourSpan(ListCh[Cnt].OutputArray[ListCh[Cnt].CrrIndex].Time, 0), ListCh[Cnt].Dif2Volum);
          finally end;

          ListCh[Cnt].CrrArray[xLn - 1].Done:=True;

          inc(xLn);
          SetLength(ListCh[Cnt].CrrArray, xLn);

          ListCh[Cnt].OldIndex:=GetMyTimeIndex(TmpTimeEnd, ListCh[Cnt].OutputArray) - 1;
      end;

var
  i                 : integer;

  TmpTime,
  TmpTimeEnd,
  TmpData           : Double;

  StartT,
  StopT             : DWord;

  Event             : AnsiString;

  LengthArr,
  Counter,
  xC                : integer;

  xK, xb            : Double;

  TmpLine           : TControl;

  TmpColor          : TColor;

  TrL               : integer;

  Hour, Min,
  Sec, MSec         : Word;

  Tmp,
  m, b,
  iTime             : Double;

  LengthI,
  TempCount,
  Cnt               : Integer;

  dw                : DWord;

  Msg: PAnsiChar;
  ret : integer;
  
  Label CancelLS;
begin
  ExpLoading:=True;

  StatusLoading:='';

  Counter:=0;
  LengthI:=0;

  ErrorLoad:=False;
  ErrorMessage:='';
  ErrorHelpContext:='';

  Clear;

  TmrSeries.Clear;
  TmrChart.BottomAxis.AutomaticMaximum:=True;
  TmrChart.BottomAxis.AutomaticMinimum:=True;

  try
    sl3db := TSQLiteDatabase.Create(DBFile);
  finally end;

  try
    sl3db.TableExists('Version');
  except
    Msg := nil;

  ret := sqlite3_errcode(sl3db.DB);
  if ret <> SQLITE_OK then
    Msg := sqlite3_errmsg(sl3db.DB);

  if Msg <> nil then
      ErrorMessage:=Msg;

   ErrorLoad:=True;
  end;

  if ErrorLoad then GoTo CancelLS;

  StatusLoading:='Подготовка...';

  try
    if sl3db.TableExists('Data_0') then
      begin
        try
          sl3tb := sl3db.GetTable('SELECT * FROM Data_0');
          LengthI:=LengthI + sl3tb.Count;
        finally
          sl3tb.Free;
        end;
      end;

    if sl3db.TableExists('Data_1') then
      begin
        try
          sl3tb := sl3db.GetTable('SELECT * FROM Data_1');
          LengthI:=LengthI + sl3tb.Count;
        finally
          sl3tb.Free;
        end;
      end;

    if sl3db.TableExists('Events') then
      begin
        try
          sl3tb := sl3db.GetTable('SELECT * FROM Events');
          LengthI:=LengthI + sl3tb.Count;
        finally
          sl3tb.Free;
        end;
      end;

    if sl3db.TableExists('Data_VA') then
      begin
        try
          sl3tb := sl3db.GetTable('SELECT * FROM Data_VA');
          LengthI:=LengthI + sl3tb.Count;
        finally
          sl3tb.Free;
        end;
      end;

    if sl3db.TableExists('Data_VB') then
      begin
        try
          sl3tb := sl3db.GetTable('SELECT * FROM Data_VB');
          LengthI:=LengthI + sl3tb.Count;
        finally
          sl3tb.Free;
        end;
      end;

    if sl3db.TableExists('Data_VDifA') then
      begin
        try
          sl3tb := sl3db.GetTable('SELECT * FROM Data_VDifA');
          LengthI:=LengthI + sl3tb.Count;
        finally
          sl3tb.Free;
        end;
      end;

    if sl3db.TableExists('Data_VDifB') then
      begin
        try
          sl3tb := sl3db.GetTable('SELECT * FROM Data_VDifB');
          LengthI:=LengthI + sl3tb.Count;
        finally
          sl3tb.Free;
        end;
      end;

    if sl3db.TableExists('Data_0_Ev') then
      begin
        try
          sl3tb := sl3db.GetTable('SELECT * FROM Data_0_Ev');
          LengthI:=LengthI + sl3tb.Count;
        finally
          sl3tb.Free;
        end;
      end;

    if sl3db.TableExists('Data_1_Ev') then
      begin
        try
          sl3tb := sl3db.GetTable('SELECT * FROM Data_1_Ev');
          LengthI:=LengthI + sl3tb.Count;
        finally
          sl3tb.Free;
        end;
      end;

    if sl3db.TableExists('Changing') then
      begin
        try
          sl3tb := sl3db.GetTable('SELECT * FROM Changing');
          LengthI:=LengthI + sl3tb.Count;
        finally
          sl3tb.Free;
        end;
      end;

    if sl3db.TableExists('Tmr') then
      begin
        try
          sl3tb := sl3db.GetTable('SELECT * FROM Tmr');
          LengthI:=LengthI + sl3tb.Count;
        finally
          sl3tb.Free;
        end;
      end;
  finally end;

  xK:=1;
  xb:=1;

  if sl3db.TableExists('StartF') then
      begin
        try
          sl3tb := sl3db.GetTable('SELECT * FROM StartF');
          sl3tb.MoveFirst;
          if sl3tb.Count > 0 then
              begin
                StartTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Start']);
              end;
        finally
          sl3tb.Free;
        end;
      end;

  if sl3db.TableExists('pH') then
      begin
        try
          sl3tb := sl3db.GetTable('SELECT * FROM pH');
          sl3tb.MoveFirst;
          if sl3tb.Count > 0 then
              begin
                xK:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['K']);
                xb:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['b']);
              end;
        finally
          sl3tb.Free;
        end;
      end;

  if CancelLoad then GoTo CancelLS;

  SeriespH.Active:=False;
  SeriesKCI.Active:=False;

  StatusLoading:='Загрузка данных самописцев...';

  StartT:=GetTickCount;

  for Cnt := 0 to 1 do
    begin
      ListCh[Cnt].VCn:=0;
      SetLength(ListCh[Cnt].OutputArray, 0);

      if sl3db.TableExists('Data_' + IntToStr(Cnt)) then
          begin
            //try
              sl3tb := sl3db.GetTable('SELECT * FROM Data_' + IntToStr(Cnt));
              sl3tb.MoveFirst;
              if sl3tb.Count > 0 then
                  begin
                    try
                      TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Time']);
                      TmpData:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data']);

                      AddInSer(Cnt, TmpTime, TmpData, xb, xk);
                    finally end;

                    TempCount:=sl3tb.Count;

                    for xC:=0 to TempCount do
                      begin
                        if sl3tb.Next then
                          if not sl3tb.EOF then
                              begin
                                try
                                  TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Time']);
                                  TmpData:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data']);

                                  AddInSer(Cnt, TmpTime, TmpData, xb, xk);
                                finally end;

                                if CancelLoad then GoTo CancelLS;
                              end;
                        CurrentLoadProgress:=Round(xC / TempCount * 100);
                        inc(Counter);
                        FullLoadProgress:=Round(Counter / LengthI * 100);
                      end;
                sl3tb.MoveLast;

                Explength:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Time']);
                sl3tb.Free;
              //finally

              //end;
            end;
          end;
    end;

  for Cnt := 0 to 1 do
    begin
      if HourSpan(Explength, 0) > xFiveMinut then
        begin
          With ListCh[Cnt].Chart.BottomAxis do
            SetMinMax(HourSpan(Explength, 0) - xFiveMinut,
                      HourSpan(Explength, 0));
        end;
    end;

  if CancelLoad then GoTo CancelLS;

  if sl3db.TableExists('Discr') then
      begin
        try
          sl3tb := sl3db.GetTable('SELECT * FROM Discr');
          sl3tb.MoveFirst;
          if sl3tb.Count > 0 then
            begin
              DataCreatedDB:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['DateTime']);
              ExpNotes:=AnsiString(sl3tb.FieldAsBlobText(sl3tb.FieldIndex['Notes']));
            end;
        finally
          sl3tb.Free;
        end;
      end;

  if CancelLoad then GoTo CancelLS;

  StatusLoading:='Загрузка списка событий...';

  if sl3db.TableExists('Events') then
      begin
        sl3tb := sl3db.GetTable('SELECT * FROM Events');
        sl3tb.MoveFirst;
        if sl3tb.Count > 0 then
            begin
              try
                TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['DateTime']);
                Event:=sl3tb.FieldAsBlobText(sl3tb.FieldIndex['Event']);

                TmpColor:=StringToColor(AnsiString(sl3tb.FieldAsBlobText(sl3tb.FieldIndex['Color'])));

                ListBox.Items.BeginUpdate;
                ListBox.Clear;
      
                InAddToLog(Event, TmpColor, TmpTime, ListBox);
              finally end;

              TempCount:=sl3tb.Count;

              for i:=0 to TempCount do
                begin
                  if sl3tb.Next then
                    if not sl3tb.EOF then
                      begin
                        try
                          TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['DateTime']);
                          Event:=sl3tb.FieldAsBlobText(sl3tb.FieldIndex['Event']);

                          TmpColor:=StringToColor(AnsiString(sl3tb.FieldAsBlobText(sl3tb.FieldIndex['Color'])));

                          InAddToLog(Event, TmpColor, TmpTime, ListBox);
                        finally end;

                        if CancelLoad then GoTo CancelLS;
                      end;
                  try
                    CurrentLoadProgress:=Round(i / TempCount * 100);
                    inc(Counter);
                    FullLoadProgress:=Round(Counter / LengthI * 100);
                  finally end;
                end;

            ListBox.Items.EndUpdate;
          end;
      end;

  VolumSeriesA.Active:=False;
  VolumSeriesB.Active:=False;

  if CancelLoad then GoTo CancelLS;

  StatusLoading:='Данные эксперимента (Объемы титрантов)';

  for Cnt := 0 to 1 do
    begin
      if sl3db.TableExists('Data_V' + TS[Cnt]) then
          begin
            sl3tb := sl3db.GetTable('SELECT * FROM Data_V' + TS[Cnt]);
            sl3tb.MoveFirst;
            if sl3tb.Count > 0 then
              begin
                try
                  TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Time']);
                  TmpData:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data']);
                  ListCh[Cnt].VolumSeries.AddXY(HourSpan(TmpTime, 0), TmpData);
                finally end;

                TempCount:=sl3tb.Count;

                for i:=0 to TempCount do
                  begin
                    if sl3tb.Next then
                      if not sl3tb.EOF then
                        begin
                          try
                            TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Time']);
                            TmpData:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data']);
                            ListCh[Cnt].VolumSeries.AddXY(HourSpan(TmpTime, 0), TmpData);
                          finally end;

                          if CancelLoad then GoTo CancelLS;
                        end;
                    try
                      CurrentLoadProgress:=Round(i / TempCount * 100);
                      inc(Counter);
                      FullLoadProgress:=Round(Counter / LengthI * 100);
                    finally end;
                  end;
              end;
            sl3tb.Free;
          end;
    end;

  if CancelLoad then GoTo CancelLS;

  if sl3db.TableExists('Mass') then
      begin
        try
          sl3tb := sl3db.GetTable('SELECT * FROM Mass');
          sl3tb.MoveFirst;
          if sl3tb.Count > 0 then
              begin
                Mass      :=sl3tb.FieldAsDouble   (sl3tb.FieldIndex['xMass']);
                xVolum    :=sl3tb.FieldAsDouble   (sl3tb.FieldIndex['xVolum']);
                xDay      :=sl3tb.FieldAsDouble   (sl3tb.FieldIndex['xDay']);

                SolA      :=sl3tb.FieldAsDouble   (sl3tb.FieldIndex['SolA']);
                SolB      :=sl3tb.FieldAsDouble   (sl3tb.FieldIndex['SolB']);
              end;
        finally
          sl3tb.Free;
        end;
      end;

  StatusLoading:='Данные эксперимента (Дифф. скорость)';

  ListCh[0].DifVolumSeries.Active:=False;
  ListCh[1].DifVolumSeries.Active:=False;

  ListCh[0].DifVolum2Series.Active:=False;
  ListCh[1].DifVolum2Series.Active:=False;

  for Cnt := 0 to 1 do
    begin
      if sl3db.TableExists('Data_VDif' + TS[Cnt]) then
          begin
            sl3tb := sl3db.GetTable('SELECT * FROM Data_VDif' + TS[Cnt]);
            sl3tb.MoveFirst;
            if sl3tb.Count > 0 then
              begin
                try
                  TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Time']);
                  TmpData:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data']);

                  TrL:=Length(ListCh[Cnt].Tr.NotMandatoryValueList);
                  SetLength(ListCh[Cnt].Tr.NotMandatoryValueList, TrL + 1);
                  SetLength(ListCh[Cnt].Tr.Value, TrL + 1);

                  SetLength(ListCh[Cnt].CurrentVValue, TrL + 1);
                finally end;

                try
                  Tmp:=MinuteSpan(TmpTime, 0);

                  ListCh[Cnt].CurrentVValue[TrL].Time:=TmpTime;
                  ListCh[Cnt].CurrentVValue[TrL].Data:=Tmp;
                  ListCh[Cnt].CurrentVValue[TrL].DataI:=TmpData;

                  ListCh[Cnt].Tr.NotMandatoryValueList[TrL]:=Tmp;
                  ListCh[Cnt].Tr.Value[TrL]:=TmpData * ListCh[Cnt].Sol / mass;

                  if TrL < ListCh[Cnt].TrendPC then
                      ListCh[Cnt].Tr.CalculateTrend(m, b, 0, TrL)
                    else
                      ListCh[Cnt].Tr.CalculateTrend(m, b, TrL - ListCh[Cnt].TrendPC, TrL);
                finally end;

                ListCh[Cnt].DifVolumSeries.AddXY(HourSpan(TmpTime, 0), m);

                TempCount:=sl3tb.Count;

                for i:=0 to TempCount do
                  begin
                    if sl3tb.Next then
                      if not sl3tb.EOF then
                        begin
                          try
                            TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Time']);
                            TmpData:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data']);

                            TrL:=Length(ListCh[Cnt].Tr.NotMandatoryValueList);
                            SetLength(ListCh[Cnt].Tr.NotMandatoryValueList, TrL + 1);
                            SetLength(ListCh[Cnt].Tr.Value, TrL + 1);

                            SetLength(ListCh[Cnt].CurrentVValue, TrL + 1);
                          finally end;

                          try
                            Tmp:=MinuteSpan(TmpTime, 0);

                            ListCh[Cnt].CurrentVValue[TrL].Time:=TmpTime;
                            ListCh[Cnt].CurrentVValue[TrL].Data:=Tmp;
                            ListCh[Cnt].CurrentVValue[TrL].DataI:=TmpData;

                            ListCh[Cnt].Tr.NotMandatoryValueList[TrL]:=Tmp;
                            ListCh[Cnt].Tr.Value[TrL]:=TmpData * ListCh[Cnt].Sol / mass;

                            if TrL < ListCh[Cnt].TrendPC then
                                ListCh[Cnt].Tr.CalculateTrend(m, b, 0, TrL)
                              else
                                ListCh[Cnt].Tr.CalculateTrend(m, b, TrL - ListCh[Cnt].TrendPC, TrL);
                          finally end;

                          ListCh[Cnt].DifVolumSeries.AddXY(HourSpan(TmpTime, 0), m);

                          if CancelLoad then GoTo CancelLS;
                        end;
                    try
                      CurrentLoadProgress:=Round(i / TempCount * 100);
                      inc(Counter);
                      FullLoadProgress:=Round(Counter / LengthI * 100);
                    finally end;
                  end;
              end;
            sl3tb.Free;
        end;
    end;

  if CancelLoad then GoTo CancelLS;

  StatusLoading:='Данные эксперимента (Смены раствора)';

   if sl3db.TableExists('Changing') then
      begin
          sl3tb := sl3db.GetTable('SELECT * FROM Changing');
          sl3tb.MoveFirst;
          if sl3tb.Count > 0 then
              begin
                try
                  TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Start']);

                  iTime:=HourSpan(TmpTime, 0);

                  AddLineX('StartCh' + IntToStr(StartChCount), iTime,  $00E8E800, Chart1);
                  AddLineX('StartCh' + IntToStr(StartChCount), iTime,  $00E8E800, Chart2);
                  AddLineX('StartCh' + IntToStr(StartChCount), iTime,  $00E8E800, VolumChartA);
                  AddLineX('StartCh' + IntToStr(StartChCount), iTime,  $00E8E800, VolumChartB);
                  inc(StartChCount);
                finally end;

                try
                  TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['End']);

                  iTime:=HourSpan(TmpTime, 0);

                  AddLineX('EndCh' + IntToStr(EndChCount), iTime,  clBlack, Chart1);
                  AddLineX('EndCh' + IntToStr(EndChCount), iTime,  clBlack, Chart2);
                  AddLineX('EndCh' + IntToStr(EndChCount), iTime,  clBlack, VolumChartA);
                  AddLineX('EndCh' + IntToStr(EndChCount), iTime,  clBlack, VolumChartB);
                  inc(EndChCount);
                finally end;

                TempCount:=sl3tb.Count;

                for i:=0 to TempCount do
                  begin
                    if sl3tb.Next then
                        if not sl3tb.EOF then
                            begin
                              try
                                TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Start']);

                                iTime:=HourSpan(TmpTime, 0);

                                AddLineX('StartCh' + IntToStr(StartChCount), iTime,  $00E8E800, Chart1);
                                AddLineX('StartCh' + IntToStr(StartChCount), iTime,  $00E8E800, Chart2);
                                AddLineX('StartCh' + IntToStr(StartChCount), iTime,  $00E8E800, VolumChartA);
                                AddLineX('StartCh' + IntToStr(StartChCount), iTime,  $00E8E800, VolumChartB);
                                inc(StartChCount);
                              finally end;

                              TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['End']);

                              iTime:=HourSpan(TmpTime, 0);

                              try
                                AddLineX('EndCh' + IntToStr(EndChCount), iTime,  clBlack, Chart1);
                                AddLineX('EndCh' + IntToStr(EndChCount), iTime,  clBlack, Chart2);
                                AddLineX('EndCh' + IntToStr(EndChCount), iTime,  clBlack, VolumChartA);
                                AddLineX('EndCh' + IntToStr(EndChCount), iTime,  clBlack, VolumChartB);
                                inc(EndChCount);
                              finally end;

                              if CancelLoad then GoTo CancelLS;
                            end;
                    try
                      CurrentLoadProgress:=Round(i / TempCount * 100);
                      inc(Counter);
                      FullLoadProgress:=Round(Counter / LengthI * 100);
                    finally end;
                  end;
              end;
          sl3tb.Free;
      end;

  if CancelLoad then GoTo CancelLS;

  StatusLoading:='Данные эксперимента (Метки)';

  if sl3db.TableExists('Label') then
      begin
          sl3tb := sl3db.GetTable('SELECT * FROM Label');
          sl3tb.MoveFirst;
          if sl3tb.Count > 0 then
              begin
                try
                  TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Time']);
                  TmpColor:=StringToColor(AnsiString(sl3tb.FieldAsBlobText(sl3tb.FieldIndex['Color'])));

                  iTime:=HourSpan(TmpTime, 0);

                  AddLineXEx('LCh' + IntToStr(LChCount), iTime,  TmpColor, Chart1, 3, False);
                  AddLineXEx('LCh' + IntToStr(LChCount), iTime,  TmpColor, Chart2, 3, False);
                  AddLineXEx('LCh' + IntToStr(LChCount), iTime,  TmpColor, VolumChartA, 3, False);
                  AddLineXEx('LCh' + IntToStr(LChCount), iTime,  TmpColor, VolumChartB, 3, False);
                  inc(LChCount);
                finally end;

                TempCount:=sl3tb.Count;

                for i:=0 to TempCount do
                  begin
                    if sl3tb.Next then
                        if not sl3tb.EOF then
                            begin
                              try
                                TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Time']);
                                TmpColor:=StringToColor(AnsiString(sl3tb.FieldAsBlobText(sl3tb.FieldIndex['Color'])));

                                iTime:=HourSpan(TmpTime, 0);

                                AddLineXEx('LCh' + IntToStr(LChCount), iTime,  TmpColor, Chart1, 3, False);
                                AddLineXEx('LCh' + IntToStr(LChCount), iTime,  TmpColor, Chart2, 3, False);
                                AddLineXEx('LCh' + IntToStr(LChCount), iTime,  TmpColor, VolumChartA, 3, False);
                                AddLineXEx('LCh' + IntToStr(LChCount), iTime,  TmpColor, VolumChartB, 3, False);
                                inc(LChCount);
                              finally end;

                              if CancelLoad then GoTo CancelLS;
                            end;
                    try
                      CurrentLoadProgress:=Round(i / TempCount * 100);
                      inc(Counter);
                      FullLoadProgress:=Round(Counter / LengthI * 100);
                    finally end;
                  end;
              end;
          sl3tb.Free;
      end;

  StatusLoading:='Данные эксперимента (Титрования)';

  for Cnt := 0 to 1 do
    begin
      if sl3db.TableExists('Data_' + IntToStr(Cnt) + '_Ev') then
          begin
            SetLength(ListCh[Cnt].CrrArray, 1);
            ListCh[Cnt].CrrIndex:=0;
            ListCh[Cnt].OldIndex:=0;

            sl3tb := sl3db.GetTable('SELECT * FROM Data_' + IntToStr(Cnt) + '_Ev');
            sl3tb.MoveFirst;
            if sl3tb.Count > 0 then
                begin
                  try
                    TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Start']);
                    TmpTimeEnd:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['End']);

                    AddEvent(Cnt, TmpTime, TmpTimeEnd);
                  finally end;

                  TempCount:=sl3tb.Count;

                  for i:=0 to TempCount do
                    begin
                      if sl3tb.Next then
                        if not sl3tb.EOF then
                          begin
                            try
                              TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Start']);
                              TmpTimeEnd:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['End']);

                              AddEvent(Cnt, TmpTime, TmpTimeEnd);
                            finally end;

                            if CancelLoad then GoTo CancelLS;
                          end;
                      try
                        CurrentLoadProgress:=Round(i / TempCount * 100);
                        inc(Counter);
                        FullLoadProgress:=Round(Counter / LengthI * 100);
                      finally end;
                    end;
                end;
            sl3tb.Free;
          end;
      end;

  if CancelLoad then GoTo CancelLS;

   if sl3db.TableExists('Fixed_Values') then
      begin
        try
          sl3tb := sl3db.GetTable('SELECT * FROM Fixed_Values');
          sl3tb.MoveFirst;
          if sl3tb.Count > 0 then
            begin
              ListCh[0].LockValue:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['pH']);
              LockValuepH.Value:=InGetPh(xK, xb, ListCh[0].LockValue);

              ListCh[1].LockValue:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['KCI']);
              LockValueKCI.Value:=xGetC(ListCh[1].LockValue, cK, cV, cb);
            end;
        finally
          sl3tb.Free;
        end;
      end;

   if CancelLoad then GoTo CancelLS;

   StatusLoading:='Данные эксперимента (Температура)';

   TmrSeries.Active:=False;

   if sl3db.TableExists('Tmr') then
      begin
        sl3tb := sl3db.GetTable('SELECT * FROM Tmr');
        sl3tb.MoveFirst;
        if sl3tb.Count > 0 then
          begin
            try
              TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Time']);
              TmpTimeEnd:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data']);

              TmrSeries.AddXY(TmpTime, TmpTimeEnd);
            finally end;

            TempCount:=sl3tb.Count;

            for i:=0 to TempCount do
              begin
                if sl3tb.Next then
                  if not sl3tb.EOF then
                    begin
                      try
                        TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Time']);
                        TmpTimeEnd:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data']);

                        TmrSeries.AddXY(TmpTime, TmpTimeEnd);
                      finally end;

                      if CancelLoad then GoTo CancelLS;
                    end;
                  try
                    CurrentLoadProgress:=Round(i / TempCount * 100);
                    inc(Counter);
                    FullLoadProgress:=Round(Counter / LengthI * 100);
                  finally end;
                end;
            end;
      sl3tb.Free;
   end;

   TmrSeries.Active:=True;

   LockValuepH.Active:=True;
   LockValueKCI.Active:=True;

   VolumSeriesA.Active:=False;
   VolumSeriesB.Active:=False;

   StopT:=GetTickCount;

   Time:= StopT - StartT;

   SeriespH.Active:=True;
   SeriesKCI.Active:=True;

   sl3db.Free;

   CancelLS:

   ExpLoading:=False;
   CancelLoad:=False;
end;

procedure TExp.RunWrite(Sender: TIdThreadComponent);

  procedure AddVEx(Table : String; LengthB : integer; var Buff : Array of xData);
  var
    i     : integer;
    sSQL  : String;
  begin
    try
      for i:=0 to LengthB do
        begin
          try
            sSQL := 'INSERT INTO ' +
                    Table +
                    ' VALUES(null, ' +
                    FloatToStrF(Buff[i].Time, FormatSettings, 10, 7) +
                    ', ' +
                    FloatToStrF(Buff[i].Data, FormatSettings, 10, 5) +
                    ')';
            sl3db.ExecSQL(sSQL);
          finally end;
        end;
    finally end;
  end;

  procedure AddV(Table : String; var Buff : Array of xData);
  begin
    AddVEx(Table, Length(Buff) - 1, Buff);
  end;

var
  sSQL  : String;

  i,
  ink,
  LnCh  : Integer;

  xLn   : Integer;

  Label Term;
begin
  LnCh:=Length(ListCh) - 1;

  While StartExp do
    begin
      try
        sl3db.BeginTransaction;
      finally end;

      for i := 0 to LnCh  do
        begin
          if ListCh[i].VolumDataAa.Processed then
              begin
                try
                  AddV('Data_V' + TS[i], ListCh[i].VolumDataAa.Data);

                  try
                    sSQL := 'INSERT INTO Data_' + IntToStr(i) + '_Ev VALUES(null, ' +
                            FloatToStrF(ListCh[i].VolumDataAa.StartEvent, FormatSettings, 10, 7) + ', ' +
                            FloatToStrF(ListCh[i].VolumDataAa.EndEvent,   FormatSettings, 10, 7) + ')';

                    sl3db.ExecSQL(sSQL);
                  finally end;

                  try
                    sSQL := 'INSERT INTO Data_VDif' + TS[i] + ' VALUES(null, ' +
                            FloatToStrF(ListCh[i].VolumDataAa.Dif.Time, FormatSettings, 10, 7) + ', ' +
                            FloatToStrF(ListCh[i].VolumDataAa.Dif.Data, FormatSettings, 10, 7) + ')';

                    sl3db.ExecSQL(sSQL);
                  finally end;

                  SetLength(ListCh[i].VolumDataAa.Data, 0);
                  ListCh[i].VolumDataAa.Processed:=False;
                finally end;
              end;

          if ListCh[i].VolumDataAb.Processed then
              begin
                try
                  AddV('Data_V' + TS[i], ListCh[i].VolumDataAb.Data);

                  try
                    sSQL := 'INSERT INTO Data_' + IntToStr(i) + '_Ev VALUES(null, ' +
                            FloatToStrF(ListCh[i].VolumDataAb.StartEvent, FormatSettings, 10, 7) + ', ' +
                            FloatToStrF(ListCh[i].VolumDataAb.EndEvent,   FormatSettings, 10, 7) + ')';

                    sl3db.ExecSQL(sSQL);
                 finally end;

                 try
                    sSQL := 'INSERT INTO Data_VDif' + TS[i] + ' VALUES(null, ' +
                            FloatToStrF(ListCh[i].VolumDataAb.Dif.Time, FormatSettings, 10, 7) + ', ' +
                            FloatToStrF(ListCh[i].VolumDataAb.Dif.Data, FormatSettings, 10, 7) + ')';

                    sl3db.ExecSQL(sSQL);
                 finally end;

                  SetLength(ListCh[i].VolumDataAb.Data, 0);
                  ListCh[i].VolumDataAb.Processed:=False;
                finally end;
              end;
        end;

      for i := 0 to LnCh  do
        begin
          try
            if ListCh[i].F1D1 then
                begin
                  AddVEx('Data_' + IntToStr(i), 499, ListCh[i].Data1);
                  ListCh[i].F1D1:=false;
                end;
            if ListCh[i].F1D2 then
                begin
                  AddVEx('Data_' + IntToStr(i), 499, ListCh[i].Data1x);
                  ListCh[i].F1D2:=false;
                end;
          finally end;
        end;

        xLn:=Length(ToWriteBD);
        if xLn > 0 then
            begin
              for i := 0 to xLn - 1 do
                begin
                  try
                    sl3db.ExecSQL(ToWriteBD[i]);
                  finally end;
                end;
              SetLength(ToWriteBD, 0);
            end;

        Explength:=Now - StartTime;

        try
          sl3db.Commit;
        finally end;

        if StartExp then
            begin
              for ink:= 0 to TimeWrite div 1000 do
                begin
                  Sleep(1000);
                  if not StartExp then GoTo Term;
                end;
            end;
    end;

  Term:

   try
    sl3db.BeginTransaction;
   finally end;

   for i := 0 to LnCh do
     begin
        try
          if ListCh[i].F1 then
              begin
                AddVEx('Data_' + IntToStr(i), ListCh[i].DataC - 1, ListCh[i].Data1);
              end
            else
              begin
                AddVEx('Data_' + IntToStr(i), ListCh[i].DataC - 1, ListCh[i].Data1x);
              end;
        finally end;
     end;

   try
      sl3db.Commit;
   finally end;

   try
      sl3db.BeginTransaction;
   finally end;

   for i := 0 to LnCh do
      begin
        if ListCh[i].Proc then
            begin
              while ListCh[i].Proc do
                begin
                  sleep(10);
                end;
              if ListCh[i].VolumDataAa.Processed then
                  begin
                    try
                      AddV('Data_V' + TS[i], ListCh[i].VolumDataAa.Data);

                      try
                        sSQL := 'INSERT INTO Data_' + IntToStr(i) + '_Ev VALUES(null, ' +
                                FloatToStrF(ListCh[i].VolumDataAa.StartEvent, FormatSettings, 10, 7) + ', ' +
                                FloatToStrF(ListCh[i].VolumDataAa.EndEvent,   FormatSettings, 10, 7) + ')';

                        sl3db.ExecSQL(sSQL);
                      finally end;

                      SetLength(ListCh[i].VolumDataAa.Data, 0);
                      ListCh[i].VolumDataAa.Processed:=False;
                    finally end;
                  end;

              if ListCh[i].VolumDataAb.Processed then
                  begin
                    try
                      AddV('Data_V' + TS[i], ListCh[i].VolumDataAb.Data);

                      try
                        sSQL := 'INSERT INTO Data_' + IntToStr(i) + '_Ev VALUES(null, ' +
                                FloatToStrF(ListCh[i].VolumDataAb.StartEvent, FormatSettings, 10, 7) + ', ' +
                                FloatToStrF(ListCh[i].VolumDataAb.EndEvent,   FormatSettings, 10, 7) + ')';

                        sl3db.ExecSQL(sSQL);
                      finally end;

                      SetLength(ListCh[i].VolumDataAb.Data, 0);
                      ListCh[i].VolumDataAb.Processed:=False;
                    finally end;
                end;
          end;
      end;

  xLn:=Length(ToWriteBD);
  if xLn > 0 then
      begin
        for i := 0 to xLn - 1 do
          begin
            try
              sl3db.ExecSQL(ToWriteBD[i]);
            finally end;
          end;
        SetLength(ToWriteBD, 0);
      end;

  try
    sl3db.Commit;
  finally end;

  _lClose(f);

  sl3db.Free;

  WriteThread.Stop;
end;

procedure TExp.AddToLog(Event: String; Color : TColor);
var
  sSQL      : String;
  Time      : Double;
  S         : String;
begin
  try
    Time:=Now;

    sSQL := 'INSERT INTO Events(ID, DateTime, Event, Color) VALUES (NULL, ' +
            FloatToStrF(Time, FormatSettings, 10, 7) + ', "' + Event + '", "' +
            ColorToString(Color) + '");';

    AddToWrite(sSQL);

    S:='<FONT color="#0000FF"><B>' +
        FloatToStrF(HourSpan(Time, StartTime), ffFixed,6,2) +
        ' : </B></FONT>';

    LogHTMListBox.AddItem(S + '<FONT color="' + ColorToHtml(Color) + '">' +
                          TimeToStr(Time) + ' : ' + Event + '</FONT>', Self);

    LogHTMListBox.Selected[LogHTMListBox.Count - 1]:=True;
  finally end;
end;

end.
