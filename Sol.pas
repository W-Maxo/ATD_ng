unit Sol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzButton, StdCtrls, Mask, RzEdit, RzSpnEdt;

type
  TSolForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzBitBtn5: TRzBitBtn;
    RzGroupBox2: TRzGroupBox;
    RzGroupBox3: TRzGroupBox;
    Label3: TLabel;
    QuantumM1Edit: TRzSpinEdit;
    RzSpinEdit1: TRzSpinEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SolForm: TSolForm;

implementation

uses Main;

{$R *.dfm}

procedure TSolForm.FormCreate(Sender: TObject);
begin
  RzGroupBox2.Caption :=MainForm.M1StatusPane.Caption;
  RzGroupBox3.Caption :=MainForm.M2StatusPane.Caption;

  QuantumM1Edit.Value :=MainForm.Experiment.SolA;
  RzSpinEdit1.Value   :=MainForm.Experiment.SolB;
end;

procedure TSolForm.RzBitBtn5Click(Sender: TObject);
begin
  MainForm.Experiment.SolA:=QuantumM1Edit.Value;
  MainForm.Experiment.SolB:=RzSpinEdit1.Value;

  MainForm.RegIniFile.WriteFloat('Solution', 'SolA', QuantumM1Edit.Value);
  MainForm.RegIniFile.WriteFloat('Solution', 'SolB', RzSpinEdit1.Value);

  Close;
end;

end.
