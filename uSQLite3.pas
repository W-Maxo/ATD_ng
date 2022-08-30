{
  Interfac-based variant of Tim Anderson's  http://www.itwriting.com/sqlitesimple.php
  Simple classes for using SQLite's exec and get_table.

  TSQLiteDatabase wraps the calls to open and close an SQLite database.
  It also wraps SQLite_exec for queries that do not return a result set

  TSQLiteTable wraps sqlite_get_table.
  It allows accessing fields by name as well as index and can step through a
  result set with the Next procedure.

  Adapted by Tim Anderson (tim@itwriting.com)
  Originally created by Pablo Pissanetzky (pablo@myhtpc.net)
  Modified and enhanced by Lukas Gebauer

  Modified by Nikolai Shokhirev (nikolai@shokhirev.com,
  http://www.shokhirev.com/nikolai.html)in order to implement the interfaces
  ISQLiteDatabase and ISQLiteTable defined in uSQLite. 2005.10.10
}
unit uSQLite3;

interface

uses
  Classes;

type

  ISQLiteTable = interface;

  ISQLiteDatabase = interface
  ['{CD0F768B-DC68-4C5E-85AC-5175BFDE2CBE}']
//    procedure RaiseError(s: string; SQL: string);
    function GetInTrans: boolean;
    function GetTable(const SQL: AnsiString): ISQLiteTable;
    procedure ExecSQL(const SQL: AnsiString);
    function GetTableValue(const SQL: string): int64;
    function GetTableString(const SQL: string): string;
    procedure UpdateBlob(const SQL: string; BlobData: TStream);
    procedure BeginTransaction;
    procedure Commit;
    procedure Rollback;
    function TableExists(TableName: string): boolean;
    function GetLastInsertRowID: int64;
    procedure SetTimeout(Value: integer);
    function version: string;
    property isTransactionOpen: boolean read GetInTrans;
  end;

  ISQLiteTable = interface
  ['{F8C69AAE-1ACE-4A66-83BD-A930CE573C0C}']
    function GetFields(I: cardinal): string;
    function GetEOF: boolean;
    function GetBOF: boolean;
    function GetColumns(I: integer): string;
    function GetFieldByName(FieldName: string): string;
    function GetFieldIndex(FieldName: AnsiString): integer;
    function GetCount: integer;
    function GetCountResult: integer;
    function GetColCount: cardinal;
    function GetRow: cardinal;
    function GetRowCount: cardinal;
    function FieldAsInteger(I: cardinal): int64;
    function FieldAsBlob(I: cardinal): TMemoryStream;
    function FieldAsBlobText(I: cardinal): AnsiString;
    function FieldIsNull(I: cardinal): boolean;
    function FieldAsString(I: cardinal): AnsiString;
    function FieldAsDouble(I: cardinal): double;
    function Next: boolean;
    function Previous: boolean;
    property EOF: boolean read GetEOF;
    property BOF: boolean read GetBOF;
    property Fields[I: cardinal]: string read GetFields;
    property FieldByName[FieldName: string]: string read GetFieldByName;
    property FieldIndex[FieldName: AnsiString]: integer read GetFieldIndex;
    property Columns[I: integer]: string read GetColumns;
    property ColCount: cardinal read GetColCount;
    property RowCount: cardinal read GetRowCount;
    property Row: cardinal read GetRow;
    function MoveFirst: boolean;
    function MoveLast: boolean;
    property Count: integer read GetCount;
    // The property CountResult is used when you execute count(*) queries.
    // It returns 0 if the result set is empty or the value of the
    // first field as an integer.
    property CountResult: integer read GetCountResult;
  end;

implementation

end.
