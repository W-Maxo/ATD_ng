unit Refuelling;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvWiiProgressBar, RzStatus, RzButton, dwProgressBar;

type
  TRefuellingForm = class(TForm)
    AdvWiiProgressBar1: TAdvWiiProgressBar;
    RzStatusPane1: TRzStatusPane;
    RzBitBtn1: TRzBitBtn;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

    Motor : byte;
  end;

var
  RefuellingForm: TRefuellingForm;

implementation

uses Main;

{$R *.dfm}

procedure TRefuellingForm.RzBitBtn1Click(Sender: TObject);
begin
  MainForm.CancelRefuelling:=True;
end;

procedure TRefuellingForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.dwTaskbarProgressIndicator1.ShowInTaskbar:=False;
  MainForm.dwTaskbarProgressIndicator1.MarqueeEnabled:=False;
  MainForm.dwTaskbarProgressIndicator1.ProgressBarState:=pbstNormal;

  MainForm.xSay('Заправка завершена.');
end;

procedure TRefuellingForm.FormCreate(Sender: TObject);
begin
  MainForm.dwTaskbarProgressIndicator1.ShowInTaskbar:=True;
  MainForm.dwTaskbarProgressIndicator1.MarqueeEnabled:=True;
  MainForm.dwTaskbarProgressIndicator1.ProgressBarState:=pbstMarquee;
end;

procedure TRefuellingForm.FormShow(Sender: TObject);
begin
  if Motor = 0 then
      MainForm.Refuelling1Thread.Start
    else
      MainForm.Refuelling2Thread.Start;
end;

end.
