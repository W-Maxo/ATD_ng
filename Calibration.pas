unit Calibration;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzStatus, StdCtrls, Mask, RzEdit, RzSpnEdt,
  RzButton, TeeProcs, TeEngine, Chart, Series, TeeTools;

type
  TpHCalibrationForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    MinpHEdit: TRzSpinEdit;
    Label1: TLabel;
    RzBitBtn1: TRzBitBtn;
    RzGroupBox3: TRzGroupBox;
    Label3: TLabel;
    MaxpHEdit: TRzSpinEdit;
    RzBitBtn2: TRzBitBtn;
    Chart1: TChart;
    Series1: TFastLineSeries;
    ChartTool1: TColorLineTool;
    ChartTool2: TColorLineTool;
    Timer1: TTimer;
    Label2: TLabel;
    RzStatusPane1: TRzStatusPane;
    RzBitBtn3: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    Label4: TLabel;
    RzSpinEdit1: TRzSpinEdit;
    procedure Timer1Timer(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    Procedure Calibration;
    procedure RzGroupBox2Click(Sender: TObject);
    procedure RzGroupBox3Click(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Xmin, Xmax, Ymin, Ymax, xVoltA, K, b : Double;
  public
    { Public declarations }
  end;

var
  pHCalibrationForm: TpHCalibrationForm;

implementation

uses Main;

{$R *.dfm}

procedure TpHCalibrationForm.Timer1Timer(Sender: TObject);
begin
  xVoltA:=MainForm.Experiment.ListCh[0].xVolt;
  RzStatusPane1.Caption:=FloatToStrF(xVoltA, ffFixed,6,1)+' mV';
end;

procedure TpHCalibrationForm.Calibration;
begin
  K:=(Ymin - Ymax) / (Xmin - Xmax);
  b:=Ymin - (Xmin * K);

  Chart1.Title.Text.Text:='y = ' + FloatToStrF(K, ffFixed,6,2) + ' x + '+ FloatToStrF(b, ffFixed,6,1);
end;

procedure TpHCalibrationForm.RzBitBtn1Click(Sender: TObject);
begin
  Xmin:=MinpHEdit.Value;
  Ymin:=xVoltA;
  Series1.AddXY(Xmin, Ymin);
  RzBitBtn1.Enabled:=False;
  if not RzBitBtn2.Enabled then Calibration;
end;

procedure TpHCalibrationForm.RzBitBtn2Click(Sender: TObject);
begin
  Xmax:=MaxpHEdit.Value;
  Ymax:=xVoltA;
  Series1.AddXY(Xmax, Ymax);
  RzBitBtn2.Enabled:=False;
  if not RzBitBtn1.Enabled then Calibration;
end;

procedure TpHCalibrationForm.RzBitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TpHCalibrationForm.RzGroupBox2Click(Sender: TObject);
begin
  //xVoltA:=3692;
  //RzStatusPane1.Caption:=FloatToStrF(xVoltA, ffFixed,6,1)+' mV';
end;

procedure TpHCalibrationForm.RzGroupBox3Click(Sender: TObject);
begin
  //xVoltA:=-2710;
  //RzStatusPane1.Caption:=FloatToStrF(xVoltA, ffFixed,6,1)+' mV';
end;

procedure TpHCalibrationForm.RzBitBtn4Click(Sender: TObject);
begin
  MainForm.Experiment.pHK:=K;
  MainForm.Experiment.pHb:=b;
  MainForm.Experiment.Xmin:=Xmin;
  MainForm.Experiment.Xmax:=Xmax;
  MainForm.Experiment.Ymin:=Ymin;
  MainForm.Experiment.Ymax:=Ymax;

  MainForm.Experiment.ListCh[0].K:=K;
  MainForm.Experiment.ListCh[0].b:=b;
  MainForm.Experiment.ListCh[0].Xmin:=Xmin;
  MainForm.Experiment.ListCh[0].Xmax:=Xmax;
  MainForm.Experiment.ListCh[0].Ymin:=Ymin;
  MainForm.Experiment.ListCh[0].Ymax:=Ymax;

  MainForm.RegIniFile.WriteFloat('pH', 'K', K);
  MainForm.RegIniFile.WriteFloat('pH', 'b', b);
  MainForm.RegIniFile.WriteFloat('pH', 'Xmin', Xmin);
  MainForm.RegIniFile.WriteFloat('pH', 'Xmax', Xmax);
  MainForm.RegIniFile.WriteFloat('pH', 'Ymin', Ymin);
  MainForm.RegIniFile.WriteFloat('pH', 'Ymax', Ymax);

  MainForm.RegIniFile.WriteFloat('AmplificationFactor', 'KA', RzSpinEdit1.Value);
  MainForm.Experiment.KA:=RzSpinEdit1.Value;

  Close;
end;

procedure TpHCalibrationForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MainForm.Calb:=False;
end;

procedure TpHCalibrationForm.FormCreate(Sender: TObject);
begin
  if MainForm.Experiment.Xmin <> -2 then
      begin
        K:=MainForm.Experiment.pHK;
        b:=MainForm.Experiment.pHb;
        Xmin:=MainForm.Experiment.Xmin;
        Xmax:=MainForm.Experiment.Xmax;
        Ymin:=MainForm.Experiment.Ymin;
        Ymax:=MainForm.Experiment.Ymax;

        Series1.AddXY(Xmin, Ymin);
        Series1.AddXY(Xmax, Ymax);

        MinpHEdit.Value:=Xmin;
        MaxpHEdit.Value:=Xmax;

        Chart1.Title.Text.Text:='y = ' + FloatToStrF(K, ffFixed,6,2) + ' x + '+ FloatToStrF(b, ffFixed,6,1);

        RzSpinEdit1.Value:=MainForm.Experiment.KA;
      end;

  xVoltA:=MainForm.Experiment.ListCh[0].xVolt;
  RzStatusPane1.Caption:=FloatToStrF(xVoltA, ffFixed,6,1)+' mV';
end;

procedure TpHCalibrationForm.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
  if Msg.CharCode = 13 then
    RzBitBtn4.Click;
  if Msg.CharCode = 27 then
      Close;
end;

procedure TpHCalibrationForm.FormShow(Sender: TObject);
begin
  MainForm.Calb:=True;
end;

end.
