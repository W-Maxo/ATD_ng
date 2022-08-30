unit PCount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzButton, StdCtrls, RzLabel, Mask, RzEdit,
  RzSpnEdt;

type
  TPCountForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzBitBtn1: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzSpinEdit1: TRzSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PCountForm: TPCountForm;

implementation

uses Main;

{$R *.dfm}

procedure TPCountForm.FormCreate(Sender: TObject);
begin
  RzSpinEdit1.IntValue:=MainForm.TempPCount;
end;

procedure TPCountForm.RzBitBtn1Click(Sender: TObject);
begin
  MainForm.TempPCount:=RzSpinEdit1.IntValue;
  Close;
end;

end.
