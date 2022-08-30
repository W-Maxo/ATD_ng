unit MainTimeEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, AdvSpin, RzEdit, ExtCtrls, RzPanel, RzPopups,
  RzButton, RzStatus, mswheel, JvComponentBase, JvMouseGesture;

type
  TMainTimeForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzCalendar1: TRzCalendar;
    RzTimePicker1: TRzTimePicker;
    AdvSpinEdit1: TAdvSpinEdit;
    RzBitBtn1: TRzBitBtn;
    RzClockStatus1: TRzClockStatus;
    RzStatusPane1: TRzStatusPane;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzTimePicker1Change(Sender: TObject);
    procedure RzCalendar1Change(Sender: TObject);
    procedure AdvSpinEdit1Change(Sender: TObject);
    procedure FormClick(Sender: TObject);
  private
    { Private declarations }
  public
    xMinTimeDate : Double;
  end;

var
  MainTimeForm: TMainTimeForm;

implementation

{$R *.dfm}

procedure TMainTimeForm.AdvSpinEdit1Change(Sender: TObject);
begin
  RzTimePicker1.Time:=AdvSpinEdit1.TimeValue;
  if RzCalendar1.Date + AdvSpinEdit1.TimeValue < xMinTimeDate then AdvSpinEdit1.Font.Color:=clRed
    else
      AdvSpinEdit1.Font.Color:=clBlack;
end;

procedure TMainTimeForm.FormClick(Sender: TObject);
begin
  //showmessage(DateTimeToStr(xMinTimeDate));
  //showmessage(DateTimeToStr(Now));
end;

procedure TMainTimeForm.RzBitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainTimeForm.RzCalendar1Change(Sender: TObject);
begin
  if RzCalendar1.Date + AdvSpinEdit1.TimeValue < xMinTimeDate then AdvSpinEdit1.Font.Color:=clRed
    else
      AdvSpinEdit1.Font.Color:=clBlack;
end;

procedure TMainTimeForm.RzTimePicker1Change(Sender: TObject);
begin
  AdvSpinEdit1.TimeValue:=RzTimePicker1.Time;
end;

end.
