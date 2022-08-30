unit InfoExp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, StdCtrls, RzEdit, RzLabel, RzButton, MainSysUtils,
  DateUtils;

type
  TInfoExpForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    NotesMemo: TRzMemo;
    Label3: TLabel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzBitBtn1: TRzBitBtn;
    Label4: TLabel;
    RzLabel3: TRzLabel;
    Label5: TLabel;
    RzLabel4: TRzLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InfoExpForm: TInfoExpForm;

implementation

uses Main;

{$R *.dfm}

procedure TInfoExpForm.FormCreate(Sender: TObject);
begin
  RzLabel1.Caption:=MainForm.Experiment.DBFile;

  NotesMemo.Text:=MainForm.Experiment.ExpNotes;
  RzLabel2.Caption:=DateTimeToStr(MainForm.Experiment.DataCreatedDB);

  RzLabel4.Caption:=FloattoStrF(HourSpan(MainForm.Experiment.Explength, 0), ffFixed,6,3) + ' часа';

  RzLabel3.Caption:=IntToStr(GetFileSize(MainForm.Experiment.DBFile) div 1024) + ' КБайт';
end;

procedure TInfoExpForm.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if Msg.CharCode = 13 then
    RzBitBtn1.Click;
  if Msg.CharCode = 27 then
      Close;
end;

procedure TInfoExpForm.RzBitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
