unit xTrend;

interface

Uses
  Classes;

Type
  TTrendStyle=(tsNormal,tsLogarithmic,tsExponential);

  TxTrendFunction=class(TComponent)
  private
    IStyle    : TTrendStyle;
    ICount    : Integer;
    SumX      : Double;
    SumXY     : Double;
    SumY      : Double;
    SumX2     : Double;
    SumY2     : Double;

    im, ib    : Double;

    function CalculateValues(FirstIndex,LastIndex:Integer):Boolean;
  protected
    //Procedure CalculatePeriod(Const tmpX:Double; FirstIndex,LastIndex:Integer); override;
    //Procedure CalculateAllPoints( Source:TChartSeries); override;
  public
    NotMandatoryValueList : Array of Double;
    Value                 : Array of Double;

    Constructor Create(AOwner: TComponent); override;

    function AddPoint(Const Value:Double): Double;
    Function CalculateTrend( Var m,b:Double; FirstIndex,LastIndex:Integer):Boolean; 
    Function Coefficient(FirstIndex,LastIndex:Integer):Double;
  end;

implementation

Uses
  Math, SysUtils;

{ TTrendFunction }
constructor TxTrendFunction.Create(AOwner: TComponent);
begin
  inherited;
  IStyle:=tsNormal;
end;

function TxTrendFunction.AddPoint(Const Value:Double): Double;
  var tmp : Double;
  begin
    Case IStyle of
      tsNormal     : tmp:=im*Value+ib;
      tsLogarithmic: tmp:=im*Ln(Value*ib);
    else
       tmp:=im*Exp(ib*Value);
    end;

    Result:=tmp;
  end;

{Procedure TxTrendFunction.CalculateAllPoints( Source:TChartSeries;
                                             NotMandatorySource:TChartValueList);
begin
  CalculatePeriod(Source,0,0,Source.Count-1);
end;

Procedure TxTrendFunction.CalculatePeriod( Source:TChartSeries;
                                          Const tmpX:Double;
                                          FirstIndex,LastIndex:Integer);
Var m : Double;
    b : Double;

  Procedure AddPoint(Const Value:Double);
  var tmp : Double;
  begin
    Case IStyle of
      tsNormal     : tmp:=m*Value+b;
      tsLogarithmic: tmp:=m*Ln(Value*b);
    else
       tmp:=m*Exp(b*Value);
    end;

    if ParentSeries.YMandatory then ParentSeries.AddXY(Value, tmp)
                               else ParentSeries.AddXY(tmp, Value)
  end;

begin
  if CalculateTrend(m,b,Source,FirstIndex,LastIndex) then
  With Source.NotMandatoryValueList do
  begin
    if Order=loNone then
    begin
      AddPoint(MinValue);
      AddPoint(MaxValue);
    end
    else
    begin
      AddPoint(Value[FirstIndex]);
      AddPoint(Value[LastIndex]);
    end;
  end;
end; }

Function TxTrendFunction.CalculateValues(FirstIndex,LastIndex:Integer):Boolean;
var
  t      : Integer;
  x      : Double;
  y      : Double;
begin
  ICount:=LastIndex - FirstIndex + 1;

  result:=ICount > 1;

  if result then
      begin
        SumX:=0;
        SumY:=0;

        SumX2:=0;
        SumY2:=0;
        SumXY:=0;

        try
          for t:=FirstIndex to LastIndex do
            begin
              x:=NotMandatoryValueList[t];
              if IStyle=tsNormal
                  then y:=Value[t]
                else
                  if Value[t] <> 0
                      then y:=Ln(Value[t])
                    else
                      y:=0;

              SumXY:=SumXY + x * y;
              SumX2:=SumX2 + Sqr(x);
              SumY2:=SumY2 + Sqr(y);

              SumX:=SumX + x;
              SumY:=SumY + y;
            end;
        except
          result:=False;
        end;
  end;
end;

Function TxTrendFunction.Coefficient(FirstIndex,LastIndex:Integer):Double;
var tmpNumerator   : Double;
    tmpDenominator : Double;
begin
  if CalculateValues(FirstIndex,LastIndex) then
  begin
    tmpNumerator:=SumXY - SumX*SumY/ICount;
    tmpDenominator:=Sqrt( (SumX2 - SumX*SumX/ICount) * (SumY2 - SumY*SumY/ICount) );
    if tmpDenominator=0 then
       result:=1
    else
       result:=tmpNumerator/tmpDenominator;
  end
    else result:=1;
end;

Function TxTrendFunction.CalculateTrend(Var m,b:Double; FirstIndex,LastIndex:Integer):Boolean;
var Divisor : Double;
begin
  result:=CalculateValues(FirstIndex,LastIndex);

  if result then
    if IStyle=tsNormal then
    begin
      Divisor:=ICount*SumX2-Sqr(SumX);

      if Divisor<>0 then
      begin
        m:=( (ICount*SumXY) - (SumX*SumY) ) / Divisor;
        b:=( (SumY*SumX2) - (SumX*SumXY) ) / Divisor;
      end
      else
      begin
        m:=1;
        b:=0;
      end;
    end
    else
    begin
      SumX:=SumX/ICount;
      SumY:=SumY/ICount;

      Divisor:= (SumX2-(ICount*SumX*SumX));

      if Divisor=0 then b:=1
                   else b:=(SumXY-(ICount*SumX*SumY))/Divisor;

      if IStyle=tsLogarithmic then m:=SumY-b*SumX
                              else m:=Exp(SumY-b*SumX);
    end;

  im:=m;
  ib:=b;
end;

end.
