unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, RzStatus, RzButton, RzPanel, MainSysUtils,
  AdvReflectionLabel, JclSysInfo, JclWin32, RzLine, SQLiteTable3, RzLabel,
  AdvReflectionImage;

type
  TAboutForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    AdvReflectionLabel1: TAdvReflectionLabel;
    RzStatusPane1: TRzStatusPane;
    RzBitBtn1: TRzBitBtn;
    RzStatusPane2: TRzStatusPane;
    RzLine1: TRzLine;
    lblWindowsVersion: TLabel;
    Label4: TLabel;
    lblMemory: TLabel;
    Label1: TLabel;
    RzLine2: TRzLine;
    RzBitBtn2: TRzBitBtn;
    RzURLLabel1: TRzURLLabel;
    AdvReflectionImage1: TAdvReflectionImage;
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure AdvReflectionLabel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

implementation

uses Main;

{$R *.dfm}

procedure TAboutForm.AdvReflectionLabel1Click(Sender: TObject);
begin
  //ShowMessage(FloatToStr(System.CompilerVersion));
end;

procedure TAboutForm.FormCreate(Sender: TObject);
begin
  RzStatusPane1.Caption:=AnsiString(xGetFileVersion(Application.ExeName));
  RzStatusPane2.Caption:=FormatDateTime('dddddd tt', GetBuildTime);
end;

procedure TAboutForm.RzBitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TAboutForm.RzBitBtn2Click(Sender: TObject);
var
  db  : TSQLiteDatabase;
  A, B, C, D   : integer;
begin
  Showmessage(ExtractFileName(Application.ExeName) +
              ' : ' + xGetFileVersionEx(Application.ExeName, A, B, C, D) +
              #13#10 +
              'sqlite3.dll : ' +
              db.version + #13#10 +
              '7za.dll : ' +
              xGetFileVersionEx('7za.dll', A, B, C, D));
end;

procedure TAboutForm.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if Msg.CharCode = 13 then
    RzBitBtn1.Click;
  if Msg.CharCode = 27 then
      Close;
end;

procedure TAboutForm.FormShow(Sender: TObject);
{$IFDEF MSWINDOWS}
var
  VersionInfo: TOSVersionInfoEx;
{$ENDIF MSWINDOWS}
begin
  {$IFDEF MSWINDOWS}
  FillChar(VersionInfo, SizeOf(TOSVersionInfoEx), 0);
  VersionInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfoEx);
  JclWin32.GetVersionEx(VersionInfo);
  if VersionInfo.wServicePackMajor = 0 then
    lblWindowsVersion.Caption := Format('%s (Build %u)',
      [GetWindowsVersionString, VersionInfo.dwBuildNumber])
  else
    lblWindowsVersion.Caption := Format('%s (Build %u: %s)',
      [GetWindowsVersionString, VersionInfo.dwBuildNumber, GetWindowsServicePackVersionString]);
  {$ENDIF MSWINDOWS}
  {$IFDEF UNIX}
  lblWindowsVersion.Caption := GetOSVersionString;
  Label4.Caption := 'Memory Available to OS:';
  {$ENDIF UNIX}
  lblMemory.Caption := Format('%u KB', [GetTotalPhysicalMemory div 1024]);
end;

end.
