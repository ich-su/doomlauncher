unit __quickini;

interface

uses System.SysUtils, System.Classes, Generics.Collections, IniFiles, System.Rtti;

type
  TQILine = class
  protected
    FKey: string;
    FValue: string;
    FRealValue: string;

    procedure SetValue(AValue: string);

  public
    constructor Create(AKey, AValue: string); overload;
    procedure Assign(ASource: TQILine); virtual;

    property Key: string read FKey;
    property Value: string read FValue write SetValue;
    property RealValue: string read FRealValue;
  end;

  TQISectionA = class(TObjectList<TQILine>)
  protected
    function FindKey(AKey: TValue): integer;
    function GetValue(AKey: TValue): string; virtual;
    function GetValueArray(AKey: string): TArray<string>;
    procedure SetValue(AKey: TValue; AValue: string);
    function GetLine(AKey: TValue): TQILine;

  public
    procedure Clear; virtual;
    procedure Assign(ASource: TQISectionA); virtual;
    class function Compare(AString1, AString2: string): boolean;

    property Value[Key: TValue]: string read GetValue write SetValue; default;
    property ValueArray[Key: string]: TArray<string> read GetValueArray;
    property Line[Key: TValue]: TQILine read GetLine;
  end;

  TQStrings = TQISectionA;

  TQISection = class(TQISectionA)
  protected
    FName: string;

    function GetValue(AKey: TValue): string; override;

  public const
    KName = '#id';

  public
    constructor Create(AName: string); overload;
    procedure Clear; override;
    procedure Assign(ASource: TQISectionA); override;

    property Name: string read FName write FName;
  end;

  TQIFile = class(TObjectList<TQISection>)
  protected
    FFileName: string;
    FSaveEmpty: boolean;

    function FindItem(ASection: TValue): integer;
    function GetItem(ASection: TValue): TQISection;
    function GetValue(ASection, AKey: TValue): string;
    function GetValueArray(ASection: TValue; AKey: string): TArray<string>;
    procedure SetValue(ASection, AKey: TValue; AValue: string);
    function GetLine(ASection, AKey: TValue): tQILine;

  public
    constructor Create(AFileName: string = ''); reintroduce;
    procedure Assign(ASource: TQIFile); virtual;
    procedure Clear; virtual;
    function Swap(ASection1, ASection2: TValue): boolean;
    function LoadFromFile(AFileName: string): boolean; virtual;
    function SaveToFile(AFileName: string = ''): boolean; virtual;

    property Line[Section, Key: TValue]: TQILine read GetLine;
    property Items[Section: TValue]: tQISection read GetItem;
    property Value[Section, Key: TValue]: string read GetValue write SetValue; default;
    property ValueArray[Section: TValue; Key: string]: TArray<string> read GetValueArray;
    property SaveEmpty: boolean read FSaveEmpty write FSaveEmpty;
  end;

  TQIData = class
  protected
    FIndexs: TArray<integer>;
    FQIFile: TQIFile;

    function GetCount: integer;
    function GetItem(AIndex: integer): TQISection;
    function GetValue(AIndex: integer; AKey: string): string;

  public
    constructor Create(AQIFile: TQIFile); reintroduce;
    procedure Assign(ASource: TQIData);

    procedure Add(AIndex: integer);
    procedure All;
    procedure Clear;

    property Count: integer read GetCount;
    property Items[Index: integer]: tQISection read GetItem;
    property Value[Index: integer; Key: string]: string read GetValue; default;
  end;

implementation

uses __expandlongfilename, __arr;

constructor TQILine.Create(AKey, AValue: string);
begin
  inherited Create;

  FKey := AKey.Trim;
  SetValue(AValue);
end;

procedure TQILine.SetValue;
begin
  FRealValue := AValue.Trim;
  FValue := FRealValue;
end;

procedure TQILine.Assign;
begin
  FKey := ASource.FKey;
  FValue := ASource.FValue;
  FRealValue := ASource.FRealValue;
end;



class function TQISectionA.Compare;
begin
  Result := AString1.Trim.ToLower = AString2.Trim.ToLower;
end;

function TQISectionA.FindKey;
begin
  Result := -1;

  if AKey.IsOrdinal then begin
    var i: integer := AKey.AsOrdinal;
    if (i >= 0) and (i < Count) then Result := i;
  end
  else begin
    var s := AKey.AsString;
    if not s.IsEmpty then
      for var i := 0 to Count - 1 do
        if Compare(Items[i].Key, s) then begin
          Result := i;
          break;
        end;
  end;
end;

function TQISectionA.GetLine;
begin
  var i: integer := FindKey(AKey);
  if i <> -1 then Result := Items[i]
  else Result := nil;
end;

function TQISectionA.GetValue;
begin
  var l := GetLine(AKey);
  if l <> nil then Result := l.Value
  else Result := '';
end;

function TQISectionA.GetValueArray;
begin
  Result := [];
  var s := '';
  var i: integer := 0;
  var b := not GetValue(AKey).IsEmpty;
  if b then
    while b or (i <= 2) do begin
      var v := GetValue(AKey + s);
      b := not v.IsEmpty;
      if b then TArr<string>.Push(Result, v);
      inc(i);
      s := i.ToString;
    end;
end;

procedure TQISectionA.SetValue;
begin
  var i: integer := FindKey(AKey);
  if i <> -1 then Items[i].Value := AValue
  else Add(TQILine.Create(AKey.ToString, AValue));
end;

procedure TQISectionA.Clear;
begin
  inherited Clear;
end;

procedure TQISectionA.Assign;
begin
  Clear;
  for var i := 0 to ASource.Count - 1 do begin
    var l := TQILine.Create;
    l.Assign(ASource.Items[i]);
    Add(l);
  end;
end;



constructor TQISection.Create(AName: string);
begin
  inherited Create;
  FName := AName.Trim;
end;

function TQISection.GetValue;
begin
  if not AKey.IsOrdinal and Compare(AKey.AsString, KName) then Result := Name
  else Result := inherited GetValue(AKey);
end;

procedure TQISection.Assign;
begin
  inherited Assign(ASource);
  if ASource is TQISection then FName := TQISection(ASource).FName;
end;

procedure TQISection.Clear;
begin
  inherited Clear;
  FName := '';
end;



function TQIFile.FindItem;
begin
  Result := -1;

  if ASection.IsOrdinal then begin
    var i: integer := ASection.AsOrdinal;
    if (i >= 0) and (i < Count) then Result := i;
  end
  else begin
    var s := ASection.AsString;
    if not s.IsEmpty then
      for var i := 0 to Count - 1 do
        if TQISection.Compare(inherited Items[i].Name, s) then begin
          Result := i;
          break;
        end;
  end;
end;

function TQIFile.GetItem;
begin
  var i: integer := FindItem(ASection);
  if i <> -1 then Result := inherited Items[i]
  else Result := nil;
end;

function TQIFile.GetValue;
begin
  var section := Items[ASection];
  if section <> nil then Result := section[AKey]
  else Result := '';
end;

function TQIFile.GetValueArray;
begin
  var section := Items[ASection];
  if section <> nil then Result := section.ValueArray[AKey]
  else Result := [];
end;

procedure TQIFile.SetValue;
begin
  var section := Items[ASection];
  if section = nil then begin
    section := TQISection.Create(ASection.ToString);
    Add(section);
  end;
  section[AKey] := AValue;
end;

function TQIFile.GetLine;
begin
  Result := nil;
  var section := Items[ASection];
  if section <> nil then begin
    var i: integer := section.FindKey(AKey);
    if i <> -1 then Result := section.Items[i];
  end;
end;

function TQIFile.LoadFromFile;
begin
  Clear;
  FFileName := AFileName;

  var sections := TStringList.Create;
  var keys := TStringList.Create;
  var ini := TMemIniFile.Create(ExpandLongFileName(AFileName), TEncoding.UTF8);

  try
    ini.ReadSections(sections);

    for var section in sections do begin
      var key: string;
      ini.ReadSection(section, keys);

      if keys.Count > 0 then begin
        var list := TQISection.Create(section);

        for key in keys do
          list.Add(TQILine.Create(key, ini.ReadString(section, key, '').Trim));

        Add(list);
      end
    end;

    Result := true;
  except
    Result := false;
  end;

  ini.Free;
  keys.Free;
  sections.Free;
end;

function TQIFile.SaveToFile;
begin
  Result := false;

  if AFileName.IsEmpty then AFileName:=FFileName;
  if not AFileName.IsEmpty then begin

    var ini := TMemIniFile.Create(ExpandLongFileName(AFileName), TEncoding.UTF8);
    try
      for var i := 0 to Count - 1 do
        for var j := 0 to Items[i].Count - 1 do begin
          var v := Items[i].Items[j];
          if FSaveEmpty or not v.RealValue.IsEmpty then
            ini.WriteString(Items[i].Name, v.Key, v.RealValue);
        end;

      ini.UpdateFile;
      ini.Free;

      Result := true;
      FFileName := AFileName;
    except
    end
  end;
end;

constructor TQIFile.Create;
begin
  inherited Create;
  FSaveEmpty := false;
  FFileName := AFileName.Trim;

  if not FFileName.IsEmpty then LoadFromFile(AFileName);
end;

procedure TQIFile.Assign;
begin
  Clear;
  FFileName := ASource.FFileName;
  for var i := 0 to ASource.Count - 1 do begin
    var l := TQISection.Create;
    l.Assign(ASource.Items[i]);
    Add(l);
  end;
end;

procedure TQIFile.Clear;
begin
  inherited Clear;
  FSaveEmpty := false;
  FFileName := '';
end;

function TQIFile.Swap;
begin
  Result := (Items[ASection1] <> nil) and (Items[ASection2] <> nil);

  if Result then begin
    var s1 := TQISection.Create;
    s1.Assign(Items[ASection1]);
    s1.Name := ASection2.ToString;

    var s2 := TQISection.Create;
    s2.Assign(Items[ASection2]);
    s2.Name := ASection1.ToString;

    Items[ASection1].Assign(s2);
    Items[ASection2].Assign(s1);

    s1.Free;
    s2.Free;
  end;
end;



constructor TQIData.Create(AQIFile: TQIFile);
begin
  inherited Create;
  FQIFile := AQIFile;
end;

procedure TQIData.Assign;
begin
  Finalize(FIndexs);
  FIndexs := Copy(ASource.FIndexs);
  FQIFile.Assign(ASource.FQIFile);
end;

function TQIData.GetCount;
begin
  Result := length(FIndexs);
end;

function TQIData.GetItem;
begin
  Result := nil;
  if (AIndex >= 0) and (AIndex < length(FIndexs)) then
    Result := FQIFile.Items[FIndexs[AIndex]];
end;

procedure TQIData.Add;
begin
  if (AIndex >= 0) and (AIndex < FQIFile.Count) then
    TArr<integer>.Push(FIndexs, AIndex);
end;

procedure TQIData.All;
begin
  Clear;
  for var i := 0 to FQIFile.Count - 1 do Add(i);
end;

procedure TQIData.Clear;
begin
  SetLength(FIndexs, 0);
end;

function TQIData.GetValue;
begin
  var s := Items[AIndex];
  if s <> nil then Result := s[AKey]
  else Result := '';
end;

end.

