unit Archiving;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, StdCtrls, RzLstBox, RzChkLst, Mask, RzEdit,
  RzBtnEdt, RzStatus, RzButton, SevenZipVCL, RzLabel, RzShellDialogs;

type
  TArchivingForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzCheckList1: TRzCheckList;
    RzButtonEdit1: TRzButtonEdit;
    RzProgressStatus1: TRzProgressStatus;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    RzProgressStatus2: TRzProgressStatus;
    RzEdit1: TRzEdit;
    Пароль: TRzLabel;
    RzSelectFolderDialog1: TRzSelectFolderDialog;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure SevenZip1Progress(Sender: TObject; Filename: WideString; FilePosArc, FilePosFile: Int64);
    procedure SevenZip1PreProgress(Sender: TObject; MaxProgress: Int64);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzButtonEdit1ButtonClick(Sender: TObject);
    procedure RzButtonEdit1Change(Sender: TObject);
  private
    SevenZip1: TSevenZip;
  public
    MaxprogressEx : Int64;
  end;

var
  ArchivingForm: TArchivingForm;

implementation

uses Main;

{$R *.dfm}

procedure TArchivingForm.SevenZip1PreProgress(Sender: TObject; MaxProgress: Int64);
begin
//set max progess (if wanted)
 if Maxprogress > 0 then MaxprogressEx := Maxprogress div 100;
end;

procedure TArchivingForm.SevenZip1Progress(Sender: TObject; Filename: WideString;
  FilePosArc, FilePosFile: Int64);
begin
//set progress during extraction

//progress of all files
 //progressbar1.Position := fileposArc;

//progress of current file
 RzProgressStatus1.Percent:= fileposfile div MaxprogressEx;
 application.ProcessMessages;
end;

procedure TArchivingForm.FormCreate(Sender: TObject);
begin
  SevenZip1:=TSevenZip.Create(Application);
  SevenZip1.OnProgress:=SevenZip1Progress;
  SevenZip1.OnPreProgress:=SevenZip1PreProgress;

  RzButtonEdit1.Text:=MainForm.DBDir;
end;

procedure TArchivingForm.RzBitBtn1Click(Sender: TObject);
begin
  RzCheckList1.UncheckAll;
end;

procedure TArchivingForm.RzBitBtn2Click(Sender: TObject);
begin
  RzCheckList1.CheckAll;
end;

{function StringToWideString(const s: AnsiString; codePage: Word): WideString;
var
  l: integer;
begin
  if s = '' then
    Result := ''
else
  begin
    l := MultiByteToWideChar(codePage, MB_PRECOMPOSED, PChar(@s[1]), -1, nil,
      0);
    SetLength(Result, l - 1);
    if l > 1 then
      MultiByteToWideChar(CodePage, MB_PRECOMPOSED, PChar(@s[1]),
        -1, PWideChar(@Result[1]), l - 1);
  end;
end;}

procedure TArchivingForm.RzBitBtn3Click(Sender: TObject);
var
  i         : integer;
  ChCount   : integer;
  ChCountX  : integer;
begin
  if RzBitBtn3.ImageIndex = 83 then
      begin
        ChCount:=RzCheckList1.ItemsChecked;
        ChCountX:=0;

        RzBitBtn3.ImageIndex:=84;
        RzBitBtn3.Caption:='Прервать';


        while RzCheckList1.ItemsChecked <> 0 do
          for I := 0 to RzCheckList1.Count - 1 do
            begin
              if RzCheckList1.ItemChecked[i] then
                  begin
                    sevenzip1.ExtrBaseDir:=RzButtonEdit1.Text;

                    sevenzip1.AddRootDir :=RzButtonEdit1.Text;

                    sevenzip1.SZFileName := ChangeFileExt(WideString(RzButtonEdit1.Text + RzCheckList1.items[i]), '.7z');

                    sevenzip1.VolumeSize :=0;

                    If RzEdit1.Text <> '' then Sevenzip1.Password := RzEdit1.Text;

                    sevenzip1.Files.Clear;
                    sevenzip1.Files.AddString(Widestring(RzButtonEdit1.Text + RzCheckList1.items[i]));

                    sevenzip1.LZMACompressType:=LZMA;
                    sevenzip1.LZMACompressStrength:=ULTRA;

                    Sevenzip1.Add;

                    if Sevenzip1.Extract(True) = - 1 then
                        begin
                          if DeleteFile(sevenzip1.Files.WStrings[0]) then
                              RzCheckList1.Delete(RzCheckList1.IndexOf(ExtractFileName(sevenzip1.Files.WStrings[0])));
                        end;

                    inc(ChCountX);

                    RzProgressStatus2.Percent:=Trunc((ChCountX / ChCount) * 100);

                    Break;
                 end;
            end;
        RzProgressStatus1.Percent:=100;
        RzProgressStatus2.Percent:=100;
        RzBitBtn3.ImageIndex:=83;
        RzBitBtn3.Caption:='Архивирование';
      end
    else
      begin
        sevenzip1.Cancel;
        RzBitBtn3.ImageIndex:=83;
        RzBitBtn3.Caption:='Архивирование';
      end;
end;

procedure TArchivingForm.RzButtonEdit1ButtonClick(Sender: TObject);
begin
  if RzSelectFolderDialog1.Execute then
      RzButtonEdit1.Text:=RzSelectFolderDialog1.SelectedPathName;
end;

procedure TArchivingForm.RzButtonEdit1Change(Sender: TObject);
var
  sr      : TSearchRec;
  Result  : word;
begin
  Result := FindFirst(RzButtonEdit1.Text + '\*.atd', faAnyFile, sr);

  RzCheckList1.Items.BeginUpdate;
  RzCheckList1.Clear;

  While Result = 0 do
    Begin
      if ExtractFileExt(SR.Name) = '.atd' then
          RzCheckList1.Items.Add(sr.name);
      Result:=FindNext(sr);
    End;
  RzCheckList1.Items.EndUpdate;
end;

end.
