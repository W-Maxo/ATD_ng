unit xType;

interface

uses
  Windows, SysUtils, Classes;

type
  TKvb = Array[0..7] of Double;

  xData = record
    Time, Data                : Double;
  end;

  xCrr = record
    Arr   : Array of xData;
    DifK  : Double;
    DifB  : Double;
    Cn    : Integer;
    Done  : Boolean;
  end;

  BuffData = record
    Data  : Array of xData;
    Count : Integer;
  end;

  iData = record
    Time, Data, DataI         : Double;
  end;

  xHardw = record
    Major,
    Build : integer;
  end;

  TiData = array of iData;

  TTask = class(TComponent)
  private
    Fs1                       : String;
  published
    property Script: String read Fs1 write Fs1;
  end;

  TTaskEx = record
    TaskList  : TStringList;
    TimeList  : TStringList;
  end;

  pData = record
    Data                      : Array of xData;
    Processed                 : boolean;
    StartEvent, EndEvent      : Double;
    Dif                       : xData;
  end;

  PDevBroadcastHdr  = ^DEV_BROADCAST_HDR;
  DEV_BROADCAST_HDR = packed record
    dbch_size: DWORD;
    dbch_devicetype: DWORD;
    dbch_reserved: DWORD;
  end;

  PDevBroadcastDeviceInterface  = ^DEV_BROADCAST_DEVICEINTERFACE;
  DEV_BROADCAST_DEVICEINTERFACE = record
    dbcc_size: DWORD;
    dbcc_devicetype: DWORD;
    dbcc_reserved: DWORD;
    dbcc_classguid: TGUID;
    dbcc_name: short;
  end;

  SettingsF = record
    VolumPerTurnM1            : Double;
    VolumPerTurnM2            : Double;
    CountStepsPerTurnM1       : integer;
    IntervalBetweenStepsM1    : integer;
    CountStepsPerTurnM2       : integer;
    IntervalBetweenStepsM2    : integer;
    VoiceEngine               : String;
    PortDev                   : string;
    VolumPerStA               : Double;
    VolumPerStB               : Double;
  end;

implementation

end.
