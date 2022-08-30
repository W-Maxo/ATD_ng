unit Temperature;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, ExtCtrls, TeeProcs, Chart, Series, TeeThemes, RzForms,
  MainConst, TeeSpline, RzSpnEdt, TeeTools;

type
  TTemperatureForm = class(TForm)
    Chart1: TChart;
    Series1: TAreaSeries;
    RzFormState1: TRzFormState;
    RzSpinButtons2: TRzSpinButtons;
    ChartTool1: TAxisScrollTool;
    RzSpinButtons1: TRzSpinButtons;
    procedure FormCreate(Sender: TObject);
    procedure RzSpinButtons2DownLeftClick(Sender: TObject);
    procedure RzSpinButtons2UpRightClick(Sender: TObject);
    procedure Chart1Resize(Sender: TObject);
    procedure RzSpinButtons1DownLeftClick(Sender: TObject);
    procedure RzSpinButtons1UpRightClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TemperatureForm: TTemperatureForm;

implementation

uses Main;

{$R *.dfm}

procedure TTemperatureForm.Chart1Resize(Sender: TObject);
begin
  RzSpinButtons2.Top:=Chart1.Height - RzSpinButtons2.Height - 1;
  RzSpinButtons1.Top:=(Chart1.Height div 2) - 22;
end;

procedure TTemperatureForm.FormCreate(Sender: TObject);
begin
  with TSpeedTheme.Create(Chart1) do
  try
    Apply;
  finally
    Free;
  end;

  MainForm.Experiment.TmrSeries:=TemperatureForm.Series1;
  MainForm.Experiment.TmrChart:=Chart1;

  try
    //Application.OnMessage := WinMsg;
    AppendMenu (GetSystemMenu (TemperatureForm.Handle, False), MF_SEPARATOR, 0, '');
    AppendMenu (GetSystemMenu (TemperatureForm.Handle, False), MF_DISABLED, 0, '&Прозрачность окна');
    AppendMenu (GetSystemMenu (TemperatureForm.Handle, False), MF_UNCHECKED, Item75T, '&75%');
    AppendMenu (GetSystemMenu (TemperatureForm.Handle, False), MF_UNCHECKED, Item50T, '&50%');
    AppendMenu (GetSystemMenu (TemperatureForm.Handle, False), MF_UNCHECKED, Item25T, '&25%');
    AppendMenu (GetSystemMenu (TemperatureForm.Handle, False), MF_CHECKED, Item0T, '&0%');

    //CheckMenuRadioItem(
    //tem100T
  except end;
end;

procedure TTemperatureForm.RzSpinButtons1DownLeftClick(Sender: TObject);
begin
  Chart1.Zoom.Direction:=tzdVertical;
  Chart1.ZoomPercent(95);
  //AdvToolBarButton6.Enabled:=True;
  Chart1.Zoom.Direction:=tzdBoth;
end;

procedure TTemperatureForm.RzSpinButtons1UpRightClick(Sender: TObject);
begin
  Chart1.Zoom.Direction:=tzdVertical;
  Chart1.ZoomPercent(105);
  //AdvToolBarButton6.Enabled:=True;
  Chart1.Zoom.Direction:=tzdBoth;
end;

procedure TTemperatureForm.RzSpinButtons2DownLeftClick(Sender: TObject);
begin
  Chart1.Zoom.Direction:=tzdHorizontal;
  Chart1.ZoomPercent(90);
  //AdvToolBarButton6.Enabled:=True;
  Chart1.Zoom.Direction:=tzdBoth;
end;

procedure TTemperatureForm.RzSpinButtons2UpRightClick(Sender: TObject);
begin
  Chart1.Zoom.Direction:=tzdHorizontal;
  Chart1.ZoomPercent(110);
  //AdvToolBarButton6.Enabled:=True;
  Chart1.Zoom.Direction:=tzdBoth;
end;

end.
