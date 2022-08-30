unit MainConst;

interface

const
  InpBuf                              = 122880;
  AvrLh                               = 34;
  AvrLhT                              = 34;
  TimeWrite                           = 10000;
  ItemID                              = 115;

  Item75T                             = 146;
  Item50T                             = 147;
  Item25T                             = 148;
  Item0T                              = 149;

  FInitialDelay                       = 400;
  FDelay                              = 100;
  HardwID                             = 'Vid_04d8&Pid_756a';
  HardwVID                            = 1240;
  HardwPID                            = 30058;
  GUID_DEVINTERFACE_USB_DEVICE: TGUID = '{A5DCBF10-6530-11D2-901F-00C04FB951ED}';
  DBT_DEVICEARRIVAL                   = $8000;
  DBT_DEVICEREMOVECOMPLETE            = $8004;
  DBT_DEVTYP_DEVICEINTERFACE          = $00000005;
  USBDeviceNameMask                   = '\\?\USB#Vid_%x&Pid_%x#%s#%s';

  Sol0                                = 0.1;
  Sol1                                = 0.3;
  Sol2                                = 1;
  Sol3                                = 3;
  Sol4                                = 10;
  Sol5                                = 30;
  Sol6                                = 100;
  Sol7                                = 300;

  TS : Array[0..25] of String = ('A', 'B', 'C', 'D',
                                 'E', 'F', 'G', 'H',
                                 'I', 'J', 'K', 'L',
                                 'M', 'N', 'O', 'P',
                                 'Q', 'R', 'S', 'T',
                                 'U', 'V', 'W', 'X',
                                 'Y', 'Z');

  Phonemes : array[1..49] of String = (
    '-', '!', '&', ',', '.', '?', '_',
    '1', '2', 'aa', 'ae', 'ah', 'ao', 'aw',
    'ax', 'ay', 'b', 'ch', 'd', 'dh', 'eh',
    'er', 'ey', 'f', 'g', 'h', 'ih', 'iy',
    'jh', 'k', 'l', 'm', 'n', 'ng', 'ow',
    'oy', 'p', 'r', 's', 'sh', 't', 'th',
    'uh', 'uw', 'v', 'w', 'y', 'z', 'zh'
  );

implementation

end.
