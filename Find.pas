unit Find;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzForms, RzButton, StdCtrls, RzLstBox, RzStatus, JvComponentBase,
  JvThread, ExtCtrls, RzPanel, RzCmboBx, RzShellCtrls, ComCtrls, RzTreeVw,
  RzListVw, RzShellDialogs, Mask, RzEdit, RzBtnEdt, MainSysUtils, RzLabel,
  RzRadChk, AdvWiiProgressBar;

type
  TMainFindForm = class(TForm)
    RzFormState1: TRzFormState;
    JvThread1: TJvThread;
    Timer1: TTimer;
    RzSelectFolderDialog1: TRzSelectFolderDialog;
    RzGroupBox1: TRzGroupBox;
    RzStatusPane1: TRzStatusPane;
    RzListBox1: TRzListBox;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzGroupBox2: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzButtonEdit1: TRzButtonEdit;
    RzEdit1: TRzEdit;
    RzCheckBox1: TRzCheckBox;
    RzCheckBox2: TRzCheckBox;
    RzDateTimeEdit1: TRzDateTimeEdit;
    RzDateTimeEdit2: TRzDateTimeEdit;
    RzLabel3: TRzLabel;
    AdvWiiProgressBar1: TAdvWiiProgressBar;
    procedure JvThread1Execute(Sender: TObject; Params: Pointer);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure JvThread1Finish(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzButtonEdit1ButtonClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    { Private declarations }
  public
    xTerminated : boolean;
    CDir        : string;
    procedure FindFile(Dir:String);
  end;

var
  MainFindForm: TMainFindForm;

implementation

uses Main;

{$R *.dfm}

function xFind(const S, P: string): Integer;
var
  i, j: Integer;
begin
  Result := 0;
  if Length(P) > Length(S) then
    Exit;
  for i := 1 to Length(S) - Length(P) + 1 do
    for j := 1 to Length(P) do
      if P[j] <> S[i + j - 1] then
        Break
      else if j = Length(P) then
      begin
        Result := i;
        Exit;
      end;
end;

procedure TMainFindForm.FindFile(Dir:String);
Var
  SR      :TSearchRec;
  FindRes :Integer;
begin
  FindRes:=FindFirst(Dir+'*.*',faAnyFile,SR);
  While FindRes=0 do
    begin
      if ((SR.Attr and faDirectory)=faDirectory) and
      ((SR.Name='.')or(SR.Name='..')) then
         begin
            FindRes:=FindNext(SR);
            Continue;
         end;
      if ((SR.Attr and faDirectory)=faDirectory) then
         begin
            FindFile(Dir+SR.Name+'\');
            if xTerminated then
                begin
                  //JvThread1.Terminate;
                  exit;
                end;

            FindRes:=FindNext(SR);
            Continue;
         end;

      if ExtractFileExt(SR.Name) = '.atd' then
        RzListBox1.Items.Add(SR.Name + ' (' + GetDBDiscrT(Dir+SR.Name) + ')');

      CDir:=ExtractFilePath(Dir+SR.Name);

      if xTerminated then
        begin
          //JvThread1.Terminate;
          exit;
        end;

      FindRes:=FindNext(SR);
   end;
FindClose(SR);
end;

procedure TMainFindForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not JvThread1.Terminated then
      begin
        xTerminated:=True;
        JvThread1.Terminate;

        //while not JvThread1.Terminated do
          //Sleep(50);
      end;
end;

procedure TMainFindForm.FormCreate(Sender: TObject);
begin
  xTerminated:=False;
  RzButtonEdit1.Text:=MainForm.DBDir;
end;

procedure TMainFindForm.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  //if Msg.CharCode = 13 then
    //RzBitBtn2.Click;
  if Msg.CharCode = 27 then
      Close;
end;

procedure TMainFindForm.JvThread1Execute(Sender: TObject; Params: Pointer);
begin
  AdvWiiProgressBar1.Enabled:=True;
  FindFile(RzButtonEdit1.Text);

  AdvWiiProgressBar1.Enabled:=False;
  JvThread1.Terminate;
end;

procedure TMainFindForm.JvThread1Finish(Sender: TObject);
begin
  xTerminated:=False;
  RzBitBtn1.ImageIndex:=44;
  RzBitBtn1.Caption:='Поиск';
end;

procedure TMainFindForm.RzBitBtn1Click(Sender: TObject);
begin
  if RzBitBtn1.ImageIndex = 44 then
      begin
        JvThread1.Execute(nil);
        RzBitBtn1.ImageIndex:=17;
        RzBitBtn1.Caption:='Прервать';
      end
    else
      begin
        xTerminated:=True;
        JvThread1.Terminate;
        RzBitBtn1.ImageIndex:=44;
        RzBitBtn1.Caption:='Поиск';
      end
end;

procedure TMainFindForm.RzBitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TMainFindForm.RzButtonEdit1ButtonClick(Sender: TObject);
begin
  if RzSelectFolderDialog1.Execute then
      RzButtonEdit1.Text:=RzSelectFolderDialog1.SelectedPathName;
end;

procedure TMainFindForm.Timer1Timer(Sender: TObject);
var
  bm      : TBitmap;

  TmpStr  : String;

  TmpFlt  : Double;
  LengthS : integer;
  LengthA : integer;
begin
  bm := TBitmap.Create;

  bm.Canvas.Font := RzStatusPane1.Font;

  TmpFlt:= (bm.Canvas.TextWidth(CDir) + 10) / RzStatusPane1.Width;

      LengthS:=Length(CDir);
      LengthA:=Trunc(LengthS / TmpFlt - 5) div 2;

      if TmpFlt > 1 then
          begin
            TmpStr:=Copy(CDir, 0, LengthA) + ' ... ' +

            Copy(CDir, LengthS - LengthA, LengthA);


            RzStatusPane1.Caption:=TmpStr;
          end
        else
          RzStatusPane1.Caption:=CDir;

  bm.Free;
end;

end.
