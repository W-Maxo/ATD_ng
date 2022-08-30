unit ServiceMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, RzSpnEdt, RzButton, ExtCtrls, RzPanel, RzStatus, StdCtrls,
  Mask, RzEdit, IdBaseComponent, IdThreadComponent, RzPrgres;

type
  TServiceMenuForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzGroupBox2: TRzGroupBox;
    RzStatusPane2: TRzStatusPane;
    RzBitBtn3: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    ChangeSBitBtn: TRzBitBtn;
    RzGroupBox3: TRzGroupBox;
    RzGroupBox4: TRzGroupBox;
    RzBitBtn5: TRzBitBtn;
    Label1: TLabel;
    IntervalBetweenStepsM1Edit: TRzSpinEdit;
    Label3: TLabel;
    QuantumM1Edit: TRzSpinEdit;
    RzBitBtn6: TRzBitBtn;
    IdThreadComponent1: TIdThreadComponent;
    IdThreadComponent2: TIdThreadComponent;
    RzProgressBar1: TRzProgressBar;
    RzGroupBox5: TRzGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    RzProgressBar2: TRzProgressBar;
    IntervalBetweenStepsM2Edit: TRzSpinEdit;
    QuantumM2Edit: TRzSpinEdit;
    RzBitBtn7: TRzBitBtn;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ChangeSBitBtnClick(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure IdThreadComponent1Run(Sender: TIdThreadComponent);
    procedure RzBitBtn6Click(Sender: TObject);
    procedure IdThreadComponent2Run(Sender: TIdThreadComponent);
    procedure RzBitBtn7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServiceMenuForm: TServiceMenuForm;

implementation

uses Main;

{$R *.dfm}

procedure TServiceMenuForm.RzBitBtn1Click(Sender: TObject);
begin
  if not MainForm.ComPort1.Connected then exit;
  if RzBitBtn1.ImageIndex = 0  then
      begin
        RzBitBtn1.ImageIndex:=2;
        MainForm.ComPortWriteStr('*A' + IntToStr(0) +'1'+#13);
        RzBitBtn1.Caption:='Остановить насос';
        MainForm.State1:=True;
      end
    else
      begin
        RzBitBtn1.ImageIndex:=0;
        MainForm.ComPortWriteStr('*A' + IntToStr(0) +'0'+#13);
        RzBitBtn1.Caption:='Запустить насос';
        MainForm.State1:=False;
      end;
end;

procedure TServiceMenuForm.RzBitBtn2Click(Sender: TObject);
begin
  if not MainForm.ComPort1.Connected then exit;
  if RzBitBtn2.ImageIndex = 0  then
      begin
        RzBitBtn2.ImageIndex:=2;
        MainForm.ComPortWriteStr('*A' + IntToStr(1) +'1'+#13);
        RzBitBtn2.Caption:='Закрыть клапан';
        MainForm.State2:=True;
      end
    else
      begin
        RzBitBtn2.ImageIndex:=0;
        MainForm.ComPortWriteStr('*A' + IntToStr(1) +'0'+#13);
        RzBitBtn2.Caption:='Открыть клапан';
        MainForm.State2:=False;
      end;
end;

procedure TServiceMenuForm.RzBitBtn3Click(Sender: TObject);
begin
  MainForm.RzBitBtn2Click(Sender);
end;

procedure TServiceMenuForm.RzBitBtn4Click(Sender: TObject);
begin
  MainForm.RzBitBtn3Click(Sender);
end;

procedure TServiceMenuForm.RzBitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TServiceMenuForm.RzBitBtn6Click(Sender: TObject);
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

procedure TServiceMenuForm.RzBitBtn7Click(Sender: TObject);
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

procedure TServiceMenuForm.ChangeSBitBtnClick(Sender: TObject);
begin
  MainForm.ChangeSBitBtnClick(Sender);
end;

procedure TServiceMenuForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RzBitBtn6.ImageIndex:= 25;
  RzBitBtn7.ImageIndex:= 25;
end;

procedure TServiceMenuForm.FormCreate(Sender: TObject);
begin
  RzBitBtn3.Caption:=MainForm.M1StatusPane.Caption;
  RzBitBtn4.Caption:=MainForm.M2StatusPane.Caption;
  ChangeSBitBtn.Enabled:=MainForm.ChangeSBitBtn.Enabled;

  if MainForm.State1 then
      begin
        RzBitBtn1.ImageIndex:=2;
        MainForm.ComPortWriteStr('*A' + IntToStr(0) +'1'+#13);
        RzBitBtn1.Caption:='Остановить насос';
      end
    else
      begin
        RzBitBtn1.ImageIndex:=0;
        MainForm.ComPortWriteStr('*A' + IntToStr(0) +'0'+#13);
        RzBitBtn1.Caption:='Запустить насос';
      end;

  if MainForm.State2 then
      begin
        RzBitBtn2.ImageIndex:=2;
        MainForm.ComPortWriteStr('*A' + IntToStr(1) +'1'+#13);
        RzBitBtn2.Caption:='Закрыть клапан';
      end
    else
      begin
        RzBitBtn2.ImageIndex:=0;
        MainForm.ComPortWriteStr('*A' + IntToStr(1) +'0'+#13);
        RzBitBtn2.Caption:='Открыть клапан';
      end;

  QuantumM1Edit.Increment:=MainForm.Experiment.VolPerStepA;
  QuantumM1Edit.Value:=MainForm.Experiment.VolPerStepA;

  QuantumM2Edit.Increment:=MainForm.Experiment.VolPerStepB;
  QuantumM2Edit.Value:=MainForm.Experiment.VolPerStepB;
end;

procedure TServiceMenuForm.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
  {if Msg.CharCode = 13 then
    RzBitBtn1.Click;}
  if Msg.CharCode = 27 then
      Close;
end;

procedure TServiceMenuForm.IdThreadComponent1Run(Sender: TIdThreadComponent);
var
  V : Double;

  Label Term;
begin
  V:=0;

  if not (QuantumM1Edit.Value < QuantumM1Edit.Increment) then
      begin
        QuantumM1Edit.Enabled:=False;

        while V < QuantumM1Edit.Value do
          begin
            MainForm.Experiment.m1:=MainForm.Experiment.m1 - 1;
            if MainForm.Experiment.m1 < 0 then MainForm.Experiment.m1:=3;

            MainForm.ComPortWriteStr(AnsiString('*A' + IntToStr(6 + MainForm.Experiment.m1) +'1'+#13));

            V:=V + QuantumM1Edit.Increment;

            RzProgressBar1.Percent:=Trunc((V / QuantumM1Edit.Value) * 100);

            if RzBitBtn6.ImageIndex = 25 then GoTo Term;
            Sleep(IntervalBetweenStepsM1Edit.IntValue);
            if RzBitBtn6.ImageIndex = 25 then GoTo Term;
          end;
      end;

  RzProgressBar1.Percent:=100;

  Term:

  IdThreadComponent1.Stop;

  RzBitBtn6.ImageIndex:= 25;
  RzBitBtn6.Caption:='Инджекция';

  QuantumM1Edit.Enabled:=True;
end;

procedure TServiceMenuForm.IdThreadComponent2Run(Sender: TIdThreadComponent);
var
  V : Double;

  Label Term;
begin
  V:=0;

  if not (QuantumM2Edit.Value < QuantumM2Edit.Increment) then
      begin
        QuantumM2Edit.Enabled:=False;

        while V < QuantumM2Edit.Value do
          begin
            MainForm.Experiment.m2:=MainForm.Experiment.m2 - 1;
            if MainForm.Experiment.m2 < 0 then MainForm.Experiment.m2:=3;

            MainForm.ComPortWriteStr(AnsiString('*A' + IntToStr(2 + MainForm.Experiment.m2) +'1'+#13));

            V:=V + QuantumM2Edit.Increment;

            RzProgressBar2.Percent:=Trunc((V / QuantumM2Edit.Value) * 100);

            if RzBitBtn7.ImageIndex = 25 then GoTo Term;
            Sleep(IntervalBetweenStepsM2Edit.IntValue);
            if RzBitBtn7.ImageIndex = 25 then GoTo Term;
          end;
      end;

  RzProgressBar2.Percent:=100;

  Term:

  IdThreadComponent2.Stop;

  RzBitBtn7.ImageIndex:= 25;
  RzBitBtn7.Caption:='Инджекция';

  QuantumM2Edit.Enabled:=True;
end;

end.
