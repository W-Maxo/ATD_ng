unit NewCal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzLstBox, RzStatus, ExtCtrls, RzPanel, RzLine,
  TaskDialog;

type
  TNewCalForm = class(TForm)
    RzGroupBox2: TRzGroupBox;
    RzStatusPane1: TRzStatusPane;
    RzStatusPane2: TRzStatusPane;
    RzBitBtn2: TRzBitBtn;
    RzStatusPane3: TRzStatusPane;
    Timer1: TTimer;
    RzBitBtn1: TRzBitBtn;
    RzLine1: TRzLine;
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    Stage : Integer;
  public
    { Public declarations }
  end;

var
  NewCalForm: TNewCalForm;

implementation

uses KCal, Main;

{$R *.dfm}

procedure TNewCalForm.FormCreate(Sender: TObject);
begin
  RzStatusPane1.Caption:='Стадия 1 из 24';
  RzStatusPane2.Caption:='c(K+) 1 • 10^ -7';
end;

procedure TNewCalForm.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if Msg.CharCode = 27 then
      RzBitBtn1Click(NewCalForm);
end;

procedure TNewCalForm.RzBitBtn1Click(Sender: TObject);
begin
  MainForm.TaskDialog.Content:=' Прервать калибровку?';
  MainForm.TaskDialog.Icon:=tiWarning;
  if MainForm.TaskDialog.Execute = 6 then
      begin
        Close;
      end;
end;

procedure TNewCalForm.RzBitBtn2Click(Sender: TObject);
begin
  case Stage of
    0:
      begin
        //KCalForm.Val[0].Val1:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 3 • 10^ -7';
      end;
    1:
      begin
        //KCalForm.Val[1].Val1:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 1 • 10^ -6';
      end;
    2:
      begin
        //KCalForm.Val[2].Val1:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 3 • 10^ -6';
      end;
    3:
      begin
        //KCalForm.Val[3].Val1:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 1 • 10^ -5';
      end;
    4:
      begin
        //KCalForm.Val[4].Val1:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 3 • 10^ -5';
      end;
    5:
      begin
        //KCalForm.Val[5].Val1:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 1 • 10^ -4';
      end;
    6:
      begin
        //KCalForm.Val[6].Val1:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 3 • 10^ -4';
      end;
    7:
      begin
        //KCalForm.Val[7].Val1:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 1 • 10^ -7';
      end;
    8:
      begin
        //KCalForm.Val[0].Val2:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 3 • 10^ -7';
      end;
    9:
      begin
        //KCalForm.Val[1].Val2:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 1 • 10^ -6';
      end;
    10:
      begin
        //KCalForm.Val[2].Val2:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 3 • 10^ -6';
      end;
    11:
      begin
        //KCalForm.Val[3].Val2:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 1 • 10^ -5';
      end;
    12:
      begin
        //KCalForm.Val[4].Val2:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 3 • 10^ -5';
      end;
    13:
      begin
        //KCalForm.Val[5].Val2:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 1 • 10^ -4';
      end;
    14:
      begin
        //KCalForm.Val[6].Val2:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 3 • 10^ -4';
      end;
    15:
      begin
        //KCalForm.Val[7].Val2:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 1 • 10^ -7';
      end;
    16:
      begin
        //KCalForm.Val[0].Val3:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 3 • 10^ -7';
      end;
    17:
      begin
        //KCalForm.Val[1].Val3:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 1 • 10^ -6';
      end;
    18:
      begin
        //KCalForm.Val[2].Val3:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 3 • 10^ -6';
      end;
    19:
      begin
        //KCalForm.Val[3].Val3:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 1 • 10^ -5';
      end;
    20:
      begin
        //KCalForm.Val[4].Val3:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 3 • 10^ -5';
      end;
    21:
      begin
        //KCalForm.Val[5].Val3:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 1 • 10^ -4';
      end;
    22:
      begin
        //KCalForm.Val[6].Val3:=MainForm.Experiment.GetxVoltB;
        inc(Stage);
        RzStatusPane1.Caption:='Стадия ' + IntToStr(Stage + 1) + ' из 24';
        RzStatusPane2.Caption:='c(K+) 3 • 10^ -4';

        RzBitBtn2.ImageIndex:=51;
      end;
    23:
      begin
        //KCalForm.Val[7].Val3:=MainForm.Experiment.GetxVoltB;


        KCalForm.Val[0].Av:= (KCalForm.Val[0].Val1 +  KCalForm.Val[0].Val2 +  KCalForm.Val[0].Val3) / 3;
        KCalForm.Val[1].Av:= (KCalForm.Val[1].Val1 +  KCalForm.Val[1].Val2 +  KCalForm.Val[1].Val3) / 3;
        KCalForm.Val[2].Av:= (KCalForm.Val[2].Val1 +  KCalForm.Val[2].Val2 +  KCalForm.Val[2].Val3) / 3;
        KCalForm.Val[3].Av:= (KCalForm.Val[3].Val1 +  KCalForm.Val[3].Val2 +  KCalForm.Val[3].Val3) / 3;
        KCalForm.Val[4].Av:= (KCalForm.Val[4].Val1 +  KCalForm.Val[4].Val2 +  KCalForm.Val[4].Val3) / 3;
        KCalForm.Val[5].Av:= (KCalForm.Val[5].Val1 +  KCalForm.Val[5].Val2 +  KCalForm.Val[5].Val3) / 3;
        KCalForm.Val[6].Av:= (KCalForm.Val[6].Val1 +  KCalForm.Val[6].Val2 +  KCalForm.Val[6].Val3) / 3;
        KCalForm.Val[7].Av:= (KCalForm.Val[7].Val1 +  KCalForm.Val[7].Val2 +  KCalForm.Val[7].Val3) / 3;

        Close;
        NewCalForm.ModalResult:=15;
      end;
  end;
  //KCalForm.Val
end;

procedure TNewCalForm.Timer1Timer(Sender: TObject);
begin
  //RzStatusPane3.Caption:=FloatToStrF(MainForm.Experiment.GetxVoltB, ffFixed,6,1)+' mV';
end;

end.
