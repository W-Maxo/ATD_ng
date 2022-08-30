unit KCal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, TeEngine, TeeProcs, Chart, Series, StdCtrls,
  RzLstBox, RzButton, TeeAntiAlias, RzStatus, RzChkLst, TeeTools, uSQLite3,
  SQLiteTable3, MainSysUtils, MainClasses, RzLine, MainConst, ComCtrls, RzListVw,
  TeeEdit, AdvMenus, AdvMenuStylers, Menus, RzSpnEdt, Mask, RzEdit, ap, spline3;

type
  TVal = record
    Val1,
    Val2,
    Val3  : Double;

    Av    : Double;
  end;

  TKCalForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    Chart1: TChart;
    ChartTool1: TAntiAliasTool;
    RzToolButton1: TRzToolButton;
    ChartTool2: TFullScreenTool;
    Timer1: TTimer;
    RzBitBtn3: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    RzBitBtn5: TRzBitBtn;
    RzListView1: TRzListView;
    ChartExport: TChartEditor;
    RzBitBtn1: TRzBitBtn;
    CustamizePopupMenu: TAdvPopupMenu;
    N19: TMenuItem;
    RzSpinButtons1: TRzSpinButtons;
    RzSpinButtons2: TRzSpinButtons;
    Label4: TLabel;
    RzSpinEdit1: TRzSpinEdit;
    Series1: TFastLineSeries;
    procedure RzToolButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure RzListView1CheckStateChange(Sender: TObject; Item: TListItem);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzSpinButtons1DownLeftClick(Sender: TObject);
    procedure RzSpinButtons1UpRightClick(Sender: TObject);
    procedure RzSpinButtons2DownLeftClick(Sender: TObject);
    procedure RzSpinButtons2UpRightClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Chart1Resize(Sender: TObject);
    procedure RzListView1Click(Sender: TObject);
  private
    sl3db                     : TSQLiteDatabase;
    sl3tb                     : TSQLIteTable;

    Change                    : boolean;

    Series                    : Array of TFastLineSeries;
  public
    Val                       : Array[0..7] of TVal;
  end;

var
  KCalForm: TKCalForm;

implementation

uses Main, NewCal;

{$R *.dfm}

procedure TKCalForm.Chart1Resize(Sender: TObject);
begin
  RzSpinButtons1.Top:=(Chart1.Height div 2) - 22;
  RzSpinButtons2.Top:=Chart1.Height - 15;
end;

procedure TKCalForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.Calb:=False;
end;

procedure TKCalForm.FormCreate(Sender: TObject);
var
  DataCreatedDB : Double;
  TmpTime       : Double;
  DBFile        : String;
  sSQL          : String;
  Major, Minor,
  Relese, Build : integer;
  Counter, xC   : integer;

  Ln            : integer;
begin

  DBFile:=ExtractFileDir(Application.ExeName) + '\KCal.cal';

  if FileExists(DBFile) then
      begin
        sl3db := TSQLiteDatabase.Create(DBFile);

        sl3tb := sl3db.GetTable('SELECT * FROM Data');
        sl3tb.MoveFirst;
        if sl3tb.Count > 0 then
            begin
              TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Time']);

              Ln:=Length(Series);
              SetLength(Series, Ln + 1);

              Series[Ln]:=TFastLineSeries.Create(nil);

              Series[Ln].Clear;

              Chart1.AddSeries(Series[Ln]);

              Series[Ln].VertAxis := aLeftAxis;

              RzListView1.AddItem(DateTimeToStr(TmpTime), nil);
              RzListView1.Items[RzListView1.Items.Count - 1].Checked:=True;

              Series[Ln].Color:=RandomColor;

              Series[Ln].Title:=DateTimeToStr(TmpTime);

              Series[Ln].AddXY(Sol0, sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data0']));
              Series[Ln].AddXY(Sol1, sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data1']));
              Series[Ln].AddXY(Sol2, sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data2']));
              Series[Ln].AddXY(Sol3, sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data3']));
              Series[Ln].AddXY(Sol4, sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data4']));
              Series[Ln].AddXY(Sol5, sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data5']));
              Series[Ln].AddXY(Sol6, sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data6']));
              Series[Ln].AddXY(Sol7, sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data7']));

              Series[Ln].Active:=True;

              for xC:=0 to sl3tb.Count do
                  begin
                    if sl3tb.Next then
                        if not sl3tb.EOF then
                            begin
                              TmpTime:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['Time']);

                              Ln:=Length(Series);
                              SetLength(Series, Ln + 1);

                              Series[Ln]:=TFastLineSeries.Create(nil);

                              Series[Ln].Clear;

                              Chart1.AddSeries(Series[Ln]);

                              Series[Ln].VertAxis := aLeftAxis;

                              RzListView1.AddItem(DateTimeToStr(TmpTime), nil);
                              RzListView1.Items[RzListView1.Items.Count - 1].Checked:=True;

                              Series[Ln].Color:=RandomColor;


                              Series[Ln].Title:=DateTimeToStr(TmpTime);

                              Series[Ln].AddXY(Sol0, sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data0']));
                              Series[Ln].AddXY(Sol1, sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data1']));
                              Series[Ln].AddXY(Sol2, sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data2']));
                              Series[Ln].AddXY(Sol3, sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data3']));
                              Series[Ln].AddXY(Sol4, sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data4']));
                              Series[Ln].AddXY(Sol5, sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data5']));
                              Series[Ln].AddXY(Sol6, sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data6']));
                              Series[Ln].AddXY(Sol7, sl3tb.FieldAsDouble(sl3tb.FieldIndex['Data7']));

                              Series[Ln].Active:=True;
                            end;
                  end;
            end;

      end
    else
      begin
        sl3db := TSQLiteDatabase.Create(DBFile);

        sl3db.BeginTransaction;

        sl3db.execsql('CREATE TABLE Data (ID INTEGER PRIMARY KEY, Time REAL, Data0 REAL,' +
                                                                            'Data1 REAL,' +
                                                                            'Data2 REAL,' +
                                                                            'Data3 REAL,' +
                                                                            'Data4 REAL,' +
                                                                            'Data5 REAL,' +
                                                                            'Data6 REAL,' +
                                                                            'Data7 REAL);');

        sl3db.execsql('CREATE TABLE Version (Major INTEGER, Minor INTEGER, Relese INTEGER, Build INTEGER);');

        xGetFileVersionEx(Application.ExeName, Major, Minor, Relese, Build);

        sSQL := 'INSERT INTO Version VALUES (' + IntToStr(Major) + ', ' + IntToStr(Minor) + ', ' + IntToStr(Relese) + ', ' + IntToStr(Build) + ');';
        sl3db.ExecSQL(sSQL);

        sl3db.Commit;
      end;

  RzSpinEdit1.Value:=MainForm.Experiment.KB;
end;

procedure TKCalForm.FormDestroy(Sender: TObject);
begin
  sl3db.Free;
end;

procedure TKCalForm.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if Msg.CharCode = 13 then
    RzBitBtn5.Click;
  if Msg.CharCode = 27 then
      Close;
end;

procedure TKCalForm.FormShow(Sender: TObject);
begin
  MainForm.Calb:=True;
end;

procedure TKCalForm.RzBitBtn1Click(Sender: TObject);
begin
  ChartExport.Execute;
end;

procedure TKCalForm.RzBitBtn3Click(Sender: TObject);
var
  sSQL    : String;
  TmpTime : Double;
  Ln      : integer;
begin
  NewCalForm:=TNewCalForm.Create(Application);

  //Showmessage(InttoStr(NewCalForm.ShowModal));

  if NewCalForm.ShowModal = 15 then
      begin
        TmpTime:=now;

        sSQL := 'INSERT INTO Data VALUES(null' +
              ', ' + FloatToStrF(TmpTime,   MainForm.Experiment.FormatSettings, 8, 4) +
              ', ' + FloatToStrF(Val[0].Av, MainForm.Experiment.FormatSettings, 8, 4) +
              ', ' + FloatToStrF(Val[1].Av, MainForm.Experiment.FormatSettings, 8, 4) +
              ', ' + FloatToStrF(Val[2].Av, MainForm.Experiment.FormatSettings, 8, 4) +
              ', ' + FloatToStrF(Val[3].Av, MainForm.Experiment.FormatSettings, 8, 4) +
              ', ' + FloatToStrF(Val[4].Av, MainForm.Experiment.FormatSettings, 8, 4) +
              ', ' + FloatToStrF(Val[5].Av, MainForm.Experiment.FormatSettings, 8, 4) +
              ', ' + FloatToStrF(Val[6].Av, MainForm.Experiment.FormatSettings, 8, 4) +
              ', ' + FloatToStrF(Val[7].Av, MainForm.Experiment.FormatSettings, 8, 4) +

              ')';
        sl3db.ExecSQL(sSQL);

        Ln:=Length(Series);
        SetLength(Series, Ln + 1);

        Series[Ln]:=TFastLineSeries.Create(nil);

        Series[Ln].Clear;

        Chart1.AddSeries(Series[Ln]);

        Series[Ln].VertAxis := aLeftAxis;

        RzListView1.AddItem(DateTimeToStr(TmpTime), nil);
        RzListView1.Items[RzListView1.Items.Count - 1].Checked:=True;

        Series[Ln].Color:=RandomColor;

        Series[Ln].Title:=DateTimeToStr(TmpTime);

        Series[Ln].AddXY(Sol0, Val[0].Av);
        Series[Ln].AddXY(Sol1, Val[1].Av);
        Series[Ln].AddXY(Sol2, Val[2].Av);
        Series[Ln].AddXY(Sol3, Val[3].Av);
        Series[Ln].AddXY(Sol4, Val[4].Av);
        Series[Ln].AddXY(Sol5, Val[5].Av);
        Series[Ln].AddXY(Sol6, Val[6].Av);
        Series[Ln].AddXY(Sol7, Val[7].Av);

        Change:=True;

        Series[Ln].Active:=True;
      end;

  FreeAndNil(NewCalForm);
end;

procedure TKCalForm.RzBitBtn5Click(Sender: TObject);
begin
  MainForm.RegIniFile.WriteFloat('AmplificationFactor', 'KB', RzSpinEdit1.Value);
  MainForm.Experiment.KB:=RzSpinEdit1.Value;

  if Change then
      begin
        MainForm.Experiment.cV[0]:=Val[0].Av;
        MainForm.Experiment.cV[1]:=Val[1].Av;
        MainForm.Experiment.cV[2]:=Val[2].Av;
        MainForm.Experiment.cV[3]:=Val[3].Av;
        MainForm.Experiment.cV[4]:=Val[4].Av;
        MainForm.Experiment.cV[5]:=Val[5].Av;
        MainForm.Experiment.cV[6]:=Val[6].Av;
        MainForm.Experiment.cV[7]:=Val[7].Av;

        MainForm.RegIniFile.WriteFloat('KCI', 'V0', MainForm.Experiment.cV[0]);
        MainForm.RegIniFile.WriteFloat('KCI', 'V1', MainForm.Experiment.cV[1]);
        MainForm.RegIniFile.WriteFloat('KCI', 'V2', MainForm.Experiment.cV[2]);
        MainForm.RegIniFile.WriteFloat('KCI', 'V3', MainForm.Experiment.cV[3]);
        MainForm.RegIniFile.WriteFloat('KCI', 'V4', MainForm.Experiment.cV[4]);
        MainForm.RegIniFile.WriteFloat('KCI', 'V5', MainForm.Experiment.cV[5]);
        MainForm.RegIniFile.WriteFloat('KCI', 'V6', MainForm.Experiment.cV[6]);
        MainForm.RegIniFile.WriteFloat('KCI', 'V7', MainForm.Experiment.cV[7]);

        MainForm.Experiment.ReBuildK;

        with MainForm.Experiment do
          begin
            ListCh[0].cK:=cK;
            ListCh[0].cV:=cV;
            ListCh[0].cb:=cb;

            ListCh[1].cK:=cK;
            ListCh[1].cV:=cV;
            ListCh[1].cb:=cb;
          end;
      end;

  Close;
end;

procedure TKCalForm.RzListView1CheckStateChange(Sender: TObject;
  Item: TListItem);
var
  i : integer;
begin
  for i := 0 to RzListView1.Items.Count - 1 do
    Series[i].Active:= RzListView1.Items[i].Checked;
end;

procedure TKCalForm.RzListView1Click(Sender: TObject);
var
  i                     : Integer;
  Value, ValueX, ValueY : TReal1DArray;
  Lng                   : Integer;
  Tmp                   : Double;

  S : String;
begin
  {Lng:=Length(Series[RzListView1.Selected.Index].NotMandatoryValueList.Value);

  SetLength(Value, Lng);
  SetLength(ValueX, Lng);

  SetLength(ValueY, Lng);

  for I := 0 to Lng - 1 do
      begin
        ValueX[i]:=Series[RzListView1.Selected.Index].NotMandatoryValueList.Value[i];
        //ValueY[i]:=Series[RzListView1.Selected.Index].ValuesList.Items;

        S:=S + FloatToStr(ValueY[i]) + #13#10;
      end;

  ShowMessage(S);

  BuildCubicSpline(ValueX, ValueY, Lng, 0, 0, 0, 0, Value);

  Tmp:=0;

  Series1.Clear;
  Series1.BeginUpdate;

  while Tmp < 9 do
    begin
      Tmp:=Tmp + 0.0001;

      Series1.AddXY(Tmp, SplineInterpolation(Value, Tmp));

    end;

  Series1.EndUpdate;}
end;

procedure TKCalForm.RzListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Sender.Canvas.Font.Color:=Series[Item.Index].Color;
end;

procedure TKCalForm.RzSpinButtons1DownLeftClick(Sender: TObject);
begin
  Chart1.Zoom.Direction:=tzdVertical;
  Chart1.ZoomPercent(95);
  //AdvToolBarButton6.Enabled:=True;
  Chart1.Zoom.Direction:=tzdBoth;
end;

procedure TKCalForm.RzSpinButtons1UpRightClick(Sender: TObject);
begin
  Chart1.Zoom.Direction:=tzdVertical;
  Chart1.ZoomPercent(105);
  //AdvToolBarButton6.Enabled:=True;
  Chart1.Zoom.Direction:=tzdBoth;
end;

procedure TKCalForm.RzSpinButtons2DownLeftClick(Sender: TObject);
begin
  Chart1.Zoom.Direction:=tzdHorizontal;
  Chart1.ZoomPercent(90);
  //AdvToolBarButton6.Enabled:=True;
  Chart1.Zoom.Direction:=tzdBoth;
end;

procedure TKCalForm.RzSpinButtons2UpRightClick(Sender: TObject);
begin
  Chart1.Zoom.Direction:=tzdHorizontal;
  Chart1.ZoomPercent(110);
  //AdvToolBarButton6.Enabled:=True;
  Chart1.Zoom.Direction:=tzdBoth;
end;

procedure TKCalForm.RzToolButton1Click(Sender: TObject);
begin
  ChartTool2.Active:=not ChartTool2.Active;
  if ChartTool2.Active then
      RzToolButton1.ImageIndex:=17
    else
      RzToolButton1.ImageIndex:=36;

  RzSpinButtons1.Top:=(Chart1.Height div 2) - 22;
  RzSpinButtons2.Top:=Chart1.Height - 15;
end;

procedure TKCalForm.Timer1Timer(Sender: TObject);
begin
  if ChartTool2.Active then
      RzToolButton1.ImageIndex:=17
    else
      begin
        RzToolButton1.ImageIndex:=36;
        RzSpinButtons1.Top:=(Chart1.Height div 2) - 22;
        RzSpinButtons2.Top:=Chart1.Height - 15;
      end;
end;

end.
