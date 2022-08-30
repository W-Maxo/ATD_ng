unit FlowExp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvSmoothTimeLine, ExtCtrls, RzPanel, StdCtrls, RzLstBox, RzButton,
  ComCtrls, RzListVw, MainClasses, RzStatus, xType, Mask, RzEdit, RzSpnEdt;

type
  TFlowExpForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzListBox1: TRzListBox;
    RzListBox2: TRzListBox;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    RzClockStatus1: TRzClockStatus;
    RzGroupBox2: TRzGroupBox;
    Label13: TLabel;
    RzSpinEdit2: TRzSpinEdit;
    Label1: TLabel;
    RzBitBtn5: TRzBitBtn;
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzListBox1Click(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  FlowExpForm: TFlowExpForm;

implementation

uses Main, Find, MainTimeEdit, ViewTask;

{$R *.dfm}

procedure EditTime(MinDataTime : Double; Discr : String; var STime : Double);
begin
  if MainTimeForm = nil then
      MainTimeForm:=TMainTimeForm.Create(Application);

  MainTimeForm.RzCalendar1.MinDate:=MinDataTime;
  //MainTimeForm.RzTimePicker1.:=MinDataTime;

  MainTimeForm.AdvSpinEdit1.MinFloatValue:=MinDataTime;

  MainTimeForm.AdvSpinEdit1.MinDateValue:=MinDataTime;
  MainTimeForm.AdvSpinEdit1.TimeValue:=MinDataTime;

  MainTimeForm.xMinTimeDate:=MinDataTime;

  MainTimeForm.RzStatusPane1.Caption:=Discr;

  MainTimeForm.ShowModal;

  STime:=MainTimeForm.RzCalendar1.Date + MainTimeForm.AdvSpinEdit1.TimeValue;

  //Showmessage(DateTimeToStr(STime));
end;


procedure TFlowExpForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MainForm.TaskList.TaskList.Count > 0 then
    if not MainForm.SchedulerTimer.Enabled then
      begin
        MainForm.SchedulerTimer.Enabled:=True;
      end;

  if ViewTaskForm <> nil then
    begin
      ViewTaskForm.LoadList(Sender);
    end;

end;

procedure TFlowExpForm.FormCreate(Sender: TObject);
var
  obj1,
  obj2,
  obj3    : TTask;

  i       : integer;
  TmpStr  : String;
begin
  obj1 := TTask.create(RzListBox1);
  obj1.Script:='ChSol';
  RzListBox1.AddObject(WideString('Смена раствора'), obj1);

  obj2 := TTask.create(RzListBox1);
  obj2.Script:='EndExp';
  RzListBox1.AddObject(WideString('Завершение эксперемента'), obj2);

  obj3 := TTask.create(RzListBox1);
  obj3.Script:='Shutdown';
  RzListBox1.AddObject(WideString('Выключение компьютера'), obj3);

  if MainForm.TaskList.TaskList.Count > 0 then
      begin
        for i := 0 to MainForm.TaskList.TaskList.Count - 1 do
          begin
            if MainForm.TaskList.TaskList[i] = 'ChSol' then TmpStr:='Смена раствора'
              else
                if MainForm.TaskList.TaskList[i] = 'EndExp' then TmpStr:='Завершение эксперемента'
                  else
                    if MainForm.TaskList.TaskList[i] = 'Shutdown' then TmpStr:='Выключение компьютера';

            RzListBox2.Add(MainForm.TaskList.TimeList[i] + ' : ' + TmpStr);
          end;
      end;
end;

procedure TFlowExpForm.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  {if Msg.CharCode = 13 then
    RzBitBtn1.Click;}
  if Msg.CharCode = 27 then
      Close;
end;

procedure TFlowExpForm.RzBitBtn1Click(Sender: TObject);
var
  Tmp     : integer;
  TmpData : Double;
begin
  if RzListBox1.ItemIndex = -1 then exit;

  with MainForm do
    begin
      if TTask(RzListBox1.Items.Objects[RzListBox1.ItemIndex]).Script = 'Shutdown' then
          begin
            if not TaskList.TaskList.Find('EndExp', Tmp) then
                begin
                  TaskList.TaskList.Add('EndExp');

                  if TaskList.TimeList.Count = 0 then
                      begin
                        EditTime(Now, 'Завершение эксперемента', TmpData);
                        TaskList.TimeList.Add(DateTimeToStr(TmpData));
                        RzListBox2.Add(TaskList.TimeList[TaskList.TimeList.Count - 1] + ' : Завершение эксперемента');
                      end
                    else
                      begin
                        EditTime(StrToDateTime(TaskList.TimeList[TaskList.TimeList.Count - 1]), 'Завершение эксперемента', TmpData);
                        TaskList.TimeList.Add(DateTimeToStr(TmpData));
                        RzListBox2.Add(TaskList.TimeList[TaskList.TimeList.Count - 1] + ' : Завершение эксперемента');
                      end;

                  TaskList.TimeList.Add(DateTimeToStr(TmpData + EncodeTime(0, 1, 30, 0)));

                  TaskList.TaskList.Add(TTask(RzListBox1.Items.Objects[RzListBox1.ItemIndex]).Script);
                  RzListBox2.Add(TaskList.TimeList[TaskList.TimeList.Count - 1] + ' : ' + RzListBox1.Items[RzListBox1.ItemIndex]);
                end
              else
                begin
                  TaskList.TaskList.Add(TTask(RzListBox1.Items.Objects[RzListBox1.ItemIndex]).Script);

                  if TaskList.TimeList.Count = 0 then
                      begin
                        EditTime(Now, RzListBox1.Items[RzListBox1.ItemIndex], TmpData);
                        TaskList.TimeList.Add(DateTimeToStr(TmpData));
                      end
                    else
                      begin
                        //if TaskList.TaskList.Find('ChSol', Tmp) then
                            //EditTime(StrToDateTime(TaskList.TimeList[TaskList.TimeList.Count - 1]) + EncodeTime(0, 15, 0, 0), RzListBox1.Items[RzListBox1.ItemIndex], TmpData)
                          //else
                            EditTime(StrToDateTime(TaskList.TimeList[TaskList.TimeList.Count - 1]), RzListBox1.Items[RzListBox1.ItemIndex], TmpData);
                        TaskList.TimeList.Add(DateTimeToStr(TmpData));
                      end;

                  RzListBox2.Add(TaskList.TimeList[TaskList.TimeList.Count - 1] + ' : ' + RzListBox1.Items[RzListBox1.ItemIndex]);
                end;

            RzBitBtn1.Enabled:=False;
          end
        else
          begin
            if not TaskList.TaskList.Find('EndExp', Tmp) then
                begin
                  TaskList.TaskList.Add(TTask(RzListBox1.Items.Objects[RzListBox1.ItemIndex]).Script);

                  if TaskList.TimeList.Count = 0 then
                      begin
                        EditTime(Now, RzListBox1.Items[RzListBox1.ItemIndex], TmpData);
                        TaskList.TimeList.Add(DateTimeToStr(TmpData));
                      end
                    else
                      begin
                        if TaskList.TaskList.Find('ChSol', Tmp) then
                            EditTime(StrToDateTime(TaskList.TimeList[TaskList.TimeList.Count - 1]) + EncodeTime(0, 15, 0, 0), RzListBox1.Items[RzListBox1.ItemIndex], TmpData)
                          else
                            EditTime(StrToDateTime(TaskList.TimeList[TaskList.TimeList.Count - 1]), RzListBox1.Items[RzListBox1.ItemIndex], TmpData);

                        //EditTime(StrToDateTime(TaskList.TimeList[TaskList.TimeList.Count - 1]) + EncodeTime(0, 15, 0, 0), RzListBox1.Items[RzListBox1.ItemIndex], TmpData);
                        TaskList.TimeList.Add(DateTimeToStr(TmpData));
                      end;

                  RzListBox2.Add(TaskList.TimeList[TaskList.TimeList.Count - 1] + ' : ' + RzListBox1.Items[RzListBox1.ItemIndex]);
                end;
          end;
    end;

  if RzListBox2.Count = 0 then
      begin
        RzBitBtn2.Enabled:=False;
        RzBitBtn4.Enabled:=False;
      end
    else
      begin
        RzBitBtn2.Enabled:=True;
        RzBitBtn4.Enabled:=True;
      end;
end;

procedure TFlowExpForm.RzBitBtn2Click(Sender: TObject);
begin
  if RzListBox2.ItemIndex = -1 then exit;

  if MainForm.TaskList.TaskList[RzListBox2.ItemIndex] = 'Shutdown' then RzBitBtn1.Enabled:=True;;

  MainForm.TaskList.TaskList.Delete(RzListBox2.ItemIndex);
  MainForm.TaskList.TimeList.Delete(RzListBox2.ItemIndex);

  RzListBox2.DeleteSelected;

  if RzListBox2.Count = 0 then
      begin
        RzBitBtn2.Enabled:=False;
        RzBitBtn4.Enabled:=False;
      end
    else
      begin
        RzBitBtn2.Enabled:=True;
        RzBitBtn4.Enabled:=True;
      end;
  //Showmessage(TaskList.TaskList.Text);
end;

procedure TFlowExpForm.RzBitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TFlowExpForm.RzBitBtn5Click(Sender: TObject);
var
  Tmp     : integer;
  TmpData : Double;
begin
  MainForm.TaskList.TaskList.Add(TTask(RzListBox1.Items.Objects[RzListBox1.ItemIndex]).Script);

  if MainForm.TaskList.TimeList.Count = 0 then
      begin
        TmpData:=Now + EncodeTime(Trunc(RzSpinEdit2.Value), Trunc((RzSpinEdit2.Value - Trunc(RzSpinEdit2.Value)) * 60), 0, 0);
        MainForm.TaskList.TimeList.Add(DateTimeToStr(TmpData));
      end
    else
      begin
        TmpData:=StrToDateTime(MainForm.TaskList.TimeList[MainForm.TaskList.TimeList.Count - 1]) +
                 EncodeTime(Trunc(RzSpinEdit2.Value), Trunc((RzSpinEdit2.Value - Trunc(RzSpinEdit2.Value)) * 60), 0, 0);

        MainForm.TaskList.TimeList.Add(DateTimeToStr(TmpData));
      end;

  RzListBox2.Add(MainForm.TaskList.TimeList[MainForm.TaskList.TimeList.Count - 1] + ' : ' + RzListBox1.Items[RzListBox1.ItemIndex]);
end;

procedure TFlowExpForm.RzListBox1Click(Sender: TObject);
begin
  if TTask(RzListBox1.Items.Objects[RzListBox1.ItemIndex]).Script = 'ChSol' then
      RzGroupBox2.Enabled:=True
    else
      RzGroupBox2.Enabled:=False;
end;

end.
