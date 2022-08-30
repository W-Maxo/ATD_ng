unit StOpenExp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, RzPanel, RzPrgres, ComCtrls, StdCtrls,
  AdvWiiProgressBar, RzStatus;

type
  TStatusOpenExpForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzBitBtn1: TRzBitBtn;
    AdvWiiProgressBar1: TAdvWiiProgressBar;
    Label1: TLabel;
    RzProgressBar1: TRzProgressBar;
    Timer1: TTimer;
    RzProgressBar2: TRzProgressBar;
    RzStatusPane1: TRzStatusPane;
    RzGlyphStatus1: TRzGlyphStatus;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StatusOpenExpForm: TStatusOpenExpForm;

implementation

uses Main;

{$R *.dfm}

procedure TStatusOpenExpForm.RzBitBtn1Click(Sender: TObject);
begin
  MainForm.Experiment.CancelLoad:=True;
end;

procedure TStatusOpenExpForm.Timer1Timer(Sender: TObject);
begin
  RzProgressBar1.Percent:=MainForm.Experiment.CurrentLoadProgress;
  RzProgressBar2.Percent:=MainForm.Experiment.FullLoadProgress;

  MainForm.dwTaskbarProgressIndicator1.Position:=RzProgressBar2.Percent;

  RzGlyphStatus1.Caption:=MainForm.Experiment.StatusLoading;
end;

procedure TStatusOpenExpForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RzProgressBar1.Percent:=0;
  RzProgressBar2.Percent:=0;

  MainForm.dwTaskbarProgressIndicator1.ShowInTaskbar:=False;
  MainForm.dwTaskbarProgressIndicator1.Position:=0;
end;

procedure TStatusOpenExpForm.FormCreate(Sender: TObject);
begin
  MainForm.dwTaskbarProgressIndicator1.ShowInTaskbar:=True;
  RzStatusPane1.Hint:=MainForm.Experiment.DBFile;
  RzStatusPane1.Caption:=ExtractFileName(MainForm.Experiment.DBFile);
end;

procedure TStatusOpenExpForm.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
  if Msg.CharCode = 13 then
    RzBitBtn1.Click;
  if Msg.CharCode = 27 then
      Close;
end;

procedure TStatusOpenExpForm.FormShow(Sender: TObject);
begin
  RzProgressBar1.Percent:=0;
  RzProgressBar2.Percent:=0;

  MainForm.ReadThread.Start;
end;

end.
