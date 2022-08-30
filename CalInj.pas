unit CalInj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, Mask, RzEdit, RzSpnEdt, RzPrgres, ExtCtrls,
  RzPanel, RzStatus, IdBaseComponent, IdThreadComponent, RzLabel, RzTabs;

type
  TCalInjForm = class(TForm)
    RzBitBtn5: TRzBitBtn;
    IdThreadComponent1: TIdThreadComponent;
    IdThreadComponent2: TIdThreadComponent;
    RzGroupBox3: TRzGroupBox;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    RzGroupBox4: TRzGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    RzProgressBar1: TRzProgressBar;
    RzStatusPane9: TRzStatusPane;
    IntervalBetweenStepsM1Edit: TRzSpinEdit;
    QuantumM1Edit: TRzSpinEdit;
    RzBitBtn6: TRzBitBtn;
    CountStepsPerTurnM1Edit: TRzSpinEdit;
    RzBitBtn4: TRzBitBtn;
    RzGroupBox1: TRzGroupBox;
    RzStatusPane2: TRzStatusPane;
    RzStatusPane3: TRzStatusPane;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzBitBtn2: TRzBitBtn;
    RzGroupBox6: TRzGroupBox;
    RzPageControl2: TRzPageControl;
    RzTabSheet1: TRzTabSheet;
    RzTabSheet2: TRzTabSheet;
    RzGroupBox5: TRzGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    RzProgressBar2: TRzProgressBar;
    RzStatusPane1: TRzStatusPane;
    IntervalBetweenStepsM2Edit: TRzSpinEdit;
    QuantumM2Edit: TRzSpinEdit;
    RzBitBtn7: TRzBitBtn;
    CountStepsPerTurnM2Edit: TRzSpinEdit;
    RzBitBtn1: TRzBitBtn;
    RzGroupBox2: TRzGroupBox;
    RzStatusPane4: TRzStatusPane;
    RzStatusPane5: TRzStatusPane;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzBitBtn3: TRzBitBtn;
    RzGroupBox7: TRzGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    RzProgressBar3: TRzProgressBar;
    RzStatusPane6: TRzStatusPane;
    RzSpinEdit1: TRzSpinEdit;
    RzSpinEdit2: TRzSpinEdit;
    RzBitBtn8: TRzBitBtn;
    RzSpinEdit3: TRzSpinEdit;
    RzBitBtn9: TRzBitBtn;
    RzGroupBox8: TRzGroupBox;
    RzStatusPane7: TRzStatusPane;
    RzStatusPane8: TRzStatusPane;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzBitBtn10: TRzBitBtn;
    procedure IdThreadComponent1Run(Sender: TIdThreadComponent);
    procedure IdThreadComponent2Run(Sender: TIdThreadComponent);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure RzBitBtn6Click(Sender: TObject);
    procedure RzBitBtn7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
  private
    VSA, VSB  : Double;
  public
    { Public declarations }
  end;

var
  CalInjForm: TCalInjForm;

implementation

uses Main;

{$R *.dfm}

procedure TCalInjForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RzBitBtn6.ImageIndex:= 25;
  RzBitBtn7.ImageIndex:= 25;
end;

procedure TCalInjForm.IdThreadComponent1Run(Sender: TIdThreadComponent);
var
  i : integer;

  Label Term;
begin
  //QuantumM1Edit.Enabled:=False;
  //CountStepsPerTurnM1Edit.Enabled:=False;
  RzBitBtn2.Enabled:=False;
  RzBitBtn4.Enabled:=False;

  for i := 0 to CountStepsPerTurnM1Edit.IntValue do
    begin
      MainForm.Experiment.m1:=MainForm.Experiment.m1 - 1;
      if MainForm.Experiment.m1 < 0 then MainForm.Experiment.m1:=3;

      MainForm.ComPortWriteStr(AnsiString('*A' + IntToStr(6 + MainForm.Experiment.m1) +'1'+#13));

      RzProgressBar1.Percent:=Trunc((i / CountStepsPerTurnM1Edit.IntValue) * 100);

      if RzBitBtn6.ImageIndex = 25 then GoTo Term;
      Sleep(IntervalBetweenStepsM1Edit.IntValue);
      if RzBitBtn6.ImageIndex = 25 then GoTo Term;
    end;

  RzProgressBar1.Percent:=100;

  RzBitBtn4.Enabled:=True;

  Term:

  IdThreadComponent1.Stop;

  RzBitBtn6.ImageIndex:= 25;
  RzBitBtn6.Caption:='Инджекция';

  QuantumM1Edit.Enabled:=True;
end;

procedure TCalInjForm.IdThreadComponent2Run(Sender: TIdThreadComponent);
var
  i : integer;

  Label Term;
begin
  //QuantumM2Edit.Enabled:=False;
  //CountStepsPerTurnM2Edit.Enabled:=False;
  RzBitBtn3.Enabled:=False;
  RzBitBtn1.Enabled:=False;

  for i := 0 to CountStepsPerTurnM2Edit.IntValue do
    begin
      MainForm.Experiment.m2:=MainForm.Experiment.m2 - 1;
      if MainForm.Experiment.m2 < 0 then MainForm.Experiment.m2:=3;

      MainForm.ComPortWriteStr(AnsiString('*A' + IntToStr(2 + MainForm.Experiment.m2) +'1'+#13));

      RzProgressBar2.Percent:=Trunc((i / CountStepsPerTurnM2Edit.IntValue) * 100);

      if RzBitBtn7.ImageIndex = 25 then GoTo Term;
      Sleep(IntervalBetweenStepsM2Edit.IntValue);
      if RzBitBtn7.ImageIndex = 25 then GoTo Term;
    end;

  RzProgressBar2.Percent:=100;

  RzBitBtn1.Enabled:=True;

  Term:

  IdThreadComponent2.Stop;

  RzBitBtn7.ImageIndex:= 25;
  RzBitBtn7.Caption:='Инджекция';

  QuantumM2Edit.Enabled:=True;
end;

procedure TCalInjForm.RzBitBtn1Click(Sender: TObject);
begin
  VSB:=QuantumM2Edit.Value / CountStepsPerTurnM2Edit.IntValue;

  RzStatusPane4.Caption:=FloatToStrF(VSB, ffFixed, 7, 6);

  RzBitBtn3.Enabled:=True;
end;

procedure TCalInjForm.RzBitBtn2Click(Sender: TObject);
begin
  MainForm.RegIniFile.WriteFloat('Motor1Settings', 'VolPerSt', VSA);
  MainForm.Config.VolumPerStA:=VSA;

  RzBitBtn2.Enabled:=False;
end;

procedure TCalInjForm.RzBitBtn3Click(Sender: TObject);
begin
  MainForm.RegIniFile.WriteFloat('Motor2Settings', 'VolPerSt', VSB);
  MainForm.Config.VolumPerStB:=VSB;

  RzBitBtn3.Enabled:=False;
end;

procedure TCalInjForm.RzBitBtn4Click(Sender: TObject);
begin
  VSA:=QuantumM1Edit.Value / CountStepsPerTurnM1Edit.IntValue;

  RzStatusPane2.Caption:=FloatToStrF(VSA, ffFixed, 7, 6);

  RzBitBtn2.Enabled:=True;
end;

procedure TCalInjForm.RzBitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TCalInjForm.RzBitBtn6Click(Sender: TObject);
begin
  if RzBitBtn6.ImageIndex = 25 then
      begin
        RzBitBtn6.ImageIndex:= 27;
        IdThreadComponent1.Start;
        RzBitBtn6.Caption:='Прервать';
      end
    else
      begin
        //IdThreadComponent1.Stop;
        RzBitBtn6.ImageIndex:= 25;
        RzBitBtn6.Caption:='Инджекция';
      end;
end;

procedure TCalInjForm.RzBitBtn7Click(Sender: TObject);
begin
  if RzBitBtn7.ImageIndex = 25 then
      begin
        RzBitBtn7.ImageIndex:= 27;
        IdThreadComponent2.Start;
        RzBitBtn7.Caption:='Прервать';
      end
    else
      begin
        //IdThreadComponent1.Stop;
        RzBitBtn7.ImageIndex:= 25;
        RzBitBtn7.Caption:='Инджекция';
      end;
end;

end.
