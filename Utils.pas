unit Utils;

interface

uses
  Windows, Series, Chart, TeeTools, TeEngine, Graphics, DateUtils, xType;

procedure AddLineX(Name: String; TimeV : Double; Color : TColor; var Chart : TChart);
procedure AddLineXEx(Name: String; TimeV : Double; Color : TColor; var Chart : TChart; xWidth : Integer; Act : boolean);

function xGetPh(VoltmV, b, k : Double) : Double;
function xGetC(VoltmV: Double; var cK, cV, cb : TKvb) : Double;

implementation

procedure AddLineX(Name: String; TimeV : Double; Color : TColor; var Chart : TChart);
var
  TmpLine : TColorLineTool;
begin
  try
    TmpLine:=TColorLineTool.Create(Chart);

    TmpLine.Active:=False;

    TmpLine.Name:=Name;

    TmpLine.Draw3D:=False;

    Chart.Tools.Add(TmpLine);
    TmpLine.Axis:=Chart.BottomAxis;

    TmpLine.AllowDrag:=False;
    TmpLine.DrawBehind:=True;

    TmpLine.Value:=TimeV;
    TmpLine.Pen.Color:=Color;
    //mpLine.Active:=True;
  finally end;
end;

procedure AddLineXEx(Name: String; TimeV : Double; Color : TColor; var Chart : TChart; xWidth : Integer; Act : boolean);
var
  TmpLine : TColorLineTool;
begin
  try
    TmpLine:=TColorLineTool.Create(Chart);

    TmpLine.Active:=Act;

    TmpLine.Name:=Name;

    TmpLine.Draw3D:=False;

    TmpLine.Pen.Width:=xWidth;

    Chart.Tools.Add(TmpLine);
    TmpLine.Axis:=Chart.BottomAxis;

    TmpLine.AllowDrag:=False;
    TmpLine.DrawBehind:=True;

    TmpLine.Value:=TimeV;
    TmpLine.Pen.Color:=Color;
    //TmpLine.Active:=True;
  finally end;
end;

function xGetPh(VoltmV, b, k : Double) : Double;
begin
  try
    Result:=(VoltmV - b) / k;
  finally end;
end;

function xGetC(VoltmV: Double; var cK, cV, cb : TKvb) : Double;
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

function GetHour(xTime, iTime : Double) : Double;
begin
  Result:=HourSpan(xTime, iTime);
end;

end.
