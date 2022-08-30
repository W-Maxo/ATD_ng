unit MainSysUtils;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Dialogs, SQLiteTable3,
  SHFolder, ShlObj, xType;

  function SetOnFlash (Wd:HWND):Boolean;
  function xStrToBool(BoolStr : String) : boolean;
  function GetFileSize(filename:string): Integer;
  function GetFreeSpace(Disk : String) : Int64;
  function COMPortCreateHandle(FPort : string): boolean;
  function xGetFileVersion(FileName : String) : AnsiString;
  function IsRun(id : String) : Boolean;
  function ColorToHtml(DColor : TColor) : string;
  function GetBuildTime: TDateTime;
  function ParseDeviceName(Mask,Text:string;Params:array of Pointer):Boolean;
  function GetDBDiscrT(DBFile : AnsiString) : AnsiString;
  function RandomColor : TColor;
  function xGetFileVersionEx(FileName : String; var Major1, Major2, Minor1, Minor2 : Integer) : AnsiString;
  procedure xEnumComPorts(var Ports: TStringList);
  procedure ShutdownComputer;
  function GetMyDocDir : String;
  function GetAppDataDir : String;
  function GetMyTimeIndex(Value : Double; var xArray : Array of iData) : Integer;

implementation

function GetMyTimeIndex(Value : Double; var xArray : Array of iData) : Integer;
var
  i   : Integer;
  Lng : Integer;
begin
  Result:=-1;

  Lng:=Length(xArray);

  for i := 0 to Lng - 1 do
    begin
      if Value <= xArray[i].Time then
        begin
          Result:=i;
          Break;
        end;
    end;
end;

function GetMyDocDir : String;
var
  s:  string;
begin
  SetLength(s, MAX_PATH);
  if not SHGetSpecialFolderPath(0, PChar(s), CSIDL_PERSONAL, true)
      then s := '';
  result := PChar(s);
end;

function GetAppDataDir : String;
var
  s:  string;
begin
  SetLength(s, MAX_PATH);
  if not SHGetSpecialFolderPath(0, PChar(s), CSIDL_APPDATA, True)
      then s := '';
  result := PChar(s);
end;

function RandomColor : TColor;
begin
  Randomize;
  Result:=RGB(Random(256), Random(256), Random(256));
end;

function GetDBDiscrT(DBFile : AnsiString) : AnsiString;
var
  sl3db : TSQLiteDatabase;
  sl3tb : TSQLIteTable;
begin
  sl3db := TSQLiteDatabase.Create(DBFile);

  try
    sl3tb := sl3db.GetTable('SELECT * FROM Discr');
    sl3tb.MoveFirst;
    if sl3tb.Count > 0 then
        begin
          //DataCreatedDB:=sl3tb.FieldAsDouble(sl3tb.FieldIndex['DateTime']);
          Result:=AnsiString(sl3tb.FieldAsBlobText(sl3tb.FieldIndex['Notes']));
        end;
  finally
    sl3db.Free;
  end;
end;

procedure ShutdownComputer;
var
  ph:THandle;
  tp,prevst:TTokenPrivileges;
  rl:DWORD;
begin
  OpenProcessToken(GetCurrentProcess,TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY,ph);
  LookupPrivilegeValue(Nil,'SeShutdownPrivilege',tp.Privileges[0].Luid);
  tp.PrivilegeCount:=1;
  tp.Privileges[0].Attributes:=2;
  AdjustTokenPrivileges(ph,FALSE,tp,SizeOf(prevst),prevst,rl);
  ExitWindowsEx(EWX_SHUTDOWN or EWX_POWEROFF,0);
end;

function ParseDeviceName(Mask,Text:string;Params:array of Pointer):Boolean;
var
  PText,PMask,First:PChar;
  V,Index:Integer;
  Token:Boolean;
  Ch:Char;
begin
  Result:=False;
  Text:=Trim(Text);
  if (Text='')or(Mask='') then Exit;
  PText:=PChar(Text);
  PMask:=PChar(Mask);

  Token:=False;
  Index:=0;
  while PMask^<>#0 do begin
    if Token then begin
      Token:=False;
      case UpCase(PMask^) of
        'X':begin
            if not(PText^in ['0'..'9','a'..'f','A'..'F']) then Exit;
            V:=0;
            repeat
              case PText^ of
                '0'..'9':V:=V*16+Ord(PText^)-Ord('0');
                'a'..'f':V:=V*16+Ord(PText^)-Ord('a')+10;
                'A'..'F':V:=V*16+Ord(PText^)-Ord('A')+10;
              else
                Break;
              end;
              if V>MaxWord then Exit;
              Inc(PText);
            until False;
            if Index>High(Params) then Exit;
            PWord(Params[Index])^:=V;
            Inc(Index);
          end;
        'S':begin
            First:=PText;
            Ch:=UpCase(PMask[1]);
            while (PText^<>#0)and(UpCase(PText^)<>Ch) do
              Inc(PText);
            if Index>High(Params) then Exit;
            SetString(PString(Params[Index])^,First,PText-First);
            Inc(Index);
          end;
        '%':begin
            if PText^<>'%' then Exit;
            Inc(PText);
          end;
      else
        Exit;
      end
    end
    else
      if PMask^='%' then
        Token:=True
      else
        if UpCase(PMask^)<>UpCase(PText^) then
          Exit
        else
          Inc(PText);
    Inc(PMask)
  end;
  Result:=True;
end;

procedure xEnumComPorts(var Ports: TStringList);
var
  KeyHandle: HKEY;
  ErrCode, Index: Integer;
  ValueName, Data: string;
  ValueLen, DataLen, ValueType: DWORD;
  TmpPorts: TStringList;
begin
  ErrCode := RegOpenKeyEx(
    HKEY_LOCAL_MACHINE,
    'HARDWARE\DEVICEMAP\SERIALCOMM',
    0,
    KEY_READ,
    KeyHandle);

  if ErrCode <> ERROR_SUCCESS then Exit;

  TmpPorts := TStringList.Create;
  try
    Index := 0;
    repeat
      ValueLen := 256;
      DataLen := 256;
      SetLength(ValueName, ValueLen);
      SetLength(Data, DataLen);
      ErrCode := RegEnumValue(
        KeyHandle,
        Index,
        PChar(ValueName),
{$IFDEF DELPHI_4_OR_HIGHER}
        Cardinal(ValueLen),
{$ELSE}
        ValueLen,
{$ENDIF}
        nil,
        @ValueType,
        PByte(PChar(Data)),
        @DataLen);

      if ErrCode = ERROR_SUCCESS then
      begin
        SetLength(Data, DataLen);
        TmpPorts.Add(Data);
        Inc(Index);
      end
      else
        if ErrCode <> ERROR_NO_MORE_ITEMS then Exit;

    until (ErrCode <> ERROR_SUCCESS) ;

    TmpPorts.Sort;
    Ports.Assign(TmpPorts);
  finally
    RegCloseKey(KeyHandle);
    TmpPorts.Free;
  end;
end;

function IsRun(id : String) : Boolean;
var
  Mutex  : integer;
begin
  Result := False;
  Mutex := CreateMutex(nil , True, PChar(id));
  if GetLastError <> 0 then
  begin
    CloseHandle(Mutex);
    Result := True;
  end;
end;

function SetOnFlash (Wd:HWND):Boolean;
var
  f: TFlashWInfo;
begin
  f.Hwnd:=Wd;
  f.dwFlags:= FLASHW_CAPTION;//FLASHW_ALL;
  f.dwTimeout:=0;
  f.uCount:=1;
  f.cbSize:=SizeOf(F);
  FlashWindowEx(F);
  Result:=True;
end;

function GetFileSize(filename:string): Integer;
var
  f:file of byte;
  fs: TFileStream;
begin
  Result := 0;
  AssignFile(f,filename);
  {$i-}
  Reset(f);
  {$i+}
  if IOResult = 0 then
  begin
    Result := FileSize(f);
    Closefile(f);
  end;
  if Result = 0 then
  begin
    fs := TFileStream.Create(fileName, fmOpenRead or fmShareDenyNone);
    try
      Result := fs.size;
    finally
      fs.free;
    end;
  end;
end;

function xStrToBool(BoolStr : String) : boolean;
begin
  if BoolStr = '1' then Result:=True
    else Result:=False;
end;

function GetFreeSpace(Disk : String) : Int64;
var
  TotalBytes     : Int64;
  TotalFreeBytes : PLargeInteger;
  FreeBytesCall  : Int64;
begin
  New(TotalFreeBytes);
  try
    GetDiskFreeSpaceEx(PChar(Disk), FreeBytesCall, TotalBytes, TotalFreeBytes);;
    Result := TotalFreeBytes^;
  finally
    Dispose(TotalFreeBytes);
  end;
end;

function COMPortCreateHandle(FPort : string): boolean;
var
  FHandle : THandle;
  dev     : string;
begin
  dev :='\\.\' + FPort;

  FHandle := CreateFile(
    PChar(dev),
    {GENERIC_READ or }GENERIC_WRITE,
    0,
    nil,
    OPEN_EXISTING,
    FILE_FLAG_OVERLAPPED,
    0);

  if FHandle <> INVALID_HANDLE_VALUE then
      Result:=True
    else
      Result:=False;
  CloseHandle(FHandle);
end;

function xGetFileVersion(FileName : String) : AnsiString;
var
  Data : Pointer;
  DataSize, InfoSize : Dword;
  Dummy : Cardinal;
  Major1, Major2, Minor1, Minor2 : Integer;
  FileInfo : PVSFixedFileInfo;
begin
  DataSize := GetFileVersionInfoSize(PChar(FileName + #0), Dummy);
  if DataSize > 0 then
  begin
    GetMem(Data, DataSize);
    GetFileVersionInfo(PChar(FileName + #0), 0, DataSize, Data);
    VerQueryValue(Data, '\', Pointer(FileInfo), InfoSize);
    Major1 := FileInfo.dwFileVersionMS shr 16;
    Major2 := FileInfo.dwFileVersionMS and $FFFF;
    Minor1 := FileInfo.dwFileVersionLS shr 16;
    Minor2 := FileInfo.dwFileVersionLS and $FFFF;
    Result := AnsiString(IntToStr(Major1) + '.' + IntToStr(Major2) + '.' + IntToStr(Minor1) + ' build ' + IntToStr(Minor2));
    FreeMem(Data, DataSize);
  end;
end;

function xGetFileVersionEx(FileName : String; var Major1, Major2, Minor1, Minor2 : Integer) : AnsiString;
var
  Data : Pointer;
  DataSize, InfoSize : Dword;
  Dummy : Cardinal;
  FileInfo : PVSFixedFileInfo;
begin
  //StrCat(Buffer, PChar(FileName));
  DataSize := GetFileVersionInfoSize(PChar(FileName + #0), Dummy);
  if DataSize > 0 then
  begin
    GetMem(Data, DataSize);
    GetFileVersionInfo(PChar(FileName + #0), 0, DataSize, Data);
    VerQueryValue(Data, '\', Pointer(FileInfo), InfoSize);
    Major1 := FileInfo.dwFileVersionMS shr 16;
    Major2 := FileInfo.dwFileVersionMS and $FFFF;
    Minor1 := FileInfo.dwFileVersionLS shr 16;
    Minor2 := FileInfo.dwFileVersionLS and $FFFF;
    Result := AnsiString(IntToStr(Major1) + '.' + IntToStr(Major2) + '.' + IntToStr(Minor1) + '.' + IntToStr(Minor2));
    FreeMem(Data, DataSize);
  end;
end;

function ColorToHtml(DColor : TColor) : string;
var
  tmpRGB : TColorRef;
begin
  tmpRGB := ColorToRGB(DColor) ;
  Result:=Format('#%.2x%.2x%.2x',
                   [GetRValue(tmpRGB),
                    GetGValue(tmpRGB),
                    GetBValue(tmpRGB)]) ;
  end;

{procedure delElem( var A:TRectArray; Index:integer );
var Last : integer;
begin
   Last:= high( A );
   if Index <  Last then move( A[Index+1], A[ Index ],
       (Last-Index) * sizeof( A[Index] )  );
   setLength( A, Last );
end;

procedure addElem( var A: TRectArray; Index: integer;
                                       ANew: TRect );
var Len : integer;
begin
   Len:= Length( A );
   if Index > = Len then Index := Len+1;
   setLength( A, Len+1);
   move( A[Index], A[ Index+1 ],
         (Len-Index) * sizeof( A[Index] ));
   A[Index] := ANew;
end; }

function GetBuildTime: TDateTime;
type
 UShort = Word;
 TImageDosHeader = packed record
    e_magic: UShort;                            // магическое число
    e_cblp: UShort;                             // количество байт на последней странице файла
    e_cp: UShort;                               // количество страниц вфайле
    e_crlc: UShort;                             // Relocations
    e_cparhdr: UShort;                          // размер заголовка в параграфах
    e_minalloc: UShort;                         // Minimum extra paragraphsneeded
    e_maxalloc: UShort;                         // Maximum extra paragraphsneeded
    e_ss: UShort;                               // начальное( относительное ) значение регистра SS
    e_sp: UShort;                               // начальное значениерегистра SP
    e_csum: UShort;                             // контрольная сумма
    e_ip: UShort;                               // начальное значение регистра IP
    e_cs: UShort;                               // начальное( относительное ) значение регистра CS
    e_lfarlc: UShort;                           // адрес в файле на таблицу переадресации
    e_ovno: UShort;                             // количество оверлеев
    e_res: array[0..3] of UShort;               // Зарезервировано
    e_oemid: UShort;                            // OEM identifier (for e_oeminfo)
    e_oeminfo: UShort;                          // OEM information; e_oemid specific
    e_res2: array [0..9] of UShort;             // Зарезервировано
    e_lfanew: LongInt;                          // адрес в файле нового .exeзаголовка
  end;

 TImageResourceDirectory = packed record
    Characteristics: DWord;
    TimeDateStamp: DWord;
    MajorVersion: Word;
    MinorVersion: Word;
    NumberOfNamedEntries: Word;
    NumberOfIdEntries: Word;
//  IMAGE_RESOURCE_DIRECTORY_ENTRY DirectoryEntries[];
  end;
  PImageResourceDirectory = ^TImageResourceDirectory;

var
  hExeFile: HFile;
  ImageDosHeader: TImageDosHeader;
  Signature: Cardinal;
  ImageFileHeader: TImageFileHeader;
  ImageOptionalHeader: TImageOptionalHeader;
  ImageSectionHeader: TImageSectionHeader;
  ImageResourceDirectory: TImageResourceDirectory;
  Temp: Cardinal;
  i: Integer;
begin
  hExeFile:=CreateFile(PChar(ParamStr(0)), GENERIC_READ, FILE_SHARE_READ,nil, OPEN_EXISTING, 0, 0);
  try
    ReadFile(hExeFile, ImageDosHeader, SizeOf(ImageDosHeader), Temp, nil);
    SetFilePointer(hExeFile, ImageDosHeader.e_lfanew, nil, FILE_BEGIN);
    ReadFile(hExeFile, Signature, SizeOf(Signature), Temp, nil);
    ReadFile(hExeFile, ImageFileHeader, SizeOf(ImageFileHeader), Temp, nil);
    ReadFile(hExeFile, ImageOptionalHeader, SizeOf(ImageOptionalHeader), Temp, nil);
    for i:=0 to ImageFileHeader.NumberOfSections-1 do
    begin
      ReadFile(hExeFile, ImageSectionHeader, SizeOf(ImageSectionHeader), Temp, nil);
      if StrComp(@ImageSectionHeader.Name, '.rsrc')=0 then Break;
    end;
    SetFilePointer(hExeFile, ImageSectionHeader.PointerToRawData, nil, FILE_BEGIN);
    ReadFile(hExeFile, ImageResourceDirectory, SizeOf(ImageResourceDirectory), Temp, nil);
  finally
    FileClose(hExeFile);
  end;

  Result:=FileDateToDateTime(ImageResourceDirectory.TimeDateStamp);
end;

end.
