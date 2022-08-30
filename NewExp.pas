unit NewExp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzEdit, Mask, RzBtnEdt, ExtCtrls, RzPanel,
  RzStatus, TaskDialog, Buttons, MainSysUtils, RzSpnEdt;

type
  TNewExpForm = class(TForm)
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzGroupBox1: TRzGroupBox;
    RzButtonEdit1: TRzButtonEdit;
    NotesMemo: TRzMemo;
    Label1: TLabel;
    Label2: TLabel;
    SaveDialog1: TSaveDialog;
    RzGroupBox2: TRzGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    RzSpinEdit1: TRzSpinEdit;
    QuantumM1Edit: TRzSpinEdit;
    Label5: TLabel;
    RzSpinEdit2: TRzSpinEdit;
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzButtonEdit1ButtonClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  NewExpForm: TNewExpForm;

implementation

uses Main;

{$R *.dfm}

procedure TNewExpForm.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (Msg.CharCode = 13) and (not NotesMemo.Focused) then
    RzBitBtn1.Click;
  if Msg.CharCode = 27 then
      Close;
end;

procedure TNewExpForm.RzBitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TNewExpForm.RzButtonEdit1ButtonClick(Sender: TObject);
begin
  SaveDialog1.InitialDir  := MainForm.DBDir;
  SaveDialog1.Filter := 'atd files (*.atd)|*.atd|All files (*.*)|*.*';
  if SaveDialog1.Execute then
    begin
      RzButtonEdit1.Text:=SaveDialog1.FileName;
    end;
end;

procedure TNewExpForm.RzBitBtn1Click(Sender: TObject);
Label 1;
begin
  if ((GetFreeSpace(ExtractFileDrive(RzButtonEdit1.Text)) div 1024) div 1024) < 25 then
      begin
        MainForm.TaskDialog.Content:=' На диске доступно менее 25 мегабайт свободного места, продолжить?';
        MainForm.TaskDialog.Title:='';
        MainForm.TaskDialog.Icon:=tiQuestion;
        if MainForm.TaskDialog.Execute = 6 then
            begin
              GoTo 1;
            end
          else
            Exit;
      end;

  1:
    MainForm.DBDir        := ExtractFileDir(RzButtonEdit1.Text) + '\';
    MainForm.Experiment.DBFile       := RzButtonEdit1.Text;
    MainForm.Experiment.ExpNotes     := NotesMemo.Text;

    MainForm.Experiment.Mass         :=QuantumM1Edit.Value;
    MainForm.Experiment.VSol         :=RzSpinEdit1.Value;
    MainForm.Experiment.xVolum       :=RzSpinEdit1.Value;
    MainForm.Experiment.xDay         :=RzSpinEdit2.Value;

    MainForm.RegIniFile.WriteFloat('Solution', 'Day',   MainForm.Experiment.xDay);
    MainForm.RegIniFile.WriteFloat('Solution', 'Volum', MainForm.Experiment.xVolum);
    MainForm.RegIniFile.WriteFloat('Solution', 'Mass',  MainForm.Experiment.Mass);

    NewExpForm.ModalResult:=mrOk;
end;

procedure TNewExpForm.FormCreate(Sender: TObject);
begin
  RzButtonEdit1.Text:=MainForm.DBDir + FormatDateTime('dd.mm.yyyy h-nn-ss', Now) + '.atd';
  SaveDialog1.FileName:=ExtractFileName(RzButtonEdit1.Text);
  NotesMemo.Text:='Эксперемент от ' + DateTimeToStr(Now);

  QuantumM1Edit.Value :=MainForm.Experiment.Mass;
  RzSpinEdit1.Value   :=MainForm.Experiment.xVolum;
  RzSpinEdit2.Value   :=MainForm.Experiment.xDay;
end;

end.
