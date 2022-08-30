unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, RzCommon, ExtCtrls, RzPanel, RzSplit, RzForms, ImgList,
  TeEngine, Series, TeeProcs, Chart, RzButton, RzStatus, AdvCircularProgress,
  CPort, StdCtrls, Mask, RzEdit, RzSpnEdt, MainConst, Registry,
  JvScreenSaveSuppress, JvComponentBase, JvSysRequirements, AdvMenus,
  RzLaunch, JvDebugHandler, AppEvnts, AdvToolBar, AdvToolBarStylers,
  AdvMenuStylers, RzTray, IdBaseComponent, IdThreadComponent,
  TaskDialog, HTMListB, AdvProgressBar, TeeTools, SetupAPI,
  uSQLite3, SQLiteTable3, RzLstBox, RzChkLst, MainClasses,
  MainSysUtils, TeeBannerTool, ShellApi, RzSndMsg, Mapimail, TeeAntiAlias,
  JvFormMagnet, OleServer, SpeechLib_TLB, JvComputerInfoEx, DateUtils,
  TeeTranslate, TeeRussian, RzLabel, dwTaskbarComponents, dwOverlayIcon,
  xType, Utils, HTMLabel, dwProgressBar, RzRadChk, SQLite3, SHFolder, TeeEdit;

type
  TMainForm = class(TForm)
    RzStatusBar1: TRzStatusBar;
    RegIniFile: TRzRegIniFile;
    FormState: TRzFormState;
    RzSizePanel3: TRzSizePanel;
    VersionInfo: TRzVersionInfo;
    RzSplitter1: TRzSplitter;
    RzSizePanel1: TRzSizePanel;
    ImageList2: TImageList;
    ImageList3: TImageList;
    ChartPrint: TChartEditor;
    ChartA: TChart;
    SeriespH: TFastLineSeries;
    AntiAl1: TAntiAliasTool;
    FullScreenToolA: TFullScreenTool;
    ChartTool8: TAxisScrollTool;
    LockValuepH: TColorLineTool;
    ChartB: TChart;
    SeriesKCI: TFastLineSeries;
    AntiAliasTool1: TAntiAliasTool;
    FullScreenToolB: TFullScreenTool;
    AxisScrollTool1: TAxisScrollTool;
    LockValueKCI: TColorLineTool;
    VolumSplitter: TRzSplitter;
    VolumChartA: TChart;
    AntiAliasTool3: TAntiAliasTool;
    ChartTool5: TFullScreenTool;
    ChartTool7: TAxisScrollTool;
    ChartTool10: TColorLineTool;
    VolumChartB: TChart;
    AntiAliasTool2: TAntiAliasTool;
    FullScreenTool2: TFullScreenTool;
    AxisScrollTool2: TAxisScrollTool;
    ColorLineTool2: TColorLineTool;
    RzPanel5: TRzPanel;
    RigthSizePanel: TRzSizePanel;
    RzPanel2: TRzPanel;
    LeftSizePanel: TRzSizePanel;
    RzPanel1: TRzPanel;
    ReadThread: TIdThreadComponent;
    RzTrayIcon1: TRzTrayIcon;
    ExpOpenDialog: TOpenDialog;
    MainMenu: TAdvMainMenu;
    File1: TMenuItem;
    OpenItM1: TMenuItem;
    N1: TMenuItem;
    NewExp1: TMenuItem;
    N2: TMenuItem;
    Print1: TMenuItem;
    Export1: TMenuItem;
    V2: TMenuItem;
    V1: TMenuItem;
    N3: TMenuItem;
    ExitM: TMenuItem;
    N4: TMenuItem;
    ExpStart1: TMenuItem;
    N5: TMenuItem;
    ExpStop: TMenuItem;
    ools1: TMenuItem;
    Settings: TMenuItem;
    N6: TMenuItem;
    About: TMenuItem;
    AdvMenuOfficeStyler1: TAdvMenuOfficeStyler;
    AdvDockPanel1: TAdvDockPanel;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    MenuImageList: TImageList;
    DisMenuImageList: TImageList;
    N7: TMenuItem;
    ConnectDevice: TMenuItem;
    DisConnectDevice: TMenuItem;
    MainToolBar: TAdvToolBar;
    NewExpToolBarButton: TAdvToolBarButton;
    OpenExpToolBarButton: TAdvToolBarButton;
    AdvToolBarSeparator1: TAdvToolBarSeparator;
    AdvToolBarSeparator2: TAdvToolBarSeparator;
    StartExpToolBarButton: TAdvToolBarButton;
    StopExpToolBarButton: TAdvToolBarButton;
    ExitToolBarButton: TAdvToolBarButton;
    AdvToolBarSeparator6: TAdvToolBarSeparator;
    SettingsToolBarButton: TAdvToolBarButton;
    AdvToolBarSeparator5: TAdvToolBarSeparator;
    DisconnectToolBarButton: TAdvToolBarButton;
    ConnectToolBarButton: TAdvToolBarButton;
    InfoExpToolBarButton: TAdvToolBarButton;
    AdvToolBarSeparator3: TAdvToolBarSeparator;
    ButtonImageList: TImageList;
    N8: TMenuItem;
    InfoExp: TMenuItem;
    RzGroupBox2: TRzGroupBox;
    N9: TMenuItem;
    archiving: TMenuItem;
    RzGroupBox1: TRzGroupBox;
    AdvCircularProgress1: TAdvCircularProgress;
    AdvCircularProgress2: TAdvCircularProgress;
    M1StatusPane: TRzStatusPane;
    M2StatusPane: TRzStatusPane;
    RzStatusPane3: TRzStatusPane;
    RzStatusPane4: TRzStatusPane;
    RzStatusPane5: TRzStatusPane;
    RzStatusPane7: TRzStatusPane;
    VolumStatusPaneA: TRzStatusPane;
    VolumStatusPaneB: TRzStatusPane;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    RzEdit1: TRzEdit;
    Capt1: TAnnotationTool;
    Capt2: TAnnotationTool;
    Label7: TLabel;
    Edit1: TRzSpinEdit;
    RzClockStatus1: TRzClockStatus;
    ApplicationEvents1: TApplicationEvents;
    LogHTMListBox: THTMListBox;
    QuantumM1Edit: TRzSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    RzSpinEdit1: TRzSpinEdit;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    RzSpinButtons1: TRzSpinButtons;
    RzSpinButtons2: TRzSpinButtons;
    RzSpinButtons3: TRzSpinButtons;
    RzSpinButtons4: TRzSpinButtons;
    RzSpinButtons5: TRzSpinButtons;
    RzSpinButtons6: TRzSpinButtons;
    RzSpinButtons7: TRzSpinButtons;
    RzSpinButtons8: TRzSpinButtons;
    IntervalBetweenStepsM1Edit: TRzSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    IntervalBetweenStepsM2Edit: TRzSpinEdit;
    RzSpinEdit3: TRzSpinEdit;
    RzSpinEdit4: TRzSpinEdit;
    QuantumM2Edit: TRzSpinEdit;
    AdvToolBarButton1: TAdvToolBarButton;
    JvDebugHandler1: TJvDebugHandler;
    SendBugsR: TMenuItem;
    N11: TMenuItem;
    RzLauncher1: TRzLauncher;
    Help: TMenuItem;
    N10: TMenuItem;
    MailThread: TIdThreadComponent;
    AdvToolBarButton2: TAdvToolBarButton;
    AdvToolBarSeparator11: TAdvToolBarSeparator;
    AdvPopupMenu1: TAdvPopupMenu;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    FlowExpButton: TAdvToolBarButton;
    N15: TMenuItem;
    FlowExpM: TMenuItem;
    JvSysRequirements1: TJvSysRequirements;
    JvScreenSaveSuppressor1: TJvScreenSaveSuppressor;
    ChSolThread: TIdThreadComponent;
    RzSpinEdit6: TRzSpinEdit;
    Label11: TLabel;
    RzPanel3: TRzPanel;
    AdvToolBar2: TAdvToolBar;
    AdvToolBarButton3: TAdvToolBarButton;
    AdvToolBarSeparator12: TAdvToolBarSeparator;
    AdvToolBarButton4: TAdvToolBarButton;
    AdvToolBarButton5: TAdvToolBarButton;
    AdvToolBarButton6: TAdvToolBarButton;
    AdvToolBarSeparator13: TAdvToolBarSeparator;
    LeftScrollA: TAdvToolBarButton;
    AdvToolBarButton8: TAdvToolBarButton;
    AdvToolBarButton9: TAdvToolBarButton;
    AdvToolBarSeparator14: TAdvToolBarSeparator;
    AdvToolBarButton10: TAdvToolBarButton;
    AdvToolBarButton11: TAdvToolBarButton;
    AdvToolBarButton12: TAdvToolBarButton;
    AdvToolBarButton13: TAdvToolBarButton;
    XpHStatusPane: TRzStatusPane;
    pHStatusPane: TRzStatusPane;
    RzSpinEdit7: TRzSpinEdit;
    Label12: TLabel;
    RzPanel7: TRzPanel;
    AdvToolBar3: TAdvToolBar;
    AdvToolBarButton14: TAdvToolBarButton;
    AdvToolBarSeparator4: TAdvToolBarSeparator;
    AdvToolBarButton15: TAdvToolBarButton;
    AdvToolBarButton16: TAdvToolBarButton;
    AdvToolBarButton17: TAdvToolBarButton;
    AdvToolBarSeparator7: TAdvToolBarSeparator;
    LeftScrollB: TAdvToolBarButton;
    AdvToolBarButton19: TAdvToolBarButton;
    AdvToolBarButton20: TAdvToolBarButton;
    AdvToolBarSeparator8: TAdvToolBarSeparator;
    AdvToolBarButton21: TAdvToolBarButton;
    AdvToolBarButton22: TAdvToolBarButton;
    AdvToolBarButton23: TAdvToolBarButton;
    AdvToolBarButton24: TAdvToolBarButton;
    RzStatusPane17: TRzStatusPane;
    KCIStatusPane: TRzStatusPane;
    AdvToolBarButton25: TAdvToolBarButton;
    AdvToolBarButton26: TAdvToolBarButton;
    ChartTool3: TMarksTipTool;
    JvFormMagnet1: TJvFormMagnet;
    AdvToolBar4: TAdvToolBar;
    AdvToolBarButton18: TAdvToolBarButton;
    AdvToolBarButton27: TAdvToolBarButton;
    UndoZoomToolBarButtonA: TAdvToolBarButton;
    UndoZoomToolBarButtonB: TAdvToolBarButton;
    AdvToolBarButton33: TAdvToolBarButton;
    PGlyphStatusA: TRzStatusPane;
    VolumPaneA: TRzStatusPane;
    AdvToolBarButton7: TAdvToolBarButton;
    RzPanel4: TRzPanel;
    AdvToolBar5: TAdvToolBar;
    AdvToolBarButton29: TAdvToolBarButton;
    AdvToolBarButton30: TAdvToolBarButton;
    AdvToolBarButton32: TAdvToolBarButton;
    PGlyphStatusB: TRzStatusPane;
    VolumPaneB: TRzStatusPane;
    AdvToolBarButton34: TAdvToolBarButton;
    AdvToolBarButton35: TAdvToolBarButton;
    AdvToolBarSeparator9: TAdvToolBarSeparator;
    RzPanel6: TRzPanel;
    LockValueBitBtn: TRzBitBtn;
    ChartTool6: TMarksTipTool;
    N16: TMenuItem;
    Refuelling1Thread: TIdThreadComponent;
    Refuelling2Thread: TIdThreadComponent;
    IdThreadComponent1: TIdThreadComponent;
    JvComputerInfoEx1: TJvComputerInfoEx;
    LockValueBitBtnEx: TAdvToolBarButton;
    NLoockValue: TMenuItem;
    Timer1: TTimer;
    FlagsImageList: TImageList;
    TaskDialog: TAdvTaskDialog;
    RzGlyphStatus2: TRzGlyphStatus;
    AdvToolBarButton36: TAdvToolBarButton;
    AdvToolBarSeparator15: TAdvToolBarSeparator;
    RzStatusPane1: TRzStatusPane;
    SchedulerTimer: TTimer;
    AdvPopupMenu2: TAdvPopupMenu;
    N17: TMenuItem;
    N18: TMenuItem;
    AdvToolBarButton37: TAdvToolBarButton;
    ChartEditor1: TChartEditor;
    CustamizePopupMenu: TAdvPopupMenu;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    RzStatusPane13: TRzGlyphStatus;
    AdvToolBarSeparator10: TAdvToolBarSeparator;
    AdvToolBarSeparator16: TAdvToolBarSeparator;
    AdvToolBarButton38: TAdvToolBarButton;
    AdvToolBarButton39: TAdvToolBarButton;
    mVAS: TFastLineSeries;
    mVBS: TFastLineSeries;
    cp: TImageList;
    AdvToolBarButton40: TAdvToolBarButton;
    AdvToolBarButton41: TAdvToolBarButton;
    dwOverlayIcon1: TdwOverlayIcon;
    N23: TMenuItem;
    N24: TMenuItem;
    N110: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    RzGroupBox3: TRzGroupBox;
    Label13: TLabel;
    RzSpinEdit2: TRzSpinEdit;
    ChangeSBitBtn: TRzBitBtn;
    N28: TMenuItem;
    N29: TMenuItem;
    Button1: TButton;
    dwTaskbarProgressIndicator1: TdwTaskbarProgressIndicator;
    RzCheckBox1: TRzCheckBox;
    RzCheckBox2: TRzCheckBox;
    ComPort1: TComPort;
    ChangeViewPopupMenuA: TAdvPopupMenu;
    MenuItem1: TMenuItem;
    N30: TMenuItem;
    N210: TMenuItem;
    N31: TMenuItem;
    ChangeViewPopupMenuB: TAdvPopupMenu;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    Series5: TPointSeries;
    Series6: TPointSeries;
    N32: TMenuItem;
    AdvToolBarButton42: TAdvToolBarButton;
    ChartTool1: TMarksTipTool;
    ChartTool2: TMarksTipTool;
    AdvToolBarButton28: TAdvToolBarButton;
    AdvToolBarSeparator17: TAdvToolBarSeparator;
    AdvToolBarSeparator18: TAdvToolBarSeparator;
    AdvToolBarButton31: TAdvToolBarButton;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    R1: TMenuItem;
    F1: TMenuItem;
    RzGlyphStatus1: TRzGlyphStatus;
    AdvToolBarButton43: TAdvToolBarButton;
    AdvToolBarButton44: TAdvToolBarButton;
    G1: TMenuItem;
    Y1: TMenuItem;
    ChartExport: TChartEditor;
    CheckBox1: TCheckBox;
    DifVSeriesA: TLineSeries;
    DifVol2SeriesA: TLineSeries;
    DifVSeriesB: TLineSeries;
    DifVol2SeriesB: TLineSeries;
    VolumSeriesA: TLineSeries;
    VolumSeriesB: TLineSeries;
    AdvToolBarButton45: TAdvToolBarButton;
    RzStatusPane2: TRzStatusPane;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    TmrMenu: TAdvPopupMenu;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    RzToolButton3: TRzToolButton;
    RzToolButton4: TRzToolButton;
    RefTimer: TTimer;
    TimerInj: TTimer;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    Edit2: TEdit;
    AdvToolBar1: TAdvToolBar;
    AdvToolBarButton46: TAdvToolBarButton;
    RzStatusPane6: TRzStatusPane;
    TimerClock: TTimer;
    procedure M2StatusPaneClick(Sender: TObject);
    procedure ComPort1BeforeClose(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure ScrollAxis(TheChart : TChart; Axis:TChartAxis; Const Percent:Double);
    procedure HorizScroll(TheChart : TChart; Const Percent:Double);
    procedure VertScroll(TheChart : TChart; Const Percent:Double);
    procedure RzToolButton15Click(Sender: TObject);
    procedure RzToolButton16Click(Sender: TObject);
    procedure RzToolButton17Click(Sender: TObject);
    procedure RzToolButton23Click(Sender: TObject);
    procedure RzToolButton21Click(Sender: TObject);
    procedure RzToolButton18Click(Sender: TObject);
    procedure RzToolButton19Click(Sender: TObject);
    procedure RzToolButton20Click(Sender: TObject);
    procedure ReadThreadRun(Sender: TIdThreadComponent);
    procedure Cleaning;
    procedure OpenItM1Click(Sender: TObject);
    procedure NewExp1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure V1Click(Sender: TObject);
    procedure V2Click(Sender: TObject);
    procedure ExitMClick(Sender: TObject);
    procedure ExpStart1Click(Sender: TObject);
    procedure ExpStopClick(Sender: TObject);
    procedure SettingsClick(Sender: TObject);
    procedure AboutClick(Sender: TObject);
    procedure ConnectDeviceClick(Sender: TObject);
    procedure DisConnectDeviceClick(Sender: TObject);
    procedure NewExpToolBarButtonClick(Sender: TObject);
    procedure OpenExpToolBarButtonClick(Sender: TObject);
    procedure StartExpToolBarButtonClick(Sender: TObject);
    procedure StopExpToolBarButtonClick(Sender: TObject);
    procedure ConnectToolBarButtonClick(Sender: TObject);
    procedure DisconnectToolBarButtonClick(Sender: TObject);
    procedure SettingsToolBarButtonClick(Sender: TObject);
    procedure ExitToolBarButtonClick(Sender: TObject);
    procedure InfoExpToolBarButtonClick(Sender: TObject);
    procedure InfoExpClick(Sender: TObject);
    procedure LockValueBitBtnClick(Sender: TObject);
    procedure ApplicationEvents1Hint(Sender: TObject);
    procedure RzEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure QuantumM1EditChange(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure RzSpinButtons1DownLeftClick(Sender: TObject);
    procedure RzSpinButtons1UpRightClick(Sender: TObject);
    procedure RzSpinButtons2DownLeftClick(Sender: TObject);
    procedure RzSpinButtons2UpRightClick(Sender: TObject);
    procedure IntervalBetweenStepsM1EditChange(Sender: TObject);
    procedure RzSpinButtons7DownLeftClick(Sender: TObject);
    procedure RzSpinButtons7UpRightClick(Sender: TObject);
    procedure RzSpinButtons8DownLeftClick(Sender: TObject);
    procedure RzSpinButtons8UpRightClick(Sender: TObject);
    procedure RzSpinButtons3DownLeftClick(Sender: TObject);
    procedure RzSpinButtons3UpRightClick(Sender: TObject);
    procedure RzSpinButtons4DownLeftClick(Sender: TObject);
    procedure RzSpinButtons4UpRightClick(Sender: TObject);
    procedure RzSpinButtons5UpRightClick(Sender: TObject);
    procedure RzSpinButtons5DownLeftClick(Sender: TObject);
    procedure RzSpinButtons6DownLeftClick(Sender: TObject);
    procedure RzSpinButtons6UpRightClick(Sender: TObject);
    procedure HelpClick(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure MailThreadRun(Sender: TIdThreadComponent);
    procedure SendBugsRClick(Sender: TObject);
    procedure RzTrayIcon1RestoreApp(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure FlowExpMClick(Sender: TObject);
    procedure FlowExpButtonClick(Sender: TObject);
    procedure ChangeSBitBtnClick(Sender: TObject);
    procedure ChSolThreadRun(Sender: TIdThreadComponent);
    procedure RzRapidFireButton1Click(Sender: TObject);
    procedure AdvToolBarButton3Click(Sender: TObject);
    procedure AdvToolBarButton4Click(Sender: TObject);
    procedure AdvToolBarButton5Click(Sender: TObject);
    procedure AdvToolBarButton6Click(Sender: TObject);
    procedure LeftScrollAClick(Sender: TObject);
    procedure AdvToolBarButton8Click(Sender: TObject);
    procedure AdvToolBarButton9Click(Sender: TObject);
    procedure AdvToolBarButton11Click(Sender: TObject);
    procedure AdvToolBarButton13Click(Sender: TObject);
    procedure AdvToolBarButton12Click(Sender: TObject);
    procedure AdvToolBarButton15Click(Sender: TObject);
    procedure AdvToolBarButton16Click(Sender: TObject);
    procedure AdvToolBarButton17Click(Sender: TObject);
    procedure LeftScrollBClick(Sender: TObject);
    procedure AdvToolBarButton19Click(Sender: TObject);
    procedure AdvToolBarButton20Click(Sender: TObject);
    procedure AdvToolBarButton23Click(Sender: TObject);
    procedure LeftScrollAMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LeftScrollAMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AdvToolBarButton8MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AdvToolBarButton9MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AdvToolBarButton25Click(Sender: TObject);
    procedure AdvToolBarButton26Click(Sender: TObject);
    procedure AdvToolBarButton25MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LeftScrollBMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AdvToolBarButton19MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AdvToolBarButton20MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AdvToolBarButton26MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AdvToolBarButton8MouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AdvToolBarButton9MouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AdvToolBarButton25MouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LeftScrollBMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AdvToolBarButton19MouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AdvToolBarButton20MouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AdvToolBarButton26MouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AdvToolBarButton22Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AdvToolBarButton24Click(Sender: TObject);
    procedure AdvToolBarButton34Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure Refuelling1ThreadRun(Sender: TIdThreadComponent);
    procedure Refuelling2ThreadRun(Sender: TIdThreadComponent);
    procedure IdThreadComponent1Run(Sender: TIdThreadComponent);
    procedure Button1Click(Sender: TObject);
    procedure LockValueBitBtnExClick(Sender: TObject);
    procedure NLoockValueClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure AdvToolBarButton35Click(Sender: TObject);
    procedure SchedulerTimerTimer(Sender: TObject);
    procedure AdvToolBarButton36Click(Sender: TObject);
    procedure archivingClick(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure AdvToolBarButton14Click(Sender: TObject);
    procedure RzGlyphStatus2Click(Sender: TObject);
    procedure AdvToolBarButton37Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure ChartAResize(Sender: TObject);
    procedure ChartBResize(Sender: TObject);
    procedure VolumChartAResize(Sender: TObject);
    procedure VolumChartBResize(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure AdvToolBarButton38Click(Sender: TObject);
    procedure AdvToolBarButton39Click(Sender: TObject);
    procedure AdvToolBarButton40Click(Sender: TObject);
    procedure AdvToolBarButton41Click(Sender: TObject);
    procedure RzSpinEdit2Change(Sender: TObject);
    procedure ChartABeforeDrawChart(Sender: TObject);
    procedure ChartBBeforeDrawChart(Sender: TObject);
    procedure N110Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure RzCheckBox1Click(Sender: TObject);
    procedure RzCheckBox2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ReadThreadAfterRun(Sender: TIdThreadComponent);
    procedure N31Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N210Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure AdvToolBarButton42Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure AdvToolBarButton31Click(Sender: TObject);
    procedure AdvToolBarButton28Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure F1Click(Sender: TObject);
    procedure AdvToolBarButton43Click(Sender: TObject);
    procedure AdvToolBarButton44Click(Sender: TObject);
    procedure G1Click(Sender: TObject);
    procedure Y1Click(Sender: TObject);
    procedure VolumChartABeforeDrawChart(Sender: TObject);
    procedure VolumChartBBeforeDrawChart(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure RzGlyphStatus1Click(Sender: TObject);
    procedure OnTmrAdd(Sender: TObject; Tmr : Double);
    procedure N37Click(Sender: TObject);
    procedure AdvToolBarButton45Click(Sender: TObject);
    procedure LeftSizePanelHotSpotClick(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure RigthSizePanelHotSpotClick(Sender: TObject);
    procedure XpHStatusPaneClick(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure ChangeCheckBox;
    procedure ChartAZoom(Sender: TObject);
    procedure ChartBZoom(Sender: TObject);
    procedure ChartBUndoZoom(Sender: TObject);
    procedure ChartAUndoZoom(Sender: TObject);
    procedure VolumChartAZoom(Sender: TObject);
    procedure VolumChartAUndoZoom(Sender: TObject);
    procedure VolumChartBZoom(Sender: TObject);
    procedure VolumChartBUndoZoom(Sender: TObject);
    procedure RzToolButton1Click(Sender: TObject);
    procedure RzToolButton2Click(Sender: TObject);
    procedure RzToolButton3Click(Sender: TObject);
    procedure RzToolButton4Click(Sender: TObject);
    procedure OpenFile(xFile : String);
    procedure RefTimerTimer(Sender: TObject);
    procedure TimerInjTimer(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure MainToolBarResize(Sender: TObject);
    procedure AdvToolBarButton46Click(Sender: TObject);
    procedure TimerClockTimer(Sender: TObject);
    procedure pHStatusPaneClick(Sender: TObject);
  private
    {TeeGDIPlus1,
    TeeGDIPlus2,
    TeeGDIPlus3,
    TeeGDIPlus4               : TTeeGDIPlus;}

    Input_buffer              : string;
    DigitalInp                : byte;

    Volt_Ch_0,
    Volt_Ch_1,
    Volt_Ch_T,
    ADC_Const                 : Double;

    FRepeatTimer1,
    FRepeatTimer2,
    FRepeatTimer3,
    FRepeatTimer4,
    FRepeatTimer5,
    FRepeatTimer6,
    FRepeatTimer7,
    FRepeatTimer8             : TTimer;

    FWindowHandle             : HWND;

    InOldTime                 : Double;

    StTimerClock              : Double;

    procedure WMQueryEndSession(var Message: TWMQueryEndSession); message WM_QUERYENDSESSION;

    procedure WMCopyData (var Msg : TWMCopyData); message WM_COPYDATA;
    procedure AcceptFiles(var msg : TMessage);    message WM_DROPFILES;

    procedure WinMsg (Var Msg : TMsg; Var Handled : Boolean);

    procedure ExceptAllError(Sender : TObject; Exc : Exception);
    procedure CalculateADC(Count : Integer);

    procedure TimerExpired1(Sender: TObject);
    procedure TimerExpired2(Sender: TObject);
    procedure TimerExpired3(Sender: TObject);
    procedure TimerExpired4(Sender: TObject);
    procedure TimerExpired5(Sender: TObject);
    procedure TimerExpired6(Sender: TObject);
    procedure TimerExpired7(Sender: TObject);
    procedure TimerExpired8(Sender: TObject);

    procedure WndProc(var Msg: TMessage);
    function USBRegister: Boolean;
    procedure WMDeviceChange(var Msg: TMessage); dynamic;
    function SetupEnumAvailableComPorts:TstringList;
    procedure GetParam(var List : TStringList);

    procedure DoDeviceChange(Event:Integer; Device:PDevBroadcastDeviceInterface);
  public
    HardwareVer               : xHardw;

    //g                         : TGDIPlusCanvas;

    AppDataDir                : String;

    SafeT                     : boolean;

    ParamList                 : TStringlist;
    SpVoice                   : TSpVoice;

    ikk,
    ChSolTime,
    TempPCount                : Integer;

    AllowSpeech,
    Calb,
    ShowLineA,
    ShowLineB                 : boolean;

    State1,
    State2                    : Boolean;

    TaskList                  : TTaskEx;

    TimeEvent                 : Double;
    StrEvent                  : String;
    StrTask                   : String;

    InsideShutdown            : boolean;
    JobEvent                  : boolean;

    Config                    : SettingsF;

    SubmercibleSensorWarn     : Boolean;

    InjEmpty                  : Boolean;
    
    TmpV                      : Double;

    Cl                        : integer;

    M1Home,
    M2Home,
    M1End,
    M2End                     : boolean;
    
    DBDir                     : string;

    ExpCreated                : boolean;
    CurStatVl                 : Double;
    AppTerminated             : Boolean;
    Experiment                : TExp;
    Lost                      : Integer;

    CancelRefuelling          : Boolean;
    StTimeRefuelling          : Double;

    BtRefStA,
    BtRefStB                  : Boolean;
    StTimeBtRefA,
    StTimeBtRefB              : Double;

    OldActStInjA,
    OldActStInjB              : Boolean;

    ExpTime                   : Double;

    MFCaption                 : String;

    procedure CheckDBDir;
    procedure StopExp;
    function CheckDevice(dev : string) : boolean;
    function xSay(Word : String) : boolean;
    function ComPortWriteStr(const Str: AnsiString): Integer;
  end;

var
  MainForm: TMainForm;

implementation

uses About, Settings, NewExp, InfoExp, Calibration, FlowExp,
  Change, ServiceMenu, Refuelling, StOpenExp, Find, ViewTask, Archiving, KCal,
  CalInj, Sol, Mass, PCount, View, TeeThemes,

  //{$IFNDEF CLR}
  TeeJPEG,
  TeeGIF,
  TeePNG,
  TeePCX,
  TeePDFCanvas,
  //{$ENDIF}
  TeeSVGCanvas,
  TeePSCanvas,
  TeeVMLCanvas,
  TeExport, Temperature, TempCal;


{$R *.dfm}

procedure TMainForm.WMCopyData(var Msg: TWMCopyData);
var
  sText: array[0..99] of Char;
begin
  StrLCopy(sText, Msg.CopyDataStruct.lpData, Msg.CopyDataStruct.cbData);

  if not Experiment.StartExp then
      OpenFile(sText);
end;

procedure TMainForm.AcceptFiles(var msg : TMessage);
const
  cnMaxFileNameLen = 255;
var
  i,
  nCount     : integer;
  acFileName : array [0..cnMaxFileNameLen] of char;
begin
  nCount := DragQueryFile(msg.WParam,
                          $FFFFFFFF,
                          acFileName,
                          cnMaxFileNameLen);
  for i := 0 to nCount - 1 do
    begin
      DragQueryFile(msg.WParam, i,
                    acFileName,
                    cnMaxFileNameLen );

      if LowerCase(ExtractFileExt(acFileName)) = '.atd' then
          begin
            if not Experiment.StartExp then
                OpenFile(acFileName);
            Break;
          end;
    end;
  DragFinish(msg.WParam);
end;

function TMainForm.SetupEnumAvailableComPorts : TstringList;
var 
  RequiredSize              : Cardinal;
  Guid                      : TGUID;
  DevInfoHandle             : HDEVINFO;
  DeviceInfoData            : TSPDevInfoData;
  MemberIndex               : Cardinal;
  PropertyRegDataType       : DWord;
  RegProperty               : Cardinal;
  RegTyp                    : Cardinal;
  Key                       : Hkey;
  Info                      : TRegKeyInfo;
  S1,S2                     : string;
begin 
  Result:=Nil;
  if not LoadsetupAPI then exit; 
    try
      if SetupDiClassGuidsFromName('Ports',@Guid,RequiredSize,RequiredSize) then
          begin
            DevInfoHandle:=SetupDiGetClassDevs(@Guid,Nil,0,DIGCF_PRESENT);
            if Cardinal(DevInfoHandle)<>Invalid_Handle_Value then begin
              try
                MemberIndex:=0;
                result:=TStringList.Create;                    

                repeat
                  FillChar(DeviceInfoData,SizeOf(DeviceInfoData),0);
                  DeviceInfoData.cbSize:=SizeOf(DeviceInfoData);

                  if not SetupDiEnumDeviceInfo(DevInfoHandle,MemberIndex,
                      DeviceInfoData) then break;

                  RegProperty:=SPDRP_FriendlyName;
                  SetupDiGetDeviceRegistryProperty(DevInfoHandle,
                                              DeviceInfoData,
                                              RegProperty,
                                              PropertyRegDataType,
                                              NIL,
                                              0,
                                              RequiredSize);
                  SetLength(S1,RequiredSize);
                  if SetupDiGetDeviceRegistryProperty(DevInfoHandle,
                                              DeviceInfoData,
                                              RegProperty,
                                              PropertyRegDataType,
                                              @S1[1],
                                              RequiredSize,
                                              RequiredSize) then
                      begin
                        KEY:=SetupDiOpenDevRegKey(DevInfoHandle,
                                              DeviceInfoData,
                                              DICS_FLAG_GLOBAL,
                                              0,
                                              DIREG_DEV,
                                              KEY_READ);

                        if key <> INValid_Handle_Value then
                            begin
                              FillChar(Info, SizeOf(Info), 0);

                              if RegQueryInfoKey(Key,
                                          nil,
                                          nil,
                                          nil,
                                          @Info.NumSubKeys,
                                          @Info.MaxSubKeyLen,
                                          nil,
                                          @Info.NumValues,
                                          @Info.MaxValueLen,
                                          @Info.MaxDataLen,
                                          nil,
                                          @Info.FileTime) = ERROR_SUCCESS then
                              begin
                                RequiredSize:= Info.MaxValueLen + 1;
                                SetLength(S2,RequiredSize);
                                if RegQueryValueEx(KEY,
                                          'PortName',
                                          Nil,@Regtyp,
                                          @s2[1],
                                          @RequiredSize)=Error_Success then
                                    begin
                                      If (Pos('COM',S2)=1) then
                                          begin
                                            Result.Add(AnsiString(Strpas(PChar(S2)))); //+': = ' + StrPas(PChar(S1)));
                                          end;
                                    end;
                              end;
                            end;
                        RegCloseKey(key);
                      end;
                  Inc(MemberIndex);
                until False;

                if Result.Count=0 then
                    begin
                      Result.Free;
                      Result:=NIL;
                    end
            finally
              SetupDiDestroyDeviceInfoList(DevInfoHandle);
            end;
       end; 
    end; 
    finally
      UnloadSetupApi;
    end;
end;

procedure TMainForm.WMDeviceChange(var Msg: TMessage);
var 
  devType: Integer; 
  Datos: PDevBroadcastHdr; 
begin 
  if (Msg.wParam = DBT_DEVICEARRIVAL) or (Msg.wParam = DBT_DEVICEREMOVECOMPLETE) then  
      begin
        Datos := PDevBroadcastHdr(Msg.lParam);
        devType := Datos^.dbch_devicetype;
        if devType = DBT_DEVTYP_DEVICEINTERFACE then
            begin 
              DoDeviceChange(Msg.wParam,PDevBroadcastDeviceInterface(Msg.lParam));
            end;
      end; 
end;

procedure TMainForm.DoDeviceChange(Event:Integer; Device:PDevBroadcastDeviceInterface);
var
  VID,PID     : Word;
  Serial,GUID : string;
  List        : TstringList;
  IndT        : integer;
begin
  IndT:=0;

  if (Device.dbcc_devicetype=DBT_DEVTYP_DEVICEINTERFACE)
    and ParseDeviceName(USBDeviceNameMask,PChar(@Device.dbcc_name),
        [@VID,@PID,@Serial,@GUID]) then
      begin                                              
        if (VID = HardwVID) and (PID = HardwPID) then
            case Event of
                DBT_DEVICEARRIVAL :
                    begin
                      List:=TstringList.Create;
                      try
                        List.Assign(SetupEnumAvailableComPorts);

                        if List.Find(Comport1.Port, IndT) then
                            begin
                              Application.ProcessMessages;
                              Sleep(500);
                              Application.ProcessMessages;

                              ConnectDeviceClick(Self);
                              RzStatusPane13.Font.Color:=ClBlack;
                            end;
                      finally
                        List.Free;
                      end;
                    end;

                DBT_DEVICEREMOVECOMPLETE :
                    begin
                      List:=TstringList.Create;
                      try
                        List.Assign(SetupEnumAvailableComPorts);
                        if not List.Find(Comport1.Port, IndT) then
                            begin
                              Comport1.Close;
                              if ExpCreated then
                                  Experiment.AddToLog(WideString('Ошибка. Потеряна связь с прибором.'), clRed);
                              xSay('Ошибка. Потеряна связь с прибором.');
                              RzStatusPane13.Font.Color:=ClRed;
                            end;
                      finally
                        List.Free;
                      end;
                    end;
              end;
  end;
end;

function TMainForm.USBRegister: Boolean;
var 
  dbi: DEV_BROADCAST_DEVICEINTERFACE; 
  Size: Integer; 
  r: Pointer; 
begin 
  Result := False; 
  Size := SizeOf(DEV_BROADCAST_DEVICEINTERFACE); 
  ZeroMemory(@dbi, Size); 
  dbi.dbcc_size := Size;
  dbi.dbcc_devicetype := DBT_DEVTYP_DEVICEINTERFACE;
  dbi.dbcc_reserved := 0; 
  dbi.dbcc_classguid  := GUID_DEVINTERFACE_USB_DEVICE;
  dbi.dbcc_name := 0;

  r := RegisterDeviceNotification(FWindowHandle, @dbi, 
    DEVICE_NOTIFY_WINDOW_HANDLE);

  if Assigned(r) then Result := True; 
end;

procedure TMainForm.WndProc(var Msg: TMessage);
begin 
  if (Msg.Msg = WM_DEVICECHANGE) then
  begin 
    try 
      WMDeviceChange(Msg); 
    except 
      Application.HandleException(Self); 
    end; 
  end 
  else 
    Msg.Result := DefWindowProc(FWindowHandle, Msg.Msg, Msg.wParam, Msg.lParam);
end;

procedure TMainForm.XpHStatusPaneClick(Sender: TObject);
var
  FormatSettings            : TFormatSettings;
begin
  //ShowMessage(FloatToStrF(1234+pI,FormatSettings,8,4));
end;

procedure TMainForm.WinMsg (Var Msg : TMsg; Var Handled : Boolean);
begin
  If Msg.Message = WM_SYSCOMMAND then
      begin
        case Msg.WParam of
          ItemID:
            begin
              RzTrayIcon1.HideOnMinimize:=True;
              RzTrayIcon1.MinimizeApp;
            end;

          Item75T:
            begin
              TemperatureForm.AlphaBlend:=True;
              TemperatureForm.AlphaBlendValue:=Round(0.25 * 255);
            end;

          Item50T:
            begin
              TemperatureForm.AlphaBlend:=True;
              TemperatureForm.AlphaBlendValue:=Round(0.5 * 255);
            end;

          Item25T:
            begin
              TemperatureForm.AlphaBlend:=True;
              TemperatureForm.AlphaBlendValue:=Round(0.75 * 255);
            end;

          Item0T:
            begin
              TemperatureForm.AlphaBlend:=False;
              TemperatureForm.AlphaBlendValue:=255;
            end;
        end;

        //If Msg.WParam = ItemID then
            //begin
              //RzTrayIcon1.HideOnMinimize:=True;
              //RzTrayIcon1.MinimizeApp;
            //end;
      end
    else
      inherited;
end;

function TMainForm.xSay(Word : String) : boolean;
begin
  if AllowSpeech then
    try
      SpVoice.Speak(WideString(Word), SVSFlagsAsync);
      Result:=True;
    except
      AdvToolBarButton37.ImageIndex:= 49;
      AllowSpeech:=False;

      Result:=False;
    end;
end;

procedure TMainForm.Y1Click(Sender: TObject);
begin
  AdvToolBarButton44Click(Sender);
end;

procedure TMainForm.WMQueryEndSession(var Message: TWMQueryEndSession);
begin
  inherited;
  if not InsideShutdown then
      Message.Result:=0
    else
      Message.Result:=1;
end;

function TMainForm.CheckDevice(dev : string): boolean;
var
  Answer:String;
  CheckDevComPort : TComPort;
begin
  CheckDevComPort:=TComPort.Create(Self);

  try
    CheckDevComPort.Port:=dev;

    CheckDevComPort.Open;
    CheckDevComPort.WriteStr('*W'+#13);

    sleep(10);

    try
      CheckDevComPort.ReadStr(Answer, CheckDevComPort.InputCount);
    except
      Result:=False;
      Exit;
    end;

    if not (Pos('*W', Answer) > 0) then
        Result:=False
      else
        Result:=True;
  finally
    CheckDevComPort.Close;
    FreeAndNil(CheckDevComPort);
  end;
end;

procedure TMainForm.ScrollAxis(TheChart : TChart; Axis:TChartAxis; Const Percent:Double);
var Amount:Double;
begin
  With Axis do
  begin
    Amount:= -((Maximum - Minimum) / (100.0 / Percent));
    SetMinMax(Minimum - Amount, Maximum - Amount);
  end;
end;

procedure TMainForm.HorizScroll(TheChart : TChart; Const Percent:Double);
begin
  ScrollAxis(TheChart,TheChart.TopAxis,Percent);
  ScrollAxis(TheChart,TheChart.BottomAxis,Percent);
end;

procedure TMainForm.VertScroll(TheChart : TChart; Const Percent:Double);
begin
  ScrollAxis(TheChart,TheChart.LeftAxis,Percent);
  ScrollAxis(TheChart,TheChart.RightAxis,Percent);
end;

procedure TMainForm.ComPort1RxChar(Sender: TObject; Count: Integer);
var
  i             : integer;

  xInput_buffer : string;
begin
  {if Count > InpBuf then
      begin
        SetLength(xInput_buffer, Count);

        ComPort1.ReadStr(xInput_buffer, Count);

        SetLength(xInput_buffer, 0);
      end
    else
      begin}
        try
          ComPort1.ReadStr(Input_buffer, Count);
        finally end;
      //end;

  if (Input_buffer[1]='*') and (Input_buffer[count]=#13) then
    begin
      try
        if input_buffer[2] = 'C' then
            begin
              CalculateADC(Count);

              DigitalInp:=(ord(input_buffer[count - 2{16}]) and $0F) or
                         ((ord(input_buffer[count - 1{17}]) and $0F) shl 4);

              ChangeCheckBox;

              {if ((DigitalInp and $01) = 1) then
                  M1Home:=True
                else
                  M1Home:=False;
              if ((DigitalInp and $02) = $02) then
                  M2Home:=True
                else
                  M2Home:=False;
              if ((DigitalInp and $04) = $04) then
                  M1End:=True
                else
                  M1End:=False;
              if ((DigitalInp and $08) = $08) then
                  M2End:=True
                else
                  M2End:=False;}
            end;
      finally end;
    end;
end;

procedure TMainForm.ChangeCheckBox;
begin
      //Edit1.Text:=IntToHex(DigitalInp,2);
      if ((DigitalInp and $01) = 1) then
          CheckBox9.Checked:=true
      else
          CheckBox9.Checked:=false;

      if ((DigitalInp and $02) = $02) then
          begin
            CheckBox8.Checked:=True;
          end
        else
          begin
            if MilliSecondSpan(ExpTime, StTimeBtRefB) >= 250 then
              begin
                StTimeBtRefB:=ExpTime;

                BtRefStB:=not BtRefStB;

                if BtRefStB then
                    begin
                      if (not Experiment.ListCh[0].Refuelling) and
                         (not Experiment.ListCh[1].Refuelling) and
                         (not M2Home) then
                          begin
                            StTimeRefuelling:=ExpTime;
                            Experiment.ListCh[1].Refuelling:=True;
                            RefTimer.Enabled:=True;
                          end
                        else
                          begin
                            if Experiment.ListCh[1].Refuelling then
                                CancelRefuelling:=True;
                          end;
                    end;
              end;

            CheckBox8.Checked:=False;
          end;

      if ((DigitalInp and $04) = $04) then
        begin
          CheckBox7.Checked:=True;
          M2Home:=False;
        end
      else
        begin
          CheckBox7.Checked:=False;
          M2Home:=True;
        end;

      if ((DigitalInp and $08) = $08) then
        begin
          CheckBox6.Checked:=True;
          M2End:=False;
          InjEmpty:=False;

          if not RzCheckBox2.Enabled then
              begin
                RzCheckBox2.Enabled:=True;
                RzCheckBox2.Checked:=OldActStInjB;
              end;
        end
      else
        begin
          CheckBox6.Checked:=False;
          M2End:=True;
          if not TimerInj.Enabled then
              begin
                TimerInj.Enabled:=True;
                xSay('Внимание!. Закончился раствор во втором инжекторе!.');
                InjEmpty:=True;
              end;

          if RzCheckBox2.Enabled then
              begin
                RzCheckBox2.Enabled:=False;
                OldActStInjB:=RzCheckBox2.Checked;
                RzCheckBox2.Checked:=False;
              end;
        end;

      if ((DigitalInp and $10) = $10) then
          CheckBox5.Checked:=true
      else
          CheckBox5.Checked:=false;

      if ((DigitalInp and $20) = $20) then
        begin
          CheckBox4.Checked:=True;
        end
      else
        begin
          if MilliSecondSpan(ExpTime, StTimeBtRefA) >= 250 then
              begin
                StTimeBtRefA:=ExpTime;

                BtRefStA:=not BtRefStA;

                if BtRefStA then
                    begin
                      if (not Experiment.ListCh[0].Refuelling) and
                         (not Experiment.ListCh[1].Refuelling) and
                         (not M1Home) then
                          begin
                            StTimeRefuelling:=ExpTime;
                            Experiment.ListCh[0].Refuelling:=True;
                            RefTimer.Enabled:=True;
                          end
                        else
                          begin
                            if Experiment.ListCh[0].Refuelling then
                                CancelRefuelling:=True;
                          end;
                    end;
              end;

          CheckBox4.Checked:=false;
        end;

      if ((DigitalInp and $40) = $40) then
        begin
          CheckBox3.Checked:=True;
          M1Home:=False;
        end
      else
        begin
          CheckBox3.Checked:=False;
          M1Home:=True;
        end;

      if ((DigitalInp and $80) = $80) then
        begin
          CheckBox2.Checked:=True;
          M1End:=False;
          InjEmpty:=False;

          if not RzCheckBox1.Enabled then
              begin
                RzCheckBox1.Enabled:=True;
                RzCheckBox1.Checked:=OldActStInjA;
              end;
        end
      else
        begin
          CheckBox2.Checked:=False;
          M1End:=True;

          if RzCheckBox1.Enabled then
              begin
                RzCheckBox1.Enabled:=False;
                OldActStInjA:=RzCheckBox1.Checked;
                RzCheckBox1.Checked:=False;
              end;

          if not TimerInj.Enabled then
              begin
                TimerInj.Enabled:=True;
                xSay('Внимание!. Закончился раствор в первом инжекторе!.');
                InjEmpty:=True;
              end;
        end;
end;

procedure TMainForm.CalculateADC(Count : Integer);
var
  FI,
  XC,
  i,
  Day         : Integer;

  BtwTime,
  QWT,
  St,
  Volt_Ch_A,
  Volt_Ch_B   : Double;
begin
  ExpTime:= Now - Experiment.StartTime;

  if (InOldTime = 0) or (InOldTime > ExpTime) then
      begin
        InOldTime:=ExpTime;
      end;

  BtwTime:=ExpTime - InOldTime;

  if (Count mod 19) = 0 then
    begin
      XC:=Count div 19;

      QWT:=BtwTime / XC;

      for i := 0 to XC - 1 do
        begin
          FI:=i * 19;

          St:=InOldTime + (QWT * i);

          try
            Volt_Ch_0:=ADC_Const * StrToInt(Input_buffer[FI + 3] +
                                            Input_buffer[FI + 7] +
                                            Input_buffer[FI + 6] +
                                            Input_buffer[FI + 5] +
                                            Input_buffer[FI + 4]);
          finally end;

          try
            Volt_Ch_1:=ADC_Const * StrToInt(Input_buffer[FI + 8]  +
                                            Input_buffer[FI + 12] +
                                            Input_buffer[FI + 11] +
                                            Input_buffer[FI + 10] +
                                            Input_buffer[FI + 9]);
            finally end;

          try
            Volt_Ch_T:=ADC_Const * StrToInt(Input_buffer[FI + 16] +
                                            Input_buffer[FI + 15] +
                                            Input_buffer[FI + 14] +
                                            Input_buffer[FI + 13]);
          finally end;

          Volt_Ch_A:=Volt_Ch_0;
          Volt_Ch_B:=Volt_Ch_1;

          try
            if Experiment.KA <> 0 then Volt_Ch_0:=Volt_Ch_0 / Experiment.KA;
            Experiment.ListCh[0].ADC_Ch_P(Volt_Ch_0, St);
          finally end;

          try
            if Experiment.KB <> 0 then Volt_Ch_1:=Volt_Ch_1 / Experiment.KB;
            Experiment.ListCh[1].ADC_Ch_P(Volt_Ch_1, St);
          finally end;

          try
            Experiment.AddTmrPoint(Volt_Ch_T, St);
          finally end;

        end;
    end;

    if not Calb then
      try
        if (Abs(Volt_Ch_A) = 5000) or
           (Abs(Volt_Ch_B) = 5000)
           then
              begin
                if not Timer1.Enabled then
                    begin
                      Timer1.Enabled:=True;
                      xSay('Внимание. Проверьте погруженность электродов в раствор.');
                      SubmercibleSensorWarn:=True;
                    end;
              end
          else
            begin
              SubmercibleSensorWarn:=False;
            end;
      finally end;

  InOldTime:=ExpTime;

  Day:=Trunc(DaySpan(ExpTime, 0));

  if Day > 0 then
      RzStatusPane2.Caption:='Tl ' + IntToStr(Day) + '-' + TimeToStr(ExpTime)
    else
      RzStatusPane2.Caption:='Tl ' + TimeToStr(ExpTime);
end;

procedure TMainForm.M2StatusPaneClick(Sender: TObject);
begin
  AdvCircularProgress2.Position:=AdvCircularProgress2.Position +1;
  if AdvCircularProgress2.Position = 13 then AdvCircularProgress2.Position:=1;
end;

procedure TMainForm.ComPort1BeforeClose(Sender: TObject);
begin
  ConnectToolBarButton.Enabled:=true;
  DisconnectToolBarButton.Enabled:=false;
  ConnectDevice.Enabled:=true;
  DisConnectDevice.Enabled:=false;
  RzStatusPane3.Show;
  RzStatusPane4.Show;
  RzStatusPane3.Show;
  RzStatusPane4.Show;

  RzStatusPane13.Caption:=WideString('Hardware connected on :');
  RzStatusPane13.Font.Color:=ClBlack;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if InsideShutdown then
      begin
        CanClose:=True;
      end
    else
      begin
        SetOnFlash(Application.Handle);
        SetOnFlash(MainForm.Handle);
        if Experiment.StartExp then
            begin
              TaskDialog.Content:=' Завершить эксперимент и выйти из программы?';
              TaskDialog.CommonButtons:=[cbYes,cbNo];
              TaskDialog.Icon:=tiWarning;
              if TaskDialog.Execute = 6 then
                  begin
                    StopExp;
                    CanClose:=True;
                  end
                else
                  CanClose:=False;
            end
          else
            begin
              TaskDialog.Content:=' Выйти из программы?';
              TaskDialog.CommonButtons:=[cbYes,cbNo];
              TaskDialog.Icon:=tiQuestion;
              if TaskDialog.Execute = 6 then
                  CanClose:=True
                else
                  CanClose:=False;
            end;
      end;
end;

procedure TMainForm.G1Click(Sender: TObject);
begin
  AdvToolBarButton43Click(Sender);
end;

procedure TMainForm.GetParam(var List : TStringList);
var
  i: Integer;
begin
  List.Clear;

  for i := 1 to ParamCount do
    begin
      List.Add(LowerCase(ParamStr(i)));
    end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  i, IndT         : integer;

  Sec, Nl         : Word;

  List            : TstringList;

  SOTokens        : ISpeechObjectTokens;
begin
  DecimalSeparator:='.';

 try
    AppDataDir:=GetAppDataDir + '\ATD\';
  finally end;

  ADC_Const:=5000/$3FF;

  try
    if not DirectoryExists(AppDataDir) then
        begin
          CreateDir(AppDataDir);
        end;
  finally end;

  RegIniFile.Path:=AppDataDir + 'ATD.ini';

  JvDebugHandler1.LogFileName:=AppDataDir + 'ErrorLog.log';
  //showmessage(JvDebugHandler1.LogFileName);

  if FileExists(JvDebugHandler1.LogFileName) then SendBugsR.Enabled:=True;

  with TSpeedTheme.Create(ChartA) do
  try
    Apply;
  finally
    Free;
  end;

  with TSpeedTheme.Create(ChartB) do
  try
    Apply;
  finally
    Free;
  end;

  with TSpeedTheme.Create(VolumChartA) do
  try
    Apply;
  finally
    Free;
  end;

  with TSpeedTheme.Create(VolumChartB) do
  try
    Apply;
  finally
    Free;
  end;

  //ChartA.Axes.FastCalc:=True;
  //ChartB.Axes.FastCalc:=True;

  {TeeGDIPlus1:=TTeeGDIPlus.Create(Application);

  TeeGDIPlus1.TeePanel:=ChartA;

  TeeGDIPlus1.AntiAliasText:=False;
  TeeGDIPlus1.Antialias:=False;
  TeeGDIPlus1.Active:=True;

  TeeGDIPlus2:=TTeeGDIPlus.Create(Application);

  TeeGDIPlus2.TeePanel:=ChartB;

  TeeGDIPlus2.AntiAliasText:=False;
  TeeGDIPlus2.Antialias:=False;
  TeeGDIPlus2.Active:=True;

  TeeGDIPlus3:=TTeeGDIPlus.Create(Application);

  TeeGDIPlus3.TeePanel:=VolumChartA;

  TeeGDIPlus3.AntiAliasText:=False;
  TeeGDIPlus3.Antialias:=False;
  TeeGDIPlus3.Active:=True;

  TeeGDIPlus4:=TTeeGDIPlus.Create(Application);

  TeeGDIPlus4.TeePanel:=VolumChartB;

  TeeGDIPlus4.AntiAliasText:=False;
  TeeGDIPlus4.Antialias:=False;
  TeeGDIPlus4.Active:=True;}

  //ChartA.BufferedDisplay:=True;
  //ChartB.BufferedDisplay:=True;
  //VolumChartA.BufferedDisplay:=True;
  //VolumChartB.BufferedDisplay:=True;

  //SeriesPH.LinePen.OwnerCriticalSection:=nil;
  //SeriesKCI.LinePen.OwnerCriticalSection:=nil;

  //MVAS.LinePen.OwnerCriticalSection:=nil;
  //MVBS.LinePen.OwnerCriticalSection:=nil;

  SeriesPH.FastPen:=True;
  SeriesKCI.FastPen:=True;

  OldActStInjA:=True;
  OldActStInjB:=True;

  MVAS.FastPen:=True;
  MVBS.FastPen:=True;

  SeriesPH.DrawAllPoints:=False;
  SeriesKCI.DrawAllPoints:=False;

  MVAS.DrawAllPoints:=False;
  MVBS.DrawAllPoints:=False;

  ParamList:=TStringlist.Create;
  GetParam(ParamList);

  if ParamList.Find('\safe', IndT) then
      SafeT:=True
    else
      SafeT:=False;

  AppTerminated   :=False;
  ExpCreated      :=False;
  JobEvent        :=False;
  InsideShutdown  :=False;
  ShowLineA       :=True;
  ShowLineB       :=True;

  Application.OnException:=ExceptAllError;

  Experiment:=TExp.Create;
  Experiment.StartTime:=Now;

  CancelRefuelling:=False;
  SubmercibleSensorWarn:=False;
  AllowSpeech:=True;
  Calb:=False;

  With RegIniFile do
    begin
      try
        Config.VolumPerTurnM1          :=ReadFloat     ('Motor1Settings', 'VolumPerTurn', 0.0001);
        Config.CountStepsPerTurnM1     :=ReadInteger   ('Motor1Settings', 'CountStepsPerTurn', 200);
        Config.IntervalBetweenStepsM1  :=ReadInteger   ('Motor1Settings', 'IntervalBetweenSteps', 100);
        Experiment.M1Interval          :=Config.IntervalBetweenStepsM1;
        M1StatusPane.Caption           :=ReadString    ('Motor1Settings', 'Coment', 'NaOH');
        Config.VolumPerTurnM2          :=ReadFloat     ('Motor2Settings', 'VolumPerTurn', 0.0001);
        Config.CountStepsPerTurnM2     :=ReadInteger   ('Motor2Settings', 'CountStepsPerTurn', 200);
        Config.IntervalBetweenStepsM2  :=ReadInteger   ('Motor2Settings', 'IntervalBetweenSteps', 100);
        Experiment.M2Interval          :=Config.IntervalBetweenStepsM2;
        M2StatusPane.Caption           :=ReadString    ('Motor2Settings', 'Coment', 'KCI');
        DBDir                          :=ReadString    ('DB', 'Dir', GetMyDocDir + '\AtdData\');

        try
          if not DirectoryExists(DBDir) then
              begin
                CreateDir(DBDir);
              end;
          finally end;

        Config.VoiceEngine             :=ReadString    ('Voice', 'VoiceEngine', '');
        Config.PortDev                 :=ReadString    ('Device', 'Port', '');
      finally end;

      try
        Experiment.KA                  :=ReadFloat     ('AmplificationFactor', 'KA', 0);
        Experiment.KB                  :=ReadFloat     ('AmplificationFactor', 'KB', 0);

        Config.VolumPerStA             :=ReadFloat     ('Motor1Settings', 'VolPerSt', 0.0001);
        Config.VolumPerStB             :=ReadFloat     ('Motor2Settings', 'VolPerSt', 0.0001);
      finally end;

      try
        if ReadBool('ClS','LeftPanel', False) then
            begin
              LeftSizePanel.CloseHotSpot;
              N38.Checked:=not LeftSizePanel.HotSpotClosed;
            end;
        if ReadBool('ClS','RigthPanel', False) then
            begin
              RigthSizePanel.CloseHotSpot;
              N39.Checked:=not RigthSizePanel.HotSpotClosed;
            end;
      finally end;
    end;

  //////////////////////////////////////////////////////////////////////////////

  Experiment.vCapt1:=Capt1;
  Experiment.vCapt2:=Capt2;

  Experiment.Chart1:=ChartA;
  Experiment.Chart2:=ChartB;

  Experiment.VolumChartA:=VolumChartA;
  Experiment.VolumSeriesA:=VolumSeriesA;
  Experiment.DifVolumSeriesA:=DifVSeriesA;
  Experiment.DifVolum2SeriesA:=DifVol2SeriesA;

  Experiment.mVAS:=mVAS;
  Experiment.mVBS:=mVBS;

  Experiment.VolumChartB:=VolumChartB;
  Experiment.VolumSeriesB:=VolumSeriesB;
  Experiment.DifVolumSeriesB:=DifVSeriesB;
  Experiment.DifVolum2SeriesB:=DifVol2SeriesB;

  Experiment.LockValuepH:=LockValuepH;
  Experiment.LockValueKCI:=LockValueKCI;

  Experiment.VolumStatusPaneA:=VolumStatusPaneA;
  Experiment.VolumStatusPaneB:=VolumStatusPaneB;

  Experiment.VolumPaneA:=VolumPaneA;
  Experiment.VolumPaneB:=VolumPaneB;

  Experiment.pHStatusPane:=pHStatusPane;
  Experiment.KCIStatusPane:=KCIStatusPane;

  Experiment.AdvCircularProgressA:=AdvCircularProgress1;
  Experiment.AdvCircularProgressB:=AdvCircularProgress2;

  Experiment.SeriespH:=SeriespH;
  Experiment.SeriesKCI:=SeriesKCI;

  Experiment.LogHTMListBox:=LogHTMListBox;
  Experiment.ComPort:=ComPort1;

  Experiment.OnTmrAdd:=OnTmrAdd;

  try
    Experiment.pHK          :=RegIniFile.ReadFloat('pH', 'K', 50);
    Experiment.pHb          :=RegIniFile.ReadFloat('pH', 'b', 320);

    Experiment.TmrK          :=RegIniFile.ReadFloat('TmrS', 'K', 400);
    Experiment.Tmrb          :=RegIniFile.ReadFloat('TmrS', 'b', -7500);

    Experiment.Xmin         :=RegIniFile.ReadFloat('pH', 'Xmin', -2);
    Experiment.Xmax         :=RegIniFile.ReadFloat('pH', 'Xmax', -2);
    Experiment.Ymin         :=RegIniFile.ReadFloat('pH', 'Ymin', 5001);
    Experiment.Ymax         :=RegIniFile.ReadFloat('pH', 'Ymax', 5001);
    Experiment.ThresholdA   :=RegIniFile.ReadFloat('Exp', 'ThresholdA', 0.001);
    Experiment.ThresholdB   :=RegIniFile.ReadFloat('Exp', 'ThresholdB', 0.001);

    Experiment.SolA         :=RegIniFile.ReadFloat('Solution', 'SolA', 20);
    Experiment.SolB         :=RegIniFile.ReadFloat('Solution', 'SolB', 5);

    Experiment.xDay         :=RegIniFile.ReadFloat('Solution', 'Day', 7);
    Experiment.xVolum       :=RegIniFile.ReadFloat('Solution', 'Volum', 40);

    Experiment.Mass         :=RegIniFile.ReadFloat('Solution', 'Mass', 1);
  finally end;

  Experiment.VolPerStepA:=MainForm.Config.VolumPerStA;
  Experiment.VolPerStepB:=MainForm.Config.VolumPerStB;

  QuantumM1Edit.Increment:=Experiment.VolPerStepA;
  QuantumM2Edit.Increment:=Experiment.VolPerStepB;

  Experiment.Quantum1:=RegIniFile.ReadFloat('Exp', 'Quantum1', 0.0001);
  QuantumM1Edit.Value:=Experiment.Quantum1;

  Experiment.Quantum2:=RegIniFile.ReadFloat('Exp', 'Quantum2', 0.0001);
  QuantumM2Edit.Value:=Experiment.Quantum2;

  Experiment.DownEventTime1:=RegIniFile.ReadFloat('Exp', 'DownTA', EncodeTime(0, 0, 5, 0));
  Experiment.MixEventTime1:=RegIniFile.ReadFloat('Exp', 'MixTA', EncodeTime(0, 0, 10, 0));

  DecodeTime(Experiment.DownEventTime1, Nl, Nl, Sec, Nl);
  Edit1.IntValue:=Sec;
  DecodeTime(Experiment.MixEventTime1, Nl, Nl, Sec, Nl);
  RzSpinEdit1.IntValue:=Sec;

  Experiment.DownEventTime2:=RegIniFile.ReadFloat('Exp', 'DownTB', EncodeTime(0, 0, 5, 0));
  Experiment.MixEventTime2:=RegIniFile.ReadFloat('Exp', 'MixTB', EncodeTime(0, 0, 10, 0));

  DecodeTime(Experiment.DownEventTime2, Nl, Nl, Sec, Nl);
  RzSpinEdit4.IntValue:=Sec;
  DecodeTime(Experiment.MixEventTime2, Nl, Nl, Sec, Nl);
  RzSpinEdit3.IntValue:=Sec;

  Experiment.StepsToQuaA:=Round(Experiment.Quantum1 / Experiment.VolPerStepA);
  Experiment.StepsToQuaB:=Round(Experiment.Quantum2 / Experiment.VolPerStepB);

  IntervalBetweenStepsM1Edit.IntValue:=Config.IntervalBetweenStepsM1;
  IntervalBetweenStepsM2Edit.IntValue:=Config.IntervalBetweenStepsM2;

  Experiment.StepCircA:=12 / Config.IntervalBetweenStepsM1;
  Experiment.StepCircB:=12 / Config.IntervalBetweenStepsM2;

  try
    Experiment.cV[0]           :=RegIniFile.ReadFloat('KCI', 'V0', 100);
    Experiment.cV[1]           :=RegIniFile.ReadFloat('KCI', 'V1', 90);
    Experiment.cV[2]           :=RegIniFile.ReadFloat('KCI', 'V2', 80);
    Experiment.cV[3]           :=RegIniFile.ReadFloat('KCI', 'V3', 70);
    Experiment.cV[4]           :=RegIniFile.ReadFloat('KCI', 'V4', 60);
    Experiment.cV[5]           :=RegIniFile.ReadFloat('KCI', 'V5', 50);
    Experiment.cV[6]           :=RegIniFile.ReadFloat('KCI', 'V6', 40);
    Experiment.cV[7]           :=RegIniFile.ReadFloat('KCI', 'V7', 30);
  finally end;

  try
    Experiment.Init;
  finally end;

  //TeeSetRussian;

  {if not RegIniFile.SectionExists('Other') then
      RegIniFile.WriteBool('Other', 'DoubleBuffered', True);

  if RegIniFile.ReadBool('Other', 'DoubleBuffered', True) then
    begin
      ChartA.DoubleBuffered:=True;
      ChartB.DoubleBuffered:=True;
      VolumChartA.DoubleBuffered:=True;
      VolumChartB.DoubleBuffered:=True;
    end;}

  VolumSplitter.Percent:=50;

  TaskList.TaskList:=TStringList.Create;
  TaskList.TimeList:=TStringList.Create;

  ChartA.AnimatedZoom:=False;
  ChartB.AnimatedZoom:=False;

  VolumChartA.AnimatedZoom:=False;
  VolumChartB.AnimatedZoom:=False;

  if (JvComputerInfoEx1.CPU.NormFreq > 1200) and (not SafeT) then
      begin
        AntiAl1.Active:=True;
        AntiAliasTool1.Active:=True;
        AntiAliasTool2.Active:=True;
        AntiAliasTool3.Active:=True;

        //ChartA.AnimatedZoom:=True;
        //ChartB.AnimatedZoom:=True;

        //VolumChartA.AnimatedZoom:=True;
        //VolumChartB.AnimatedZoom:=True;
      end
    else
      begin
        AntiAl1.Active:=False;
        AntiAliasTool1.Active:=False;
        AntiAliasTool2.Active:=False;
        AntiAliasTool3.Active:=False;

        //VolumChartA.AnimatedZoom:=False;
        //VolumChartB.AnimatedZoom:=False;
      end;

  ChSolTime                 :=RegIniFile.ReadInteger('Solution', 'Time', 600);
  RzSpinEdit2.Value         :=ChSolTime / 60;

  RzSpinEdit6.Value:=Experiment.ThresholdA;
  RzSpinEdit7.Value:=Experiment.ThresholdB;

  //Experiment.VolPerStepA:=Config.VolumPerTurnM1 / Config.CountStepsPerTurnM1;
  //Experiment.VolPerStepB:=Config.VolumPerTurnM2 / Config.CountStepsPerTurnM2;

  RzBitBtn4.Enabled:=False;

  try
    CheckDBDir;
  except end;

  try
    if SafeT then
        MFCaption:='ATD v. ' +
                    AnsiString(xGetFileVersion(Application.ExeName)) +
                    ' [Safe mode]'
      else
        MFCaption:='ATD v. ' +
                    AnsiString(xGetFileVersion(Application.ExeName));

    MainForm.Caption:=MFCaption;
  except end;

  try
    Application.OnMessage := WinMsg;
    AppendMenu (GetSystemMenu (MainForm.Handle, False), MF_SEPARATOR, 0, '');
    AppendMenu (GetSystemMenu (MainForm.Handle, False), MF_BYPOSITION, ItemID, '&Свернуть в трей');
    AppendMenu (GetSystemMenu (Application.Handle, False), MF_SEPARATOR, 0, '');
    AppendMenu (GetSystemMenu (Application.Handle, False), MF_BYPOSITION, ItemID,'&Свернуть в трей');
  except end;

  try
    FWindowHandle := AllocateHWnd(WndProc);
    USBRegister;
  except end;

  if not SafeT then
      begin
        SpVoice:=TSpVoice.Create(Application);
          try
            SOTokens := SpVoice.GetVoices('', '');

            if Config.VoiceEngine = '' then
                begin
                  if SOTokens.Count > 0 then
                      begin
                        SpVoice.Voice := SOTokens.Item(0);
                      end;
                end
              else
                begin
                  for i := 0 to SOTokens.Count - 1 do
                    begin
                      if SOTokens.Item(i).GetDescription(0) = Config.VoiceEngine then
                          SpVoice.Voice := SOTokens.Item(i);
                    end;
                end;
          finally end;
      end
    else
      begin
        AdvToolBarButton37.Enabled:= False;
        AllowSpeech:=False;
      end;

  State1:=False;
  State2:=False;

  IndT:=0;
  InOldTime:=0;

  List:=TstringList.Create;
    try
      xEnumComPorts(List);

      if Config.PortDev = '' then
          begin
            for i := 0 to List.Count - 1 do
              begin
                if MainForm.CheckDevice(List[i]) then
                    begin
                      Config.PortDev:=List[i];
                      RegIniFile.WriteString('Device', 'Port', List[i]);
                      ComPort1.Port:=Config.PortDev;
                      break;
                    end;
              end;
          end
        else
          begin
            ComPort1.Port:=Config.PortDev;
          end;

      if List.Find(Comport1.Port, IndT) then ConnectDeviceClick(Self);
    finally
      List.Free;
    end;

  if ComPort1.Connected then
      begin
        try
          ComPort1.WriteStr('*A' + IntToStr(0) +'0'+#13);
          ComPort1.WriteStr('*A' + IntToStr(1) +'0'+#13);
        finally end;
      end;

  DragAcceptFiles(Handle, True);
end;

function TMainForm.ComPortWriteStr(const Str: AnsiString): Integer;
begin
  if ComPort1.Connected then
      Result:=ComPort1.WriteStr(Str)
    else
       Result:=0;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RegIniFile.WriteBool('ClS','LeftPanel', LeftSizePanel.HotSpotClosed);
  RegIniFile.WriteBool('ClS','RigthPanel', RigthSizePanel.HotSpotClosed);

  Experiment.StartExp:=False;
  AppTerminated:=True;

  Comport1.Close;

  While Comport1.Connected do
    begin
      Application.ProcessMessages;
      Sleep(1);
    end;
end;

procedure TMainForm.RzToolButton15Click(Sender: TObject);
begin
  VolumChartA.ZoomPercent(120);
end;

procedure TMainForm.RzToolButton16Click(Sender: TObject);
begin
  VolumChartA.ZoomPercent(80);
end;

procedure TMainForm.RzToolButton17Click(Sender: TObject);
begin
  VolumChartA.UndoZoom;
  UndoZoomToolBarButtonA.Enabled:=False;
end;

procedure TMainForm.RzToolButton23Click(Sender: TObject);
begin
  ChartTool5.Active:=True;
  RzSpinButtons3.Top:=(VolumChartA.Height div 2) - 22;
  RzSpinButtons4.Top:=VolumChartA.Height - 15;

  RzToolButton1.Top:=3;
  RzToolButton1.Left:=VolumChartA.Width - RzToolButton1.Width - 3;

  RzToolButton1.Visible:=True;
end;

procedure TMainForm.RzToolButton2Click(Sender: TObject);
begin
  FullScreenTool2.Active:=False;

  RzToolButton2.Visible:=False;
end;

procedure TMainForm.RzToolButton3Click(Sender: TObject);
begin
  FullScreenToolA.Active:=False;

  RzToolButton3.Visible:=False;
end;

procedure TMainForm.RzToolButton4Click(Sender: TObject);
begin
  FullScreenToolB.Active:=False;

  RzToolButton4.Visible:=False;
end;

procedure TMainForm.RzToolButton21Click(Sender: TObject);
begin
  FullScreenTool2.Active:=True;
  RzSpinButtons5.Top:=(VolumChartB.Height div 2) - 22;
  RzSpinButtons6.Top:=VolumChartB.Height - 15;

  RzToolButton2.Top:=3;
  RzToolButton2.Left:=VolumChartB.Width - RzToolButton2.Width - 3;

  RzToolButton2.Visible:=True;
end;

procedure TMainForm.RzToolButton18Click(Sender: TObject);
begin
  VolumChartB.ZoomPercent(120);
end;

procedure TMainForm.RzToolButton19Click(Sender: TObject);
begin
  VolumChartB.ZoomPercent(80);
end;

procedure TMainForm.RzToolButton1Click(Sender: TObject);
begin
  ChartTool5.Active:=False;

  RzToolButton1.Visible:=False;
end;

procedure TMainForm.RzToolButton20Click(Sender: TObject);
begin
  VolumChartB.UndoZoom;
  UndoZoomToolBarButtonB.Enabled:=False;
end;

procedure TMainForm.Cleaning;
begin
  LogHTMListBox.Clear;
  Experiment.Clear;
end;

procedure TMainForm.R1Click(Sender: TObject);
begin
  AdvToolBarButton31Click(Sender);
end;

procedure TMainForm.ReadThreadAfterRun(Sender: TIdThreadComponent);
begin
  StatusOpenExpForm.Close;

  if Experiment.ErrorLoad and (Experiment.ErrorMessage <> '') then
      begin
        TaskDialog.Content:=' ' + Experiment.ErrorMessage;
        TaskDialog.Icon:=tiError;
        TaskDialog.CommonButtons:=[cbOK];

        TaskDialog.Execute;
      end;
end;

procedure TMainForm.ReadThreadRun(Sender: TIdThreadComponent);
var
  Time : Cardinal;
begin
  Experiment.RunRead(Time, LogHTMListBox);

  N30Click(Application);
  MenuItem3Click(Application);
  ChartABeforeDrawChart(Application);
  ChartBBeforeDrawChart(Application);
  VolumChartABeforeDrawChart(Application);
  VolumChartBBeforeDrawChart(Application);

  ReadThread.Stop;
end;

procedure TMainForm.DisConnectDeviceClick(Sender: TObject);
begin
  Comport1.Close;
end;

procedure TMainForm.CheckBox1Click(Sender: TObject);
begin
  SeriesPH.DrawAllPoints:=not CheckBox1.Checked;
  SeriesKCI.DrawAllPoints:=not CheckBox1.Checked;

  MVAS.DrawAllPoints:=not CheckBox1.Checked;
  MVBS.DrawAllPoints:=not CheckBox1.Checked;
end;

procedure TMainForm.CheckDBDir;
begin
  if not DirectoryExists(DBDir) then
    begin
      DBDir:=GetMyDocDir + '\AtdData\';

      RegIniFile.WriteString('DB', 'Dir', DBDir);
    end;
end;

procedure TMainForm.StopExp;
begin
  MassForm:=TMassForm.Create(Application);
  MassForm.ShowModal;

  FreeAndNil(MassForm);

  StopExpToolBarButton.Enabled:=False;
  NewExpToolBarButton.Enabled:=True;
  NewExp1.Enabled:=True;
  OpenExpToolBarButton.Enabled:=True;
  OpenItM1.Enabled:=True;
  ExpStop.Enabled:=False;
  ExpCreated:=False;
  ChangeSBitBtn.Enabled:=False;
  N29.Enabled:=False;
  Experiment.AddToLog(WideString('Эксперемент завершен'), ClBlue);
  Experiment.StopExperiment;
  LockValueBitBtn.Show;
  RzPanel6.Hide;

  AdvToolBarButton31.Enabled    :=False;
  AdvToolBarButton28.Enabled    :=False;
  AdvToolBarButton43.Enabled    :=False;
  AdvToolBarButton44.Enabled    :=False;
  R1.Enabled                    :=False;
  F1.Enabled                    :=False;
  G1.Enabled                    :=False;
  Y1.Enabled                    :=False;

  LockValueBitBtn.Enabled       :=False;

  LockValueBitBtnEx.Enabled     :=False;
  NLoockValue.Enabled           :=False;

  RzStatusPane2.Visible         :=False;
end;

procedure TMainForm.OpenItM1Click(Sender: TObject);
var
  ProcessHandle   : THandle;
  MyThreadHandle  : THandle;
  ProcessID       : DWORD;
begin
  ExpOpenDialog.Filter := 'atd files (*.atd)|*.atd|All files (*.*)|*.*';
  CheckDBDir;
  ExpOpenDialog.InitialDir:=DBDir;
  if ExpOpenDialog.Execute then
    begin
      Cleaning;
      Experiment.DBFile:=ExpOpenDialog.FileName;

      MainForm.Caption:=MFCaption + ' [' + ExtractFileName(Experiment.DBFile) + ']';

      try
        ProcessID := GetCurrentProcessID;
        ProcessHandle := OpenProcess(PROCESS_SET_INFORMATION, false, ProcessID);
        SetPriorityClass(ProcessHandle, NORMAL_PRIORITY_CLASS);

        MyThreadHandle := GetCurrentThread;
        SetThreadPriority(MyThreadHandle, THREAD_PRIORITY_NORMAL);
      finally end;

      if StatusOpenExpForm = nil then
          StatusOpenExpForm:=TStatusOpenExpForm.Create(Application);

      StatusOpenExpForm.ShowModal;

      StartExpToolBarButton.Enabled:=False;
      ExpStart1.Enabled:=False;
      InfoExp.Enabled:=True;
      InfoExpToolBarButton.Enabled:=True;
      Print1.Enabled:=True;
      Export1.Enabled:=True;
    end;
end;

procedure TMainForm.pHStatusPaneClick(Sender: TObject);
begin
  ShowMessage(IntToStr(ord(AnsiChar('C'))));
end;

procedure TMainForm.NewExp1Click(Sender: TObject);
var
  ProcessHandle   : THandle;
  MyThreadHandle  : THandle;
  ProcessID       : DWORD;
begin
  NewExpForm:=TNewExpForm.Create(Application);
  if NewExpForm.ShowModal = 1 then
    begin
      RegIniFile.WriteString('DB', 'Dir', DBDir);
      Cleaning;
      Experiment.CreateDefaultDB;
      ExpCreated:=True;
      StartExpToolBarButton.Enabled:=True;
      ExpStart1.Enabled:=True;
      InfoExp.Enabled:=True;
      InfoExpToolBarButton.Enabled:=True;
      Print1.Enabled:=True;
      Export1.Enabled:=True;
      Cleaning;
      Experiment.AddToLog(WideString('Создан файл базы данных эксперемента: ' + Experiment.DBFile), ClBlack);

      MainForm.Caption:=MFCaption + ' [' + ExtractFileName(Experiment.DBFile) + ']';

      if ComPort1.Connected then
          begin
            try
              ComPort1.WriteStr('*A' + IntToStr(0) +'0'+#13);
              ComPort1.WriteStr('*A' + IntToStr(1) +'0'+#13);
            finally end;
          end;
      State1:=False;
      State2:=False;
    end;

  try
    ProcessID := GetCurrentProcessID;
    ProcessHandle := OpenProcess(PROCESS_SET_INFORMATION, false, ProcessID);
    SetPriorityClass(ProcessHandle, HIGH_PRIORITY_CLASS);

    MyThreadHandle := GetCurrentThread;
    SetThreadPriority(MyThreadHandle, THREAD_PRIORITY_TIME_CRITICAL);
  finally end;

  LockValuepH.Active:=False;
  LockValueKCI.Active:=False;

  FreeAndNil(NewExpForm);
end;

procedure TMainForm.Print1Click(Sender: TObject);
begin
  ChartPrint.Execute;
end;

procedure TMainForm.V1Click(Sender: TObject);
begin
  ChartExport.Chart:=VolumChartA;
  ChartExport.Execute;
end;

procedure TMainForm.V2Click(Sender: TObject);
begin
  ChartExport.Chart:=VolumChartB;
  ChartExport.Execute;
end;

procedure TMainForm.ExitMClick(Sender: TObject);
begin
  close;
end;

procedure TMainForm.ExpStart1Click(Sender: TObject);
begin
  if not ComPort1.Connected then
      begin
        TaskDialog.Content:=' Прибор не подключен, невозможно начать эксперимент!';
        TaskDialog.Icon:=tiError;
        TaskDialog.CommonButtons:=[cbOK];
        TaskDialog.Execute;
        TaskDialog.CommonButtons:=[cbYes,cbNo];
        Exit;
      end;

  Experiment.SolA               :=RegIniFile.ReadFloat('Solution', 'SolA', 20);
  Experiment.SolB               :=RegIniFile.ReadFloat('Solution', 'SolB', 5);

  Experiment.xDay               :=RegIniFile.ReadFloat('Solution', 'Day', 7);
  Experiment.xVolum             :=RegIniFile.ReadFloat('Solution', 'Volum', 40);

  StartExpToolBarButton.Enabled :=False;
  OpenItM1.Enabled              :=False;
  NewExpToolBarButton.Enabled   :=False;
  NewExp1.Enabled               :=False;
  OpenExpToolBarButton.Enabled  :=False;
  ExpStart1.Enabled             :=False;

  StopExpToolBarButton.Enabled  :=True;
  ExpStop.Enabled               :=True;
  LockValueBitBtn.Enabled       :=True;
  LockValueBitBtnEx.Enabled     :=True;
  NLoockValue.Enabled           :=True;
  ChangeSBitBtn.Enabled         :=True;
  N29.Enabled                   :=True;

  AdvToolBarButton31.Enabled    :=True;
  AdvToolBarButton28.Enabled    :=True;
  AdvToolBarButton43.Enabled    :=True;
  AdvToolBarButton44.Enabled    :=True;
  R1.Enabled                    :=True;
  F1.Enabled                    :=True;
  G1.Enabled                    :=True;
  Y1.Enabled                    :=True;

  LockValueBitBtn.Enabled       :=True;

  dwOverlayIcon1.ImageIndex:=3;

  Experiment.StartExperiment;

  RzStatusPane2.Visible         :=True;
end;

procedure TMainForm.ExpStopClick(Sender: TObject);
begin
  TaskDialog.Content:=' Завершить эксперимент?';
  TaskDialog.Icon:=tiWarning;
  SetOnFlash(Application.Handle);
  if TaskDialog.Execute = 6 then
      begin
        StopExp;
        dwOverlayIcon1.ImageIndex:=-1;
      end;
end;

procedure TMainForm.SettingsClick(Sender: TObject);
begin
  SettingsForm:=TSettingsForm.Create(Application);
  SettingsForm.ShowModal;
  FreeAndNil(SettingsForm);
end;

procedure TMainForm.AboutClick(Sender: TObject);
begin
  AboutForm:=TAboutForm.Create(Application);
  AboutForm.ShowModal;
  FreeAndNil(AboutForm);
end;

procedure TMainForm.ConnectDeviceClick(Sender: TObject);
var
  Answer : String;
  P      : byte;

  Bl     : String;
begin
  try
    Comport1.Open;
    Comport1.WriteStr(AnsiString('*W'+#13));
    sleep(10);
    ComPort1.ReadStr(Answer, ComPort1.InputCount);
    Application.ProcessMessages;

    if not (Pos(AnsiString('*W'), Answer) > 0) then
        begin
          RzStatusPane13.Font.Color:=clRed;
          RzStatusPane13.caption:=WideString('Hardware NOT found on : ' + ComPort1.Port);
          comport1.Close;
          exit;
        end
      else
        begin
          RzStatusPane13.Font.Color:=clBlack;
          P:=Pos(AnsiString('--'), Answer) + 2;
          RzStatusPane13.caption:=WideString('Hardware connected on : ' +
                                             ComPort1.Port  +
                                             ' (Firmware v. ' +
                                             Answer[P] + '.' +
                                             Answer[P + 1] +
                                             Answer[P + 2] + ')');

          HardwareVer.Major:=StrToInt(Answer[P]);
          HardwareVer.Build:=StrToInt(Answer[P + 1] + Answer[P + 2]);

          if not ((HardwareVer.Major = 1) and (HardwareVer.Build = 8)) then
              begin
                if HardwareVer.Build < 10 then
                    Bl:='0' + IntToStr(HardwareVer.Build)
                  else
                    Bl:=IntToStr(HardwareVer.Build);

                TaskDialog.Content:=' Программа предназначена для работы с прибором с версией прошивки 1.08!' +
                                    #13#10 +
                                    ' Текущая версия: ' +
                                    IntToStr(HardwareVer.Major) +
                                    '.' +
                                    Bl +
                                    '.';
                TaskDialog.Icon:=tiError;
                TaskDialog.Title:='Внимание';
                TaskDialog.CommonButtons:=[cbOK];
                TaskDialog.Execute;
                TaskDialog.CommonButtons:=[cbYes,cbNo];
              end;

          ConnectToolBarButton.Enabled:=False;

          DisconnectToolBarButton.Enabled:=true;
          ConnectDevice.Enabled:=False;
          DisConnectDevice.Enabled:=True;
          RzStatusPane3.Hide;
          RzStatusPane4.Hide;
        end;
  finally end;
end;

procedure TMainForm.NewExpToolBarButtonClick(Sender: TObject);
begin
  NewExp1Click(Sender);
end;

procedure TMainForm.NLoockValueClick(Sender: TObject);
begin
  LockValueBitBtnClick(Sender);
end;

procedure TMainForm.OpenExpToolBarButtonClick(Sender: TObject);
begin
  OpenItM1Click(Sender);
end;

procedure TMainForm.StartExpToolBarButtonClick(Sender: TObject);
begin
  ExpStart1Click(Sender);
end;

procedure TMainForm.StopExpToolBarButtonClick(Sender: TObject);
begin
  ExpStopClick(Sender);
end;

procedure TMainForm.ConnectToolBarButtonClick(Sender: TObject);
begin
  ConnectDeviceClick(Sender);
end;

procedure TMainForm.DisconnectToolBarButtonClick(Sender: TObject);
begin
  DisConnectDeviceClick(Sender);
end;

procedure TMainForm.SettingsToolBarButtonClick(Sender: TObject);
begin
  SettingsClick(Sender);
end;

procedure TMainForm.ExitToolBarButtonClick(Sender: TObject);
begin
  close;
end;

procedure TMainForm.InfoExpToolBarButtonClick(Sender: TObject);
begin
  InfoExpClick(Sender);
end;

procedure TMainForm.InfoExpClick(Sender: TObject);
begin
  InfoExpForm:=TInfoExpForm.Create(Application);
  InfoExpForm.ShowModal;
  FreeAndNil(InfoExpForm);
end;

procedure TMainForm.ExceptAllError(Sender : TObject; Exc : Exception);
{var
  f                   : TextFile;
  Filedir             : string;}
begin
  {Filedir:=ExtractFileDir(ParamStr(0)) + '/Errorlog.log';

  AssignFile(f, Filedir);
  if not FileExists(Filedir) then
    begin
      Rewrite(f);
      CloseFile(f);
    end;

  Append(f);

  Writeln(f, DateToStr(Now) + ' $ ' + TimeToStr(Now) + ' $ ' + Exc.Message);

  Flush(f);
  CloseFile(f);}
end;

procedure TMainForm.LockValueBitBtnClick(Sender: TObject);
begin
  Experiment.PLockValue;

  LockValuepH.Value:=xGetpH(Experiment.ListCh[0].LockValue, Experiment.pHb, Experiment.pHk);
  //LockValueKCI.Value:=Experiment.LockValueB;
  LockValueKCI.Value:=Experiment.GetC(Experiment.ListCh[1].LockValue);

  RzPanel6.Caption:='Фикс. знач.' + #13#10 +
      'pH: ' + FloatToStrF(xGetpH(Experiment.ListCh[0].LockValue, Experiment.pHb, Experiment.pHk), ffFixed,6,4) +
      ';' + #13#10 + 'KCL : ' + FloatToStrF(Experiment.ListCh[1].LockValue, ffFixed,6,1) + ' mV';

  LockValueBitBtn.Hide;
  RzPanel6.Show;

  LockValuepH.Active:=True;
  LockValueKCI.Active:=True;

  LockValueBitBtn.Enabled:=False;
  LockValueBitBtnEx.Enabled:=False;
  NLoockValue.Enabled:=False;
end;

procedure TMainForm.LockValueBitBtnExClick(Sender: TObject);
begin
  LockValueBitBtnClick(Sender);
end;

procedure TMainForm.ApplicationEvents1Hint(Sender: TObject);
begin
  RzStatusPane1.Caption:= Application.Hint;  
end;

procedure TMainForm.archivingClick(Sender: TObject);
begin
  ArchivingForm:=TArchivingForm.Create(Application);
  ArchivingForm.Show;
end;

procedure TMainForm.RzEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = 13 then
    RzBitBtn1Click(Sender);
end;

procedure TMainForm.RzGlyphStatus1Click(Sender: TObject);
begin
  if not TemperatureForm.Visible then TemperatureForm.Show;
end;

procedure TMainForm.RzGlyphStatus2Click(Sender: TObject);
begin
  AdvToolBarButton36Click(Sender);
end;

procedure TMainForm.RzBitBtn1Click(Sender: TObject);
begin
  if (RzEdit1.Text <> '') and ExpCreated then
      begin
        Experiment.AddToLog(WideString(RzEdit1.Text), $000147EB);
        RzEdit1.Clear;
      end;
end;

procedure TMainForm.QuantumM1EditChange(Sender: TObject);
begin
  RzBitBtn4.Enabled:=True;
end;

procedure TMainForm.RzBitBtn4Click(Sender: TObject);
begin
  Experiment.Quantum1:=QuantumM1Edit.Value;

  Experiment.StepsToQuaA:=Round(Experiment.Quantum1 / Experiment.VolPerStepA);
  Experiment.ListCh[0].StepsToQuaA:=Experiment.StepsToQuaA;

  RegIniFile.WriteFloat('Exp', 'Quantum1', Experiment.Quantum1);

  if (Experiment.ListCh[0].DownEventTime > EncodeTime(0, 0, Edit1.IntValue, 0)) then
      begin
        if Experiment.StartExp then Experiment.ListCh[0].ReBildDownBff:=True;
      end;

  Experiment.DownEventTime1:=EncodeTime(0, 0, Edit1.IntValue, 0);
  Experiment.MixEventTime1:=EncodeTime(0, 0, RzSpinEdit1.IntValue, 0);

  Experiment.ListCh[0].DownEventTime:=Experiment.DownEventTime1;
  Experiment.ListCh[0].MixEventTime:=Experiment.MixEventTime1;

  RegIniFile.WriteFloat('Exp', 'DownTA', Experiment.DownEventTime1);
  RegIniFile.WriteFloat('Exp', 'MixTA', Experiment.MixEventTime1);

  Config.IntervalBetweenStepsM1:=IntervalBetweenStepsM1Edit.IntValue;
  RegIniFile.WriteInteger('Motor1Settings', 'IntervalBetweenSteps', IntervalBetweenStepsM1Edit.IntValue);

  Experiment.M1Interval:=Config.IntervalBetweenStepsM1;
  Experiment.ListCh[0].M1Interval:=Experiment.M1Interval;

  Experiment.ThresholdA:=RzSpinEdit6.Value;
  Experiment.ListCh[0].Threshold:=Experiment.ThresholdA;
  RegIniFile.WriteFloat('Exp', 'ThresholdA', Experiment.ThresholdA);

  ////

  Experiment.Quantum2:=QuantumM2Edit.Value;
  Experiment.StepsToQuaB:=Round(Experiment.Quantum2 / Experiment.VolPerStepB);
  Experiment.ListCh[1].StepsToQuaA:=Experiment.StepsToQuaB;

  RegIniFile.WriteFloat('Exp', 'Quantum2', Experiment.Quantum2);

  if (Experiment.ListCh[1].DownEventTime > EncodeTime(0, 0, RzSpinEdit4.IntValue, 0)) then
      if Experiment.StartExp then Experiment.ListCh[1].ReBildDownBff:=True;

  Experiment.DownEventTime2:=EncodeTime(0, 0, RzSpinEdit3.IntValue, 0);
  Experiment.MixEventTime2:=EncodeTime(0, 0, RzSpinEdit4.IntValue, 0);

  Experiment.ListCh[1].DownEventTime:=Experiment.DownEventTime2;
  Experiment.ListCh[1].MixEventTime:=Experiment.MixEventTime2;

  RegIniFile.WriteFloat('Exp', 'DownTB', Experiment.DownEventTime2);
  RegIniFile.WriteFloat('Exp', 'MixTB', Experiment.MixEventTime2);

  Config.IntervalBetweenStepsM2:=IntervalBetweenStepsM2Edit.IntValue;
  RegIniFile.WriteInteger('Motor2Settings', 'IntervalBetweenSteps', IntervalBetweenStepsM2Edit.IntValue);
  Experiment.M2Interval:=Config.IntervalBetweenStepsM2;

  Experiment.ListCh[1].M1Interval:=Experiment.M2Interval;

  Experiment.ThresholdB:=RzSpinEdit7.Value;
  RegIniFile.WriteFloat('Exp', 'ThresholdB', Experiment.ThresholdB);
  Experiment.ListCh[1].Threshold:=Experiment.ThresholdB;

  RzBitBtn4.Enabled:=False;
end;

procedure TMainForm.RzCheckBox1Click(Sender: TObject);
begin
  Experiment.ListCh[0].InjActive:=RzCheckBox1.Checked;
  M1StatusPane.Enabled:=RzCheckBox1.Checked;
  if RzCheckBox1.Checked then
      AdvCircularProgress1.Appearance.InActiveSegmentColor:=clSilver
    else
      AdvCircularProgress1.Appearance.InActiveSegmentColor:=$00A00000;
end;

procedure TMainForm.RzCheckBox2Click(Sender: TObject);
begin
  Experiment.ListCh[1].InjActive:=RzCheckBox2.Checked;
  M2StatusPane.Enabled:=RzCheckBox2.Checked;
  if RzCheckBox2.Checked then
      AdvCircularProgress2.Appearance.InActiveSegmentColor:=clSilver
    else
      AdvCircularProgress2.Appearance.InActiveSegmentColor:=$00A00000;
end;

procedure TMainForm.RzSpinButtons1DownLeftClick(Sender: TObject);
begin
  ChartA.Zoom.Direction:=tzdVertical;
  ChartA.ZoomPercent(95);
  ChartA.Zoom.Direction:=tzdBoth;
end;

procedure TMainForm.RzSpinButtons1UpRightClick(Sender: TObject);
begin
  ChartA.Zoom.Direction:=tzdVertical;
  ChartA.ZoomPercent(105);
  ChartA.Zoom.Direction:=tzdBoth;
end;

procedure TMainForm.RzSpinButtons2DownLeftClick(Sender: TObject);
begin
  ChartA.Zoom.Direction:=tzdHorizontal;
  ChartA.ZoomPercent(90);
  ChartA.Zoom.Direction:=tzdBoth;
end;

procedure TMainForm.RzSpinButtons2UpRightClick(Sender: TObject);
begin
  ChartA.Zoom.Direction:=tzdHorizontal;
  ChartA.ZoomPercent(110);
  ChartA.Zoom.Direction:=tzdBoth;
end;

procedure TMainForm.VolumChartABeforeDrawChart(Sender: TObject);
var
  i : Integer;
begin
  if not Experiment.ExpLoading then
    begin
      try
        if Experiment.StartChCount > 0 then
            begin
              for i:=0 to Experiment.StartChCount - 1 do
                begin
                  with TColorLineTool(VolumChartA.FindComponent('StartCh' + IntToStr(i))) do
                    begin
                      if (Value > VolumChartA.BottomAxis.Minimum) and (Value < VolumChartA.BottomAxis.Maximum) then
                          Active:=True
                        else
                          Active:=False;
                    end;
                end;
            end;
      finally end;

      try
        if Experiment.EndChCount > 0 then
            begin
              for i:=0 to Experiment.EndChCount - 1 do
                begin
                  with TColorLineTool(VolumChartA.FindComponent('EndCh' + IntToStr(i))) do
                    begin
                      if (Value > VolumChartA.BottomAxis.Minimum) and (Value < VolumChartA.BottomAxis.Maximum) then
                          Active:=True
                        else
                          Active:=False;
                    end;
                end;
            end;
      finally end;

      try
        if Experiment.LChCount > 0 then
            begin
              for i:=0 to Experiment.LChCount - 1 do
                begin
                  with TColorLineTool(VolumChartA.FindComponent('LCh' + IntToStr(i))) do
                    begin
                      if (Value > VolumChartA.BottomAxis.Minimum) and (Value < VolumChartA.BottomAxis.Maximum) then
                          Active:=True
                        else
                          Active:=False;
                    end;
                end;
            end;
      finally end;
    end;
end;

procedure TMainForm.VolumChartAResize(Sender: TObject);
begin
  RzSpinButtons3.Top:=(VolumChartA.Height div 2) - 22;
  RzSpinButtons4.Top:=VolumChartA.Height - 15;

  if not ChartTool5.Active then RzToolButton1.Visible:=False;
end;

procedure TMainForm.VolumChartAUndoZoom(Sender: TObject);
begin
  UndoZoomToolBarButtonA.Enabled:=False;
end;

procedure TMainForm.VolumChartAZoom(Sender: TObject);
begin
  UndoZoomToolBarButtonA.Enabled:=True;
end;

procedure TMainForm.VolumChartBBeforeDrawChart(Sender: TObject);
var
  i : Integer;
begin
  if not Experiment.ExpLoading then
    begin
      try
        if Experiment.StartChCount > 0 then
            begin
              for i:=0 to Experiment.StartChCount - 1 do
                begin
                  with TColorLineTool(VolumChartB.FindComponent('StartCh' + IntToStr(i))) do
                    begin
                      if (Value > VolumChartB.BottomAxis.Minimum) and (Value < VolumChartB.BottomAxis.Maximum) then
                          Active:=True
                        else
                          Active:=False;
                    end;
                end;
            end;
      finally end;

      try
        if Experiment.EndChCount > 0 then
            begin
              for i:=0 to Experiment.EndChCount - 1 do
                begin
                  with TColorLineTool(VolumChartB.FindComponent('EndCh' + IntToStr(i))) do
                    begin
                      if (Value > VolumChartB.BottomAxis.Minimum) and (Value < VolumChartB.BottomAxis.Maximum) then
                          Active:=True
                        else
                          Active:=False;
                    end;
                end;
            end;
      finally end;

      try
        if Experiment.LChCount > 0 then
            begin
              for i:=0 to Experiment.LChCount - 1 do
                begin
                  with TColorLineTool(VolumChartB.FindComponent('LCh' + IntToStr(i))) do
                    begin
                      if (Value > VolumChartB.BottomAxis.Minimum) and (Value < VolumChartB.BottomAxis.Maximum) then
                          Active:=True
                        else
                          Active:=False;
                    end;
                end;
            end;
      finally end;
    end;
end;

procedure TMainForm.VolumChartBResize(Sender: TObject);
begin
  RzSpinButtons5.Top:=(VolumChartB.Height div 2) - 22;
  RzSpinButtons6.Top:=VolumChartB.Height - 15;

  if not FullScreenTool2.Active then RzToolButton2.Visible:=False;
end;

procedure TMainForm.VolumChartBUndoZoom(Sender: TObject);
begin
  UndoZoomToolBarButtonB.Enabled:=False;
end;

procedure TMainForm.VolumChartBZoom(Sender: TObject);
begin
  UndoZoomToolBarButtonB.Enabled:=True;
end;

procedure TMainForm.ChartABeforeDrawChart(Sender: TObject);
var
  i : integer;
begin
  if not Experiment.ExpLoading then
    begin
      try
        if Experiment.ListCh[0].LineCount > 0 then
            begin
              for i:=0 to Experiment.ListCh[0].LineCount - 1 do
                begin
                  with TColorLineTool(ChartA.FindComponent('Line' + IntToStr(i))) do
                    begin
                      if (Value > ChartA.BottomAxis.Minimum) and (Value < ChartA.BottomAxis.Maximum) then
                          begin
                            if ShowLineA then
                                begin
                                  Active:=True;
                                end
                              else
                                begin
                                  Active:=False;
                                end;
                          end
                        else
                          Active:=False;
                    end;
                end;
            end;
      finally end;

      try
        if Experiment.StartChCount > 0 then
            begin
              for i:=0 to Experiment.StartChCount - 1 do
                begin
                  with TColorLineTool(ChartA.FindComponent('StartCh' + IntToStr(i))) do
                    begin
                      if (Value > ChartA.BottomAxis.Minimum) and (Value < ChartA.BottomAxis.Maximum) then
                          Active:=True
                        else
                          Active:=False;
                    end;
                end;
            end;
      finally end;

      try
        if Experiment.EndChCount > 0 then
            begin
              for i:=0 to Experiment.EndChCount - 1 do
                begin
                  with TColorLineTool(ChartA.FindComponent('EndCh' + IntToStr(i))) do
                    begin
                      if (Value > ChartA.BottomAxis.Minimum) and (Value < ChartA.BottomAxis.Maximum) then
                          Active:=True
                        else
                          Active:=False;
                    end;
                end;
            end;
      finally end;

      try
        if Experiment.LChCount > 0 then
            begin
              for i:=0 to Experiment.LChCount - 1 do
                begin
                  with TColorLineTool(ChartA.FindComponent('LCh' + IntToStr(i))) do
                    begin
                      if (Value > ChartA.BottomAxis.Minimum) and (Value < ChartA.BottomAxis.Maximum) then
                          Active:=True
                        else
                          Active:=False;
                    end;
                end;
            end;
      finally end;
    end;
end;

procedure TMainForm.ChartAResize(Sender: TObject);
begin
  RzSpinButtons1.Top:=(ChartA.Height div 2) - 22;
  RzSpinButtons2.Top:=ChartA.Height - 15;

  if not FullScreenToolA.Active then RzToolButton3.Visible:=False;
end;

procedure TMainForm.ChartAUndoZoom(Sender: TObject);
begin
  AdvToolBarButton6.Enabled:=False;
end;

procedure TMainForm.ChartAZoom(Sender: TObject);
begin
  AdvToolBarButton6.Enabled:=True;
end;

procedure TMainForm.ChartBBeforeDrawChart(Sender: TObject);
var
  i : integer;
begin
  if not Experiment.ExpLoading then
    begin
      try
        if Experiment.ListCh[1].LineCount > 0 then
            begin
              for i:=0 to Experiment.ListCh[1].LineCount - 1 do
                begin
                  with TColorLineTool(ChartB.FindComponent('Line' + IntToStr(i))) do
                    begin
                      if (Value > ChartB.BottomAxis.Minimum) and (Value < ChartB.BottomAxis.Maximum) then
                          begin
                            if ShowLineB then
                                begin
                                  Active:=True;
                                end
                              else
                                begin
                                  Active:=False;
                                end;
                          end
                        else
                          Active:=False;
                    end;
                end;
            end;
      finally end;

      try
        if Experiment.StartChCount > 0 then
            begin
              for i:=0 to Experiment.StartChCount - 1 do
                begin
                  with TColorLineTool(ChartB.FindComponent('StartCh' + IntToStr(i))) do
                    begin
                      if (Value > ChartB.BottomAxis.Minimum) and (Value < ChartB.BottomAxis.Maximum) then
                          Active:=True
                        else
                          Active:=False;
                    end;
                end;
            end;
      finally end;

      try
        if Experiment.EndChCount > 0 then
            begin
              for i:=0 to Experiment.EndChCount - 1 do
                begin
                  with TColorLineTool(ChartB.FindComponent('EndCh' + IntToStr(i))) do
                    begin
                      if (Value > ChartB.BottomAxis.Minimum) and (Value < ChartB.BottomAxis.Maximum) then
                          Active:=True
                        else
                          Active:=False;
                    end;
                end;
            end;
      finally end;

      try
        if Experiment.LChCount > 0 then
            begin
              for i:=0 to Experiment.LChCount - 1 do
                begin
                  with TColorLineTool(ChartB.FindComponent('LCh' + IntToStr(i))) do
                    begin
                      if (Value > ChartB.BottomAxis.Minimum) and (Value < ChartB.BottomAxis.Maximum) then
                          Active:=True
                        else
                          Active:=False;
                    end;
                end;
            end;
      finally end;
    end;
end;

procedure TMainForm.ChartBResize(Sender: TObject);
begin
  RzSpinButtons7.Top:=(ChartB.Height div 2) - 22;
  RzSpinButtons8.Top:=ChartB.Height - 15;

  if not FullScreenToolB.Active then RzToolButton4.Visible:=False;
end;

procedure TMainForm.ChartBUndoZoom(Sender: TObject);
begin
  AdvToolBarButton17.Enabled:=False;
end;

procedure TMainForm.ChartBZoom(Sender: TObject);
begin
  AdvToolBarButton17.Enabled:=True;
end;

procedure TMainForm.IntervalBetweenStepsM1EditChange(Sender: TObject);
begin
  RzBitBtn4.Enabled:=True;
end;

procedure TMainForm.RzSpinButtons7DownLeftClick(Sender: TObject);
begin
  ChartB.Zoom.Direction:=tzdVertical;
  ChartB.ZoomPercent(95);
  ChartB.Zoom.Direction:=tzdBoth;
end;

procedure TMainForm.RzSpinButtons7UpRightClick(Sender: TObject);
begin
  ChartB.Zoom.Direction:=tzdVertical;
  ChartB.ZoomPercent(105);
  ChartB.Zoom.Direction:=tzdBoth;
end;

procedure TMainForm.RzSpinButtons8DownLeftClick(Sender: TObject);
begin
  ChartB.Zoom.Direction:=tzdHorizontal;
  ChartB.ZoomPercent(95);
  ChartB.Zoom.Direction:=tzdBoth;
end;

procedure TMainForm.RzSpinButtons8UpRightClick(Sender: TObject);
begin
  ChartB.Zoom.Direction:=tzdHorizontal;
  ChartB.ZoomPercent(105);
  ChartB.Zoom.Direction:=tzdBoth;
end;

procedure TMainForm.RzSpinEdit2Change(Sender: TObject);
begin
  ChSolTime:=Round(RzSpinEdit2.Value * 60);
  RegIniFile.WriteInteger('Solution', 'Time', ChSolTime);
end;

procedure TMainForm.RzSpinButtons3DownLeftClick(Sender: TObject);
begin
  VolumChartA.Zoom.Direction:=tzdVertical;
  VolumChartA.ZoomPercent(95);
  VolumChartA.Zoom.Direction:=tzdBoth;
end;

procedure TMainForm.RzSpinButtons3UpRightClick(Sender: TObject);
begin
  VolumChartA.Zoom.Direction:=tzdVertical;
  VolumChartA.ZoomPercent(105);
  UndoZoomToolBarButtonA.Enabled:=True;
  VolumChartA.Zoom.Direction:=tzdBoth;
end;

procedure TMainForm.RzSpinButtons4DownLeftClick(Sender: TObject);
begin
  VolumChartA.Zoom.Direction:=tzdHorizontal;
  VolumChartA.ZoomPercent(95);
  VolumChartA.Zoom.Direction:=tzdBoth;
end;

procedure TMainForm.RzSpinButtons4UpRightClick(Sender: TObject);
begin
  VolumChartA.Zoom.Direction:=tzdHorizontal;
  VolumChartA.ZoomPercent(105);
  VolumChartA.Zoom.Direction:=tzdBoth;
end;

procedure TMainForm.RzSpinButtons5DownLeftClick(Sender: TObject);
begin
  VolumChartB.Zoom.Direction:=tzdVertical;
  VolumChartB.ZoomPercent(95);
  VolumChartB.Zoom.Direction:=tzdBoth;
end;

procedure TMainForm.RzSpinButtons5UpRightClick(Sender: TObject);
begin
  VolumChartB.Zoom.Direction:=tzdVertical;
  VolumChartB.ZoomPercent(105);
  VolumChartB.Zoom.Direction:=tzdBoth;
end;

procedure TMainForm.RzSpinButtons6DownLeftClick(Sender: TObject);
begin
  VolumChartB.Zoom.Direction:=tzdHorizontal;
  VolumChartB.ZoomPercent(95);
  VolumChartB.Zoom.Direction:=tzdBoth;
end;

procedure TMainForm.RzSpinButtons6UpRightClick(Sender: TObject);
begin
  VolumChartB.Zoom.Direction:=tzdHorizontal;
  VolumChartB.ZoomPercent(105);
  VolumChartB.Zoom.Direction:=tzdBoth;
end;

procedure TMainForm.HelpClick(Sender: TObject);
begin
  RzLauncher1.Launch;
end;

procedure TMainForm.RzBitBtn2Click(Sender: TObject);
begin
  if not ComPort1.Connected then
      begin
        TaskDialog.Content:=' Прибор не подключен!';
        TaskDialog.Icon:=tiError;
        TaskDialog.CommonButtons:=[cbOK];
        TaskDialog.Execute;
        TaskDialog.CommonButtons:=[cbYes,cbNo];
        Exit;
      end;

  TaskDialog.Content:=' Начать заполнение?';
  TaskDialog.CommonButtons:=[cbYes,cbNo];
  TaskDialog.Icon:=tiShield;
  if TaskDialog.Execute = 6 then
      begin
        RefuellingForm:=TRefuellingForm.Create(Application);
        RefuellingForm.Motor:=0;
        RefuellingForm.ShowModal;
        FreeAndNil(RefuellingForm);
      end;
end;

procedure TMainForm.RzBitBtn3Click(Sender: TObject);
begin
  if not ComPort1.Connected then
      begin
        TaskDialog.Content:=' Прибор не подключен!';
        TaskDialog.Icon:=tiError;
        TaskDialog.CommonButtons:=[cbOK];
        TaskDialog.Execute;
        TaskDialog.CommonButtons:=[cbYes,cbNo];
        Exit;
      end;

  TaskDialog.Content:=' Начать заполнение?';
  TaskDialog.CommonButtons:=[cbYes,cbNo];
  TaskDialog.Icon:=tiShield;
  if TaskDialog.Execute = 6 then
      begin
        RefuellingForm:=TRefuellingForm.Create(Application);
        RefuellingForm.Motor:=1;
        RefuellingForm.ShowModal;
        FreeAndNil(RefuellingForm);
      end;
end;

procedure TMainForm.MailThreadRun(Sender: TIdThreadComponent);
begin
    if sendMail('ATDProgramm@gmail.com', 'ATDProgramm@gmail.com',
             'ATDProgramm@gmail.com', 'ATDProgramm@gmail.com',
             'Bugs report', 'Bugs report',
             JvDebugHandler1.LogFileName, True) = 0 then
      begin
        DeleteFile(JvDebugHandler1.LogFileName);
        SendBugsR.Enabled:=False;
      end;

  MailThread.Stop;
end;

procedure TMainForm.MainToolBarResize(Sender: TObject);
begin
  AdvToolBar1.Left:=MainToolBar.Width;
end;

procedure TMainForm.MenuItem1Click(Sender: TObject);
begin
  MenuItem1 .Checked:=True;
  N30       .Checked:=False;
  N210      .Checked:=False;

  VolumChartA.UndoZoom;
  UndoZoomToolBarButtonA.Enabled:=False;

  DifVol2SeriesA.Active:=False;
  //PointDif2VolSeriesA.Active:=False;
  DifVSeriesA.Active:=False;
  VolumSeriesA.Active:=True;
  //PointDifVolSeriesA.Active:=False;
  PGlyphStatusA.Caption:='sum Vol';
  VolumPaneA.Caption:=FloatToStrF(Experiment.ListCh[0].SumVolum, ffFixed, 6, 4) + ' ml';
end;

procedure TMainForm.MenuItem2Click(Sender: TObject);
begin
  MenuItem2.Checked:=True;
  MenuItem3.Checked:=False;
  MenuItem4.Checked:=False;

  VolumChartB.UndoZoom;
  UndoZoomToolBarButtonB.Enabled:=False;

  DifVol2SeriesB.Active:=False;
  //PointDif2VolSeriesB.Active:=False;
  DifVSeriesB.Active:=False;
  VolumSeriesB.Active:=True;
  //PointDifVolSeriesB.Active:=False;
  PGlyphStatusB.Caption:='sum Vol';
  VolumPaneB.Caption:=FloatToStrF(Experiment.ListCh[1].SumVolum, ffFixed, 6, 4) + ' ml';
end;

procedure TMainForm.MenuItem3Click(Sender: TObject);
begin
  MenuItem2.Checked:=False;
  MenuItem3.Checked:=True;
  MenuItem4.Checked:=False;

  VolumChartB.UndoZoom;
  UndoZoomToolBarButtonB.Enabled:=False;

  VolumSeriesB.Active:=False;

  DifVSeriesB.Active:=True;
  //PointDifVolSeriesB.Active:=True;

  DifVol2SeriesB.Active:=False;
  //PointDif2VolSeriesB.Active:=False;

  PGlyphStatusB.Caption:='df K';
  VolumPaneB.Caption:=FloatToStrF(Experiment.ListCh[1].DifVolum, ffFixed, 6, 4){ + ' ml/min'};
end;

procedure TMainForm.MenuItem4Click(Sender: TObject);
begin
  MenuItem2.Checked:=False;
  MenuItem3.Checked:=False;
  MenuItem4.Checked:=True;

  VolumChartB.UndoZoom;
  UndoZoomToolBarButtonB.Enabled:=False;

  VolumSeriesB.Active:=False;

  DifVSeriesB.Active:=False;
  //PointDifVolSeriesB.Active:=False;

  DifVol2SeriesB.Active:=True;
  //PointDif2VolSeriesB.Active:=True;

  PGlyphStatusB.Caption:='df K 2';
  VolumPaneB.Caption:=FloatToStrF(Experiment.ListCh[1].Dif2Volum, ffFixed, 6, 4){ + ' ml/min'};
end;

procedure TMainForm.SendBugsRClick(Sender: TObject);
begin
  MailThread.Start;
end;

procedure TMainForm.RzTrayIcon1RestoreApp(Sender: TObject);
begin
  RzTrayIcon1.HideOnMinimize:=False;
end;

procedure TMainForm.N14Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.N110Click(Sender: TObject);
begin
  RzBitBtn2Click(Sender);
end;

procedure TMainForm.N12Click(Sender: TObject);
begin
  RzTrayIcon1.RestoreApp;
end;

procedure TMainForm.FlowExpMClick(Sender: TObject);
begin
  FlowExpForm:=TFlowExpForm.Create(Application);
  FlowExpForm.ShowModal;
end;

procedure TMainForm.F1Click(Sender: TObject);
begin
  AdvToolBarButton28Click(Sender);
end;

procedure TMainForm.FlowExpButtonClick(Sender: TObject);
begin
  FlowExpMClick(Sender);
end;

procedure TMainForm.ChangeSBitBtnClick(Sender: TObject);
begin
  if  ChangeSolutionForm = nil then
      begin
        ChangeSolutionForm:=TChangeSolutionForm.Create(Application);
      end;

  Experiment.Changing:=True;
  ChangeSolutionForm.ShowModal;
  Experiment.Changing:=False; 
end;

procedure TMainForm.ChSolThreadRun(Sender: TIdThreadComponent);
var
  i,
  min,
  sec,
  Crr,
  Frr       : Integer;

  label TermCh;
begin
  Frr:=ChSolTime + 33;
  Crr:=0;

  try
    begin
      if Experiment.StartExp then Experiment.AddToLog(WideString('Замена раствора [' + IntToStr(Experiment.StartChCount + 1) + ']'), clPurple);

      Experiment.StartChanging;

      ChangeSolutionForm.RzGlyphStatus1.ImageIndex:=4;
      ComPortWriteStr(AnsiString('*A' + IntToStr(0) +'1'+#13));
      ChangeSolutionForm.RzGlyphStatus1.ImageIndex:=0;

      ChangeSolutionForm.RzGlyphStatus2.ImageIndex:=4;
      for i:=15 downto 0 do
        begin
          if not (Experiment.StartExp and Experiment.Changing) then GoTo TermCh;
          ChangeSolutionForm.RzGlyphStatus2.Caption:='Ожидание [' + IntToStr(i) + ' сек.]';
          sleep(1000);
          inc(Crr);
          ChangeSolutionForm.RzProgressBar1.Percent:=Round((Crr / Frr) * 100);
          MainForm.dwTaskbarProgressIndicator1.Position:=ChangeSolutionForm.RzProgressBar1.Percent;
        end;
      ChangeSolutionForm.RzGlyphStatus2.Caption:='Ожидание ...';
      ChangeSolutionForm.RzGlyphStatus2.ImageIndex:=0;

      ComPortWriteStr(AnsiString('*A' + IntToStr(1) +'1'+#13));
      ChangeSolutionForm.RzGlyphStatus3.ImageIndex:=4;
      for i:= ChSolTime downto 0 do
        begin
          if not (Experiment.StartExp and Experiment.Changing) then GoTo TermCh;

          min:=i div 60;
          sec:=i - min * 60;

          if min = 0 then
              ChangeSolutionForm.RzGlyphStatus3.Caption:='Добавление раствора [' + IntToStr(sec) + ' сек.]'
            else
              ChangeSolutionForm.RzGlyphStatus3.Caption:='Добавление раствора [' + IntToStr(min) + ' мин., ' + IntToStr(sec) + ' сек.]';
          sleep(1000);

          inc(Crr);
          ChangeSolutionForm.RzProgressBar1.Percent:=Round((Crr / Frr) * 100);
          MainForm.dwTaskbarProgressIndicator1.Position:=ChangeSolutionForm.RzProgressBar1.Percent;
        end;
      ChangeSolutionForm.RzGlyphStatus3.Caption:='Добавление раствора ...';
      ChangeSolutionForm.RzGlyphStatus3.ImageIndex:=0;

      ComPortWriteStr(AnsiString('*A' + IntToStr(1) +'0'+#13));

      ChangeSolutionForm.RzGlyphStatus4.ImageIndex:=4;
      for i:=15 downto 0 do
        begin
          if not (Experiment.StartExp and Experiment.Changing) then GoTo TermCh;
          ChangeSolutionForm.RzGlyphStatus4.Caption:='Ожидание [' + IntToStr(i) + ' сек.]';
          sleep(1000);

          inc(Crr);
          ChangeSolutionForm.RzProgressBar1.Percent:=Round((Crr / Frr) * 100);
          MainForm.dwTaskbarProgressIndicator1.Position:=ChangeSolutionForm.RzProgressBar1.Percent;
        end;
      ChangeSolutionForm.RzGlyphStatus4.Caption:='Ожидание ...';
      ChangeSolutionForm.RzGlyphStatus4.ImageIndex:=0;

      ChangeSolutionForm.RzGlyphStatus5.ImageIndex:=4;
      ComPortWriteStr(AnsiString('*A' + IntToStr(0) +'0'+#13));
      ChangeSolutionForm.RzGlyphStatus5.ImageIndex:=0;
    end;

    if Experiment.StartExp then Experiment.AddToLog(WideString('Замена раствора завершена [' + IntToStr(Experiment.EndChCount + 1) + ']'), $00C08000);
    xSay('Замена раствора завершена.');

    TermCh:

  finally
    Experiment.ListCh[0].CheckBeforeChanging;
    Experiment.ListCh[1].CheckBeforeChanging;

    ComPortWriteStr(AnsiString('*A' + IntToStr(0) +'0'+#13));
    ComPortWriteStr(AnsiString('*A' + IntToStr(1) +'0'+#13));

    ChangeSolutionForm.RzGlyphStatus1.ImageIndex:=6;
    ChangeSolutionForm.RzGlyphStatus2.ImageIndex:=6;
    ChangeSolutionForm.RzGlyphStatus3.ImageIndex:=6;
    ChangeSolutionForm.RzGlyphStatus4.ImageIndex:=6;
    ChangeSolutionForm.RzGlyphStatus5.ImageIndex:=6;

    Experiment.EndChanging;

    ChangeSolutionForm.RzProgressBar1.Percent:=0;
    ChangeSolutionForm.Close;

    ChSolThread.Stop;
  end;
end;

procedure TMainForm.RzRapidFireButton1Click(Sender: TObject);
begin
  beep;
end;

procedure TMainForm.AdvToolBarButton3Click(Sender: TObject);
begin
  if not ComPort1.Connected then
      begin
        TaskDialog.Content:=' Прибор не подключен!';
        TaskDialog.Icon:=tiError;
        TaskDialog.CommonButtons:=[cbOK];
        TaskDialog.Execute;
        TaskDialog.CommonButtons:=[cbYes,cbNo];
        Exit;
      end;

  if Experiment.StartExp then
      begin
        TaskDialog.Content:=' Во время эксперимента калибровка невозможна!';
        TaskDialog.Icon:=tiShield;
        TaskDialog.CommonButtons:=[cbOK];
        TaskDialog.Execute;
        TaskDialog.CommonButtons:=[cbYes,cbNo];
      end
    else
      begin
        pHCalibrationForm:=TpHCalibrationForm.Create(Application);
        pHCalibrationForm.ShowModal;
        FreeAndNil(pHCalibrationForm);
      end;
end;

procedure TMainForm.AdvToolBarButton40Click(Sender: TObject);
var
  chg : integer;
begin
  TempPCount:=Experiment.ListCh[0].TrendPC;
  chg:=TempPCount;

  PCountForm:=TPCountForm.Create(Application);
  try
    PCountForm.ShowModal;

    if chg <> TempPCount then
        begin
          Experiment.ListCh[0].TrendPC:=TempPCount;
          Experiment.ListCh[0].ReBuildDifSer(False);
        end;
  finally
    FreeAndNil(PCountForm);
  end;
end;

procedure TMainForm.AdvToolBarButton41Click(Sender: TObject);
var
  chg : integer;
begin
  TempPCount:=Experiment.ListCh[1].TrendPC;
  chg:=TempPCount;

  PCountForm:=TPCountForm.Create(Application);
  try
    PCountForm.ShowModal;

    if chg <> TempPCount then
        begin
          Experiment.ListCh[1].TrendPC:=TempPCount;
          Experiment.ListCh[1].ReBuildDifSer(False);
        end;
  finally
    FreeAndNil(PCountForm);
  end;
end;

procedure TMainForm.AdvToolBarButton42Click(Sender: TObject);
begin
  ViewForm:=TViewForm.Create(Application);
  ViewForm.ShowModal;
  FreeAndNil(ViewForm);
end;

procedure TMainForm.AdvToolBarButton43Click(Sender: TObject);
begin
  Experiment.AddLabel(ClGreen);
  Experiment.AddToLog('Метка (G)', clBlack);
end;

procedure TMainForm.AdvToolBarButton44Click(Sender: TObject);
begin
  Experiment.AddLabel(ClYellow);
  Experiment.AddToLog('Метка (Y)', clBlack);
end;

procedure TMainForm.AdvToolBarButton45Click(Sender: TObject);
begin
  N37Click(Sender);
end;

procedure TMainForm.AdvToolBarButton46Click(Sender: TObject);
begin
  if AdvToolBarButton46.ImageIndex = 3 then
      begin
        AdvToolBarButton46.ImageIndex:=5;
        StTimerClock:=Now;
        TimerClock.Enabled:=True;
      end
    else
      begin
        AdvToolBarButton46.ImageIndex:=3;
        TimerClock.Enabled:=False;
      end
end;

procedure TMainForm.AdvToolBarButton4Click(Sender: TObject);
begin
  ChartA.ZoomPercent(120);
end;

procedure TMainForm.AdvToolBarButton5Click(Sender: TObject);
begin
  ChartA.ZoomPercent(80);
end;

procedure TMainForm.AdvToolBarButton6Click(Sender: TObject);
begin
  ChartA.UndoZoom;
  AdvToolBarButton6.Enabled:=False;
end;

procedure TMainForm.LeftScrollAClick(Sender: TObject);
begin
  HorizScroll(ChartA, 10);
  AdvToolBarButton6.Enabled:=True;
end;

procedure TMainForm.AdvToolBarButton8Click(Sender: TObject);
begin
  HorizScroll(ChartA, -10);
  AdvToolBarButton6.Enabled:=True;
end;

procedure TMainForm.AdvToolBarButton9Click(Sender: TObject);
begin
  VertScroll(ChartA, -10);
  AdvToolBarButton6.Enabled:=True;
end;

procedure TMainForm.AdvToolBarButton11Click(Sender: TObject);
begin
  FullScreenToolA.Active:=True;
  RzSpinButtons1.Top:=(ChartA.Height div 2) - 22;
  RzSpinButtons2.Top:=ChartA.Height - 15;

  RzToolButton3.Top:=Capt1.Top + Capt1.Height + 9;
  RzToolButton3.Left:=ChartA.Width - RzToolButton3.Width - 3;

  RzToolButton3.Visible:=True;
end;

procedure TMainForm.AdvToolBarButton13Click(Sender: TObject);
begin
  if Experiment.Explength >  Experiment.FiveMinut then
      With ChartA.BottomAxis do
        SetMinMax(HourSpan(MainForm.Experiment.Explength, 0) - Experiment.xFiveMinut,
                  HourSpan(MainForm.Experiment.Explength, 0));
end;

procedure TMainForm.AdvToolBarButton14Click(Sender: TObject);
begin
  if not ComPort1.Connected then
      begin
        TaskDialog.Content:=' Прибор не подключен!';
        TaskDialog.Icon:=tiError;
        TaskDialog.CommonButtons:=[cbOK];
        TaskDialog.Execute;
        TaskDialog.CommonButtons:=[cbYes,cbNo];
        Exit;
      end;

  if Experiment.StartExp then
      begin
        TaskDialog.Content:=' Во время эксперимента калибровка невозможна!';
        TaskDialog.Icon:=tiShield;
        TaskDialog.CommonButtons:=[cbOK];
        TaskDialog.Execute;
        TaskDialog.CommonButtons:=[cbYes,cbNo];
      end
    else
      begin
        KCalForm:=TKCalForm.Create(Application);
        KCalForm.ShowModal;
        FreeAndNil(KCalForm);
      end;
end;

procedure TMainForm.AdvToolBarButton12Click(Sender: TObject);
begin
  {if Experiment.StartExp then }LockValuepH.Active:=not LockValuepH.Active;
  ShowLineA:=LockValuepH.Active;
end;

procedure TMainForm.AdvToolBarButton15Click(Sender: TObject);
begin
  ChartB.ZoomPercent(120);
end;

procedure TMainForm.AdvToolBarButton16Click(Sender: TObject);
begin
  ChartB.ZoomPercent(80);
end;

procedure TMainForm.AdvToolBarButton17Click(Sender: TObject);
begin
  ChartB.UndoZoom;
  AdvToolBarButton17.Enabled:=False;
end;

procedure TMainForm.LeftScrollBClick(Sender: TObject);
begin
  HorizScroll(ChartB, 10);
  AdvToolBarButton17.Enabled:=True;
end;

procedure TMainForm.AdvToolBarButton19Click(Sender: TObject);
begin
  HorizScroll(ChartB, -10);
  AdvToolBarButton17.Enabled:=True;
end;

procedure TMainForm.AdvToolBarButton20Click(Sender: TObject);
begin
  VertScroll(ChartB, -10);
  AdvToolBarButton17.Enabled:=True;
end;

procedure TMainForm.AdvToolBarButton25Click(Sender: TObject);
begin
  VertScroll(ChartA, 10);
  AdvToolBarButton6.Enabled:=True;
end;

procedure TMainForm.AdvToolBarButton26Click(Sender: TObject);
begin
  VertScroll(ChartB, 10);
  AdvToolBarButton17.Enabled:=True;
end;

procedure TMainForm.AdvToolBarButton23Click(Sender: TObject);
begin
  {if Experiment.StartExp then} LockValueKCI.Active:=not LockValueKCI.Active;
  ShowLineB:=LockValueKCI.Active;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  if SubmercibleSensorWarn then
    begin
      xSay('Внимание. Проверьте погруженность электродов в раствор.');
    end
  else
    begin
      Timer1.Enabled:=False;
    end;
end;

procedure TMainForm.TimerClockTimer(Sender: TObject);
var
  BetwenTime : Double;
  Hour, Min, Sec, MSec : Word;
  SHour, SMin, SSec, SMSec : String;
begin
  BetwenTime:=Now - StTimerClock;

  DecodeTime(BetwenTime, Hour, Min, Sec, MSec);

  if Min < 10 then
      SMin:='0' + IntToStr(Min)
    else
      SMin:=IntToStr(Min);

   if Sec < 10 then
      SSec:='0' + IntToStr(Sec)
    else
      SSec:=IntToStr(Sec);

  RzStatusPane6.Caption:=IntToStr(Trunc(HourSpan(BetwenTime, 0))) + ':' +
                         SMin + '.' +
                         SSec;
end;

procedure TMainForm.SchedulerTimerTimer(Sender: TObject);
var
  Tmp                   : Double;
  xTime                 : Double;
  Hour, Min, Sec, MSec  : Word;
begin
  if not JobEvent then
    begin
      if TaskList.TaskList.Count = 0 then
        begin
          SchedulerTimer.Enabled:=False;
          RzGlyphStatus2.Caption:='Нет заданий';
          RzGlyphStatus2.Enabled:=False;
          AdvToolBarButton36.Enabled:=False;
          N31.Enabled:=False;
          Exit;
        end;

      JobEvent:=True;
      RzGlyphStatus2.Enabled:=True;
      AdvToolBarButton36.Enabled:=True;
      N31.Enabled:=True;

      TimeEvent:=StrToDateTime(TaskList.TimeList[0]);

      if TaskList.TaskList[0] = 'ChSol' then StrEvent:='Замена раствора'
        else
          if TaskList.TaskList[0] = 'EndExp' then StrEvent:='Завершение эксперемента'
            else
              if TaskList.TaskList[0] = 'Shutdown' then StrEvent:='Выключение компьютера';

      StrTask:=TaskList.TaskList[0];
    end
  else
    begin
      xTime:=Now;
      Tmp:=TimeEvent - xTime;

      if Trunc(Tmp) > 0 then
          begin
            RzGlyphStatus2.Caption:=IntToStr(DaysBetween(xTime, TimeEvent)) + ' Дней ' + TimeToStr(Tmp) + ' : ' + StrEvent;
          end
        else
          RzGlyphStatus2.Caption:=TimeToStr(Tmp) + ' : ' + StrEvent;

      DecodeTime(Tmp, Hour, Min, Sec, MSec);

      if ((Hour + Sec + Trunc(Tmp)) = 0) and (Min = 1) then
          begin
            RzGlyphStatus2.Blinking:=True;
            if StrTask = 'Shutdown' then
                xSay('Внимание. Выключение компьютера через одну минуту.');
          end;

      if (Hour + Min + Sec + Trunc(Tmp)) = 0 then
        begin
          JobEvent:=False;

          RzGlyphStatus2.Blinking:=False;

          TaskList.TaskList.Delete(0);
          TaskList.TimeList.Delete(0);

          if ViewTaskForm <> nil then
              begin
                ViewTaskForm.RzListBox2.Delete(0);
              end;

          if StrTask = 'ChSol' then ChangeSBitBtnClick(Sender)
            else
              if StrTask = 'EndExp' then StopExp
                else
                  if StrTask = 'Shutdown' then
                    begin
                      InsideShutdown:=True;
                      ShutdownComputer;
                      Sleep(10);
                      Application.ProcessMessages;
                      Sleep(10);
                      Application.ProcessMessages;
                      MainForm.Close;
                    end;
        end;

    end;
end;

procedure TMainForm.TimerExpired1(Sender: TObject);      //Expired1
begin
  FRepeatTimer1.Interval := FDelay;
  try
    LeftScrollAClick(Sender);
  except
    FRepeatTimer1.Enabled := False;
  end;
end;

procedure TMainForm.TimerExpired2(Sender: TObject);      //Expired2
begin
  FRepeatTimer2.Interval := FDelay;
  try
    AdvToolBarButton8Click(Sender);
  except
    FRepeatTimer2.Enabled := False;
  end;
end;

procedure TMainForm.TimerExpired3(Sender: TObject);       //Expired3
begin
  FRepeatTimer3.Interval := FDelay;
  try
    AdvToolBarButton9Click(Sender);
  except
    FRepeatTimer3.Enabled := False;
  end;
end;

procedure TMainForm.TimerExpired4(Sender: TObject);       //Expired4
begin
  FRepeatTimer4.Interval := FDelay;
  try
    AdvToolBarButton25Click(Sender);
  except
    FRepeatTimer4.Enabled := False;
  end;
end;

procedure TMainForm.TimerExpired5(Sender: TObject);       //Expired5
begin
  FRepeatTimer5.Interval := FDelay;
  try
    LeftScrollBClick(Sender);
  except
    FRepeatTimer5.Enabled := False;
  end;
end;

procedure TMainForm.TimerExpired6(Sender: TObject);       //Expired6
begin
  FRepeatTimer6.Interval := FDelay;
  try
    AdvToolBarButton19Click(Sender);
  except
    FRepeatTimer6.Enabled := False;
  end;
end;

procedure TMainForm.TimerExpired7(Sender: TObject);       //Expired7
begin
  FRepeatTimer7.Interval := FDelay;
  try
    AdvToolBarButton20Click(Sender);
  except
    FRepeatTimer7.Enabled := False;
  end;
end;

procedure TMainForm.TimerExpired8(Sender: TObject);       //Expired8
begin
  FRepeatTimer8.Interval := FDelay;
  try
    AdvToolBarButton26Click(Sender);
  except
    FRepeatTimer8.Enabled := False;
  end;
end;

procedure TMainForm.TimerInjTimer(Sender: TObject);
begin
  if InjEmpty then
    begin
      if M1End then
          xSay('Внимание!. Закончился раствор в первом инжекторе!.');
      if M2End then
          xSay('Внимание!. Закончился раствор во втором инжекторе!.');
    end
  else
    begin
      TimerInj.Enabled:=False;
    end;
end;

procedure TMainForm.LeftScrollAMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer1 = nil then
      begin
        FRepeatTimer1:= TTimer.Create(Self);
        FRepeatTimer1.OnTimer := TimerExpired1;
      end;
  FRepeatTimer1.Interval:= FInitialDelay;
  FRepeatTimer1.Enabled:= True;
end;

procedure TMainForm.AdvToolBarButton8MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer2 = nil then
      begin
        FRepeatTimer2:= TTimer.Create(Self);
        FRepeatTimer2.OnTimer := TimerExpired2;
      end;
  FRepeatTimer2.Interval:= FInitialDelay;
  FRepeatTimer2.Enabled:= True;
end;

procedure TMainForm.AdvToolBarButton9MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer3 = nil then
      begin
        FRepeatTimer3:= TTimer.Create(Self);
        FRepeatTimer3.OnTimer := TimerExpired3;
      end;
  FRepeatTimer3.Interval:= FInitialDelay;
  FRepeatTimer3.Enabled:= True;
end;


procedure TMainForm.AdvToolBarButton25MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer4 = nil then
      begin
        FRepeatTimer4:= TTimer.Create(Self);
        FRepeatTimer4.OnTimer := TimerExpired4;
      end;
  FRepeatTimer4.Interval:= FInitialDelay;
  FRepeatTimer4.Enabled:= True;
end;

procedure TMainForm.LeftScrollBMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer5 = nil then
      begin
        FRepeatTimer5:= TTimer.Create(Self);
        FRepeatTimer5.OnTimer := TimerExpired5;
      end;
  FRepeatTimer5.Interval:= FInitialDelay;
  FRepeatTimer5.Enabled:= True;
end;

procedure TMainForm.AdvToolBarButton19MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer6 = nil then
      begin
        FRepeatTimer6:= TTimer.Create(Self);
        FRepeatTimer6.OnTimer := TimerExpired6;
      end;
  FRepeatTimer6.Interval:= FInitialDelay;
  FRepeatTimer6.Enabled:= True;
end;

procedure TMainForm.AdvToolBarButton20MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer7 = nil then
      begin
        FRepeatTimer7:= TTimer.Create(Self);
        FRepeatTimer7.OnTimer := TimerExpired7;
      end;
  FRepeatTimer7.Interval:= FInitialDelay;
  FRepeatTimer7.Enabled:= True;
end;

procedure TMainForm.AdvToolBarButton26MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer8 = nil then
      begin
        FRepeatTimer8:= TTimer.Create(Self);
        FRepeatTimer8.OnTimer := TimerExpired8;
      end;
  FRepeatTimer8.Interval:= FInitialDelay;
  FRepeatTimer8.Enabled:= True;
end;

procedure TMainForm.LeftScrollAMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer1 <> nil then
      FRepeatTimer1.Enabled := False;
end;

procedure TMainForm.AdvToolBarButton8MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer2 <> nil then
      FRepeatTimer2.Enabled := False;
end;

procedure TMainForm.AdvToolBarButton9MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer3 <> nil then
      FRepeatTimer3.Enabled := False;
end;

procedure TMainForm.AdvToolBarButton25MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer4 <> nil then
      FRepeatTimer4.Enabled := False;
end;

procedure TMainForm.LeftScrollBMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer5 <> nil then
      FRepeatTimer5.Enabled := False;
end;

procedure TMainForm.LeftSizePanelHotSpotClick(Sender: TObject);
begin
  N38.Checked:=not LeftSizePanel.HotSpotClosed;
end;

procedure TMainForm.AdvToolBarButton19MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer6 <> nil then
      FRepeatTimer6.Enabled := False;
end;

procedure TMainForm.AdvToolBarButton20MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer7 <> nil then
      FRepeatTimer7.Enabled := False;
end;

procedure TMainForm.AdvToolBarButton26MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FRepeatTimer8 <> nil then
      FRepeatTimer8.Enabled := False;
end;

procedure TMainForm.AdvToolBarButton28Click(Sender: TObject);
begin
  Experiment.AddLabel(ClPurple);
  Experiment.AddToLog('Метка (F)', clBlack);
end;

procedure TMainForm.AdvToolBarButton22Click(Sender: TObject);
begin
  FullScreenToolB.Active:=True;
  RzSpinButtons7.Top:=(ChartB.Height div 2) - 22;
  RzSpinButtons8.Top:=ChartB.Height - 15;

  RzToolButton4.Top:=Capt2.Top + Capt2.Height + 9;
  RzToolButton4.Left:=ChartB.Width - RzToolButton4.Width - 3;

  RzToolButton4.Visible:=True;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  DeallocateHWnd(FWindowHandle);
end;

procedure TMainForm.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var
  CName : String;
begin
	CName:=FindVCLWindow(MousePos).Name;

  if CName = 'ChartA' then
      begin
        Edit2.SetFocus;
        HorizScroll(ChartA, 5);
      end;

  if CName = 'ChartB' then
      begin
        Edit2.SetFocus;
        HorizScroll(ChartB, 5);
      end;
end;

procedure TMainForm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var
  CName : String;
begin
	CName:=FindVCLWindow(MousePos).Name;

  if CName = 'ChartA' then
      begin
        Edit2.SetFocus;
        HorizScroll(ChartA, -5);
      end;

  if CName = 'ChartB' then
      begin
        Edit2.SetFocus;
        HorizScroll(ChartB, -5);
      end;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  RzEdit1.Top:=RzPanel1.Height - 5 - RzEdit1.Height;
  RzBitBtn1.Top:=RzPanel1.Height - 5 - RzBitBtn1.Height;

  LogHTMListBox.Height:=RzPanel1.Height - LogHTMListBox.Top - 10 - RzEdit1.Height;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  i : integer;
begin
   for i := 0 to ParamList.Count - 1 do
    begin
      if Copy(ParamList[i], Length(ParamList[i]) - 3, 4) = '.atd' then
        begin
          OpenFile(ParamList[i]);

          Break;
        end;
    end;
end;

procedure TMainForm.OpenFile(xFile : String);
begin
  Experiment.DBFile:=xFile;

  MainForm.Caption:=MFCaption + ' [' + ExtractFileName(Experiment.DBFile) + ']';

  if StatusOpenExpForm = nil then
      StatusOpenExpForm:=TStatusOpenExpForm.Create(Application);

  StatusOpenExpForm.ShowModal;

  StartExpToolBarButton.Enabled:=False;
  ExpStart1.Enabled:=False;
  InfoExp.Enabled:=True;
  InfoExpToolBarButton.Enabled:=True;
  Print1.Enabled:=True;
  Export1.Enabled:=True;
end;

procedure TMainForm.AdvToolBarButton24Click(Sender: TObject);
begin
  if Experiment.Explength >  Experiment.FiveMinut then
      With ChartB.BottomAxis do
        SetMinMax(HourSpan(MainForm.Experiment.Explength, 0) - Experiment.xFiveMinut,
                  HourSpan(MainForm.Experiment.Explength, 0));
end;

procedure TMainForm.AdvToolBarButton31Click(Sender: TObject);
begin
  Experiment.AddLabel(ClRed);
  Experiment.AddToLog('Метка (R)', clBlack);
end;

procedure TMainForm.AdvToolBarButton34Click(Sender: TObject);
begin
  VolumChartB.UndoZoom;
  UndoZoomToolBarButtonB.Enabled:=False;

  if VolumSeriesB.Active then
      begin
        VolumSeriesB.Active:=False;
        DifVSeriesB.Active:=True;
        //PointDifVolSeriesB.Active:=True;
        PGlyphStatusB.Caption:='K';
        AdvToolBarButton34.Caption:='K -> sum Vol';
        VolumPaneB.Caption:=FloatToStrF(Experiment.ListCh[1].DifVolum, ffFixed, 6, 4){ + ' ml/min'};
      end
    else
      begin
        DifVSeriesB.Active:=False;
        VolumSeriesB.Active:=True;
        //PointDifVolSeriesB.Active:=False;
        PGlyphStatusB.Caption:='sum Vol';
        AdvToolBarButton34.Caption:='sum Vol -> K';
        VolumPaneB.Caption:=FloatToStrF(Experiment.ListCh[1].SumVolum, ffFixed, 6, 4) + ' ml';
      end;
end;

procedure TMainForm.AdvToolBarButton35Click(Sender: TObject);
begin
  if MainFindForm = nil then
      MainFindForm:=TMainFindForm.Create(Application);
  MainFindForm.Show;
end;

procedure TMainForm.AdvToolBarButton36Click(Sender: TObject);
begin
  if ViewTaskForm = nil then ViewTaskForm:=TViewTaskForm.Create(Application);

  ViewTaskForm.Visible:=not ViewTaskForm.Visible;
end;

procedure TMainForm.AdvToolBarButton37Click(Sender: TObject);
begin
  if AdvToolBarButton37.ImageIndex = 48 then
      begin
        AdvToolBarButton37.ImageIndex:= 49;
        AllowSpeech:=False;
      end
    else
      begin
        AdvToolBarButton37.ImageIndex:= 48;
        AllowSpeech:=True;
      end;
end;

procedure TMainForm.AdvToolBarButton38Click(Sender: TObject);
begin
  if AdvToolBarButton38.ImageIndex = 56 then
      begin
        AdvToolBarButton38.ImageIndex:=54;

        SeriespH.Active:=False;
        mVAS.Active:=True;

        XpHStatusPane.Caption:='mV';
        Experiment.ListCh[0].StAmV:=True;

        LockValuepH.Value:=Experiment.ListCh[0].LockValue;
      end
    else
      begin
        AdvToolBarButton38.ImageIndex:=56;

        SeriespH.Active:=True;
        mVAS.Active:=False;

        XpHStatusPane.Caption:='pH';
        Experiment.ListCh[0].StAmV:=False;

        LockValuepH.Value:=xGetpH(Experiment.ListCh[0].LockValue, Experiment.pHb, Experiment.pHK);
      end;
end;

procedure TMainForm.AdvToolBarButton39Click(Sender: TObject);
begin
  if AdvToolBarButton39.ImageIndex = 56 then
      begin
        AdvToolBarButton39.ImageIndex:=55;

        SeriesKCI.Active:=False;
        mVBS.Active:=True;

        RzStatusPane17.Caption:='C(K+) mV';
        Experiment.ListCh[1].StAmV:=True;

        LockValueKCI.Value:=Experiment.ListCh[1].LockValue;
      end
    else
      begin
        AdvToolBarButton39.ImageIndex:=56;

        SeriesKCI.Active:=True;
        mVBS.Active:=False;

        RzStatusPane17.Caption:='C(K+) mkM';
        Experiment.ListCh[1].StAmV:=False;

        LockValueKCI.Value:=Experiment.GetC(Experiment.ListCh[1].LockValue);
      end;
end;

procedure TMainForm.N16Click(Sender: TObject);
begin
  ServiceMenuForm:=TServiceMenuForm.Create(Application);
  ServiceMenuForm.ShowModal;
  FreeAndNil(ServiceMenuForm);
end;

procedure TMainForm.N17Click(Sender: TObject);
begin
  if N17.Checked then
      begin
        N17.Checked:=False;
        N18.Checked:=True;

        ChartA.BottomAxis.DateTimeFormat:='s';
        ChartB.BottomAxis.DateTimeFormat:='s';

        VolumChartA.BottomAxis.DateTimeFormat:='s';
        VolumChartB.BottomAxis.DateTimeFormat:='s';
      end
    else
      begin
        N18.Checked:=False;
        N17.Checked:=True;

        ChartA.BottomAxis.DateTimeFormat:='h:mm.ss';
        ChartB.BottomAxis.DateTimeFormat:='h:mm.ss';

        VolumChartA.BottomAxis.DateTimeFormat:='h:mm.ss';
        VolumChartB.BottomAxis.DateTimeFormat:='h:mm.ss';
      end;
end;

procedure TMainForm.N18Click(Sender: TObject);
begin
  N17Click(Sender);
end;

procedure TMainForm.N19Click(Sender: TObject);
begin
  ChartEditor1.Title:='Редактирование';


  ChartEditor1.Chart:=((Sender as TMenuItem).GetParentComponent as TAdvPopupMenu).PopupComponent as TChart;

  ChartEditor1.Series:=(((Sender as TMenuItem).GetParentComponent as TAdvPopupMenu).PopupComponent as TChart).Series[0];
  ChartEditor1.Execute;
end;

procedure TMainForm.N20Click(Sender: TObject);
begin
  if Experiment.StartExp then
      begin
        TaskDialog.Content:=' Во время эксперимента калибровка невозможна!';
        TaskDialog.Icon:=tiShield;
        TaskDialog.CommonButtons:=[cbOK];
        TaskDialog.Execute;
        TaskDialog.CommonButtons:=[cbYes,cbNo];
      end
    else
      begin
        CalInjForm:=TCalInjForm.Create(Application);
        CalInjForm.ShowModal;
        FreeAndNil(CalInjForm);
      end;
end;

procedure TMainForm.N210Click(Sender: TObject);
begin
  MenuItem1 .Checked:=False;
  N30       .Checked:=False;
  N210      .Checked:=True;

  VolumChartA.UndoZoom;
  UndoZoomToolBarButtonA.Enabled:=False;

  VolumSeriesA.Active:=False;

  DifVSeriesA.Active:=False;
  //PointDifVolSeriesA.Active:=False;

  DifVol2SeriesA.Active:=True;
  //PointDif2VolSeriesA.Active:=True;

  PGlyphStatusA.Caption:='df K 2';
  VolumPaneA.Caption:=FloatToStrF(Experiment.ListCh[0].Dif2Volum, ffFixed, 6, 4){ + ' ml/min'};
end;

procedure TMainForm.N21Click(Sender: TObject);
begin
  if Experiment.StartExp then
      begin
        TaskDialog.Content:=' Во время эксперимента невозможно изменить данные параметры!';
        TaskDialog.Icon:=tiShield;
        TaskDialog.CommonButtons:=[cbOK];
        TaskDialog.Execute;
        TaskDialog.CommonButtons:=[cbYes,cbNo];
      end
    else
      begin
        SolForm:=TSolForm.Create(Application);
        SolForm.ShowModal;
        FreeAndNil(SolForm);
      end;
end;

procedure TMainForm.N25Click(Sender: TObject);
begin
  RzBitBtn3Click(Sender);
end;

procedure TMainForm.N29Click(Sender: TObject);
begin
  ChangeSBitBtnClick(Sender);
end;

procedure TMainForm.N30Click(Sender: TObject);
begin
  MenuItem1 .Checked:=False;
  N30       .Checked:=True;
  N210      .Checked:=False;

  VolumChartA.UndoZoom;
  UndoZoomToolBarButtonA.Enabled:=False;

  VolumSeriesA.Active:=False;

  DifVSeriesA.Active:=True;
  //PointDifVolSeriesA.Active:=True;

  DifVol2SeriesA.Active:=False;
  //PointDif2VolSeriesA.Active:=False;

  PGlyphStatusA.Caption:='df K';
  VolumPaneA.Caption:=FloatToStrF(Experiment.ListCh[0].DifVolum, ffFixed, 6, 4){ + ' ml/min'};
end;

procedure TMainForm.N31Click(Sender: TObject);
begin
  AdvToolBarButton36Click(Sender);
end;

procedure TMainForm.N32Click(Sender: TObject);
begin
  //ChartEditor1.Title:='Редактирование';

  //TeeExport(Self,((Sender as TMenuItem).GetParentComponent as TAdvPopupMenu).PopupComponent as TChart);

  ChartExport.Chart:=((Sender as TMenuItem).GetParentComponent as TAdvPopupMenu).PopupComponent as TChart;

  {ChartExport.Series:=(((Sender as TMenuItem).GetParentComponent
                                as TAdvPopupMenu).PopupComponent
                                as TChart).Series[0];}

  ChartExport.Execute;
end;

procedure TMainForm.N34Click(Sender: TObject);
begin
  AdvToolBarButton42Click(Sender);
end;

procedure TMainForm.N37Click(Sender: TObject);
begin
  RzPanel3.Visible:=not RzPanel3.Visible;
  RzPanel7.Visible:=not RzPanel7.Visible;
  RzPanel5.Visible:=not RzPanel5.Visible;
  RzPanel4.Visible:=not RzPanel4.Visible;

  N37.Checked:=RzPanel4.Visible;
end;

procedure TMainForm.N38Click(Sender: TObject);
begin
  if LeftSizePanel.HotSpotClosed then
      LeftSizePanel.RestoreHotSpot
    else
      LeftSizePanel.CloseHotSpot;
  N38.Checked:=not LeftSizePanel.HotSpotClosed;
end;

procedure TMainForm.N39Click(Sender: TObject);
begin
  if RigthSizePanel.HotSpotClosed then
      RigthSizePanel.RestoreHotSpot
    else
      RigthSizePanel.CloseHotSpot;
  N39.Checked:=not RigthSizePanel.HotSpotClosed;
end;

procedure TMainForm.N40Click(Sender: TObject);
begin
  TempCalForm:=TTempCalForm.Create(Application);
  TempCalForm.ShowModal;
  FreeAndNil(TempCalForm);
end;

procedure TMainForm.N41Click(Sender: TObject);
begin
  if not TemperatureForm.Visible then TemperatureForm.Show;
end;

procedure TMainForm.N43Click(Sender: TObject);
begin
  Capt1.Visible:=not Capt1.Visible;
  Capt2.Visible:=not Capt2.Visible;
  N43.Checked:=Capt1.Visible;
end;

procedure TMainForm.N44Click(Sender: TObject);
begin
  MainToolBar.Visible:=not MainToolBar.Visible;

  N44.Checked:=RzPanel4.Visible;
end;

procedure TMainForm.RefTimerTimer(Sender: TObject);
begin
  RefTimer.Enabled:=False;
  RefuellingForm:=TRefuellingForm.Create(Application);

  if Experiment.ListCh[0].Refuelling then
      RefuellingForm.Motor:=0
    else
      RefuellingForm.Motor:=1;

  RefuellingForm.ShowModal;
  FreeAndNil(RefuellingForm);
end;

procedure TMainForm.Refuelling1ThreadRun(Sender: TIdThreadComponent);
begin
  Experiment.ListCh[0].Refuelling:=True;
  try
    While not CancelRefuelling do
      begin
        if ComPort1.Connected then
            begin
              inc(Experiment.m1);
              if Experiment.m1 > 3 then Experiment.m1:=0;

              if M1Home then CancelRefuelling:=True;

              ComPortWriteStr(AnsiString('*A' + IntToStr(6 + Experiment.m1) +'1'+#13));
            end;
        Sleep(8);
      end;
  finally
    Refuelling1Thread.Stop;
    RefuellingForm.Close;
    CancelRefuelling:=False;
    Experiment.ListCh[0].Refuelling:=False;
    BtRefStA:=False;
    //xSay('Заправка завершена.');
  end;
end;

procedure TMainForm.Refuelling2ThreadRun(Sender: TIdThreadComponent);
begin
  Experiment.ListCh[1].Refuelling:=True;
  try
    While not CancelRefuelling do
      begin
        if ComPort1.Connected then
            begin
              inc(Experiment.m2);
              if Experiment.m2 > 3 then Experiment.m2:=0;

              if M2Home then CancelRefuelling:=True;

              ComPortWriteStr(AnsiString('*A' + IntToStr(2 + Experiment.m2) +'1'+#13));
            end;
        Sleep(8);
      end;
  finally
    Refuelling2Thread.Stop;
    RefuellingForm.Close;
    CancelRefuelling:=False;
    Experiment.ListCh[1].Refuelling:=False;
    BtRefStB:=False;
    //xSay('Заправка завершена.');
  end;
end;

procedure TMainForm.RigthSizePanelHotSpotClick(Sender: TObject);
begin
  N39.Checked:=not RigthSizePanel.HotSpotClosed;
end;

procedure TMainForm.IdThreadComponent1Run(Sender: TIdThreadComponent);
var
  i : integer;

Label Term;
begin
  while not AppTerminated do
    begin
      for i:=0 to 14 do
        begin
          Sleep(1000);
          if AppTerminated then GoTo Term;
        end;

      ComPortWriteStr(AnsiString('*A' + IntToStr(0) +'1'+#13));


      for i:=0 to 8 do
        begin
          Sleep(1000);
          if AppTerminated then GoTo Term;
        end;

       ComPortWriteStr(AnsiString('*A' + IntToStr(0) +'0'+#13));

    end;

  Term:

  IdThreadComponent1.Stop;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  IdThreadComponent1.Start;
end;

procedure TMainForm.OnTmrAdd(Sender: TObject; Tmr : Double);
var
  StrTmp : String;
begin
  StrTmp:=FloatToStrF(Tmr, ffFixed,6,1);
  TemperatureForm.Caption:='Температура [' + StrTmp + ' °C]';
  RzGlyphStatus1.Caption:='t ' + StrTmp + ' °C';
end;

end.
