unit View;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, RzButton,DateUtils,
  RzPanel, StdCtrls, RzCmboBx, TeeTools, MainConst;

type
  TViewForm = class(TForm)
    Chart1: TChart;
    Series1: TFastLineSeries;
    RzGroupBox1: TRzGroupBox;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    RzGroupBox2: TRzGroupBox;
    RzComboBox1: TRzComboBox;
    Line: TColorLineTool;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzComboBox1Change(Sender: TObject);
    procedure RzBitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RzBitBtn1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TimerExpired1(Sender: TObject);
    procedure RzBitBtn2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RzBitBtn2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TimerExpired2(Sender: TObject);      //Expired1
  private
    FRepeatTimer1,
    FRepeatTimer2 : TTimer;

    index         : integer;
  public

  end;

var
  ViewForm: TViewForm;

implementation

uses Main;

{$R *.dfm}

procedure TViewForm.FormCreate(Sender: TObject);
var
  i     : integer;

  xT,
  xD    : Double;

  cpi   : Double;
  xHigh : Integer;
begin
  index:=0;
  Series1.Clear;

  cpi:=0;

  if (Length(MainForm.Experiment.ListCh[StrToInt(RzComboBox1.Value)].CrrArray) > 0) and
      MainForm.Experiment.ListCh[StrToInt(RzComboBox1.Value)].CrrArray[index].Done then
      begin
        if index > 0 then
            RzBitBtn2.Enabled:=True
          else
            RzBitBtn2.Enabled:=False;

        if not (index < Length(MainForm.Experiment.ListCh[StrToInt(RzComboBox1.Value)].CrrArray) - 1) then
            RzBitBtn1.Enabled:=False
          else
            RzBitBtn1.Enabled:=True;

        for i := 0 to MainForm.Experiment.ListCh[StrToInt(RzComboBox1.Value)].CrrArray[index].Cn - 1 do
          begin
            xT:=MinuteSpan(MainForm.Experiment.ListCh[StrToInt(RzComboBox1.Value)].CrrArray[index].Arr[i].Time, 0);
            xD:=MainForm.Experiment.ListCh[StrToInt(RzComboBox1.Value)].CrrArray[index].Arr[i].Data;

            Series1.AddXY(xT, xD);

            if cpi <= xD then
                begin
                  cpi:=xD;
                  xHigh:=i;
                end;
          end;

        Line.Value:=MinuteSpan(MainForm.Experiment.ListCh[StrToInt
                              (RzComboBox1.Value)].CrrArray[index].Arr[xHigh].Time, 0);
      end
    else
      begin
        RzBitBtn2.Enabled:=False;
        RzBitBtn1.Enabled:=False;
      end;
end;

procedure TViewForm.RzBitBtn1Click(Sender: TObject);
var
  i   : integer;

  xT,
  xD  : Double;

  cpi   : Double;
  xHigh : Integer;
begin
  if index < Length(MainForm.Experiment.ListCh[StrToInt(RzComboBox1.Value)].CrrArray) - 1 then
      begin
        inc(index);

        Series1.Clear;

        cpi:=0;

        for i := 0 to MainForm.Experiment.ListCh[StrToInt(RzComboBox1.Value)].CrrArray[index].Cn - 1 do
          begin
            xT:=MinuteSpan(MainForm.Experiment.ListCh[StrToInt(RzComboBox1.Value)].CrrArray[index].Arr[i].Time, 0);
            xD:=MainForm.Experiment.ListCh[StrToInt(RzComboBox1.Value)].CrrArray[index].Arr[i].Data;

            Series1.AddXY(xT, xD);

          if cpi <= xD then
                begin
                  cpi:=xD;
                  xHigh:=i;
                end;
          end;

        Line.Value:=MinuteSpan(MainForm.Experiment.ListCh[StrToInt
                              (RzComboBox1.Value)].CrrArray[index].Arr[xHigh].Time, 0);
      end
    else
      begin
        RzBitBtn1.Enabled:=False;
      end;

  if not MainForm.Experiment.ListCh[StrToInt(RzComboBox1.Value)].CrrArray[index + 1].Done then
      begin
        RzBitBtn1.Enabled:=False;
      end;

  if not ((index + 1) < (Length(MainForm.Experiment.ListCh[StrToInt(RzComboBox1.Value)].CrrArray) - 1)) then
      RzBitBtn1.Enabled:=False
    else
      RzBitBtn1.Enabled:=True;

  if index > 0 then
      RzBitBtn2.Enabled:=True
    else
      RzBitBtn2.Enabled:=False;
end;

procedure TViewForm.TimerExpired1(Sender: TObject);      //Expired1
begin
  FRepeatTimer1.Interval := FDelay;
  try
    if RzBitBtn1.Enabled then
        RzBitBtn1Click(Sender);
  except
    FRepeatTimer1.Enabled := False;
  end;
end;

procedure TViewForm.TimerExpired2(Sender: TObject);      //Expired1
begin
  FRepeatTimer1.Interval := FDelay;
  try
    if RzBitBtn1.Enabled then
        RzBitBtn1Click(Sender);
  except
    FRepeatTimer1.Enabled := False;
  end;
end;

procedure TViewForm.RzBitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer1 = nil then
      begin
        FRepeatTimer1:= TTimer.Create(Self);
        FRepeatTimer1.OnTimer := TimerExpired1;
      end;
  FRepeatTimer1.Interval:= FInitialDelay;
  FRepeatTimer1.Enabled:= True;
end;

procedure TViewForm.RzBitBtn1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer1 <> nil then
      FRepeatTimer1.Enabled := False;
end;

procedure TViewForm.RzBitBtn2Click(Sender: TObject);
var
  i   : integer;

  xT,
  xD  : Double;

  cpi   : Double;
  xHigh : Integer;
begin
  if index > 0 then
      begin
        index:=index - 1;

        if index > 0 then
            RzBitBtn2.Enabled:=True
          else
            RzBitBtn2.Enabled:=False;

        if not (index < Length(MainForm.Experiment.ListCh[StrToInt(RzComboBox1.Value)].CrrArray) - 1) then
            RzBitBtn1.Enabled:=False
          else
            RzBitBtn1.Enabled:=True;

        Series1.Clear;

        cpi:=0;

        for i := 0 to MainForm.Experiment.ListCh[StrToInt(RzComboBox1.Value)].CrrArray[index].Cn - 1 do
          begin
            xT:=MinuteSpan(MainForm.Experiment.ListCh[StrToInt(RzComboBox1.Value)].CrrArray[index].Arr[i].Time, 0);
            xD:=MainForm.Experiment.ListCh[StrToInt(RzComboBox1.Value)].CrrArray[index].Arr[i].Data;

            Series1.AddXY(xT, xD);
          if cpi <= xD then
                begin
                  cpi:=xD;
                  xHigh:=i;
                end;
          end;

        Line.Value:=MinuteSpan(MainForm.Experiment.ListCh[StrToInt
                              (RzComboBox1.Value)].CrrArray[index].Arr[xHigh].Time, 0);
      end
    else
      begin
        RzBitBtn2.Enabled:=False;
      end;
end;

procedure TViewForm.RzBitBtn2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer2 = nil then
      begin
        FRepeatTimer2:= TTimer.Create(Self);
        FRepeatTimer2.OnTimer := TimerExpired2;
      end;
  FRepeatTimer2.Interval:= FInitialDelay;
  FRepeatTimer2.Enabled:= True;
end;

procedure TViewForm.RzBitBtn2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer2 <> nil then
      FRepeatTimer2.Enabled := False;
end;

procedure TViewForm.RzBitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TViewForm.RzComboBox1Change(Sender: TObject);
begin
  FormCreate(Sender);
end;

end.
