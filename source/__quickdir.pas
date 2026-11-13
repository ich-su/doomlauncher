unit __quickdir;

interface

uses System.SysUtils, System.Classes, Generics.Collections;

type
  TQDir = class;
  TQDirOnCanAdd = procedure (ADir: TQDir; AFileName: string; AAttr: integer; var ACanAdd: boolean) of object;
  TQDirFind = (qdfName, qdfFileName);

  TQDir = class(TObjectList<TQDir>)
  protected
    FFileName: string;
    FIsDir: boolean;
    FTime: TDateTime;
    FName: string;
    FParent: TQDir;
    FData: pointer;

    function DirCreate: TQDir; virtual;

  public
    constructor Create(AFileName: string = ''; AParent: TQDir = nil; AMask: string = '*.*'; AAttr: integer = faAnyFile; ACanAdd: TQDirOnCanAdd = nil); reintroduce;

    procedure Clear; virtual;
    procedure Scan(AFileName: string; AParent: TQDir = nil; AMask: string = '*.*'; AAttr: integer = faAnyFile; ACanAdd: TQDirOnCanAdd = nil); virtual;

    class function Compare(AStr1, AStr2: string): boolean;

    function Find(AName: string; AFind: TQDirFind = qdfName): integer;
    function QItem(ANames: TArray<string>): TQDir;
    function QItemPath(APath: string): TQDir;
    function Root(ADepth: integer = 0): TQDir;

    property FileName: string read FFileName;
    property IsDir: boolean read FIsDir;
    property Time: TDateTime read FTime;
    property Name: string read FName;
    property Parent: TQDir read FParent; // write FParent;
    property Data: pointer read FData write FData;
  end;

implementation

uses __expandlongfilename, __arr;

function TQDir.DirCreate;
begin
  Result := TQDir.Create;
end;

constructor TQDir.Create;
begin
  inherited Create;
  Scan(AFileName, AParent, AMask, AAttr, ACanAdd);
end;

procedure TQDir.Scan;
var sr: TSearchRec;
begin
  Clear;
  FFileName := AFileName.Trim;

  if (length(FFileName) > 0) and (CharInSet(FFileName[length(FFileName)], ['\', '/'])) then
    SetLength(FFileName, length(FFileName) - 1);

  if not FFileName.IsEmpty then begin

    FIsDir := DirectoryExists(FFileName);

    var fn := ExpandLongFileName(FFileName);
    if FileExists(fn) then FTime := FileDateToDateTime(FileAge(fn))
    else FTime := -1;

    FParent := AParent;
    FName := ExtractFileName(FFileName);

    if FIsDir then begin
      if FindFirst(ExpandLongFileName(FFileName) + '\' + AMask, faAnyFile, sr) = 0 then begin

        repeat
          if (length(sr.Name) > 0) and (sr.Name[1] <> '.') then begin
            var can := true;
            if Assigned(ACanAdd) then ACanAdd(self, FFileName + '\' + sr.Name, sr.Attr, can);
            if can then begin
              var d := DirCreate;
              d.Scan(FFileName + '\' + sr.Name, self, AMask, AAttr, ACanAdd);
              Add(d);
            end;
          end;
        until FindNext(sr) <> 0;

        FindClose(sr);
      end;
    end;
  end;
end;

procedure TQDir.Clear;
begin
  inherited Clear;

  FFileName := '';
  FIsDir := false;
  FTime := -1;
  FName := '';
  FData := nil;
end;

function TQDir.Root;
begin
  Result := nil;

  var a: TArray<TQDir>;
  TArr<TQDir>.Push(a, self);

  var dir := self;
  while dir.Parent <> nil do begin
    dir := dir.Parent;
    TArr<TQDir>.Push(a, dir);
  end;

  if ADepth < length(a) then Result := a[length(a) - ADepth - 1];
end;

function TQDir.Find;
var s: string;
begin
  Result := -1;
  var i: integer := 0;
  while (Result = -1) and (i < Count) do begin
    if AFind = qdfName then s := Items[i].Name
    else s := Items[i].FileName;
    if Compare(s, AName) then Result := i
    else inc(i);
  end;
end;

class function TQDir.Compare;
begin
  Result := AStr1.Trim.ToLower = AStr2.Trim.ToLower;
end;

function TQDir.QItem;
begin
  Result := nil;
  if length(ANames) > 0 then begin
    var i: integer := Find(ANames[0]);
    if i <> -1 then begin
      System.Delete(ANames, 0, 1);
      if length(ANames) > 0 then Result := Items[i].QItem(ANames)
      else Result := Items[i];
    end;
  end;
end;

function TQDir.QItemPath;
begin
  var dirs := APath.Split(['\', '/']);
  Result := QItem(dirs);
end;

end.

