unit ViewTask;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLstBox, RzForms, JvComponentBase, JvFormMagnet;

type
  TViewTaskForm = class(TForm)
    RzListBox2: TRzListBox;
    RzFormState1: TRzFormState;
    JvFormMagnet1: TJvFormMagnet;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LoadList(Sender: TObject);
  end;

var
  ViewTaskForm: TViewTaskForm;

implementation

uses Main;

{$R *.dfm}

procedure TViewTaskForm.FormCreate(Sender: TObject);
begin
  LoadList(Sender);
end;

procedure TViewTaskForm.LoadList(Sender: TObject);
var
  TmpStr : String;
  i      : integer;
begin
  RzListBox2.Items.BeginUpdate;
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
  RzListBox2.Items.EndUpdate;
end;

end.
