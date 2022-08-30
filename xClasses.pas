unit xClasses;

interface

uses
  Windows, uSQLite3, SQLiteTable3, SysUtils, Series, Chart, HTMListB, StdCtrls,
  TeeTools, Graphics, MainSysUtils, IdThreadComponent, CPort, TeEngine, xTrend,
  AdvCircularProgress, RzStatus, Forms, ExtCtrls, TypInfo, Classes, MainConst,
  Dialogs, Controls, JvThread, Utils, xType, DateUtils, Math;

type
  TATD = class(TObject)
  protected
    ProcessingDataThread  : TIdThreadComponent;
    OutputThread          : TIdThreadComponent;
  private
    BuffArray             : BuffData;

    ProcessingArray       : Array of pData;
    ProcessingDownArray   : Array of xData;

    procedure OutputThreadRun(Sender: TIdThreadComponent);
    procedure ProcessingDataThreadRun(Sender: TIdThreadComponent);
  public
    OldIndex,
    CrrIndex              : Integer;

    CrrArray              : Array of xCrr;
    OutputArray           : Array of iData;

    Tr,
    xTr,
    TmpTr                 : TxTrendFunction;

    MotorShift            : Integer;

    Timer                 : TTimer;

    xVolt,
    LockValue,
    Threshold,
    mass,
    SumVolum,
    Sol,
    DifVolum,
    Dif2Volum,
    StartTime,
    StWt,
    LockTime,
    OldTime,
    FiveMinut,
    OldTimeOneA,
    OldTimeTwoA,
    Xmin, Xmax,
    Ymin, Ymax,
    xFiveMinut,
    VolPerStep,
    MixEventTime,
    CircAPos,
    StepCircA,
    DownEventTime,
    Last,
    OneSec,
    b, k,
    xTrCf,
    mCf, bCf              : Double;

    VolumSeries,
    DifVolumSeries        : TLineSeries;
    DifVolum2Series       : TLineSeries;
    DifxHourSeries        : TPointSeries;

    Chart                 : TChart;

    StatusPane            : TRzStatusPane;

    VolumPane,
    VolumStatusPane       : TRzStatusPane;

    m1                    : Integer;

    StageAct,
    Stage,
    StepsToQuaA,
    M1Interval,
    DataC,
    TrendPC,
    LineCount,
    VCn,
    RCn                   : Integer;

    Comport               : TComPort;

    F1,
    F1D1,
    F1D2,
    Mix,
    Inj,
    ReBildDownBff,
    Changing,
    StartExp,
    Active,
    Refuelling,
    InjActive,
    LockValueA,
    pH,
    StAmV,
    SamplRed,
    Proc,
    SilBeforeChang        : boolean;

    Data1, Data1x         : Array[0..499] of xData;

    CurrentVValue         : Array of iData;

    VolumDataAa,
    VolumDataAb           : pData;


    mVAS                  : TFastLineSeries;
    AdvCircularProgressA  : TAdvCircularProgress;
    vCapt                 : TAnnotationTool;
    Series                : TFastLineSeries;


    sl3db                 : TSQLiteDatabase;
    sl3tb                 : TSQLIteTable;

    FormatSettings        : TFormatSettings;

    cK,
    cV,
    cb                        : TKvb;
  published
    procedure Init;
    procedure CheckBeforeChanging;
    procedure AddDifPoint(TmpTime : Double);
    procedure TimerRun(Sender : TObject);
    procedure ReBuildDifSer(ReLoadSource   : boolean);
    procedure ADC_Ch_P(Volt, TmpTime : Double);
    procedure StartExperiment(xTime : Double);
    procedure Clear;
  end;

implementation

procedure TATD.Init;
begin
  StartExp:=False;

  ProcessingDataThread:=TIdThreadComponent.Create();
  ProcessingDataThread.OnRun:=ProcessingDataThreadRun;
  ProcessingDataThread.Priority:=tpHighest;

  OutputThread:=TIdThreadComponent.Create();
  OutputThread.OnRun:=OutputThreadRun;
  OutputThread.Priority:=tpHighest;

  Timer:=Ttimer.Create(Application);
  Timer.Enabled   :=False;
  Timer.Interval  :=1000;
  Timer.OnTimer   :=TimerRun;

  StAmV           :=False;
  SamplRed        :=True;
  InjActive       :=True;

  OldTime         :=0;

  LineCount       :=0;
  xFiveMinut      :=5 / 60;

  m1              :=0;
  VCn             :=0;

  CircAPos:=1;
  ReBildDownBff:=False;

  SumVolum:=0;

  SetLength(BuffArray.Data, AvrLh + 1);
  BuffArray.Count:=0;

  VolumDataAa.Processed:=False;
  VolumDataAb.Processed:=False;

  Refuelling:=False;

  FiveMinut :=EncodeTime(0, 5, 0, 0);
  OneSec    :=EncodeTime(0, 0, 1, 0);

  Tr    :=TxTrendFunction.Create(Application);
  xTr   :=TxTrendFunction.Create(Application);
  TmpTr :=TxTrendFunction.Create(Application);

  with Chart do
    begin
      ClipPoints := False;

      Title.Visible := False;
      Legend.Visible := False;

      LeftAxis      .Axis.Width:=1;
      BottomAxis    .Axis.Width:=1;
      RightAxis     .Axis.Width:=1;
      TopAxis.Axis  .Width:=1;

      BottomAxis.RoundFirstLabel := False;

      View3D := False;
  end;

  Clear;
end;

{Var X,Y : Array of Double; // TChartValues
t : Integer;
Num : Integer;
begin}
{ 1M points }
//Num:= 1000000;

{ allocate our custom arrays }
//SetLength(X,Num);
//SetLength(Y,Num);

{ fill data in our custom arrays }
//X[0]:=0;
//Y[0]:=Random(10000);
//for t:=1 to Num-1 do
//begin
//X[t]:=t;
//Y[t]:=Y[t-1]+Random(101)-50;
//end;

{ set our X array }
//With Series1.XValues do
//begin
//Value:=TChartValues(X); { end;

{ set our Y array }
//With Series1.YValues do
//begin
//Value:=TChartValues(Y);
//Count:=Num;
//Modified:=True;
//end;

{ Show data }
//Series1.Repaint;

procedure TATD.OutputThreadRun(Sender: TIdThreadComponent);
var
  i, LengthOutputBuff,
  Tmp                 : Integer;

  xHour               : Double;
begin
  While StartExp do
    begin
      Sleep(1000);

      Tmp:=VCn - 1;

      //Series.BeginUpdate;

      if RCn <> Tmp then
        for i := RCn to Tmp do
          begin
            try
              xHour:=HourSpan(OutputArray[i].Time, 0);

              try
                Series.AddXY(xHour, OutputArray[i].Data);
              finally end;

              try
                mVAS.AddXY(xHour, OutputArray[i].DataI);
              finally end;
            finally end;
          end;

      RCn:=Tmp;

      if  xHour > xFiveMinut then
          begin
            try
              With Chart.BottomAxis do
                SetMinMax(Minimum + (xHour - Last), Maximum + (xHour - Last));
            finally end;
          end;

      //Series.EndUpdate;

      Last:=xHour;
    end;
  OutputThread.Stop;
end;

procedure TATD.StartExperiment(xTime : Double);
begin
  StartExp:=True;
  StartTime:=xTime;

  SumVolum:=0;

  StageAct:=1;

  SetLength(CurrentVValue, 1);
  SetLength(CurrentVValue, 1);
  SetLength(CrrArray, 1);

  CurrentVValue[0].Time:=0;
  CurrentVValue[0].Data:=0;
  CurrentVValue[0].DataI:=0;

  SetLength(ProcessingDownArray, 0);

  SetLength(OutputArray, 0);
  VCn:=0;

  Last:=0;

  SetLength(xTr.NotMandatoryValueList, 1);
  SetLength(xTr.Value, 1);

  SetLength(Tr.NotMandatoryValueList, 1);
  SetLength(Tr.Value, 1);

  SetLength(TmpTr.NotMandatoryValueList, 0);
  SetLength(TmpTr.Value, 0);

  Tr.NotMandatoryValueList[0]:=0;
  Tr.Value[0]:=0;

  DifVolumSeries.AddXY(0, 0);

  OutputThread.Start;

  VolumSeries.AddXY(0, SumVolum);
  VolumStatusPane.Caption:=AnsiString(FloatToStrF(SumVolum, ffFixed, 6, 4) + ' ml');
  if VolumSeries.Active then VolumPane.Caption:=FloatToStrF(SumVolum, ffFixed, 6, 4) + ' ml';
end;

procedure TATD.Clear;
var
  i,
  TmpLC : integer;
begin
  DataC:=0;

  F1:=True;

  F1D1:=False;
  F1D2:=False;

  Series.Clear;
  VolumSeries.Clear;

  DifVolumSeries.Clear;
  DifVolum2Series.Clear;

  Changing:=False;
  Refuelling:=False;

  mVAS.Clear;

  Proc:=False;

  Active:=False;

  StageAct:=1;

  Stage:=1;
  Mix:=False;

  LockValueA:=False;

  SumVolum:=0;

  TmpLC:=LineCount;
  LineCount   :=0;

  if TmpLC > 0 then
      begin
        for i:=0 to TmpLC - 1 do
          begin
            Chart.FindComponent('Line' + IntToStr(i)).Free;
          end;
      end;

  With Chart.BottomAxis do
    SetMinMax(0, xFiveMinut);

  SetLength(CurrentVValue, 1);

  CurrentVValue[0].Time  :=0;
  CurrentVValue[0].Data  :=0;
  CurrentVValue[0].DataI :=0;

  SetLength(Tr.NotMandatoryValueList, 1);
  SetLength(Tr.Value, 1);

  Tr.NotMandatoryValueList[0]:=0;
  Tr.Value[0]:=0;

  DifVolumSeries.AddXY(0, 0);

  VolumSeries.AddXY(0, SumVolum);

  VolumStatusPane.Caption:=AnsiString(FloatToStrF(SumVolum, ffFixed, 6, 4) + ' ml');
  if VolumSeries.Active then VolumPane.Caption:=FloatToStrF(SumVolum, ffFixed, 6, 4) + ' ml';
end;

procedure TATD.CheckBeforeChanging;
begin
 if pH then
    begin
      if xVolt <= LockValue - (Threshold * k) then
        begin
          SilBeforeChang:=True;
        end;
      end
    else
      begin
        if xVolt <= LockValue + Threshold then
            begin
              SilBeforeChang:=True;
            end;
      end;
end;

procedure TATD.AddDifPoint(TmpTime : Double);
var
  TrL             : Integer;

  Tmp, m, b       : double;
begin
  TrL:=Length(Tr.NotMandatoryValueList);
  SetLength(Tr.NotMandatoryValueList, TrL + 1);
  SetLength(Tr.Value, TrL + 1);

  SetLength(CurrentVValue, TrL + 1);

  try
    Tmp:=MinuteSpan(TmpTime, 0);

    CurrentVValue[TrL].Time:=TmpTime;
    CurrentVValue[TrL].Data:=Tmp;
    CurrentVValue[TrL].DataI:=SumVolum;

    Tr.NotMandatoryValueList[TrL]:=Tmp;
    Tr.Value[TrL]:=SumVolum * Sol / mass;

    if TrL < TrendPC then
        Tr.CalculateTrend(m, b, 0, TrL)
      else
        Tr.CalculateTrend(m, b, TrL - TrendPC, TrL);
   finally end;

   DifVolum:=m;

   DifVolumSeries.AddXY(HourSpan(TmpTime, 0), m);
end;

procedure TATD.TimerRun(Sender : TObject);

  procedure InternalProcessingData1ThreadRun(var Buff : PData);
    var
      TmpTimeV        : Double;

      iTime           : Double;
    begin
      TmpTimeV:=Now - StartTime;
      Buff.StartEvent:=TmpTimeV;

      iTime:=HourSpan(TmpTimeV, 0);

      AddLineX('Line' + IntToStr(LineCount), iTime,  $000080FF, Chart);
      inc(LineCount);

      StatusPane.Font.Color:=ClBlue;

      VolumSeries.AddXY(iTime, SumVolum);

      try
        VolumStatusPane.Caption:=AnsiString(FloatToStrF(SumVolum, ffFixed, 6, 4) + ' ml');
        if VolumSeries.Active then VolumPane.Caption:=FloatToStrF(SumVolum, ffFixed, 6, 4) + ' ml';
      finally end;

      Buff.EndEvent:=TmpTimeV;

      AddLineX('Line' + IntToStr(LineCount), iTime,  ClLime, Chart);
      inc(LineCount);

      AddDifPoint(TmpTimeV);

      Buff.Dif.Time:=TmpTimeV;
      Buff.Dif.Data:=SumVolum;

      if DifVolumSeries.Active then VolumPane.Caption:=FloatToStrF(DifVolum, ffFixed, 7, 4) + ' ';

      Buff.Processed:=True;
    end;
var
  T : Double;
begin
  if Changing then
    begin
        StWt:=Now;
        Exit;
      end;

  if ProcessingDataThread.Active then
      begin
        Active:=True;
        StWt:=Now;
        Exit;
      end;

  if not Active then
      begin
        if (LockTime + (FiveMinut * StageAct)) < Now then
            begin
              inc(StageAct);

              if VolumDataAa.Processed then
                  InternalProcessingData1ThreadRun(VolumDataAb)
                else
                  InternalProcessingData1ThreadRun(VolumDataAa);
            end;
        Exit;
      end;

  T:=0;

  if (OldTimeTwoA = 0) and (OldTimeOneA > 0) then
      T:=OldTimeOneA * 4;

  if (OldTimeTwoA > 0) and (OldTimeOneA = 0) then
      T:=OldTimeTwoA * 4;

  if (OldTimeTwoA > 0) and (OldTimeOneA > 0) then
      T:=(OldTimeTwoA + OldTimeOneA) * 2;

  if (OldTimeTwoA = 0) and (OldTimeOneA = 0) then Exit;

  if (StWt + T) < Now then
      begin
        StWt:=Now;

        if VolumDataAa.Processed then
            InternalProcessingData1ThreadRun(VolumDataAb)
          else
            InternalProcessingData1ThreadRun(VolumDataAa);
      end;
end;

procedure TATD.ReBuildDifSer(ReLoadSource  : boolean);
var
  LengthM         : Integer;
  i               : Integer;

  m, b       : double;

begin
  LengthM:=Length(CurrentVValue);

  DifVolumSeries.BeginUpdate;
  DifVolumSeries.Clear;

  DifVolumSeries.AddXY(0, 0);

  if ReLoadSource then
      for i := 1 to LengthM - 1 do
        begin
          Tr.Value[i]:=CurrentVValue[i].DataI * Sol / mass;

          if i < TrendPC then
              Tr.CalculateTrend(m, b, 0, i)
            else
              Tr.CalculateTrend(m, b, i - TrendPC, i);

          DifVolumSeries.AddXY(HourSpan(CurrentVValue[i].Time, 0), m);
        end
      else
        for i := 1 to LengthM - 1 do
          begin
            if i < TrendPC then
                Tr.CalculateTrend(m, b, 0, i)
              else
                Tr.CalculateTrend(m, b, i - TrendPC, i);

            DifVolumSeries.AddXY(HourSpan(CurrentVValue[i].Time, 0), m);
          end;

  DifVolumSeries.EndUpdate;
end;

procedure TATD.ProcessingDataThreadRun(Sender: TIdThreadComponent);

  procedure InternalProcessingData1ThreadRun(var Buff : PData);
    var
      i,
      Timer,
      xLn,
      Ti,
      xHigh           : integer;

      Nl,
      Sec             : Word;
      TmpTimeV,
      cpi             : Double;

      LengthBuff      : Integer;

      Label Term;
    begin
      Proc:=True;

      xLn:=Length(CrrArray);

      CrrIndex:=VCn - 1;

      CrrArray[xLn - 1].Cn:=CrrIndex - OldIndex + 1;

      SetLength(CrrArray[xLn - 1].Arr, CrrArray[xLn - 1].Cn);
      SetLength(TmpTr.NotMandatoryValueList, CrrArray[xLn - 1].Cn);
      SetLength(TmpTr.Value, CrrArray[xLn - 1].Cn);

      cpi:=0;

      for i := 0 to CrrArray[xLn - 1].Cn - 1 do
        begin
          try
            Ti:= i + OldIndex;

            CrrArray[xLn - 1].Arr[i].Time:=OutputArray[Ti].Time;
            CrrArray[xLn - 1].Arr[i].Data:=OutputArray[Ti].Data;

            TmpTr.NotMandatoryValueList[i]:=MinuteSpan(CrrArray[xLn - 1].Arr[i].Time,
                                                       CrrArray[xLn - 1].Arr[0].Time);

            TmpTr.Value[i]:=CrrArray[xLn - 1].Arr[i].Data;

            if pH then
                if cpi <= TmpTr.Value[i] then
                    begin
                      cpi:=TmpTr.Value[i];
                      xHigh:=i;
                    end
              else
                if cpi >= TmpTr.Value[i] then
                    begin
                      cpi:=TmpTr.Value[i];
                      xHigh:=i;
                    end

          finally end;
        end;

        //xHigh:=High(TmpTr.Value);

        try
          TmpTr.CalculateTrend(CrrArray[xLn - 1].DifK,
                               CrrArray[xLn - 1].DifB,
                               CrrArray[xLn - 1].Cn - (xHigh div 2),
                               CrrArray[xLn - 1].Cn);
        finally end;

        Dif2Volum:=CrrArray[xLn - 1].DifK;

        if Dif2Volum <= 0 then
            begin
              try
                if DifVolum2Series.Active then VolumPane.Caption:=
                FloatToStrF(Dif2Volum, ffFixed, 6, 4) + ' ml';

                DifVolum2Series.AddXY(HourSpan(OutputArray[CrrIndex].Time, 0), Dif2Volum);
              finally end;
            end;

        CrrArray[xLn - 1].Done:=True;

        inc(xLn);
        SetLength(CrrArray, xLn);

      TmpTimeV:=Now - StartTime;
      //Buff.StartEvent:=TmpTimeV;

      Buff.StartEvent:=OutputArray[CrrIndex].Time;

      if OldTime = 0 then OldTime:=Now;

      AddLineX('Line' + IntToStr(LineCount), HourSpan(TmpTimeV, 0),  $000080FF, Chart);
      inc(LineCount);

      StatusPane.Font.Color:=ClRed;

      Stage:=1;

      DecodeTime(MixEventTime, Nl, Nl, Sec, Nl);

      While StartExp do
        begin
            for i:=0 to Stage * StepsToQuaA do
              begin
                if (xVolt < LockValue) or
                    Changing or
                    Refuelling or
                   (not InjActive) then GoTo Term;

                m1:=m1 - 1;
                if m1 < 0 then m1:=3;

                if Comport.Connected then
                    begin
                      try
                        Comport.WriteStr(AnsiString('*A' + IntToStr(MotorShift + m1) +'1'+#13));
                      finally end;
                    end;

                TmpTimeV:=Now - StartTime;

                if not SilBeforeChang then
                    begin
                      SumVolum:=SumVolum + VolPerStep;

                      try
                        VolumSeries.AddXY(HourSpan(TmpTimeV, 0), SumVolum);
                        VolumStatusPane.Caption:=AnsiString(FloatToStrF(SumVolum, ffFixed, 6, 4) + ' ml');
                        if VolumSeries.Active then VolumPane.Caption:=FloatToStrF(SumVolum, ffFixed, 6, 4) + ' ml';

                        VolumStatusPane.Font.Color:=clBlack;
                      finally end;
                    end
                  else
                    begin
                      VolumStatusPane.Font.Color:=clBlue;
                    end;

                LengthBuff:=Length(Buff.Data);

                SetLength(Buff.Data, LengthBuff + 1);
                Buff.Data[LengthBuff].Time:=TmpTimeV;
                Buff.Data[LengthBuff].Data:=SumVolum;

                CircAPos:=CircAPos + StepCircA;
                if CircAPos > 12 then CircAPos:=1;

                try
                  if AdvCircularProgressA.Position <> Round(CircAPos) then
                      AdvCircularProgressA.Position:=Round(CircAPos);
                finally end;

                Sleep(M1Interval);
              end;

            Timer:=0;

            While (Sec * 1000) > Timer do
              begin
                Sleep(100);
                if (not StartExp) or Changing or Refuelling or (not InjActive) then GoTo Term;
                if xVolt < LockValue then GoTo Term;
                Timer:=Timer + 100;
              end;

            if xVolt < LockValue then GoTo Term;
            inc(Stage);
          end;

      Term:

      TmpTimeV:=Now - StartTime;
      //Buff.EndEvent:=TmpTimeV;

      OldIndex:=VCn - 1;
      Buff.EndEvent:=OutputArray[OldIndex].Time;

      AddLineX('Line' + IntToStr(LineCount), HourSpan(TmpTimeV, 0),  ClLime, Chart);
      inc(LineCount);

      OldTimeOneA:=OldTimeTwoA;
      OldTimeTwoA:=Now - OldTime;

      OldTime:=Now;

      AddDifPoint(TmpTimeV);

      Buff.Dif.Time:=TmpTimeV;
      Buff.Dif.Data:=SumVolum;

      if DifVolumSeries.Active then VolumPane.Caption:=FloatToStrF(DifVolum, ffFixed, 7, 4) + ' ';

      StatusPane.Font.Color:=ClBlack;

      Buff.Processed:=True;

      SilBeforeChang:=False;
    end;

begin
  try
    if VolumDataAa.Processed then
        InternalProcessingData1ThreadRun(VolumDataAb)
      else
        InternalProcessingData1ThreadRun(VolumDataAa);
  finally
    Proc:=False;
    ProcessingDataThread.Stop;
  end;
end;

procedure TATD.ADC_Ch_P(Volt, TmpTime : Double);
var
  i                 : integer;
  xHigh             : integer;

  TmpInd            : integer;
  xLn               : integer;

  AvrTmp            : Double;

  LengthBuffDown,
  LengthOutputBuff  : integer;

  Val               : Double;
begin
  try
    if BuffArray.Count <= AvrLh then
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
            for i:=0 to BuffArray.Count - 1 do
                BuffArray.Data[i]:=BuffArray.Data[i + 1];
            BuffArray.Data[BuffArray.Count - 1].Time:=TmpTime;
            BuffArray.Data[BuffArray.Count - 1].Data:=Volt;
          finally end;
        end;
  finally end;

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

  if StartExp then
      begin
        SamplRed:=not SamplRed;

        if SamplRed then
            begin
              try
                if F1 then
                    begin
                      Data1[DataC].Time:=TmpTime;
                      Data1[DataC].Data:=xVolt;
                      inc(DataC);
                      if DataC = 500 then
                          begin
                            F1:=False;
                            F1D1:=True;
                            DataC:=0;
                          end;
                        end
                          else
                            begin
                              Data1x[DataC].Time:=TmpTime;
                              Data1x[DataC].Data:=xVolt;
                              inc(DataC);
                              if DataC = 500 then
                                  begin
                                    F1:=True;
                                    F1D2:=True;
                                    DataC:=0;
                                  end;
                    end;
              finally end;

              LengthBuffDown:=Length(ProcessingDownArray);

              if ReBildDownBff then
                  begin
                    try
                      TmpInd:=LengthBuffDown - 1;

                      for i:=LengthBuffDown - 1 downto 0 do
                        begin
                          if (ProcessingDownArray[LengthBuffDown - 1].Time - ProcessingDownArray[i].Time) > DownEventTime then
                              begin
                                TmpInd:=i;
                                Break;
                              end;
                        end;

                      for i:=TmpInd to LengthBuffDown - 1 do
                        begin
                          ProcessingDownArray[i - TmpInd]:=ProcessingDownArray[i];
                        end;

                      SetLength(ProcessingDownArray, LengthBuffDown - TmpInd);

                      LengthBuffDown:=Length(ProcessingDownArray);
                      ReBildDownBff:=False;
                    finally end;
                  end;

              try
                if LengthBuffDown = 0 then
                    begin
                      try
                        SetLength(ProcessingDownArray, LengthBuffDown + 1);
                        ProcessingDownArray[LengthBuffDown].Time:=TmpTime;
                        ProcessingDownArray[LengthBuffDown].Data:=xVolt;
                      finally end;
                    end
                  else
                    begin
                      try
                        if (ProcessingDownArray[LengthBuffDown - 1].Time - ProcessingDownArray[0].Time) < DownEventTime then
                            begin
                              SetLength(ProcessingDownArray, LengthBuffDown + 1);
                              ProcessingDownArray[LengthBuffDown].Time:=TmpTime;
                              ProcessingDownArray[LengthBuffDown].Data:=xVolt;
                            end
                          else
                            begin
                              for i:=0 to LengthBuffDown - 1 do
                                ProcessingDownArray[i]:=ProcessingDownArray[i + 1];
                              ProcessingDownArray[LengthBuffDown - 1].Time:=TmpTime;
                              ProcessingDownArray[LengthBuffDown - 1].Data:=xVolt;
                            end;
                      finally end;
                    end;
              finally end;

              //TrLX:=Length(xTr.NotMandatoryValueList);

              //SetLength(xTr.NotMandatoryValueList, TrLX + 1);
              //SetLength(xTr.Value, TrLX + 1);

              //xTr.NotMandatoryValueList[TrLX]:=MinuteSpan(TmpTime, 0);
              //xTr.Value[TrLX]:=xVolt;

              //try
              //if TrLX > 60 then
                //xTr.CalculateTrend(mCf, bCf, TrLX - 30, TrLX);
              //finally end;

              if LockValueA then
                  begin
                    Inj:=True;

                    for i:=0 to LengthBuffDown - 1 do
                      begin
                        if pH then
                            begin
                              if ProcessingDownArray[i].Data <= LockValue - (Threshold * k) then
                                  begin
                                    Inj:=False;
                                    Break;
                                  end;
                            end
                          else
                            begin
                              if ProcessingDownArray[i].Data <= LockValue + Threshold then
                                  begin
                                    Inj:=False;
                                    Break;
                                  end;
                            end;
                      end;

                      if Inj and ProcessingDataThread.Stopped and (not Changing) and (not Refuelling) and InjActive then
                        begin
                          Mix:=True;
                          ProcessingDataThread.Start;
                        end;
                  end;

              if pH then
                  begin
                    try
                      Val:=xGetpH(xVolt, b, k);
                    finally end;

                    if StAmV then
                        begin
                          try
                            StatusPane.Caption:=FloatToStrF(xVolt, ffFixed,6,2);
                            vCapt.Text:=StatusPane.Caption + ' mV';
                          finally end;
                        end
                      else
                        begin
                          try
                            StatusPane.Caption:=FloatToStrF(Val, ffFixed,6,3);
                            vCapt.Text:='pH: ' + StatusPane.Caption;
                          finally end;
                        end;
                  end
                else
                  begin
                    try
                      Val:=xGetC(xVolt, cK, cV, cb);
                    finally end;

                    if StAmV then
                        begin
                          try
                            StatusPane.Caption:=FloatToStrF(xVolt, ffFixed,6,2);
                            vCapt.Text:=StatusPane.Caption + ' mV';
                          finally end;
                        end
                      else
                        begin
                          try
                            StatusPane.Caption:=FloatToStrF(Val, ffFixed,6,1);
                            vCapt.Text:=StatusPane.Caption + ' mkM';
                          finally end;
                        end;
                  end;

              {xLn:=Length(CrrArray);

              if ProcessingDataThread.Active then
                  begin
                    CrrArray[xLn - 1].Done:=True;
                  end
                else
                  begin
                    try
                      if CrrArray[xLn - 1].Done then
                          begin
                            SetLength(TmpTr.NotMandatoryValueList, CrrArray[xLn - 1].Cn);
                            SetLength(TmpTr.Value, CrrArray[xLn - 1].Cn);

                            for i := 0 to CrrArray[xLn - 1].Cn - 1 do
                              begin
                                TmpTr.NotMandatoryValueList[i]:=MinuteSpan(CrrArray[xLn - 1].Arr[i].Time,
                                                                         CrrArray[xLn - 1].Arr[0].Time);
                                TmpTr.Value[i]:=CrrArray[xLn - 1].Arr[i].Data;
                              end;

                            xHigh:=High(CrrArray[xLn - 1].Arr);

                            TmpTr.CalculateTrend(CrrArray[xLn - 1].DifK,
                                                 CrrArray[xLn - 1].DifB,
                                                 CrrArray[xLn - 1].Cn - (xHigh div 2),
                                                 CrrArray[xLn - 1].Cn);

                            Dif2Volum:=CrrArray[xLn - 1].DifK;

                            try
                              if DifVolum2Series.Active then VolumPane.Caption:=
                                  FloatToStrF(Dif2Volum, ffFixed, 6, 4) + ' ml';

                              DifVolum2Series.AddXY(HourSpan(TmpTime, 0), Dif2Volum);
                            finally end;

                            inc(xLn);
                            SetLength(CrrArray, xLn);
                          end;

                      SetLength(CrrArray[xLn - 1].Arr, CrrArray[xLn - 1].Cn + 1);

                      CrrArray[xLn - 1].Arr[CrrArray[xLn - 1].Cn].Time:=TmpTime;
                      CrrArray[xLn - 1].Arr[CrrArray[xLn - 1].Cn].Data:=Val;

                      inc(CrrArray[xLn - 1].Cn);
                    finally end;
                  end;}

              SetLength(OutputArray, VCn + 1);
              OutputArray[VCn].Time:=TmpTime;
              OutputArray[VCn].Data:=Val;
              OutputArray[VCn].DataI:=xVolt;

              inc(VCn);
          end;
      end
    else
      begin
        if StAmV then
            begin
              try
                StatusPane.Caption:=FloatToStrF(xVolt, ffFixed,6,2);
                vCapt.Text:=StatusPane.Caption + ' mV';
              finally end;
            end
          else
            begin
              if pH then
                  begin
                    try
                      Val:=xGetpH(xVolt, b, k);
                    finally end;

                    try
                      StatusPane.Caption:=FloatToStrF(Val, ffFixed,6,3);
                      vCapt.Text:='pH: ' + StatusPane.Caption;
                    finally end;
                  end
                else
                  begin
                    try
                      Val:=xGetC(xVolt, cK, cV, cb);
                    finally end;

                    try
                      StatusPane.Caption:=FloatToStrF(Val, ffFixed,6,1);
                      vCapt.Text:=StatusPane.Caption + ' mkM';
                    finally end;
                  end;
            end;
      end;
end;


end.
