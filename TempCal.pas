unit TempCal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzButton, StdCtrls, Mask, RzEdit, RzSpnEdt,
  RzLabel, Math;

type
  TTempCalForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    OKBitBtn: TRzBitBtn;
    CancelBitBtn: TRzBitBtn;
    MinTEdit: TRzSpinEdit;
    MaxTEdit: TRzSpinEdit;
    RzBitBtn4: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    procedure RzBitBtn4Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);

    procedure OKBitBtnClick(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
  private
    Xmin, Xmax, Ymin, Ymax, xVoltA, K, b : Double;

    procedure Calibration;
  public
    { Public declarations }
  end;

var
  TempCalForm: TTempCalForm;

implementation

uses Main;

{$R *.dfm}

procedure TTempCalForm.Calibration;
begin
  K:=(Ymin - Ymax) / (Xmin - Xmax);
  b:=Ymin - (Xmin * K);

  OKBitBtn.Enabled:=True;
  //Chart1.Title.Text.Text:='y = ' + FloatToStrF(K, ffFixed,6,2) + ' x + '+ FloatToStrF(b, ffFixed,6,1);
end;

procedure TTempCalForm.OKBitBtnClick(Sender: TObject);
begin
  MainForm.Experiment.TmrK:=K;
  MainForm.Experiment.Tmrb:=b;

  MainForm.RegIniFile.WriteFloat('TmrS', 'K', MainForm.Experiment.TmrK);
  MainForm.RegIniFile.WriteFloat('TmrS', 'b', MainForm.Experiment.Tmrb);

  Close;
end;

procedure TTempCalForm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TTempCalForm.RzBitBtn3Click(Sender: TObject);
begin
  Xmax:=MaxTEdit.Value;
  Ymax:=RoundTo(MainForm.Experiment.TmrVolt, -2);
  //Series1.AddXY(Xmax, Ymax);
  RzBitBtn3.Enabled:=False;
  if not RzBitBtn4.Enabled then Calibration;
end;

procedure TTempCalForm.RzBitBtn4Click(Sender: TObject);
begin
  Xmin:=MinTEdit.Value;
  Ymin:=RoundTo(MainForm.Experiment.TmrVolt, -2);
  //Series1.AddXY(Xmin, Ymin);
  RzBitBtn4.Enabled:=False;
  if not RzBitBtn3.Enabled then Calibration;
end;

end.
