unit Change;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvWiiProgressBar, ExtCtrls, RzPanel, RzStatus, RzButton, SpeechLib_TLB,
  RzPrgres;

type
  TChangeSolutionForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzStatusPane1: TRzStatusPane;
    RzBitBtn1: TRzBitBtn;
    RzGlyphStatus1: TRzGlyphStatus;
    RzGlyphStatus2: TRzGlyphStatus;
    RzGlyphStatus3: TRzGlyphStatus;
    RzGlyphStatus4: TRzGlyphStatus;
    RzGlyphStatus5: TRzGlyphStatus;
    AdvWiiProgressBar1: TAdvWiiProgressBar;
    RzGroupBox2: TRzGroupBox;
    RzStatusPane2: TRzStatusPane;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    RzProgressBar1: TRzProgressBar;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChangeSolutionForm: TChangeSolutionForm;

implementation

uses Main;

{$R *.dfm}

procedure TChangeSolutionForm.RzBitBtn1Click(Sender: TObject);
begin
  MainForm.Experiment.Changing:=False;
  MainForm.Experiment.AddToLog('Замена раствора прервана пользователем.', clPurple);
  MainForm.xSay('Замена раствора прервана пользователем.');
  MainForm.ChSolThread.Start;
  Close;
end;

procedure TChangeSolutionForm.RzBitBtn2Click(Sender: TObject);
begin
  MainForm.RzBitBtn2Click(Sender);
end;

procedure TChangeSolutionForm.RzBitBtn3Click(Sender: TObject);
begin
  MainForm.RzBitBtn3Click(Sender);
end;

procedure TChangeSolutionForm.FormShow(Sender: TObject);
begin
  MainForm.xSay('Замена раствора.');
  MainForm.ChSolThread.Start;
end;

procedure TChangeSolutionForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MainForm.dwTaskbarProgressIndicator1.ShowInTaskbar:=False;
  MainForm.dwTaskbarProgressIndicator1.Position:=0;
end;

procedure TChangeSolutionForm.FormCreate(Sender: TObject);
begin
  RzBitBtn2.Caption:=MainForm.M1StatusPane.Caption;
  RzBitBtn3.Caption:=MainForm.M2StatusPane.Caption;

  MainForm.dwTaskbarProgressIndicator1.ShowInTaskbar:=True;
end;

end.
