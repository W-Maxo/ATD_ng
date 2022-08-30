unit Mass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzSpnEdt, ExtCtrls, RzPanel, RzButton;

type
  TMassForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    Label3: TLabel;
    QuantumM1Edit: TRzSpinEdit;
    RzBitBtn1: TRzBitBtn;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MassForm: TMassForm;

implementation

uses Main;

{$R *.dfm}

procedure TMassForm.FormCreate(Sender: TObject);
begin
  QuantumM1Edit.Value:=MainForm.Experiment.Mass;
end;

procedure TMassForm.RzBitBtn1Click(Sender: TObject);
begin
  MainForm.Experiment.Mass:=QuantumM1Edit.Value;
  Close;
end;

end.
